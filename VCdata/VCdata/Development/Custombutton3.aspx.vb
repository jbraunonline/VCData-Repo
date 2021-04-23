Imports System.Drawing
Imports Telerik.Web.UI

Public Class Custombutton3
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Public Sub RadGrid1_ItemDataBound(ByVal sender As Object, ByVal e As Telerik.Web.UI.GridItemEventArgs) Handles RadGrid1.ItemDataBound
        If (TypeOf e.Item Is GridEditFormItem AndAlso e.Item.IsInEditMode) Then
            Dim editFormItem As GridEditFormItem = CType(e.Item, GridEditFormItem)
            Dim parentItem As GridDataItem = editFormItem.ParentItem
            Dim box As TextBox = CType(editFormItem.FindControl("TextBox1"), TextBox)
            box.Text = parentItem("Firstname").Text
        End If
    End Sub

End Class