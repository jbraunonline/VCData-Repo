Imports System.IO
Imports System.Data.SqlClient
Imports System.Data.Sql



Public Class UploadDetails
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim strFileName As String

        If UploadFile.PostedFile.FileName.Length > 0 Then
            strFileName = System.IO.Path.GetFileName(UploadFile.PostedFile.FileName)
            UploadFile.PostedFile.SaveAs(Server.MapPath("Data/ExamDetails.txt"))
            Panel1.Visible = True
            Panel2.Visible = True
        End If

        lblFileName.Text = UploadFile.PostedFile.FileName
        lblFileSize.Text = UploadFile.PostedFile.ContentLength
        lblFileContentType.Text = UploadFile.PostedFile.ContentType


    End Sub

    Protected Sub btnUpload_Click(sender As Object, e As EventArgs) Handles btnUpload.Click


        'DeleteFromFDLC()

        Dim fileStream As FileStream = File.Open(Server.MapPath("Data/ExamDetails.txt"), FileMode.Open, FileAccess.Read)

        Dim streamReader As StreamReader = New StreamReader(fileStream)

        Dim nLine As Integer = 0

        While (streamReader.Peek() > -1)

            Dim strLine As String = streamReader.ReadLine()

            nLine = nLine + 1


            'Response.Write(nLine & "<br>")
            'Response.Write(strLine & "<br>")
            Dim astrValues As String() = strLine.Split(CChar(","))
            'Dim newname As String = "<font color=red>not here </font>"
            If astrValues.Length <> 30 Then
                '''''changed 6 t0 7
                Response.Write("<B> An error occurred while processing Line " & nLine.ToString() & ":<B><br><br>")
                Response.Write(strLine)

                Exit While

            End If

            Dim mystring0 As String = astrValues(0)
            Dim mystring1 As String = astrValues(1)
            Dim mystring2 As String = astrValues(2)
            Dim mystring3 As String = astrValues(3)
            Dim mystring4 As String = astrValues(4)
            Dim mystring5 As String = astrValues(5)
            Dim mystring6 As String = astrValues(6)
            Dim mystring7 As String = astrValues(7)
            Dim mystring8 As String = astrValues(8)
            Dim mystring9 As String = astrValues(9)
            Dim mystring10 As String = astrValues(10)
            Dim mystring11 As String = astrValues(11)
            Dim mystring12 As String = astrValues(12)
            Dim mystring13 As String = astrValues(13)
            Dim mystring14 As String = astrValues(14)
            Dim mystring15 As String = astrValues(15)
            Dim mystring16 As String = astrValues(16)
            Dim mystring17 As String = astrValues(17)
            Dim mystring18 As String = astrValues(18)
            Dim mystring19 As String = astrValues(19)
            Dim mystring20 As String = astrValues(20)
            Dim mystring21 As String = astrValues(21)
            Dim mystring22 As String = astrValues(22)
            Dim mystring23 As String = astrValues(23)
            Dim mystring24 As String = astrValues(24)
            Dim mystring25 As String = astrValues(25)
            Dim mystring26 As String = astrValues(26)
            Dim mystring27 As String = astrValues(27)
            Dim mystring28 As String = astrValues(28)
            Dim mystring29 As String = astrValues(29)

            If RadioButtonList1.SelectedValue = "Preview" Then
                Dim i As Integer = 0
                For i = 0 To 29
                    Response.Write(astrValues(i) & "|")
                Next
                Response.Write("<br>")
            End If

            If RadioButtonList1.SelectedValue <> "Preview" Then
                addMaster(mystring0, mystring1, mystring2, mystring3, mystring4, mystring5, mystring6, mystring7, mystring8, mystring9, mystring10, mystring11, mystring12, mystring13, mystring14, mystring15, mystring16, mystring17, mystring18, mystring19, mystring20, mystring21, mystring22, mystring23, mystring24, mystring25, mystring26, mystring27, mystring28, mystring29)
            End If
        End While

        streamReader.Close()
        fileStream.Close()

    End Sub

    Sub addMaster(ByVal strTextField0 As String, ByVal strTextField1 As String, ByVal strTextField2 As String, ByVal strTextField3 As String, ByVal strTextField4 As String, ByVal strTextField5 As String, ByVal strTextField6 As String, ByVal strTextField7 As String, ByVal strTextField8 As String, ByVal strTextField9 As String, ByVal strTextField10 As String, ByVal strTextField11 As String, ByVal strTextField12 As String, ByVal strTextField13 As String, ByVal strTextField14 As String, ByVal strTextField15 As String, ByVal strTextField16 As String, ByVal strTextField17 As String, ByVal strTextField18 As String, ByVal strTextField19 As String, ByVal strTextField20 As String, ByVal strTextField21 As String, ByVal strTextField22 As String, ByVal strTextField23 As String, ByVal strTextField24 As String, ByVal strTextField25 As String, ByVal strTextField26 As String, ByVal strTextField27 As String, ByVal strTextField28 As String, ByVal strTextField29 As String)
        'ANGEL,Course,Instructor,Outlook,CanChange,IsMidterm,MidStart,MidEnd,MidTime,MidPaper,MidCalculator,MidGraph,MidNotes,IsFinal,finalStart,FinalEnd,FinalTime,FinalPaper,FinalCalculator,FinalGraph,FinalNotes,Access,InstComments,MidName,MidFolder,FinalName,FinalFolder,Chair,ChairOutlook
        'Dim strSQL As String = "INSERT INTO MasterProctor (ANGEL,Course,Instructor,Outlook,CanChange,IsMidterm,MidStart,MidEnd,MidTime,MidPaper,MidCalculator,MidGraph,MidNotes,IsFinal,finalStart,FinalEnd,FinalTime,FinalPaper,FinalCalculator,FinalGraph,FinalNotes,Access,InstComments) " & _ 
        Dim strSQL As String = "INSERT INTO MasterProctor1 (ANGEL,Course,Instructor,Outlook,CanChange,IsMidterm,MidStart,MidEnd,MidTime,MidPaper,MidCalculator,MidGraph,MidNotes,IsFinal,finalStart,FinalEnd,FinalTime,FinalPaper,FinalCalculator,FinalGraph,FinalNotes,Access,InstComments,MidName,MidFolder,FinalName,FinalFolder,MidProctorX,FinalProctorX,LMS) " &
                               "VALUES ('" & strTextField0 &
                               "','" & strTextField1 &
                               "','" & strTextField2 &
                               "','" & strTextField3 &
                               "'," & strTextField4 &
                               "," & strTextField5 &
                               ",'" & strTextField6 &
                               "','" & strTextField7 &
                               "'," & strTextField8 &
                               "," & strTextField9 &
                               "," & strTextField10 &
                               "," & strTextField11 &
                               ",'" & strTextField12 &
                               "'," & strTextField13 &
                               ",'" & strTextField14 &
                               "','" & strTextField15 &
                               "'," & strTextField16 &
                               "," & strTextField17 &
                               "," & strTextField18 &
                               "," & strTextField19 &
                               ",'" & strTextField20 &
                               "'," & strTextField21 &
                               ",'" & strTextField22 &
                               "','" & strTextField23 &
                               "','" & strTextField24 &
                               "','" & strTextField25 &
                               "','" & strTextField26 &
                               "'," & strTextField27 &
                               "," & strTextField28 &
                               ",'" & strTextField29 & "')"

        'Course_ID,Course,Term,MidStdFolder,MidAltFolder,IsMidterm,MidTime,MidStart,MidEnd,MidPass,Final,FinalTime,FinalStart,FinalEnd,FinalPass,FinalSpecial,FinalPaper,FinalCalculator,FinalMedia,FinalSpecialNotes
        Response.Write(strSQL & "<BR><BR>")
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
        ' Create Instance of Connection and Command Object
        Dim myCommand As New SqlCommand(strSQL, myConnection)

        ' Execute the command in a try/catch to catch duplicate username errors
        Try

            ' Open the connection and execute the Command
            myConnection.Open()

            If RadioButtonList1.SelectedValue = "Input" Then
                'HOLD SQL HOLD.........]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]
                myCommand.ExecuteNonQuery()
                'Response.Write("LiveRun<br>")
            End If
        Catch

            Response.Write("<font color=red>failed to create a new record</font>")


        Finally

            ' Close the Connection
            If myConnection.State = ConnectionState.Open Then
                myConnection.Close()
            End If

        End Try



    End Sub

    Protected Sub btnShow_Click(sender As Object, e As EventArgs) Handles btnShow.Click
        Panel2.Visible = True
    End Sub
End Class