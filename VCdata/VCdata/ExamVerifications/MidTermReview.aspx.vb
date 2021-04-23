Public Class MidTermReview
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        lblSelection.Text = ddlTerm.SelectedValue & " Session = " & ddlSession.SelectedValue
    End Sub
    Function getPopUp(ByVal myID As Integer) As String
        Dim myreturn As String = "Nada"

        myreturn = "<a href='CompareMidTerms.aspx?ID=" & myID & "' onclick=""centeredPopup(this.href,'myWindow','1500','860','yes');return false"">Details</a>"

        Return myreturn
    End Function

    Function GetOutlook(ByVal myinstructor As String, ByVal myOutlook As String) As String
        Dim myreturn As String = ""
        Dim myemail As String = ""

        myemail = myOutlook & "@mdc.edu"
        myreturn = "<a href='mailto:" & myemail & " ' target='_top'>" & myinstructor & "</a>"
        Return myreturn
    End Function
End Class