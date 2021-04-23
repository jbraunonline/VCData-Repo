Imports System.IO
Imports System.Data.SqlClient
Imports System.Data.Sql

Public Class UploadFacultyScheduleList
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub


    Protected Sub btnUpload_Click(sender As Object, e As EventArgs) Handles btnUpload.Click
        'DeleteFromFDLC()
        Dim changecount As Integer = 0
        Dim fileStream As FileStream = File.Open(Server.MapPath("Data/FacultyApproval.txt"), FileMode.Open, FileAccess.Read)
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
            If astrValues.Length <> 3 Then
                '''''changed 6 t0 7
                Response.Write("<B> An error occurred while processing Line " & nLine.ToString() & ":<B><br><br>")
                Response.Write(strLine)

                Exit While

            End If



            '    working list of data:   term, reference, subject, catalog, descr, status, credits, component, section, session, startdate, enddate, classtype, mdcid, instassign, last, first, email
            If RadioButtonList1.SelectedValue = "Preview" Then
                Dim i As Integer = 0
                For i = 0 To 2
                    Response.Write(astrValues(i) & "|")
                Next
                Response.Write("<br>")
            End If

            'Response.Write(term & "--" & reference & "--" & Chair & "--" & chairoutlook & "--" & scheduleNotes & "<br>")
            'UpgradeCMR(term, reference, Chair, chairoutlook, scheduleNotes)

            addfaculty(astrValues(0), astrValues(1), astrValues(2))
        End While

        streamReader.Close()
        fileStream.Close()
        Response.Write("<br>The Total  Count is " & CStr(changecount))
    End Sub

    Private Sub addfaculty(ByVal LastName As String, ByVal FirstName As String, ByVal Username As String)




        Dim strSQL As String = "Insert into scheduleSignoffList (Last, First, Username) " &
                               "VALUES ('" & LastName &
                               "','" & FirstName &
                                "','" & Username & "')"

        'Course_ID,Course,Term,MidStdFolder,MidAltFolder,IsMidterm,MidTime,MidStart,MidEnd,MidPass,Final,FinalTime,FinalStart,FinalEnd,FinalPass,FinalSpecial,FinalPaper,FinalCalculator,FinalMedia,FinalSpecialNotes
        Response.Write(strSQL & "<BR><BR>")
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
    End Sub






    ''This is the UPLOAD FILE BUttON
    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim strFileName As String

        If UploadFile.PostedFile.FileName.Length > 0 Then
            strFileName = System.IO.Path.GetFileName(UploadFile.PostedFile.FileName)
            UploadFile.PostedFile.SaveAs(Server.MapPath("Data/FacultyApproval.txt"))
            Panel1.Visible = True
            Panel2.Visible = True
        End If

        lblFileName.Text = UploadFile.PostedFile.FileName
        lblFileSize.Text = UploadFile.PostedFile.ContentLength
        lblFileContentType.Text = UploadFile.PostedFile.ContentType

    End Sub

    ' Upgrade CMR[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[adding new data to all courses


    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Panel2.Visible = True

    End Sub

    Protected Sub btnLook_Click(sender As Object, e As EventArgs) Handles btnLook.Click

        Dim strSQL As String = "select Last + ', ' + First As TheName, Username from  scheduleSignoffList "

        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)

        Response.Write(strSQL & "<br>")
        Dim myCommand As New SqlCommand(strSQL, myConnection)

        ' Open the connection and execute the Command
        myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        If dr.HasRows Then
            While dr.Read()

                Response.Write(dr("TheName") & "|" & dr("Username") & "<br>")
                'InsertRequest(dr("TheName"), dr("UserName"))
            End While
        End If
        dr.Close()
        dr = Nothing
        myConnection.Close()



    End Sub



End Class
