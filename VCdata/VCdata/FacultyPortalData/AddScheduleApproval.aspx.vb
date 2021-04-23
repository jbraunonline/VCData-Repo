

Imports System.Data
Imports System.Data.SqlClient
Imports System.IO

Public Class AddScheduleApproval
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim mylinktext As String = "<a href=""tabstrip.aspx?Action=Approval' target='""_parent"">Go to task.</a>"
        Dim strsql As String
        strsql = " Insert into AdminRequest (TaskTable,Term, Username,RecipientName,Sender, DateIn,Subject,ReopenMessage, ActionRequest) Values ('"
        strsql += "AdminScheduleApproval','"
        strsql += txtTerm.Text & " ','"
        strsql += txtUsername.Text & "','"
        strsql += txtRecipientName.Text & "','"
        strsql += txtSender.Text & "','"
        strsql += Now.ToShortDateString & "','"
        strsql += txtSubject.Text & "','"
        strsql += txtActionEvent.Text & "','"
        strsql += txtActionRequest.Text & "');"
        strsql += " Select SCOPE_IDENTITY()  as myID"
        Response.Write(strsql)

        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand(strsql, myConnection)
        Dim xyz As Integer = 777
        Try
            myConnection.Open()
            ''Note ExecuteScalar()  {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{ Hold below ]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]
            xyz = myCommand.ExecuteScalar()

        Catch
            Response.Write("<br>failed to create a new task record <br>")
        Finally

        End Try
        Response.Write("<br> My TaskID = " & xyz)

        'Now add the Admin Message with the above task ID
        Dim mysql As String
        mysql = "Insert into AdminScheduleApproval (Request_ID,term, username, RecipientName, sender,datein,Subject,Task) Values ("
        mysql += xyz & ",'"
        mysql += txtTerm.Text & "','"
        mysql += txtUsername.Text & "','"
        mysql += txtRecipientName.Text & "','"
        mysql += txtSender.Text & "','"
        mysql += Now.ToShortDateString & "','"
        mysql += txtSubject.Text & "','"
        mysql += txtTask.Text & "');"





        Response.Write("<br>" & mysql & "<br> ")

        '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

        Dim myCommand2 As New SqlCommand(mysql, myConnection)

        ' Execute the command in a try/catch to catch duplicate username errors
        Try
            ']]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]HOLD SQL HOLD...[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[
            myCommand2.ExecuteNonQuery()
        Catch
            Response.Write("<br>failed to create a new AdminRequest record <br>")
        End Try

        ' Close the Connection
        If myConnection.State = ConnectionState.Open Then
            myConnection.Close()
        End If
    End Sub

    Protected Sub btnLoop_Click(sender As Object, e As EventArgs) Handles btnLoop.Click
        Dim strSQL As String = "select Top 3 Last + ', ' + First  As TheName, Username from  scheduleSignoffList "

        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)

        Response.Write(strSQL & "<br>")
        Dim myCommand As New SqlCommand(strSQL, myConnection)

        ' Open the connection and execute the Command
        myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        If dr.HasRows Then
            While dr.Read()

                Response.Write(dr("TheName") & "|" & dr("Username") & "<br>")
                InsertRequest(dr("TheName"), dr("UserName"))
            End While
        End If
        dr.Close()
        dr = Nothing
        myConnection.Close()

    End Sub

    Sub insertrequest(ByVal TheName As String, ByVal theusername As String)
        Dim mylinktext As String = "<a href=""tabstrip.aspx?Action=Approval' target='""_parent"">Go to task.</a>"
        Dim strsql As String
        strsql = " Insert into AdminRequest (TaskTable,Term, Username,RecipientName, Sender, DateIn,Subject,ReopenMessage, ActionRequest) Values ('"
        strsql += "AdminScheduleApproval','"
        strsql += txtTerm.Text & " ','"
        strsql += theusername & "','"
        strsql += TheName & "','"
        strsql += txtSender.Text & "','"
        strsql += Now.ToShortDateString & "','"
        strsql += txtSubject.Text & "','"
        strsql += txtActionEvent.Text & "','"
        strsql += txtActionRequest.Text & "');"
        strsql += " Select SCOPE_IDENTITY()  as myID"
        Response.Write(strsql)

        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand(strsql, myConnection)
        Dim xyz As Integer = 777
        Try
            myConnection.Open()
            ''Note ExecuteScalar()  {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{ Hold below ]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]
            xyz = myCommand.ExecuteScalar()

        Catch
            Response.Write("<br>failed to create a new task record <br>")
        Finally

        End Try
        Response.Write("<br> My TaskID = " & xyz)

        'Now add the Admin Message with the above task ID
        Dim mysql As String
        mysql = "Insert into AdminScheduleApproval (Request_ID,term, username, RecipientName, sender,datein,Subject,Task) Values ("
        mysql += xyz & ",'"
        mysql += txtTerm.Text & "','"
        mysql += theusername & "','"
        mysql += TheName & "','"
        mysql += txtSender.Text & "','"
        mysql += Now.ToShortDateString & "','"
        mysql += txtSubject.Text & "','"
        mysql += txtTask.Text & "');"





        Response.Write("<br>" & mysql & "<br> ")

        '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

        Dim myCommand2 As New SqlCommand(mysql, myConnection)

        ' Execute the command in a try/catch to catch duplicate username errors
        Try
            ']]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]HOLD SQL HOLD...[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[
            myCommand2.ExecuteNonQuery()
        Catch
            Response.Write("<br>failed to create a new AdminRequest record <br>")
        End Try

        ' Close the Connection
        If myConnection.State = ConnectionState.Open Then
            myConnection.Close()
        End If







    End Sub



End Class