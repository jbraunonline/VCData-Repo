Public Class ClassTest
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim NewCode As String
        Dim objMyMethod As ProctorExam
        objMyMethod = New ProctorExam
        NewCode = objMyMethod.getNextTerm
        Session("NextTerm") = NewCode
        Dim myThisTerm As String = objMyMethod.getThisTerm
        Response.Write(myThisTerm)
        Dim myNextTerm As String = objMyMethod.getNextTerm
        Response.Write(myNextTerm)
        Dim myname As String = ""
        myname = objMyMethod.getCourseByID(1)
        Response.Write(myname)
        Response.Write("<BR>")
        Dim mystuff As String = ""
        mystuff = objMyMethod.getTestingInstructions(2973, "Final")
        Response.Write(mystuff)
    End Sub

End Class