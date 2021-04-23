Imports System.IO
Imports System.Data.SqlClient
Imports System.Data.Sql
Public Class UploadParentChild03
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnUpload_Click(sender As Object, e As EventArgs) Handles btnUpload.Click
        Dim fileStream As FileStream = File.Open(Server.MapPath("ParentChild03.csv"), FileMode.Open, FileAccess.Read)

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

            If astrValues.Length <> 5 Then
                '''''changed 6 t0 7
                Response.Write("<B> An error occurred while processing Line " & nLine.ToString() & ":<B><br><br>")
                Response.Write(strLine)

                Exit While

            End If


            Response.Write("<br>")
            Response.Write(astrValues(0))

            Response.Write("<BR>")
            Response.Write(astrValues(1))
            Response.Write("<BR>")
            Response.Write(astrValues(2))

            Response.Write("<BR>")
            Response.Write(astrValues(3))
            Response.Write("<BR>")

            Response.Write(astrValues(4))
            Response.Write("<BR>")



            addData(astrValues(0), astrValues(1), astrValues(2), astrValues(3), astrValues(4))

        End While

        streamReader.Close()
        fileStream.Close()
    End Sub



    Sub addData(ByVal strTextField1 As String, ByVal strTextField2 As String, ByVal strTextField3 As String, ByVal strTextField4 As String, ByVal strTextField5 As String)

        Dim strSQL As String = "Insert into BB_ParentChild03 (ParentCourse, ChildCourse, parent, child, course) "
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
        Dim myCommand As New SqlCommand("Select Distinct Parent from BB_ParentChild03 ", myConnection)
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
        Dim myCommand As New SqlCommand("Select child from BB_ParentChild03 where parent= '" & myfamily & "'", myConnection2)
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

        Dim strSQL As String = "Insert into MasterProctor03 (FamilyString,Parent)  "
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
                theconstraint = " and dbo.MasterProctor03.Session = '1'"
            Case "A"
                theconstraint = " and dbo.MasterProctor03.Session = '8W1' or  dbo.MasterProctor03.Session = '6W1'"
            Case "A & 1"
                theconstraint = " and dbo.MasterProctor03.Session = '1' or   dbo.MasterProctor03.Session = '8W1' or dbo.MasterProctor03.Session = '6W1'"
            Case "B"
                theconstraint = " and dbo.MasterProctor03.Session = '8W2' or dbo.MasterProctor03.Session = '6W2'"
        End Select
        theconstraint = ""
        Dim StrSql As String = ""

        StrSql = " Update dbo.MasterProctor03 "
        StrSql += " set dbo.masterProctor03.course=CMR.course,"
        StrSql += "dbo.masterProctor03.Instructor= CMR.InstructorFirst + ' ' + CMR.InstructorLast,"
        StrSql += "dbo.MasterProctor03.Outlook = CMR.username,"
        StrSql += "dbo.MasterProctor03.Session = CMR.session,"
        StrSql += "dbo.MasterProctor03.Canchange = CMR.CanChange "
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

    Protected Sub btnAddSinglesMP03_Click(sender As Object, e As EventArgs) Handles btnAddSinglesMP03.Click
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
        Dim strsql As String = ""
        Dim mycount As Integer = 0

        strsql += " Select reference, course"
        strsql += " From [VC_VCData].[dbo].[BBcourses]"
        strsql +=" Where ischild = 0 And term_key ='2203' and category <> 'Master' "
        strsql += " And reference Not In (Select distinct Parent from BB_ParentChild03)"

        Dim myCommand As New SqlCommand(strsql, myConnection)
        'Response.Write("select Course, Credits from Courses where course_ID=" & CInt(courseID))
        ' Open the connection and execute the Command
        myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        While dr.Read()
            mycount = mycount + 1
            'response.Write("<br>" & dr("family"))
            If Not IsDBNull(dr("Reference")) Then
                'Response.Write(dr("Parent") & "<br>")
                'response.Write("<br>" & getCourse(dr("family")) & "," & dr("family") & " " & getExams(dr("family")))
                addMasterProctor(dr("Reference"), dr("Reference"))
            End If
        End While
        myConnection.Close()
        Response.Write("<br>Count =  " & mycount)
    End Sub

    Protected Sub btnClearTable_Click(sender As Object, e As EventArgs)

    End Sub

    Protected Sub btnClearTable0_Click(sender As Object, e As EventArgs) Handles btnClearTable0.Click

    End Sub

    Protected Sub btnAddExamData_Click(sender As Object, e As EventArgs) Handles btnAddExamData.Click

    End Sub
End Class