Imports System.IO
Imports System.Data.SqlClient
Imports System.Data.Sql

Public Class UploadExamDates
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim strFileName As String

        If UploadFile.PostedFile.FileName.Length > 0 Then
            strFileName = System.IO.Path.GetFileName(UploadFile.PostedFile.FileName)
            UploadFile.PostedFile.SaveAs(Server.MapPath("Data/ExamDates.txt"))
            Panel1.Visible = True
            Panel2.Visible = True
        End If

        lblFileName.Text = UploadFile.PostedFile.FileName
        lblFileSize.Text = UploadFile.PostedFile.ContentLength
        lblFileContentType.Text = UploadFile.PostedFile.ContentType

    End Sub


    Protected Sub btnUpload_Click(sender As Object, e As EventArgs) Handles btnUpload.Click
        Dim fileStream As FileStream = File.Open(Server.MapPath("Data/ExamDates.txt"), FileMode.Open, FileAccess.Read)

        Dim streamReader As StreamReader = New StreamReader(fileStream)

        Dim nLine As Integer = 0

        While (streamReader.Peek() > -1)

            Dim strLine As String = streamReader.ReadLine()

            nLine = nLine + 1

            If (strLine = "") Then
                Exit While
            End If
            'Response.Write(nLine & "<br>")
            'Response.Write(strLine & "<br>")
            Dim astrValues As String() = strLine.Split(CChar(","))

            If astrValues.Length <> 11 Then
                '''''changed 6 t0 7
                Response.Write("<B> An error occurred while processing Line " & nLine.ToString() & ":<B><br><br>")
                Response.Write(strLine)

                Exit While

            End If


            Response.Write("<br>")
            Response.Write(astrValues(0))
            Response.Write(",")
            Response.Write(astrValues(1))
            Response.Write(",")
            Response.Write(astrValues(2))
            Response.Write(",")
            Response.Write(astrValues(3))
            Response.Write(",")
            Response.Write(astrValues(4))
            Response.Write(",")
            Response.Write(astrValues(5))
            Response.Write(",")
            Response.Write(astrValues(6))
            Response.Write("<br>")
            Response.Write(astrValues(7))
            Response.Write("<br>")
            Response.Write(astrValues(8))
            Response.Write("<br>")
            Response.Write(astrValues(9))
            Response.Write("<br>")
            Response.Write(astrValues(10))
            Response.Write("<br>")
            Dim i As Integer = 0
            For i = 0 To 10
                Response.Write(astrValues(i) & "|")
            Next
            Response.Write("<br>")

            addData(astrValues(0), astrValues(1), astrValues(2), astrValues(3), astrValues(4), astrValues(5), astrValues(6), astrValues(7), astrValues(8), astrValues(9), astrValues(10))


        End While

        streamReader.Close()
        fileStream.Close()
    End Sub



    Sub addData(ByVal strTextField1 As String, ByVal strTextField2 As String, ByVal strTextField3 As String, ByVal strTextField4 As String, ByVal strTextField5 As String, ByVal strTextField6 As String, ByVal strTextField7 As String, ByVal strTextField8 As String, ByVal strTextField9 As String, ByVal strTextField10 As String, ByVal strTextField11 As String)

        Dim strSQL As String = "INSERT INTO examdates(reference,course,instructor,MDID,Outlook,IsMidterm,MidStart,MidEnd,IsFinal,FinalStart,FinalEnd,term) "
        strSQL += "VALUES ('" & strTextField1
        strSQL += "','" & strTextField2
        strSQL += "','" & strTextField3
        strSQL += "','" & strTextField4
        strSQL += "','" & strTextField5
        Dim ismid As Integer = 0
        If strTextField6 = "Yes" Then
            ismid = 1
        End If

        strSQL += "'," & ismid

        strSQL += ",'" & strTextField7
        strSQL += "','" & strTextField8
        Dim isfinal As Integer = 0
        If strTextField9 = "Yes" Then
            isfinal = 1
        End If
        strSQL += "'," & isfinal
        strSQL += ",'" & strTextField10
        strSQL += "','" & strTextField11
        strSQL += "','" & txtTerm.Text & "')"


        Response.Write("<BR>" & strSQL & "<BR>")

        ' Create Instance of Connection and Command Object
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)

        Dim myCommand As New SqlCommand(strSQL, myConnection)

        ' Execute the command in a try/catch to catch duplicate username errors
        Try

            ' Open the connection and execute the Command
            myConnection.Open()

            If RadioButtonList1.SelectedValue = "Input" Then
                ']]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]HOLD SQL HOLD...[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[
                myCommand.ExecuteNonQuery()
            End If
        Catch

            ' failed to create a new record
            Response.Write("<font color=red><br>.}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}} <b>.FAIL</b></font><br>")



        Finally

            ' Close the Connection
            If myConnection.State = ConnectionState.Open Then
                myConnection.Close()
            End If

        End Try



    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Panel2.Visible = True
    End Sub

    Protected Sub txtTerm_TextChanged(sender As Object, e As EventArgs) Handles txtTerm.TextChanged

    End Sub
End Class