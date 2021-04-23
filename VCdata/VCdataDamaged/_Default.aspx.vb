Imports Telerik.Web.UI
Imports System.IO


Partial Class _Default
    Inherits System.Web.UI.Page




    Protected Sub uploadbutton_Click1(sender As Object, e As EventArgs) Handles uploadbutton.Click
        If FileUpload1.HasFile Then

            Try



                If FileUpload1.PostedFile.ContentLength < 102400 Then
                    Dim filename As String = Path.GetFileName(FileUpload1.FileName)
                    FileUpload1.SaveAs(Server.MapPath("~/AppData/") & filename)
                    FileUpload1.SaveAs(Server.MapPath("~/AppData/") & "Hello;txt")
                    StatusLabel.Text = "Upload status: File uploaded!"
                    lblFileName.Text = FileUpload1.PostedFile.FileName
                    lblFileSize.Text = FileUpload1.PostedFile.ContentLength
                    lblFileContentType.Text = FileUpload1.PostedFile.ContentType



                Else
                    StatusLabel.Text = "Upload status: The file has to be less than 100 kb!"

                End If
            Catch ex As Exception
                StatusLabel.Text = "Upload status: The file could not be uploaded. The following error occured: " & ex.Message
            End Try
        End If
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Response.Redirect("StudentExamDates/myproctor.aspx")
    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Response.Redirect("2195")
    End Sub
End Class
