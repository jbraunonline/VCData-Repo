Imports Telerik.Web.UI
Public Class FInalSettingVerification
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            Session("mysession") = "1"
            lblSession.Text = "Viewing Session " & Session("mysession")
        Else
            Session("mysession") = ddSession.SelectedValue
            lblSession.Text = "Viewing Session " & Session("mysession")
        End If
    End Sub
    Function getPopUp(ByVal myID As Integer, ByVal myCourse As String) As String
        Dim myreturn As String = "Nada"

        myreturn = "<a href='popupdata.aspx?ID=" & myID & "&Course=" & myCourse & "' onclick=""centeredPopup(this.href,'myWindow','1100','1000','yes');return false"">??</a>"

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

    Private Sub RadGrid1_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles RadGrid1.Init
        Dim menu As Telerik.Web.UI.GridFilterMenu = RadGrid1.FilterMenu
        Dim i As Integer = 0
        While i < menu.Items.Count
            If menu.Items(i).Text = "NoFilter" Or
           menu.Items(i).Text = "Contains" Or
           menu.Items(i).Text = "GreaterThan" Or
           menu.Items(i).Text = "LessThan" Or
           menu.Items(i).Text = "EqualTo" Then
                i = i + 1
            Else
                menu.Items.RemoveAt(i)
            End If
        End While
    End Sub
End Class