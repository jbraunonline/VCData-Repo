Imports System.IO
Imports System.Data.SqlClient
Imports System.Data.Sql

Public Class SessionB_Setup
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnCatch_Click(sender As Object, e As EventArgs) Handles btnCatch.Click
        Dim myreturn As String = "Missing Course = "
        Dim strsql As String = ""
        strsql += " Select distinct course from MasterProctor where term = '2213' "
        strsql += " And masterproctor.course Not in (select distinct course from MasterExamDates where term = '2213')"

        ' Create Instance of Connection and Command Object
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand(strsql, myConnection)

        ' Open the connection and execute the Command
        myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        While dr.Read
            If Not IsDBNull(dr("Course")) Then
                myreturn += dr("Course") & ", "
            End If
        End While
        lblMissing.Text = myreturn
    End Sub

    Protected Sub btnErrorExam_Click(sender As Object, e As EventArgs) Handles btnErrorExam.Click
        Dim myreturn As String = "Missing OL_MasterExam = "
        Dim strsql As String = ""
        strsql += " Select distinct course from MasterProctor where term = '2213' "
        strsql += " And masterproctor.course Not in (select distinct course from OL_Masterexam where term = '2213')"

        ' Create Instance of Connection and Command Object
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand(strsql, myConnection)

        ' Open the connection and execute the Command
        myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        While dr.Read
            If Not IsDBNull(dr("Course")) Then
                myreturn += dr("Course") & ", "
            End If
        End While
        lblMissingExam.Text = myreturn
    End Sub

    Protected Sub btnBUMasterProctor_Click(sender As Object, e As EventArgs) Handles btnBUMasterProctor.Click
        Dim strsql As String = "Delete FROM MasterProctor_BU;"

        strsql += "Insert into MasterProctor_BU Select * from MasterProctor;"
        'Note that the MasterProctor)BU does not have a key and you can simply import all the data from MasterProctor. If it ever needs to be restored, you must drop the ID column from MasterProctor_BU
        ' delete ^ from MasterProctor (do NOT drop the table) and then run Insert into MasterProctor select * from MasterProctor_BU

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
        Response.Write("MasterProctor backed up to MasterProctor_BU_B <br>")
    End Sub

End Class