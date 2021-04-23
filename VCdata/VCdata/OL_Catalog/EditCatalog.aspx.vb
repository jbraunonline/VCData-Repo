Public Class EditCatalog
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
    Protected Function shrinkme(ByVal mytext As String) As String
        Dim myreturn As String
        myreturn = Left(mytext, 30) & "..."
        Return myreturn
    End Function

End Class