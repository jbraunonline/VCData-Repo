
Imports System.IO
Imports System.Data.SqlClient
Imports System.Data.Sql
Public Class UploadPoints
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim strFileName As String

        If UploadFile.PostedFile.FileName.Length > 0 Then
            strFileName = System.IO.Path.GetFileName(UploadFile.PostedFile.FileName)
            UploadFile.PostedFile.SaveAs(Server.MapPath("Data/PointsData.txt"))
            Panel1.Visible = True
            Panel2.Visible = True
        End If

        lblFileName.Text = UploadFile.PostedFile.FileName
        lblFileSize.Text = UploadFile.PostedFile.ContentLength
        lblFileContentType.Text = UploadFile.PostedFile.ContentType

    End Sub

    Protected Sub btnUpload_Click(sender As Object, e As EventArgs) Handles btnUpload.Click
        Dim changecount As Integer = 0
        Dim fileStream As FileStream = File.Open(Server.MapPath("Data/PointsData.txt"), FileMode.Open, FileAccess.Read)

        Dim streamReader As StreamReader = New StreamReader(fileStream)

        Dim nLine As Integer = 0

        While (streamReader.Peek() > -1)

            Dim strLine As String = streamReader.ReadLine()

            nLine = nLine + 1

            Response.Write(nLine & "<br>")
            'Response.Write(nLine & "<br>")
            'Response.Write(strLine & "<br>")
            Dim astrValues As String() = strLine.Split(CChar(","))
            'Dim newname As String = "<font color=red>not here </font>"
            If astrValues.Length <> 7 Then
                '''''changed 6 t0 7
                Response.Write("<B> An error occurred while processing Line " & nLine.ToString() & ":<B><br><br>")
                Response.Write(strLine)

                Exit While

            End If

            Dim Reference As String = astrValues(0)  'Term,
            Dim UserName As String = astrValues(1)  'reference
            Dim UserStatus As String = astrValues(2)  'Subject,'
            Dim Points As String = astrValues(3)  'Catalog,
            Dim Inload As String = astrValues(4)  'Descr,
            Dim Overload As String = astrValues(5)  'Component,
            Dim Banked As String = astrValues(6)  'Status,
            If RadioButtonList1.SelectedValue = "Preview" Then
                Response.Write(getCMRID(DropDownList1.SelectedValue, Reference) & "<BR>")
                Response.Write(DropDownList1.SelectedValue & "," & Reference & "," & UserName & "," & UserStatus & "," & Points & "," & Inload & "," & Overload & "," & Banked & "<BR>")
            Else
                InsertPoints(DropDownList1.SelectedValue, Reference, UserName, UserStatus, Points, Inload, Overload, Banked)
            End If
        End While

        streamReader.Close()
        fileStream.Close()
        Response.Write("<br>The Change Count is " & CStr(changecount))
    End Sub

    Function getCMRID(ByVal myterm As String, myreference As String) As Integer
        Dim myreturn As Integer = 0
        Dim strsql As String = "Select ID from CMR where term ='" & myterm & "' and reference = '" & myreference & "'"
        ' Create Instance of Connection and Command Object
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand(strsql, myConnection)

        ' Open the connection and execute the Command
        myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        While dr.Read
            If Not IsDBNull(dr("ID")) Then
                myreturn = dr("ID")
            End If
        End While
        myConnection.Close()
        Return myreturn


        Return myreturn

    End Function

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Panel2.Visible = True
    End Sub

    Sub insertPoints(ByVal myterm As String, ByVal myreference As String, ByVal myusername As String, ByVal myuserstatus As String, ByVal myPoints As String, ByVal myInload As String, ByVal myoverload As String, ByVal myBanked As String)
        Dim myerror As Integer = 0
        Using conn As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)

            Using mycommand As New SqlCommand()
                With mycommand
                    .Connection = conn
                    mycommand.CommandText = "sp_InsertAdminPoints"
                    mycommand.CommandType = CommandType.StoredProcedure

                    mycommand.Parameters.Add("@Term", SqlDbType.VarChar).Value = myterm
                    mycommand.Parameters.Add("@Reference", SqlDbType.VarChar).Value = myreference
                    mycommand.Parameters.Add("@UserName", SqlDbType.VarChar).Value = myusername
                    mycommand.Parameters.Add("@UserStatus", SqlDbType.VarChar).Value = myuserstatus
                    mycommand.Parameters.Add("@Points", SqlDbType.Decimal).Value = CDec(myPoints)
                    mycommand.Parameters.Add("@PointsInload", SqlDbType.Decimal).Value = CDec(myInload)
                    mycommand.Parameters.Add("@PointsOver", SqlDbType.Decimal).Value = CDec(myoverload)
                    mycommand.Parameters.Add("@PointsBanked", SqlDbType.Decimal).Value = CDec(myBanked)
                    mycommand.Parameters.Add("@Points_Source", SqlDbType.VarChar).Value = "XLS"

                    Try
                        conn.Open()
                        mycommand.ExecuteNonQuery() '
                    Catch Ex As Exception
                        Response.Write("<font color=red>")
                        Response.Write(Ex.Message)
                        Response.Write("</font>")
                        'Response.Write("<font color=red>DuplicateMessage</font><br>")
                        myerror = 1

                    Finally

                    End Try

                    If myerror = 0 Then
                        Response.Write("Uploaded = " & myreference & "<BR>")
                    End If

                End With
            End Using
        End Using
    End Sub

End Class