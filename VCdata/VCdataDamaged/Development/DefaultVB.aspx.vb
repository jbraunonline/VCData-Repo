Imports System
Imports System.Web.UI.WebControls
Imports Telerik.Web.UI
Namespace Telerik.Web.Examples.Grid.Integration.GridAndWindow
    Partial Public Class DefaultVB
        Inherits System.Web.UI.Page
        Protected Sub RadGrid1_ItemCreated(ByVal sender As Object, ByVal e As GridItemEventArgs)
            If TypeOf e.Item Is GridDataItem Then
                Dim editLink As HyperLink = DirectCast(e.Item.FindControl("EditLink"), HyperLink)
                editLink.Attributes("href") = "javascript:void(0);"
                editLink.Attributes("onclick") = [String].Format("return ShowEditForm('{0}','{1}');", e.Item.OwnerTableView.DataKeyValues(e.Item.ItemIndex)("EmployeeID"), e.Item.ItemIndex)
            End If
        End Sub

        Protected Sub RadAjaxManager1_AjaxRequest(ByVal sender As Object, ByVal e As UI.AjaxRequestEventArgs) Handles RadAjaxManager1.AjaxRequest
            If e.Argument = "Rebind" Then
                RadGrid1.MasterTableView.SortExpressions.Clear()
                RadGrid1.MasterTableView.GroupByExpressions.Clear()
                RadGrid1.Rebind()
            ElseIf e.Argument = "RebindAndNavigate" Then
                RadGrid1.MasterTableView.SortExpressions.Clear()
                RadGrid1.MasterTableView.GroupByExpressions.Clear()
                RadGrid1.MasterTableView.CurrentPageIndex = RadGrid1.MasterTableView.PageCount - 1
                RadGrid1.Rebind()
            End If
        End Sub
    End Class
End Namespace
