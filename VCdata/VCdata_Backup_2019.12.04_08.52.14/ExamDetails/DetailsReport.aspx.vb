Public Class DetailsReport
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
    Function getalertPop(ByVal myReference As String) As String
        Dim myreturn As String = ""

        myreturn = "<a href='alert.aspx?ID=" & myReference & "' onclick=""centeredPopup(this.href,'myWindow','950','860','yes');return false""><b>Details</b></a>"

        Return myreturn
    End Function
End Class