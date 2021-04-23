Imports System.IO
Imports System.Data.SqlClient
Imports System.Data.Sql


Public Class BackupDB
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnCMR_Click(sender As Object, e As EventArgs) Handles btnCMR.Click

        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("SecureConnectionString").ConnectionString)


        Using myConnection

            Dim sqlComm As New SqlCommand

            sqlComm.Connection = myConnection

            sqlComm.CommandText = "spDropCMR_BU"
            sqlComm.CommandType = CommandType.StoredProcedure


            myConnection.Open()

            sqlComm.ExecuteNonQuery()

        End Using
        createCMR_BU()
    End Sub

    Sub createCMR_BU()
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("SecureConnectionString").ConnectionString)


        Using myConnection

            Dim sqlComm As New SqlCommand

            sqlComm.Connection = myConnection

            sqlComm.CommandText = "spCreate_CMR_BU"
            sqlComm.CommandType = CommandType.StoredProcedure


            myConnection.Open()

            sqlComm.ExecuteNonQuery()

        End Using
        Response.Write("CMR_BU has been created")
    End Sub
End Class