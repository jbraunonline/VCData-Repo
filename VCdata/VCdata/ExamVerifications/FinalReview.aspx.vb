Public Class FinalReview
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        lblSelection.Text = ddlTerm.SelectedItem.Text & " Session = " & ddlSession.SelectedItem.Text
    End Sub
    Function getPopUp(ByVal myID As Integer) As String
        Dim myreturn As String = "Nada"

        myreturn = "<a href='CompareFinals.aspx?ID=" & myID & "' onclick=""centeredPopup(this.href,'myWindow','1500','950','yes');return false"">Details</a>"

        Return myreturn
    End Function

    Function GetOutlook(ByVal myinstructor As String, ByVal myOutlook As String) As String
        Dim myreturn As String = ""
        Dim myemail As String = ""

        myemail = myOutlook & "@mdc.edu"
        myreturn = "<a href='mailto:" & myemail & " ' target='_top'>" & myinstructor & "</a>"
        Return myreturn
    End Function

    Protected Sub btnGetData_Click(sender As Object, e As EventArgs) Handles btnGetData.Click

    End Sub
End Class