Imports System.IO
Imports System.Data.SqlClient
Imports System.Data.Sql

Public Class UploadBB_ParentChild
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim strFileName As String

        If UploadFile.PostedFile.FileName.Length > 0 Then
            strFileName = System.IO.Path.GetFileName(UploadFile.PostedFile.FileName)
            UploadFile.PostedFile.SaveAs(Server.MapPath("Data/ParentChild.txt"))
            Panel1.Visible = True
            Panel2.Visible = True
        End If

        lblFileName.Text = UploadFile.PostedFile.FileName
        lblFileSize.Text = UploadFile.PostedFile.ContentLength
        lblFileContentType.Text = UploadFile.PostedFile.ContentType
    End Sub

    Protected Sub btnUpload_Click(sender As Object, e As EventArgs) Handles btnUpload.Click
        Dim fileStream As FileStream = File.Open(Server.MapPath("Data/ParentChild.txt"), FileMode.Open, FileAccess.Read)

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

            If astrValues.Length <> 2 Then
                '''''changed 6 t0 7
                Response.Write("<B> An error occurred while processing Line " & nLine.ToString() & ":<B><br><br>")
                Response.Write(strLine)

                Exit While

            End If


            Response.Write("<br>")
            Response.Write(astrValues(0))
            Dim myparent As String = astrValues(0)
            Dim Myindex As Integer = 0
            Myindex = myparent.IndexOf("-") + 2
            Dim parentRef As String = Mid(myparent, Myindex)
            Response.Write("<BR>")
            Response.Write(parentRef)
            'getMembers(parentRef)
            Response.Write("<BR>")
            Response.Write(astrValues(1))

            Dim mychild As String = astrValues(1)
            Dim Myindex2 As Integer = 0
            Myindex2 = mychild.IndexOf("-") + 2
            Dim childRef As String = Mid(mychild, Myindex2)
            Response.Write("<BR>")
            Response.Write(childRef)
            Response.Write("<BR>")
            Dim mycourse As String = Left(mychild, Myindex2 - 2)
            Response.Write(Left(mychild, Myindex2 - 2))


            Dim i As Integer = 0
            For i = 0 To 1
                'Response.Write("<br>" & astrValues(i) & "|")
            Next
            Response.Write("<br>")

            addData(astrValues(0), parentRef, astrValues(1), childRef, mycourse)
            Response.Write(astrValues(0) & "|" & parentRef & "|" & astrValues(1) & "|" & childRef & "|" & mycourse)


        End While

        streamReader.Close()
        fileStream.Close()
    End Sub



    Sub addData(ByVal strTextField1 As String, ByVal strTextField2 As String, ByVal strTextField3 As String, ByVal strTextField4 As String, ByVal strTextField5 As String)

        Dim strSQL As String = "Insert into BB_ParentChild (ParentCourse, parent, ChildCourse, child, course) "
        strSQL += "VALUES ('" & strTextField1
        strSQL += "','" & strTextField2
        strSQL += "','" & strTextField3
        strSQL += "','" & strTextField4
        strSQL += "','" & strTextField5 & "')"



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

    Protected Sub btnFamily_Click(sender As Object, e As EventArgs) Handles btnFamily.Click
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand("Select Distinct Parent from BB_ParentChild ", myConnection)
        'Response.Write("select Course, Credits from Courses where course_ID=" & CInt(courseID))
        ' Open the connection and execute the Command
        myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        While dr.Read()

            'response.Write("<br>" & dr("family"))
            If Not IsDBNull(dr("Parent")) Then
                'Response.Write(dr("Parent") & "<br>")
                'response.Write("<br>" & getCourse(dr("family")) & "," & dr("family") & " " & getExams(dr("family")))
                getMembers(dr("parent"))
            End If
        End While
        myConnection.Close()
    End Sub

    Sub getMembers(ByVal myfamily As String)
        Dim myConnection2 As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand("Select child from BB_ParentChild where parent= '" & myfamily & "'", myConnection2)
        'Response.Write("select Course, Credits from Courses where course_ID=" & CInt(courseID))
        ' Open the connection and execute the Command
        myConnection2.Open()
        Dim dr2 As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        Dim myCourseList As String = ""

        While dr2.Read()


            myCourseList += dr2("Child") & ","


        End While

        myCourseList = myCourseList.Remove(myCourseList.LastIndexOf(","))
        Dim myfamilystring As String = myfamily & "," & myCourseList
        Response.Write("<br>" & myfamily & "," & myCourseList)
        addMasterProctor(myfamilystring, myfamily)
        myConnection2.Close()

    End Sub

    Sub addMasterProctor(ByVal strTextField1 As String, ByVal strTextField2 As String)

        Dim strSQL As String = "Insert into MasterProctor (FamilyString,Parent)  "
        strSQL += "VALUES ('" & strTextField1
        strSQL += "','" & strTextField2 & "')"




        Response.Write("<BR>" & strSQL & "<BR>")

        ' Create Instance of Connection and Command Object
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)

        Dim myCommand As New SqlCommand(strSQL, myConnection)

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

        Response.Write("Data Uploaded")

    End Sub

    Protected Sub btnCourseData_Click(sender As Object, e As EventArgs) Handles btnCourseData.Click
        '  get  Course, instructor, username, CanChange, Session  from CMR where  reference = MasterProctor.parent
        Dim theconstraint As String = ""
        Select Case RadioSession.SelectedValue
            Case "1"
                theconstraint = " and dbo.MasterProctor.Session = '1'"
            Case "A"
                theconstraint = " and dbo.MasterProctor.Session = '8W1' or  dbo.MasterProctor.Session = '6W1'"
            Case "A & 1"
                theconstraint = " and dbo.MasterProctor.Session = '1' or   dbo.MasterProctor.Session = '8W1' or dbo.MasterProctor.Session = '6W1'"
            Case "B"
                theconstraint = " and dbo.MasterProctor.Session = '8W2' or dbo.MasterProctor.Session = '6W2'"
        End Select
        Dim StrSql As String = ""

        StrSql = " Update dbo.MasterProctor "
        StrSql += " set dbo.masterProctor.course=CMR.course,"
        StrSql += "dbo.masterProctor.Instructor= CMR.InstructorFirst + ' ' + CMR.InstructorLast,"
        StrSql += "dbo.MasterProctor.Outlook = CMR.username,"
        StrSql += "dbo.MasterProctor.Session = CMR.session,"
        StrSql += "dbo.MasterProctor.Canchange = CMR.CanChange "
        StrSql += "    From dbo.CMR "
        StrSql += "Where dbo.CMR.BBReference = dbo.MasterProctor.Parent" & theconstraint


        Response.Write(StrSql & "<br>")
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand(StrSql, myConnection)
        ' Execute the command in a try/catch to catch duplicate username errors
        Try
            ' Open the connection and execute the Command
            myConnection.Open()
            If RadioPreview.SelectedValue = "Run" Then
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
        Response.Write("Course Data Uploaded")
    End Sub

    Protected Sub btnAddExamData_Click(sender As Object, e As EventArgs) Handles btnAddExamData.Click
        Dim StrSql As String = ""
        Dim theconstraint As String = ""
        Select Case RadioSession.SelectedValue
            Case "1"
                theconstraint = " Session = '1'"
            Case "A"
                theconstraint = "Session = '8W1' or Session = '6W1'"
            Case "A & 1"
                theconstraint = "Session = '1' or Session = '8W1' or Session = '6W1'"
            Case "B"
                theconstraint = "Session = '8W2' or Session = '6W2'"
        End Select

        StrSql = " Select ID,course,Parent,Session From dbo.MasterProctor where  " & theconstraint

        Dim myConnection2 As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
            Dim theCommand As New SqlCommand(StrSql, myConnection2)
            'Response.Write("select Course, Credits from Courses where course_ID=" & CInt(courseID))
            ' Open the connection and execute the Command
            myConnection2.Open()
            Dim dr2 As SqlDataReader = theCommand.ExecuteReader(CommandBehavior.CloseConnection)
            Dim myCourseList As String = ""

            While dr2.Read()


            Response.Write(dr2("ID") & "  " & dr2("Course") & "  " & dr2("Parent") & "  " & dr2("Session") & "<br>")

            GetExamData(dr2("ID"), dr2("Course"), dr2("Session"))
        End While


            ''addMasterProctor(myfamilystring, myfamily)
            myConnection2.Close()














    End Sub

    Sub GetExamData(ByVal myID As Integer, ByVal mycourse As String, ByVal mysession As String)
        Dim myquery As String = ""
        Select Case mysession
            Case "1"
                myquery = "Select isMid, isFinal, Mid1_Start as myMidStart, Mid1_End as myMidEnd, Final1_Start as myFinalStart, Final1_End as myFinalEnd from MasterExamDates where Course ='" & mycourse & "'"
            Case "6W1"
                myquery = "Select isMid, isFinal, MidA_Start as myMidStart, MidA_End as myMidEnd, FinalA_Start as myFinalStart, FinalA_End as myFinalEnd from MasterExamDates where Course ='" & mycourse & "'"
            Case "8W1"
                myquery = "Select isMid, isFinal, MidA_Start as myMidStart, MidA_End as myMidEnd, FinalA_Start as myFinalStart, FinalA_End as myFinalEnd from MasterExamDates where Course ='" & mycourse & "'"
            Case "6W2"
                myquery = "Select isMid, isFina,l MidB_Start as myMidStart, MidB_End as myMidEnd, FinalB_Start as myFinalStart, FinalB_End as myFinalEnd from MasterExamDates where Course ='" & mycourse & "'"
            Case "8W2"
                myquery = "Select isMid, isFinal, MidB_Start as myMidStart, MidB_End as myMidEnd, FinalB_Start as myFinalStart, FinalB_End as myFinalEnd from MasterExamDates where Course ='" & mycourse & "'"
        End Select

        Response.Write(myquery & "<br>")

        Dim myConnection3 As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
        Dim theCommand As New SqlCommand(myquery, myConnection3)
        'Response.Write("select Course, Credits from Courses where course_ID=" & CInt(courseID))
        ' Open the connection and execute the Command
        myConnection3.Open()
        Dim dr3 As SqlDataReader = theCommand.ExecuteReader(CommandBehavior.CloseConnection)
        Dim myCourseList As String = ""

        While dr3.Read()



            UpdateMasterProctorExams(myID, dr3("IsMid"), dr3("IsFinal"), dr3("myMidStart"), dr3("myMidEnd"), dr3("myFinalStart"), dr3("myFinalEnd"))
        End While


        ''addMasterProctor(myfamilystring, myfamily)
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

        strsql += "isMidterm =" & theMid
        strsql += ", isFinal = " & theFinal
        strsql += ", midStart= '" &  myMidStart
        strsql += "', MidEnd = '" & myMidEnd
        strsql += "', FinalStart = '" & myFinalStart
        strsql += "', FinalEnd = '" & MyFinalEnd
        strsql += "' where ID = " & myID
        Response.Write(strsql & "<br>")

        Dim myConnection4 As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand(strsql, myConnection4)
        ' Execute the command in a try/catch to catch duplicate username errors
        Try
            ' Open the connection and execute the Command
            myConnection4.Open()
            If RadioPreview.SelectedValue = "Run" Then
                ']]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]HOLD SQL HOLD...[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[
                myCommand.ExecuteNonQuery()
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
                theconstraint = " and dbo.MasterProctor.Session = '8W1' or  dbo.MasterProctor.Session = '6W1'"
            Case "A & 1"
                theconstraint = " and dbo.MasterProctor.Session = '1' or   dbo.MasterProctor.Session = '8W1' or dbo.MasterProctor.Session = '6W1'"
            Case "B"
                theconstraint = " and dbo.MasterProctor.Session = '8W2' or dbo.MasterProctor.Session = '6W2'"
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
        Response.Write(StrSql)
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

    Protected Sub btnClearTable_Click(sender As Object, e As EventArgs) Handles btnClearTable.Click
        Dim StrSql As String = ""
        StrSql = " Delete from dbo.MasterProctor "


        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)

        Dim myCommand As New SqlCommand(StrSql, myConnection)

        ' Execute the command in a try/catch to catch duplicate username errors
        Try
            ' Open the connection and execute the Command
            myConnection.Open()
            If RadioPreview.SelectedValue = "Run" Then
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
        Response.Write("MasterProctor Cleared")
    End Sub

    Protected Sub btnClearTable0_Click(sender As Object, e As EventArgs) Handles btnClearTable0.Click
        Dim StrSql As String = ""
        StrSql = " Delete from dbo.BB_ParentChild "


        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)

        Dim myCommand As New SqlCommand(StrSql, myConnection)

        ' Execute the command in a try/catch to catch duplicate username errors
        Try
            ' Open the connection and execute the Command
            myConnection.Open()
            If RadioPreview.SelectedValue = "Run" Then
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
        Response.Write("BB_ParentChild Cleared")
    End Sub
End Class