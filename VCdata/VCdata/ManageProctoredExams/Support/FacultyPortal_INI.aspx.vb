Imports System.Data
Imports System.Data.SqlClient
Public Class FacultyPortal_INI
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            RadEditor1.Content = getINI("FacultyPortal", "lblMessage.text")
            txtTerm.Text = getINI("FacultyPortal", "lblTerm.text")
            If getINI("FacultyPortal", "Home") = "True" Then
                chkHome.Checked = True
            Else
                chkHome.Checked = False
            End If

            If getINI("FacultyPortal", "Proctored Exam Dates") = "True" Then
                chkDates.Checked = True
            Else
                chkDates.Checked = False
            End If

            If getINI("FacultyPortal", "Proctored Exam Settings") = "True" Then
                chkSettings.Checked = True
            Else
                chkSettings.Checked = False
            End If

            If getINI("FacultyPortal", "Next Term Course Setup") = "True" Then
                chkCourseSetup.Checked = True
            Else
                chkCourseSetup.Checked = False
            End If

            If getINI("FacultyPortal", "Faculty Observations") = "True" Then
                ChkObservations.Checked = True
            Else
                ChkObservations.Checked = False
            End If

            txtObservationTerm.Text = getINI("FacultyPortal", "ObsTerm")

        End If
    End Sub
    Function getINI(ByVal mypage As String, ByVal myItem As String) As String
        Dim myreturn As String = ""
        Dim strSQL As String = "SELECT Value"
        strSQL += " FROM  dbo.VC_INI "
        strSQL += "WHERE (Page = '" & mypage & "' and item='" & myItem & "')"
        ' Create Instance of Connection and Command Object
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand(strSQL, myConnection)

        ' Open the connection and execute the Command
        myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        While dr.Read
            If Not IsDBNull(dr("value")) Then
                myreturn = dr("Value")
            End If
        End While

        Return myreturn
    End Function


    Sub updatedata(ByVal mydetails As String, ByVal myItem As String)

        Dim strsql As String

        strsql = "update [dbo].[VC_INI] set " &
           "Value = '" & mydetails & "' " &
         " where Page='FacultyPortal' and Item='" & myItem & "'"
        Response.Write("<br>" & strsql)

        ' Create Instance of Connection and Command Object
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("VC_VCDataConnectionString").ConnectionString)
        'Dim myConnection As New SqlConnection(ConfigurationSettings.AppSettings("connectionString"))
        Dim myCommand As New SqlCommand(strsql, myConnection)
        ' Execute the command in a try/catch to catch duplicate username errors
        Try
            ' Open the connection and execute the Command
            myConnection.Open()
            'HOLD SQL HOLD........................................................................
            myCommand.ExecuteNonQuery()
        Catch
            Response.Write("<font color=red>failed to update record </font><br>")
        Finally
            ' Close the Connection
            If myConnection.State = ConnectionState.Open Then
                myConnection.Close()
            End If
        End Try
        Response.Write("Updated <br>")

    End Sub

    Protected Sub btnUpdate_Click(sender As Object, e As EventArgs) Handles btnUpdate.Click
        updatedata(RadEditor1.Content, "lblMessage.text")
        updatedata(txtTerm.Text, "lblTerm.text")
        If chkHome.Checked = True Then
            updatedata("True", "Home")
        Else
            updatedata("False", "Home")
        End If

        If chkDates.Checked = True Then
            updatedata("True", "Proctored Exam Dates")
        Else
            updatedata("False", "Proctored Exam Dates")
        End If

        If chkSettings.Checked = True Then
            updatedata("True", "Proctored Exam Settings")
        Else
            updatedata("False", "Proctored Exam Settings")
        End If

        If chkCourseSetup.Checked = True Then
            updatedata("True", "Next Term Course Setup")
        Else
            updatedata("False", "Next Term Course Setup")
        End If

        If ChkObservations.Checked = True Then
            updatedata("True", "Observations")
        Else
            updatedata("False", "Observations")
        End If

        updatedata(txtObservationTerm.Text, "ObsTerm")

    End Sub
End Class