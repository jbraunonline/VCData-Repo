Imports Telerik.Web.UI
Imports System.Data
Imports System.Data.SqlClient


Public Class _Default1
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            txtObsDateIn.Text = "1/1/2020"
            Session("ObsDateIn") = txtObsDateIn.Text
        Else
            Session("ObsDateIn") = txtObsDateIn.Text
        End If
    End Sub



    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim mytext As String = ""
        For Each item As Telerik.Web.UI.GridDataItem In RadGrid1.SelectedItems
            mytext += item("Course_Name").Text.ToString()
            mytext += ","
            mytext += item("Chair_Outlook").Text.ToString()
            mytext += ",FObserve<br>"
            markIn(item("Master_ID").Text.ToString())
        Next
        ''Response.Write(mytext)
        Panel1.Visible = True

        Literal1.Text = mytext
    End Sub

    Sub markIn(ByVal myID As String)
        Dim strsql As String = "Update BBObservations set IsIn=1 where Master_ID=" & myID
        lblSQl.Text = strsql

        ' Response.Write(strSQL)
        'Response.End()

        ' Create Instance of Connection and Command Object
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
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








    End Sub

    Sub markOut(ByVal myID As String)
        Dim strsql As String = "Update BBObservations set IsOut=1 where Master_ID=" & myID
        lblSQl.Text = strsql

        ' Response.Write(strSQL)
        'Response.End()

        ' Create Instance of Connection and Command Object
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
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








    End Sub


    Protected Sub btnClearInput_Click(sender As Object, e As EventArgs) Handles btnClearInput.Click
        Response.Redirect("default.aspx")
    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Dim mytext As String = ""
        For Each item As Telerik.Web.UI.GridDataItem In RadGrid1.SelectedItems
            mytext += "Remove   "
            mytext += item("Chair_Outlook").Text.ToString()
            mytext += "    from      "
            mytext += item("Course_Name").Text.ToString()
            mytext += "<br>"
            markOut(item("Master_ID").Text.ToString())
        Next
        ''Response.Write(mytext)
        Panel2.Visible = True

        Literal2.Text = mytext
    End Sub

    Protected Sub btnClearUsers_Click(sender As Object, e As EventArgs) Handles btnClearUsers.Click
        Response.Redirect("default.aspx")
    End Sub

    Protected Sub RadGrid1_NeedDataSource(sender As Object, e As GridNeedDataSourceEventArgs) Handles RadGrid1.NeedDataSource

    End Sub



    Protected Sub btnStartDate_Click(sender As Object, e As EventArgs) Handles btnStartDate.Click
        Session("ObsDateIn") = txtObsDateIn.Text
    End Sub
End Class