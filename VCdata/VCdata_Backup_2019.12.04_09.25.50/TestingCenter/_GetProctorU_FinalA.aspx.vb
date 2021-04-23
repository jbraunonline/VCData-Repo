Public Class GetProctorU_FinalA
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
    Function GetmyExam(ByVal Course As String, ByVal Reference As String, ByVal ExamName As String) As String
        Dim myReturn As String = ""
        Dim myreference As String = Replace(Reference, "2197-", "")
        myReturn = myreference & " - " & Course & " - " & ExamName

        Return myReturn
    End Function
    Function GetWindow1(ByVal myID As Integer) As String

        Dim myreturn As String = ""
        Return myreturn
    End Function
    Function GetmyStop(ByVal mystart As Date) As String
        Dim myreturn As String = mystart.ToShortDateString
        myreturn = myreturn & "  9:30 P.M."

        Return myreturn
    End Function

    Function GetmyStart(ByVal mystart As Date) As String
        Dim myreturn As String = mystart.ToShortDateString
        myreturn = myreturn & "  12:00 A.M."

        Return myreturn
    End Function


End Class