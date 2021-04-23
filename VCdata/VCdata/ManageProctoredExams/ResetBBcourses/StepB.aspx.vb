Imports System.IO
Imports System.Data.SqlClient
Imports System.Data.Sql

Public Class StepB
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnResetBBcourses_Click(sender As Object, e As EventArgs) Handles btnResetBBcourses.Click
        Dim myConnection2 As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
        'Dim myCommand As New SqlCommand("Select child from BB_ParentChild where parent= '" & myfamily & "'", myConnection2)
        'Response.Write("select Course, Credits from Courses where course_ID=" & CInt(courseID))
        ' Open the connection and execute the Command
        myConnection2.Open()
        'Dim dr2 As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        Dim strsql As String = ""
        If RadioSession.SelectedValue = "1" Then
            strsql = "Update BBCourses set ischild =0, childof = '' where Term_Key  = '" & txtTerm.Text & "' and (session = '1' or session= '8W1' or session = '6W1')"
        ElseIf RadioSession.SelectedValue = "2" Then
            strsql = "Update BBCourses set ischild =0, childof = '' where Term_Key  = '" & txtTerm.Text & "' and (session= '8W2' or session = '6W2')"
        ElseIf RadioSession.SelectedValue = "12W" Then
            strsql = "Update BBCourses set ischild =0, childof = '' where Term_Key  = '" & txtTerm.Text & "' and (session= '12W' )"
        End If
        Response.Write(strsql)
        'Response.End()
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand(strsql, myConnection)
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
        Response.Write("DataReset")

        myConnection2.Close()
    End Sub

    Protected Sub btnUpdateChildren_Click(sender As Object, e As EventArgs) Handles btnUpdateChildren.Click
        ' We have already set all bbcourses back to all parents with no children, so now we update parent/child from the BB-ParentChild table which is exactly what is in BB
        Dim mycount As Integer = 0

        'Dim strsql As String = ""
        'If RadioSession.SelectedValue = "1" Then
        'strsql = "Update BBCourses set ischild =0, childof = '' where Term_Key  = '" & txtTerm.Text & "' and (session = '1' or session= '8W1' or session = '6W1')"
        'ElseIf RadioSession.SelectedValue = "2" Then
        'strsql = "Update BBCourses set ischild =0, childof = '' where Term_Key  = '" & txtTerm.Text & "' and (session= '8W2' or session = '6W2')"
        'End If


        Dim myConnection2 As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand("Select Parent, child from BB_ParentChild", myConnection2)
        'Response.Write("select Course, Credits from Courses where course_ID=" & CInt(courseID))
        ' Open the connection and execute the Command
        myConnection2.Open()
        Dim dr2 As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        Dim myCourseList As String = ""

        While dr2.Read()
            mycount = mycount + 1
            Response.Write(dr2("Parent") & "<br>")
            Response.Write(dr2("Child") & "<br>")
            'I comment out the update to review the sql statements. When OK, then uncomment and rerun
            '{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{  HOLD  }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}
            updateBBCourses(dr2("Parent"), dr2("Child"))
            Response.Write(mycount & "<br>")

        End While


        'addMasterProctor(myfamilystring, myfamily)
        myConnection2.Close()
    End Sub

    Sub updateBBCourses(ByVal myparent As String, ByVal mychild As String)
        Dim StrSql As String = ""
        StrSql = " Update dbo.BBcourses "
        StrSql += " set ischild=1,"
        StrSql += "childof ='" & myparent & "',"
        StrSql += "family ='" & myparent & "'"
        StrSql += " Where Reference ='" & mychild & "'"
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
            Else
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
        Response.Write("Data Updated")
    End Sub

    Protected Sub btnResetFamilies_Click(sender As Object, e As EventArgs) Handles btnResetFamilies.Click

        'This needs to be modified for both I and A::::}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}} cHANGEme
        Dim strsql As String = ""
        If RadioSession.SelectedValue = "1" Then
            strsql = "Update BBCourses set family=reference from BBCourses where Term_Key  = '" & txtTerm.Text & "' and  (session = '1' or session= '8W1' or session = '6W1')"
        ElseIf RadioSession.SelectedValue = "2" Then
            strsql = "Update BBCourses set family=reference from BBCourses where Term_Key  = '" & txtTerm.Text & "' and  (session= '8W2' or session = '6W2')"
        ElseIf RadioSession.SelectedValue = "12W" Then
            strsql = "Update BBCourses set family=reference from BBCourses where Term_Key  = '" & txtTerm.Text & "' and (session= '12W' )"
        End If
        Response.Write(strsql & "<br>")
        'Response.End()
        Response.Write(strsql & "Family Reset<br>")
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand(strsql, myConnection)
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
        Response.Write("DataReset")
    End Sub



    Protected Sub AddSingles_Click(sender As Object, e As EventArgs) Handles AddSingles.Click
        Dim StrSql As String = ""
        If RadioSession.SelectedValue = "2" Then
            StrSql = "SELECT [Reference], [Session], [Course]  FROM [VC_VCData].[dbo].[BBCourses] "
            StrSql += "where BBcourses.term_key  = '" & txtTerm.Text & "' And BBcourses.Course_Name not like '%MC_VC' and BBcourses.Username <> '' "
            StrSql += " and BBcourses.ischild = 0 and (session = '8W2'  or session = '6W2') and BBcourses.Reference not in (select distinct parent from dbo.BB_ParentChild) "
        ElseIf RadioSession.SelectedValue = "1" Then

            StrSql = "SELECT [Reference] , [Session], [Course]  FROM [VC_VCData].[dbo].[BBCourses] "
            StrSql += "  where BBcourses.term_key = '" & txtTerm.Text & "' And BBcourses.Course_Name not like '%MC_VC' and BBcourses.Username <> '' "
            StrSql += " and BBcourses.ischild = 0 and (BBcourses.session = '8W1' or BBcourses.session = '6W1' or BBcourses.session='1') and BBcourses.Reference not in (select distinct parent from dbo.BB_ParentChild) "
        ElseIf RadioSession.SelectedValue = "12W" Then

            StrSql = "SELECT [Reference] , [Session], [Course]  FROM [VC_VCData].[dbo].[BBCourses] "
            StrSql += "  where BBcourses.term_key = '" & txtTerm.Text & "' And BBcourses.Course_Name not like '%MC_VC' and BBcourses.Username <> '' "
            StrSql += " and BBcourses.ischild = 0 and (BBcourses.session = '12W' ) and BBcourses.Reference not in (select distinct parent from dbo.BB_ParentChild) "
        End If



        Response.Write(StrSql)
        'Response.End()
        Dim mycount As Integer = 0
        Dim myConnection2 As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand(StrSql, myConnection2)
        'Response.Write("select Course, Credits from Courses where course_ID=" & CInt(courseID))
        ' Open the connection and execute the Command
        myConnection2.Open()
        Dim dr2 As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        Dim myCourseList As String = ""

        While dr2.Read()
            mycount = mycount + 1
            Response.Write(dr2("Reference") & "<br>")
            addMasterProctor(dr2("Reference"), dr2("Session"), dr2("Course"))
            Response.Write(mycount & "<br>")

        End While


        'addMasterProctor(myfamilystring, myfamily)
        myConnection2.Close()
        lblMoveOn.Visible = True
    End Sub

    Sub addMasterProctor(ByVal myparent As String, ByVal mysession As String, ByVal mycourse As String)

        Dim strSQL As String = "Insert into MasterProctor (FamilyString,Parent,Session,Course,Term,UseDefault,Lockdown)  "
        strSQL += "VALUES ('" & myparent
        strSQL += "','" & myparent
        strSQL += "','" & mysession
        strSQL += "','" & mycourse
        strSQL += "','" & txtTerm.Text
        strSQL += "',1,1)"
        Response.Write("<BR>" & strSQL & "<BR>")

        ' Create Instance of Connection and Command Object
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)

        Dim myCommand As New SqlCommand(strSQL, myConnection)

        ' Execute the command in a try/catch to catch duplicate username errors
        Try

            ' Open the connection and execute the Command
            myConnection.Open()

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
            If myConnection.State = ConnectionState.Open Then
                myConnection.Close()
            End If

        End Try
        lblMoveOn.Visible = Visible = True
    End Sub

    Protected Sub btnContinue1_Click(sender As Object, e As EventArgs) Handles btnContinue1.Click
        Panel1.Visible = False
        Panel2.Visible = True
    End Sub

    Protected Sub btnContinue2_Click(sender As Object, e As EventArgs) Handles btnContinue2.Click
        Panel2.Visible = False
        Panel3.Visible = True
    End Sub

    Protected Sub btnConeinue3_Click(sender As Object, e As EventArgs) Handles btnConeinue3.Click
        Panel3.Visible = False
        Panel4.Visible = True
    End Sub

    Protected Sub RadioSession_SelectedIndexChanged(sender As Object, e As EventArgs) Handles RadioSession.SelectedIndexChanged
        lblWorkingSession.Text = " You are working with " & RadioSession.SelectedItem.Text
    End Sub

    Protected Sub RadioPreview_SelectedIndexChanged(sender As Object, e As EventArgs) Handles RadioPreview.SelectedIndexChanged
        lblAction.Text = " The action is " & RadioPreview.SelectedItem.Text
    End Sub
End Class