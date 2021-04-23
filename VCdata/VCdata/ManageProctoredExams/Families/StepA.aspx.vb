Imports System.IO
Imports System.Data.SqlClient
Imports System.Data.Sql

Public Class StepA
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        txtTerm.Text = getINI("FacultyPortal", "lblTerm.text")
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim strFileName As String

        If UploadFile.PostedFile.FileName.Length > 0 Then
            strFileName = System.IO.Path.GetFileName(UploadFile.PostedFile.FileName)
            UploadFile.PostedFile.SaveAs(Server.MapPath("../Data/ParentChild.txt"))
            Panel3.Visible = True
            Panel4.Visible = True
        End If

        lblFileName.Text = UploadFile.PostedFile.FileName
        lblFileSize.Text = UploadFile.PostedFile.ContentLength
        lblFileContentType.Text = UploadFile.PostedFile.ContentType
    End Sub

    Protected Sub btnUpload_Click(sender As Object, e As EventArgs) Handles btnUpload.Click
        Dim fileStream As FileStream = File.Open(Server.MapPath("../Data/ParentChild.txt"), FileMode.Open, FileAccess.Read)

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
        Panel4.Visible = True
        Panel3.Visible = False
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
        Dim mycourse As String = ""
        Dim myConnection2 As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand("Select child, course from BB_ParentChild where parent= '" & myfamily & "'", myConnection2)
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
        lblStep2.Visible = True

    End Sub

    Function getsession(ByVal myparent As String) As String
        Dim myreturn As String = ""

        Dim myConnection2 As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand("Select Session from CMR where BBreference= '" & myparent & "'", myConnection2)
        'Response.Write("select Course, Credits from Courses where course_ID=" & CInt(courseID))
        ' Open the connection and execute the Command
        myConnection2.Open()
        Dim dr2 As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        Dim myCourseList As String = ""

        While dr2.Read()


            myreturn = dr2("Session")


        End While

        dr2.Close()
        dr2 = Nothing
        myConnection2.Close()


        Return myreturn


        Return myreturn
    End Function
    Function getcourse(ByVal myparent As String) As String
        Dim myreturn As String = ""



        Dim myConnection2 As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand("Select top 1 Course from BB_ParentChild where parent= '" & myparent & "'", myConnection2)
        'Response.Write("select Course, Credits from Courses where course_ID=" & CInt(courseID))
        ' Open the connection and execute the Command
        myConnection2.Open()
        Dim dr2 As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        Dim myCourseList As String = ""

        While dr2.Read()


            myreturn = dr2("Course")


        End While

        dr2.Close()
        dr2 = Nothing
        myConnection2.Close()


        Return myreturn


        Return myreturn
    End Function
    Sub addMasterProctor(ByVal strTextField1 As String, ByVal strTextField2 As String)
        Dim myfamily As String = strTextField2
        Dim mysession As String = getsession(myfamily)
        Dim goflag As Integer = 1
        ' If (mysession = "1" Or mysession = "8W1" Or mysession = "6W1") And RadioFamily.SelectedValue = "1" Then
        'goflag = 1
        'ElseIf mysession = "8W2" And RadioFamily.SelectedValue = "2" Then
        ' RadioFamily.SelectedValue = "1"
        'goflag = 2
        'End If
        If goflag = 1 Then
            Dim strSQL As String = "Insert into MasterProctor(FamilyString,Parent,Session,Course,Term)  "
            strSQL += "VALUES ('" & strTextField1
            strSQL += "','" & strTextField2
            strSQL += "','" & mysession
            strSQL += "','" & getCourse(strTextField2)
            strSQL += "','" & txtTerm.Text & "')"
            'that used to be MasterProctorPro  but I forgot why I was using pro. So I reverted to the empty MasterRroctor


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
        Else
            Response.Write("Wrong Session <br>")
        End If
        Response.Write("Data Uploaded")

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






    Protected Sub btnClearTable_Click(sender As Object, e As EventArgs) Handles btnClearTable.Click
        Dim StrSql As String = ""
        StrSql = " Delete from dbo.MasterProctor "


        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)

        Dim myCommand As New SqlCommand(StrSql, myConnection)

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
        Response.Write("BB_ParentChild Cleared")
    End Sub








    Protected Sub btnSelectSession_Click(sender As Object, e As EventArgs) Handles btnSelectSession.Click
        If RadioIsSessionB.SelectedValue = "Yes" Then
            btnClearTable.Enabled = True
            RadioFamily.SelectedValue = "1"
        Else
            btnClearTable.Enabled = False
            RadioFamily.SelectedValue = "2"
            btnClearTable.BackColor = Drawing.Color.Black
            btnClearTable.Text = "Disabled"
        End If
        Panel1.Visible = False
        Panel2.Visible = True
    End Sub

    Protected Sub BtbContine_Click(sender As Object, e As EventArgs) Handles BtbContine.Click
        Panel2.Visible = False
        Panel3.Visible = True
    End Sub



End Class