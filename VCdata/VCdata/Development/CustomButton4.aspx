﻿<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="CustomButton4.aspx.vb" Inherits="VCdata.CustomButton4" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
        </telerik:RadAjaxManager>;
                <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Skin="Default"></telerik:RadAjaxLoadingPanel>
        <div>
        </div>
        <telerik:RadGrid ID="RadGrid1" runat="server" AllowAutomaticDeletes="True" AllowAutomaticUpdates="True" AutoGenerateColumns="False" 
            AutoGenerateDeleteColumn="True" 
            AutoGenerateEditColumn="True" 
                        OnNeedDataSource="RadGrid1_NeedDataSource"
    
                
            DataSourceID="SqlDataSource1" Skin="WebBlue" Width="600px" >
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
            <MasterTableView DataKeyNames="Master_ID" DataSourceID="SqlDataSource1" EditMode ="PopUp">
                                   <EditFormSettings UserControlName="EditMe.ascx" EditFormType="WebUserControl">

    </EditFormSettings>
                <Columns>
                    <telerik:GridBoundColumn DataField="Master_ID" DataType="System.Int32" FilterControlAltText="Filter Master_ID column" HeaderText="Master_ID" ReadOnly="True" SortExpression="Master_ID" UniqueName="Master_ID">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Firstname" FilterControlAltText="Filter Firstname column" HeaderText="Firstname" SortExpression="Firstname" UniqueName="Firstname">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Lastname" FilterControlAltText="Filter Lastname column" HeaderText="Lastname" SortExpression="Lastname" UniqueName="Lastname">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
        <p>
            s<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Chairs] WHERE [Master_ID] = @Master_ID" InsertCommand="INSERT INTO [Chairs] ([Firstname], [Lastname]) VALUES (@Firstname, @Lastname)" SelectCommand="SELECT [Master_ID], [Firstname], [Lastname] FROM [Chairs]" UpdateCommand="UPDATE [Chairs] SET [Firstname] = @Firstname, [Lastname] = @Lastname WHERE [Master_ID] = @Master_ID">
                <DeleteParameters>
                    <asp:Parameter Name="Master_ID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Firstname" Type="String" />
                    <asp:Parameter Name="Lastname" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Firstname" Type="String" />
                    <asp:Parameter Name="Lastname" Type="String" />
                    <asp:Parameter Name="Master_ID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </p>
    </form>
</body>
</html>