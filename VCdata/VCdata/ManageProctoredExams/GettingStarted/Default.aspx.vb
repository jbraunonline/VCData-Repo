Imports System.Configuration
Imports System.Data
Imports System.Data.SqlClient
Imports System.IO

Public Class _Default4
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnImport_Click(sender As Object, e As EventArgs) Handles btnImport.Click
        Dim strsql As String = "Delete FROM OL_MasterExam_BU ; "

        strsql += "Insert into    [VC_VCData].[dbo].[OL_MasterExam_BU] select * from [VC_VCData1].[dbo].[OL_MasterExam] Where [VC_VCData1].[dbo].[OL_MasterExam].[Term]= '" & txtTerm.Text & "' ;"
        'NOTE the change in databases. we are copying into vc_vcdata from VC_VCDatta1
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
        Response.Write("MasterExam data copied<br>")

    End Sub

    Protected Sub btnRunFix_Click(sender As Object, e As EventArgs) Handles btnRunFix.Click
        Dim strsql As String = ""
        strsql += " update [VC_VCData].[dbo].OL_MasterExam_BU   set [PM_LIST_ANXMTRLS] = ''  where  [PM_LIST_ANXMTRLS] is null;"
        strsql += " update [VC_VCData].[dbo].OL_MasterExam_BU   set [PF_LIST_ANXMTRLS] = ''  where  [PF_LIST_ANXMTRLS] is null;"
        strsql += " update [VC_VCData].[dbo].OL_MasterExam_BU   set [PM_MG_OTHER]= ''  where  [PM_MG_OTHER]is null;"
        strsql += " update [VC_VCData].[dbo].OL_MasterExam_BU   set [PF_MG_OTHER]= ''  where  [PF_MG_OTHER] is null;"
        strsql += " update [VC_VCData].[dbo].OL_MasterExam_BU   set [PF_DURATION] = 0  where  [PF_DURATION] Is null;"
        strsql += " update [VC_VCData].[dbo].OL_MasterExam_BU   set [PM_DURATION] = 0  where  [PM_DURATION] Is null;"

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
        Response.Write("MasterExam data FIXED<br>")


    End Sub

End Class