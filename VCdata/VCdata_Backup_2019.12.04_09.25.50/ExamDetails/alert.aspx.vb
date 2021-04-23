Imports System.Data
Imports System.Data.SqlClient

Public Class alert
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            'Bindcourses()
            getallstuff(Request("ID"))
            'loadgridview2(Request("ID"))
            'txtInstructor.Text = getinstructor(Request("ID"))
            txtNotes.Text = getNotes(Request("ID"))
        End If

        'GridView1.SelectedRow.Focus()
    End Sub

    Sub getallstuff(ByVal myreference As String)
        Dim strSQL As String
        '    _BU
        strSQL = " SELECT dbo.BBCourses.Reference, dbo.BBCourses.Course_Name, dbo.BBCourses.Start_Date, dbo.BBCourses.Instructor From dbo.BBCourses "

        strSQL += " WHERE (dbo.BBCourses.Reference='" & myreference & "')"

        'Response.Write(strSQL)
        'Response.End()

        ' Create Instance of Connection and Command Object

        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand(strSQL, myConnection)

        ' Open the connection and execute the Command
        myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        While dr.Read()
            txtReference.Text = dr("reference")

            txtCourse.Text = dr("course_name")
            txtStart.Text = dr("start_date")


            txtInstructor.Text = dr("Instructor")

        End While

    End Sub

    Protected Function getinstructor(ByVal myreference As String) As String
        Dim myreturn As String = "TBA"

        Dim strSQL As String
        'strSQL = " SELECT dbo.BBCourses.Reference, dbo.BBusers.UserName "
        'strSQL += " FROM  dbo.BBAssociations INNER JOIN"
        'strSQL += " dbo.BBusers ON dbo.BBAssociations.MDCID = dbo.BBusers.MDCID RIGHT OUTER JOIN"
        ' strSQL += " dbo.BBCourses ON dbo.BBAssociations.Reference = dbo.BBCourses.Reference"
        'strSQL += " WHERE (dbo.BBCourses.Reference = '" & myreference & "')"
        'Response.Write(strSQL) 'for testing
        'Response.End()



        strSQL = " SELECT     dbo.BBCourses.ID, dbo.BBCourses.Reference, dbo.BBCourses.Course_Name, dbo.BBCourses.Course_ID, dbo.BBCourses.TERM_KEY, dbo.BBusers.UserName, dbo.BBCourses.Category, dbo.BBAssociations.MDCID"
        strSQL += "  FROM         dbo.BBusers RIGHT OUTER JOIN"
        strSQL += "  dbo.BBAssociations On dbo.BBusers.MDCID = dbo.BBAssociations.MDCID RIGHT OUTER JOIN"
        strSQL += "   dbo.BBCourses On dbo.BBAssociations.Reference = dbo.BBCourses.Reference "
        strSQL += "  WHERE (dbo.BBAssociations.Reference = '" & myreference & "')"

        'Response.Write(strSQL)
        Response.Write("<br>")
        'Response.End()
        ' Create Instance of Connection and Command Object
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand(strSQL, myConnection)

        ' Open the connection and execute the Command
        myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        dr.Read()

        If IsDBNull(dr("Username")) <> False Then
            myreturn = "TBA"
        Else
            myreturn = dr("Username")
        End If

        Return myreturn
    End Function

    Protected Function getNotes(ByVal myreference As String) As String
        Dim myreturn As String = "No Notes..."

        Dim strSQL As String
        'strSQL = " SELECT dbo.BBCourses.Reference, dbo.BBusers.UserName "
        'strSQL += " FROM  dbo.BBAssociations INNER JOIN"
        'strSQL += " dbo.BBusers ON dbo.BBAssociations.MDCID = dbo.BBusers.MDCID RIGHT OUTER JOIN"
        ' strSQL += " dbo.BBCourses ON dbo.BBAssociations.Reference = dbo.BBCourses.Reference"
        'strSQL += " WHERE (dbo.BBCourses.Reference = '" & myreference & "')"
        'Response.Write(strSQL) 'for testing
        'Response.End()



        strSQL = " SELECT   ScheduleNotes "
        strSQL += "  FROM   CMR"

        strSQL += "  WHERE (BBReference = '" & myreference & "')"

        'Response.Write(strSQL)
        'Response.Write("<br>")
        'Response.End()
        ' Create Instance of Connection and Command Object
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand(strSQL, myConnection)

        ' Open the connection and execute the Command
        myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        dr.Read()

        If IsDBNull(dr("ScheduleNotes")) <> False Then
            myreturn = "NO Notes"
        Else
            myreturn = dr("ScheduleNotes")
        End If

        Return myreturn
    End Function

    Private Sub ClearAlert(ByVal myreference As String)

        Response.Write("update BBCourses set alertflag=0 where Reference ='" & myreference & "'")

        ''''''''''''''''''''''''''''''''''''''''''
        Dim mysql As String = "update BBCourses set alertflag=0 where Reference ='" & myreference & "'"


        'Response.Write(mysql & "<br>")

        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand(mysql, myConnection) '

        ' Execute the command in a try/catch to catch duplicate username errors'
        Try
            ' Open the connection and execute the Command
            myConnection.Open()
            ' mycounter = mycounter + 1
            'HOLD SQL HOLD.[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[......................................
            myCommand.ExecuteNonQuery()
        Catch
            ' failed to create a new record 
            Response.Write("Fail")
        Finally
            'Close the Connection
            If myConnection.State = ConnectionState.Open Then
                myConnection.Close()
            End If
        End Try
        Response.Write("Flag removed. Refresh the grid after closing this window to see the change..")
    End Sub



    Protected Function getUserName(ByVal myMDCID As String) As String
        Dim myreturn As String = "TBA"

        Dim strSQL As String

        'strSQL = " SELECT UserName,[FirstName],[LastName]"
        'strSQL += "  FROM([VC_VCData].[dbo].[BBusers])"
        'strSQL += " Where MDCID='" & myMDCID & "'"

        strSQL = " SELECT username"
        strSQL += "  FROM [VC_VCData].[dbo].[BBUsers] "
        strSQL += " Where MDCID='" & myMDCID & "'"

        'Response.Write(strSQL) 'for testing
        'Response.End()

        ' CreDim myConnection As New SqlConnection(ConfigurationManager.AppSettings("ConnectionString"))ate Instance of Connection and Command Object
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand(strSQL, myConnection)

        ' Open the connection and execute the Command
        myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)

        If dr.Read() Then

            myreturn = dr("username")
        Else
            myreturn = "Unknown User"
        End If


        Return myreturn
    End Function

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Me.ClientScript.RegisterClientScriptBlock(Me.GetType(), "Close", "window.close()", True)
    End Sub

    Protected Sub btnClear_Click(sender As Object, e As EventArgs) Handles btnClear.Click
        ClearAlert(Request("ID"))
    End Sub

End Class