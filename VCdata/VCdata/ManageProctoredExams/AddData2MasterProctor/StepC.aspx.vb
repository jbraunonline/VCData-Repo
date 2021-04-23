Imports System.IO
Imports System.Data.SqlClient
Imports System.Data.Sql

Public Class StepC
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        txtTerm.Text = "2213" 'getINI("FacultyPortal", "lblTerm.text")
    End Sub


    Function getINI(ByVal mypage As String, ByVal myItem As String) As String
        Dim myreturn As String = ""
        Dim strSQL As String = "SELECT Value"
        strSQL += " FROM  dbo.VC_INI "
        strSQL += "WHERE (Page = '" & mypage & "' and item='" & myItem & "')"
        ' Create Instance of Connection and Command Object
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand(strSQL, myConnection)

        ' Open the connection and execute the Command
        myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        While dr.Read
            If Not IsDBNull(dr("value")) Then
                myreturn = dr("Value")
            End If
        End While

        Return myreturn
    End Function

    Protected Sub btnCourseData_Click(sender As Object, e As EventArgs) Handles btnCourseData.Click
        '  get  Course, instructor, username, CanChange, Session  from CMR where  reference = MasterProctor.parent
        Dim theconstraint As String = ""
        Select Case RadioSession.SelectedValue
            Case "1"
                theconstraint = " and dbo.MasterProctor.Session = '1'"
            Case "A"
                theconstraint = " and (dbo.MasterProctor.Session = '8W1' or  dbo.MasterProctor.Session = '6W1')"
            Case "A & 1"
                theconstraint = " and (dbo.MasterProctor.Session = '1' or   dbo.MasterProctor.Session = '8W1' or dbo.MasterProctor.Session = '6W1')"
            Case "B"
                theconstraint = " and (dbo.MasterProctor.Session = '8W2' or dbo.MasterProctor.Session = '6W2')"
            Case "12W"
                theconstraint = " and (dbo.MasterProctor.Session = '12W' )"
        End Select
        Dim StrSql As String = ""

        StrSql = " Update dbo.MasterProctor "
        StrSql += " set dbo.MasterProctor.course=CMR.course,"
        StrSql += "dbo.MasterProctor.Instructor= CMR.InstructorFirst + ' ' + CMR.InstructorLast,"
        StrSql += "dbo.MasterProctor.Outlook = CMR.username,"
        StrSql += "dbo.MasterProctor.Session = CMR.session,"
        StrSql += "dbo.MasterProctor.Canchange = CMR.CanChange "
        StrSql += "    From dbo.CMR "
        StrSql += "Where dbo.CMR.BBReference = dbo.MasterProctor.Parent" & theconstraint



        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand(StrSql, myConnection)
        ' Execute the command in a try/catch to catch duplicate username errors
        Try
            ' Open the connection and execute the Command
            myConnection.Open()
            If RadioPreview.SelectedValue = "Run" Then
                ']]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]HOLD SQL HOLD...[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[
                myCommand.ExecuteNonQuery()
            Else
                Response.Write(StrSql & "<br>")
                Response.Write("Hold<br>")
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
        Response.Write("Course Data Uploaded")
    End Sub

    Protected Sub btnAddExamData_Click(sender As Object, e As EventArgs) Handles btnAddExamData.Click
        Dim StrSql As String = ""
        Dim mycount As Integer = 0
        Dim theconstraint As String = ""
        Select Case RadioSession.SelectedValue
            Case "1"
                theconstraint = " Session = '1'"
            Case "A"
                theconstraint = "(Session = '8W1' or Session = '6W1')"
            Case "A & 1"
                theconstraint = "(Session = '1' or Session = '8W1' or Session = '6W1')"
            Case "B"
                theconstraint = "(Session = '8W2' or Session = '6W2')"
            Case "12W"
                theconstraint = "(Session = '12W' )"
        End Select

        StrSql = " Select  ID,course,Parent,Session From dbo.MasterProctor where term = " & txtTerm.Text & " And " & theconstraint
        ''''' Response.Write("<br>" & StrSql & "---Add ExamData<BR>")
        Dim myConnection2 As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
        Dim theCommand As New SqlCommand(StrSql, myConnection2)
        'Response.Write("select Course, Credits from Courses where course_ID=" & CInt(courseID))
        ' Open the connection and execute the Command
        myConnection2.Open()
        Dim dr2 As SqlDataReader = theCommand.ExecuteReader(CommandBehavior.CloseConnection)
        Dim myCourseList As String = ""

        While dr2.Read()
            mycount = mycount + 1

            If RadioPreview.SelectedValue = "Preview" Then

                Response.Write(dr2("ID") & "  " & dr2("Course") & "  " & dr2("Parent") & "  " & dr2("Session") & "<br>")
                Response.Write("<br>" & mycount & " ---Count<br>")
            End If
            GetExamData(dr2("ID"), dr2("Course"), dr2("Session"))
        End While

        Response.Write("<br>" & mycount & " --- Final Cours updated<br>")

        myConnection2.Close()


    End Sub

    Sub GetExamData(ByVal myID As Integer, ByVal mycourse As String, ByVal mysession As String)
        Dim myquery As String = ""
        Select Case mysession
            Case "1"
                myquery = "Select isMid, isFinal, Mid1_Start as myMidStart, Mid1_End as myMidEnd, Final1_Start as myFinalStart, Final1_End as myFinalEnd from MasterExamDates where term = '" & txtTerm.Text & "' and Course ='" & mycourse & "'"
            Case "6W1"
                myquery = "Select isMid, isFinal, MidA_Start as myMidStart, MidA_End as myMidEnd, FinalA_Start as myFinalStart, FinalA_End as myFinalEnd from MasterExamDates where term = '" & txtTerm.Text & "' and Course ='" & mycourse & "'"
            Case "8W1"
                myquery = "Select isMid, isFinal, MidA_Start as myMidStart, MidA_End as myMidEnd, FinalA_Start as myFinalStart, FinalA_End as myFinalEnd from MasterExamDates where term = '" & txtTerm.Text & "' and Course ='" & mycourse & "'"
            Case "6W2"
                myquery = "Select isMid, isFinal, MidB_Start as myMidStart, MidB_End as myMidEnd, FinalB_Start as myFinalStart, FinalB_End as myFinalEnd from MasterExamDates where term = '" & txtTerm.Text & "' and Course ='" & mycourse & "'"
            Case "8W2"
                myquery = "Select isMid, isFinal, MidB_Start as myMidStart, MidB_End as myMidEnd, FinalB_Start as myFinalStart, FinalB_End as myFinalEnd from MasterExamDates where term = '" & txtTerm.Text & "' and Course ='" & mycourse & "'"
            Case "12W"
                myquery = "Select isMid, isFinal, Mid1_Start as myMidStart, Mid1_End as myMidEnd, Final1_Start as myFinalStart, Final1_End as myFinalEnd from MasterExamDates where term = '" & txtTerm.Text & "' and Course ='" & mycourse & "'"
        End Select

        'Response.Write(" GetData?  " & myquery & "<br>")

        'HOLD}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}
        'Response.End()

        Dim myConnection3 As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
        Dim theCommand As New SqlCommand(myquery, myConnection3)

        ' Open the connection and execute the Command
        myConnection3.Open()
        Dim dr3 As SqlDataReader = theCommand.ExecuteReader(CommandBehavior.CloseConnection)
        Dim myCourseList As String = ""

        While dr3.Read()

            If RadioPreview.SelectedValue = "Run" Then
                'Block for testing{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{
                UpdateMasterProctorExams(myID, dr3("IsMid"), dr3("IsFinal"), dr3("myMidStart"), dr3("myMidEnd"), dr3("myFinalStart"), dr3("myFinalEnd"))
            Else
                Response.Write(dr3("IsMid") & "," & dr3("IsFinal") & "," & dr3("myMidStart") & "," & dr3("myMidEnd") & "," & dr3("myFinalStart") & "," & dr3("myFinalEnd") & "<br>")
            End If
        End While



        myConnection3.Close()




    End Sub

    Sub UpdateMasterProctorExams(ByVal myID As Integer, ByVal myIsMid As Boolean, ByVal myIsFinal As Boolean, ByVal myMidStart As Date, ByVal myMidEnd As Date, ByVal myFinalStart As Date, ByVal MyFinalEnd As Date)
        Dim theMid As Integer = 0
        If myIsMid = True Then
            theMid = 1
        End If

        Dim theFinal As Integer = 0
        If myIsFinal = True Then
            theFinal = 1
        End If


        Dim strsql As String = ""
        strsql = "Update MasterProctor set "
        '[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[Now getting ismid is final from DsignerDB not dates.....dates are fixed, but ismid is fin could be changed by Designer after Ernest list of dats is published
        strsql += "isMidterm =" & theMid
        strsql += ", isFinal = " & theFinal
        strsql += " ,midStart= '" & myMidStart
        strsql += "', MidEnd = '" & myMidEnd
        strsql += "', FinalStart = '" & myFinalStart
        strsql += "', FinalEnd = '" & MyFinalEnd
        strsql += "' where ID = " & myID
        Response.Write("updatemasterproctor? " & strsql & "<br>")

        Dim myConnection4 As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand(strsql, myConnection4)
        ' Execute the command in a try/catch to catch duplicate username errors
        Try
            ' Open the connection and execute the Command
            myConnection4.Open()
            If RadioPreview.SelectedValue = "Run" Then
                ']]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]HOLD SQL HOLD...[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[
                myCommand.ExecuteNonQuery()
            Else
                Response.Write("Hold<br>")
            End If
        Catch
            ' failed to create a new record
            Response.Write("<font color=red><br>.}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}} <b>.FAIL</b></font><br>")
        Finally
            ' Close the Connection
            If myConnection4.State = ConnectionState.Open Then
                myConnection4.Close()
            End If

        End Try
        Response.Write("Exam Dates Uploaded")




    End Sub

    Protected Sub btnDetails_Click(sender As Object, e As EventArgs) Handles btnDetails.Click

        Dim theconstraint As String = ""
        Select Case RadioSession.SelectedValue
            Case "1"
                theconstraint = " and dbo.MasterProctor.Session = '1'"
            Case "A"
                theconstraint = " and (dbo.MasterProctor.Session = '8W1' or  dbo.MasterProctor.Session = '6W1')"
            Case "A & 1"
                theconstraint = " and (dbo.MasterProctor.Session = '1' or   dbo.MasterProctor.Session = '8W1' or dbo.MasterProctor.Session = '6W1')"
            Case "B"
                theconstraint = " and (dbo.MasterProctor.Session = '8W2' or dbo.MasterProctor.Session = '6W2')"
            Case "12W"
                theconstraint = " and (dbo.MasterProctor.Session = '12W' )"
        End Select

        Dim StrSql As String = ""
        StrSql = " Update dbo.MasterProctor"
        StrSql += " set dbo.MasterProctor.Course = dbo.OL_MasterExam.Course,"
        StrSql += " dbo.MasterProctor.MidTime = dbo.OL_MasterExam.PM_DURATION,"
        StrSql += " dbo.MasterProctor.MidPaper = dbo.OL_MasterExam.PM_LIST_MTRLS_OPT1,"
        StrSql += " dbo.MasterProctor.MidCalculator = dbo.OL_MasterExam.PM_LIST_MTRLS_OPT2,"
        StrSql += " dbo.MasterProctor.MidGraph = dbo.OL_MasterExam.PM_LIST_MTRLS_OPT3,"
        StrSql += " dbo.MasterProctor.MidNotes  = '',"
        StrSql += " dbo.MasterProctor.PM_ANXMTR  = dbo.OL_MasterExam.PM_LIST_ANXMTRLS,"

        StrSql += " dbo.MasterProctor.Essay  = dbo.OL_MasterExam.PM_MG_ES,"
        StrSql += " dbo.MasterProctor.FinalEssay  = dbo.OL_MasterExam.PF_MG_ES,"

        StrSql += " dbo.MasterProctor.IsMidTerm = dbo.OL_MasterExam.PM_Exists,"
        StrSql += " dbo.MasterProctor.IsFinal= dbo.OL_MasterExam.PF_Exists,"



        StrSql += " dbo.MasterProctor.MidNameL = dbo.OL_MasterExam.PM_LCL_NAME,"
        StrSql += " dbo.MasterProctor.MidNameR = dbo.OL_MasterExam.PM_RMT_NAME,"
        StrSql += " dbo.MasterProctor.FinalTime = dbo.OL_MasterExam.PF_DURATION,"
        StrSql += " dbo.MasterProctor.FinalPaper = dbo.OL_MasterExam.PF_LIST_MTRLS_OPT1,"
        StrSql += " dbo.MasterProctor.FinalCalculator = dbo.OL_MasterExam.PF_LIST_MTRLS_OPT2,"
        StrSql += " dbo.MasterProctor.FinalGraph = dbo.OL_MasterExam.PF_LIST_MTRLS_OPT3,"
        StrSql += " dbo.MasterProctor.FinalNotes = '',"
        StrSql += " dbo.MasterProctor.PF_ANXMTR = dbo.OL_MasterExam.PF_LIST_ANXMTRLS,"
        StrSql += " dbo.MasterProctor.FinalNameL  = dbo.OL_MasterExam.PF_LCL_NAME,"
        StrSql += " dbo.MasterProctor.FinalNameR = dbo.OL_MasterExam.PF_RMT_NAME"
        StrSql += " From dbo.OL_MasterExam"
        StrSql += " where dbo.OL_MasterExam.Course = dbo.MasterProctor.course" & theconstraint

        If RadioPreview.SelectedValue = "Preview" Then
            Response.Write(StrSql)
        End If
        ' Response.End()
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)

        Dim myCommand As New SqlCommand(StrSql, myConnection)

        ' Execute the command in a try/catch to catch duplicate username errors
        Try
            ' Open the connection and execute the Command
            myConnection.Open()
            If RadioPreview.SelectedValue = "Run" Then
                ']]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]HOLD SQL HOLD...[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[
                myCommand.ExecuteNonQuery()
            Else
                Response.Write("<br>HOLD<nr>")
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
        Response.Write("Exam Data Uploaded")
    End Sub





    Protected Sub btnBackupB_Click(sender As Object, e As EventArgs) Handles btnBackupB.Click
        Dim strsql As String = "Delete FROM MasterProctor_BU_B; "

        strsql += "Insert into MasterProctor_BU_B Select * from MasterProctor;"
        Response.Write(strsql & "<BR>")

        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)

        Dim myCommand As New SqlCommand(strsql, myConnection)

        ' Execute the command in a try/catch to catch duplicate username errors
        Try
            ' Open the connection and execute the Command
            myConnection.Open()

            ']]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]HOLD SQL HOLD...[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[
            myCommand.ExecuteNonQuery()

        Catch
            ' failed to create a new record
            Response.Write("<font color=red><br>.}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}} <b>.FAIL</b></font><br>")
        Finally
            ' Close the Connection
            If myConnection.State = ConnectionState.Open Then
                myConnection.Close()
            End If

        End Try
        Response.Write("MasterProctor backed up to MasterProctor_BU_B <br>")
        lblFinish.Visible = True
    End Sub

    Protected Sub btnBackup1A_Click(sender As Object, e As EventArgs) Handles btnBackup1A.Click
        Dim strsql As String = "Delete FROM MasterProctor_BU_1A ; "

        strsql += " Insert into MasterProctor_BU_1A Select * from MasterProctor;"

        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)

        Dim myCommand As New SqlCommand(strsql, myConnection)

        ' Execute the command in a try/catch to catch duplicate username errors
        Try
            ' Open the connection and execute the Command
            myConnection.Open()

            ']]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]HOLD SQL HOLD...[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[
            myCommand.ExecuteNonQuery()

        Catch
            ' failed to create a new record
            Response.Write("<font color=red><br>.}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}} <b>.FAIL</b></font><br>")
        Finally
            ' Close the Connection
            If myConnection.State = ConnectionState.Open Then
                myConnection.Close()
            End If

        End Try
        Response.Write("MasterProctor backed up to MasterProctor_BU_1A <br>")
        lblFinish.Visible = True
    End Sub

    Protected Sub RadioSession_SelectedIndexChanged(sender As Object, e As EventArgs) Handles RadioSession.SelectedIndexChanged
        If RadioSession.SelectedValue = "A & 1" Then
            ' Response.Write("A & 1")
            btnBackup1A.Visible = True
            lblWorking.Text = " You are working with Session 1 & A data"
        ElseIf RadioSession.SelectedValue = "B" Then
            'Response.Write("B")
            btnBackupB.Visible = True
            lblWorking.Text = " You are working with Session B data"
        ElseIf RadioSession.SelectedValue = "12W" Then
            'Response.Write("B")
            btnBackupB.Visible = False
            lblWorking.Text = " You are working with Session 12@ data"
        End If
    End Sub

    Protected Sub btnContinue_Click(sender As Object, e As EventArgs) Handles btnContinue.Click
        Panel1.Visible = False
        Panel2.Visible = True
    End Sub

    Protected Sub RadioPreview_SelectedIndexChanged(sender As Object, e As EventArgs) Handles RadioPreview.SelectedIndexChanged
        If RadioPreview.SelectedItem.Text = "Run" Then
            lblMode.Text = "RUN Mode"
            lblMode.ForeColor = Drawing.Color.Red
        ElseIf RadioPreview.SelectedItem.Text = "Preview" Then
            lblMode.Text = "Preview Mode"
            lblMode.ForeColor = Drawing.Color.Blue
        End If
    End Sub
End Class