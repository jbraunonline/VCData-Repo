Imports System.Configuration
Imports System.Data
Imports System.Data.SqlClient
Imports System.IO
Public Class NAdates
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim strsql As String = "select Mid1_Start from MasterExamDates where course like 'MAN%'"

        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand(strsql, myConnection)

        ' Open the connection and execute the Command
        myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        If dr.HasRows Then
            While dr.Read()
                Dim mydate As Date = dr("Mid1_Start")
                Dim mystring As String = mydate.ToShortDateString
                Response.Write(dr("Mid1_Start") & "....")
                If mystring.Contains("1/1/") Then Response.Write("DayOne ")
                Response.Write("<BR>")
            End While

        End If
        dr.Close()
        dr = Nothing
        myConnection.Close()

    End Sub

End Class