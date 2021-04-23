<%@ Page Language="vb" AutoEventWireup="false"   MaintainScrollPositionOnPostback="true" CodeBehind="EditCatalog.aspx.vb" Inherits="VCdata.EditCatalog" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            font-size: x-large;
            font-family: Arial, Helvetica, sans-serif;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <telerik:RadStyleSheetManager ID="RadStyleSheetManager1" runat="server">
        </telerik:RadStyleSheetManager>
        <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
            <Scripts>
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.Core.js">
                </asp:ScriptReference>
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQuery.js">
                </asp:ScriptReference>
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQueryInclude.js">
                </asp:ScriptReference>
            </Scripts>
        </telerik:RadScriptManager>
        <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
        </telerik:RadAjaxManager>
        <br />
        <strong><span class="auto-style1">Edit OL_Catalog</span></strong><div>
    
            <telerik:RadGrid ID="RadGrid1" runat="server" AllowAutomaticUpdates="True" AutoGenerateEditColumn="True" DataSourceID="SqlDataSource1" Skin="WebBlue" AllowSorting="True">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                <MasterTableView AutoGenerateColumns="False" DataKeyNames="Catalog_ID" DataSourceID="SqlDataSource1">
                    <Columns>
                        <telerik:GridBoundColumn DataField="Catalog_ID" DataType="System.Int32" FilterControlAltText="Filter Catalog_ID column" HeaderText="Catalog_ID" ReadOnly="True" SortExpression="Catalog_ID" UniqueName="Catalog_ID">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="CatalogName" FilterControlAltText="Filter CatalogName column" HeaderText="CatalogName" SortExpression="CatalogName" UniqueName="CatalogName">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Title" FilterControlAltText="Filter Title column" HeaderText="Title" SortExpression="Title" UniqueName="Title">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Credits" FilterControlAltText="Filter Credits column" HeaderText="Credits" SortExpression="Credits" UniqueName="Credits">
                        </telerik:GridBoundColumn>


                    <telerik:GridTemplateColumn HeaderText="Pre_Requisites" ItemStyle-Width="250px" Visible="true">
                      <ItemTemplate>
                              <asp:Label ID="Pre_RequisitesLabel" runat="server" Text='<%# shrinkme(Eval("Pre_Requisites"))%>'></asp:Label>
                      </ItemTemplate>

                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Pre_Requisites") %>' width="1000" TextMode="MultiLine" Rows="2" BackColor="#CEE7FF"></asp:TextBox>
                         </EditItemTemplate>

                       </telerik:GridTemplateColumn>



<telerik:GridTemplateColumn HeaderText="CourseDescription" ItemStyle-Width="240px">
<ItemTemplate>
    <asp:Label ID="CourseDescriptionLabel" runat="server" Text='<%# shrinkme(Eval("CourseDescription"))%>'></asp:Label>
</ItemTemplate>

<EditItemTemplate>
    <telerik:RadEditor ID="CourseDescription" runat="server" Content='<%# Bind("CourseDescription") %>' BackColor="#66CCFF">
        <Tools>
            <telerik:EditorToolGroup>
                <telerik:EditorTool Name="Cut" />
                <telerik:EditorTool Name="Copy" />
                <telerik:EditorTool Name="Paste" />
            </telerik:EditorToolGroup>
        </Tools>
    </telerik:RadEditor>
</EditItemTemplate>
</telerik:GridTemplateColumn>
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
    
    </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DesignConnectionString %>" DeleteCommand="DELETE FROM [OL_Catalog] WHERE [Catalog_ID] = @Catalog_ID" InsertCommand="INSERT INTO [OL_Catalog] ([CatalogName], [Title], [Credits], [Pre_Requisites], [CourseDescription]) VALUES (@CatalogName, @Title, @Credits, @Pre_Requisites, @CourseDescription)" SelectCommand="SELECT [Catalog_ID], [CatalogName], [Title], [Credits], [Pre_Requisites], [CourseDescription] FROM [OL_Catalog]" UpdateCommand="UPDATE [OL_Catalog] SET [CatalogName] = @CatalogName, [Title] = @Title, [Credits] = @Credits, [Pre_Requisites] = @Pre_Requisites, [CourseDescription] = @CourseDescription WHERE [Catalog_ID] = @Catalog_ID">
            <DeleteParameters>
                <asp:Parameter Name="Catalog_ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="CatalogName" Type="String" />
                <asp:Parameter Name="Title" Type="String" />
                <asp:Parameter Name="Credits" Type="String" />
                <asp:Parameter Name="Pre_Requisites" Type="String" />
                <asp:Parameter Name="CourseDescription" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="CatalogName" Type="String" />
                <asp:Parameter Name="Title" Type="String" />
                <asp:Parameter Name="Credits" Type="String" />
                <asp:Parameter Name="Pre_Requisites" Type="String" />
                <asp:Parameter Name="CourseDescription" Type="String" />
                <asp:Parameter Name="Catalog_ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
