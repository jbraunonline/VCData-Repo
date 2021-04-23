Imports System.IO
Imports System.Data.SqlClient
Imports System.Data.Sql

Public Class FeedbackUpload
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim strFileName As String

        If UploadFile.PostedFile.FileName.Length > 0 Then
            strFileName = System.IO.Path.GetFileName(UploadFile.PostedFile.FileName)
            UploadFile.PostedFile.SaveAs(Server.MapPath("Data/TABupload.txt"))
            Panel1.Visible = True
            Panel2.Visible = True
        End If

        lblFileName.Text = UploadFile.PostedFile.FileName
        lblFileSize.Text = UploadFile.PostedFile.ContentLength
        lblFileContentType.Text = UploadFile.PostedFile.ContentType
    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Panel2.Visible = True
    End Sub

    Protected Sub btnUpload_Click(sender As Object, e As EventArgs) Handles btnUpload.Click
        Dim changecount As Integer = 0
        Dim fileStream As FileStream = File.Open(Server.MapPath("Data/feedbacklist.csv"), FileMode.Open, FileAccess.Read)

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
            If astrValues.Length <> 5 Then
                '''''changed 6 t0 7
                Response.Write("<B> An error occurred while processing Line " & nLine.ToString() & ":<B><br><br>")
                Response.Write(strLine)

                Exit While

            End If

            Dim myName As String = astrValues(0)  'Term,
            Dim myFirst As String = astrValues(1)  'reference
            Dim myLast As String = astrValues(2)  'Subject,'
            Dim myUserName As String = astrValues(3)  'Catalog,
            Dim mystatus As String = astrValues(4)  'Descr,


            '    working list of data:   term, reference, subject, catalog, descr, status, credits, component, section, session, startdate, enddate, classtype, mdcid, instassign, last, first, email
            If RadioButtonList1.SelectedValue = "Preview" Then
                Dim i As Integer = 0
                For i = 0 To 4
                    Response.Write(astrValues(i) & "|")
                Next
                Response.Write("<br>")
            End If

            Dim strSQL As String = "Insert into ScheduleSignoffList (Name,First,Last,Username,Status)" &
                            "VALUES ('" & myName &
                            "','" & myFirst &
                            "','" & myLast &
                            "','" & myUserName &
                             "','" & mystatus & "')"


            Response.Write(strSQL & "<br>")
            Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
            ' Create Instance of Connection and Command Object
            Dim myCommand As New SqlCommand(strSQL, myConnection)

            If RadioButtonList1.SelectedValue = "Input" Then
                Try

                    ' Open the connection and execute the Command
                    myConnection.Open()


                    'HOLD SQL HOLD.........]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]
                    myCommand.ExecuteNonQuery()

                Catch

                    Response.Write("<font color=red>failed to create a new record</font>")


                Finally

                    ' Close the Connection
                    If myConnection.State = ConnectionState.Open Then
                        myConnection.Close()
                    End If

                End Try
            End If

            CopyVC_Instructors()

        End While
    End Sub

    Sub DeleteVC_Instructors()





    End Sub


    Sub CopyVC_Instructors()

    End Sub



End Class