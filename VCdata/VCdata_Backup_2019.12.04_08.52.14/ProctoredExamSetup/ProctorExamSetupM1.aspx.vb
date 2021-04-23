Public Class ProctorExamSetupM1
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        lblTerm.Text = "7"
    End Sub
    Function GetWindow(ByVal mydate As Date) As String
        Dim myreturn As String = ""
        Dim oldDate As Date
        Dim oldWeekDayName As String
        oldDate = mydate
        oldWeekDayName = WeekdayName(Weekday(oldDate))
        ' lblDay.Text = "They day is a " & oldWeekDayName
        Dim newDate1 As Date = oldDate
        Dim newDate2 As Date = DateAdd("d", 1, oldDate)
        Dim newDate3 As Date = DateAdd("d", 2, oldDate)
        Dim newDate4 As Date = DateAdd("d", 3, oldDate)
        Dim newDate5 As Date = DateAdd("d", 4, oldDate)
        If oldWeekDayName = "Friday" Then

            If lblTerm.Text <> "5" Then
                myreturn = newDate1.ToShortDateString & " - " & newDate4.ToShortDateString & " - " & newDate5.ToShortDateString
            Else
                myreturn = newDate1.ToShortDateString & " - " & newDate4.ToShortDateString
            End If
        Else
            If lblTerm.Text <> "5" Then
                myreturn = newDate1.ToShortDateString & " - " & newDate2.ToShortDateString & " - " & newDate3.ToShortDateString
            Else
                myreturn = newDate1.ToShortDateString & " - " & newDate2.ToShortDateString
            End If
        End If
        Return myreturn

    End Function

    Protected Sub RadGrid1_ItemDataBound(ByVal sender As Object, ByVal e As GridItemEventArgs)
        If TypeOf e.Item Is GridDataItem Then
            Dim rowCounter As Integer = New Integer()
            Dim lbl As Label = TryCast(e.Item.FindControl("numberLabel"), Label)
            rowCounter = RadGrid1.MasterTableView.PageSize * RadGrid1.MasterTableView.CurrentPageIndex
            lbl.Text = (e.Item.ItemIndex + 1 + rowCounter).ToString()
        End If
    End Sub
End Class