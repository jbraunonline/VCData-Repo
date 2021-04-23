Imports System.Net
Imports System.Xml
Imports System.Configuration
Imports System.Data
Imports System.Data.SqlClient
Imports System.IO
Imports System.Drawing

Public Class CompareFinal
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        txtParent.Text = getParent()
    End Sub
    Protected Function getParent() As String
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("VC_VCDataConnectionString").ConnectionString)
        Dim myreturn As String = "Fail"
        Dim strsql As String = ""
        If Request("ID") <> "" Then
            strsql = "select parent from MasterProctor where ID =" & Request("ID")
            Response.Write(strsql & "<br>")

            Dim myCommand As New SqlCommand(strsql, myConnection)

            ' Open the connection and execute the Command
            myConnection.Open()
            Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
            If dr.HasRows Then
                While dr.Read()

                    myreturn = dr("Parent")


                End While
            End If
            dr.Close()
            dr = Nothing
            myConnection.Close()
        Else
        End If
        Return myreturn
    End Function
End Class