Imports System.Net
Imports System.Xml
Imports System.Configuration
Imports System.Data
Imports System.Data.SqlClient
Imports System.IO
Imports System.Drawing
Public Class CompareMidterms
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        txtParent.Text = getParent()
    End Sub

    Function getParent() As String
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
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

    Protected Sub btnVerify_Click(sender As Object, e As EventArgs) Handles btnVerify.Click
        updateMasterProctor()
        Me.ClientScript.RegisterClientScriptBlock(Me.GetType(), "Close", "window.close()", True)
    End Sub

    Sub updateMasterProctor()
        Dim strsql As String = "Update MasterProctor set MidVerified = 1 where ID =" & Request("ID")
        Response.Write(strsql)

        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)

        Dim myCommand As New SqlCommand(strsql, myConnection)

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



    End Sub

End Class