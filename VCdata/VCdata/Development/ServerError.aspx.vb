Imports System.Data.SqlClient
Imports System.Data.Sql

Public Class ServerError
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        getstuff()
    End Sub

    Protected Sub Getstuff()
        Dim strSQL As String = ""

        'strSQL += " SELECT * FROM CMR "
        'strSQL += "WHERE (Reference= @Reference And Term = @Term)"

        'strSQL = " SELECT     dbo.CMR.Reference, dbo.CMR.Course, dbo.CMR.Credits, dbo.courses.Description AS Course_Description, dbo.courses.Prerequisite, dbo.courses.SpecialNotes, dbo.courses.Course_Title"
        'strSQL += " FROM         dbo.CMR INNER JOIN dbo.courses On dbo.CMR.Course = dbo.courses.NoSpace"
        'strSQL += " WHERE     (dbo.CMR.Reference = @Reference) and (term = @Term)"

        strSQL = " SELECT dbo.CMR.Catalog, dbo.CMR.Course,  dbo.CMR.Credits, dbo.courses.CreditType "
        strSQL += " From  dbo.CMR INNER JOIN dbo.courses ON dbo.CMR.Course = dbo.courses.NoSpace "
        strSQL += " WHERE dbo.CMR.Reference = @Reference and dbo.CMR.Term = @Term "






        ' Create Instance of Connection and Command Object
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand(strSQL, myConnection)
        myCommand.Parameters.Add("@Reference", SqlDbType.VarChar).Value = "1003"
        myCommand.Parameters.Add("@Term", SqlDbType.VarChar).Value = "2213"

        ' Open the connection and execute the Command
        myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        While dr.Read
            If Not IsDBNull(dr("Course")) Then
                Response.Write(dr("Course") & "<br>")
                Response.Write(dr("CreditType") & "<br>")

            End If
        End While
    End Sub

End Class
