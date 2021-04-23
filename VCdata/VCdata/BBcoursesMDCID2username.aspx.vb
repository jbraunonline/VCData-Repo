Imports System.IO
Imports System.Data.SqlClient
Imports System.Data.Sql

Public Class BBcoursesMDCID2username
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        getStuff()

    End Sub


    Private Sub UpdateCourses(ByVal ID As String, ByVal Username As String)
        Dim strsql As String = "Update BBCourses_BU2 set "
        strsql += "Instructor = '" & Username & "', "
        strsql += "Username = '" & Username & "'"
        strsql += " Where ID=" & ID

        Response.Write(strsql & "<br>")

        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand(strsql, myConnection) '

        ' Execute the command in a try/catch to catch duplicate username errors'



        Try
            ' Open the connection and execute the Command
            myConnection.Open()
            ' mycounter = mycounter + 1
            'HOLD SQL HOLD..[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[.
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

    End Sub



    Private Sub getStuff()

        'Response.Write(mymdcid & "<br>")
        Dim strSQL As String = "SELECT     dbo.BBCourses_BU2.ID, dbo.BBCourses_BU2.Reference, dbo.BBusers.UserName "
        strSQL += " FROM         dbo.BBCourses_BU2 INNER JOIN"
        strSQL += "                      dbo.BBAssociations ON dbo.BBCourses_BU2.Reference = dbo.BBAssociations.Reference INNER JOIN"
        strSQL += "                      dbo.BBusers ON dbo.BBAssociations.MDCID = dbo.BBusers.MDCID"
        strSQL += " WHERE     (dbo.BBCourses_BU2.TERM_KEY = '2187')"
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
        ' Response.Write(strSQL & "<br>")
        Dim myCommand As New SqlCommand(strSQL, myConnection)

        ' Open the connection and execute the Command
        myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        If dr.HasRows Then
            While dr.Read()
                Response.Write(dr("ID") & "--myDBsession<br>")
                Response.Write(dr("UserName") & "--MDCID<br>")
                UpdateCourses(dr("ID"), dr("UserName"))
            End While
        End If
        dr.Close()
        dr = Nothing
        myConnection.Close()

    End Sub




End Class