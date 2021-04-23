<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="NewPhase.aspx.vb" Inherits="VCdata.NewPhase" %>

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
        </telerik:RadAjaxManager>
        <div>
        </div>
        <telerik:RadGrid ID="RadGrid1" runat="server" AllowAutomaticUpdates="True" AutoGenerateEditColumn="True" DataSourceID="SqlDataSource1" Skin="WebBlue">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
            <MasterTableView AutoGenerateColumns="False" DataKeyNames="Phase_ID" DataSourceID="SqlDataSource1">
                <Columns>
                    <telerik:GridBoundColumn DataField="Course" FilterControlAltText="Filter Course column" HeaderText="Course" SortExpression="Course" UniqueName="Course" ReadOnly="true">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="T_2187" FilterControlAltText="Filter T_2187 column" HeaderText="T_2187" SortExpression="T_2187" UniqueName="T_2187">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="T_2193" FilterControlAltText="Filter T_2193 column" HeaderText="T_2193" SortExpression="T_2193" UniqueName="T_2193">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="T_2195" FilterControlAltText="Filter T_2195 column" HeaderText="T_2195" SortExpression="T_2195" UniqueName="T_2195">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="T_2197" FilterControlAltText="Filter T_2197 column" HeaderText="T_2197" SortExpression="T_2197" UniqueName="T_2197">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="T_2103" FilterControlAltText="Filter T_2103 column" HeaderText="T_2103" SortExpression="T_2103" UniqueName="T_2103">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="T_2105" FilterControlAltText="Filter T_2105 column" HeaderText="T_2105" SortExpression="T_2105" UniqueName="T_2105">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="T_2107" FilterControlAltText="Filter T_2107 column" HeaderText="T_2107" SortExpression="T_2107" UniqueName="T_2107">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Phase_ID" DataType="System.Int32" FilterControlAltText="Filter Phase_ID column" HeaderText="Phase_ID" ReadOnly="True" SortExpression="Phase_ID" UniqueName="Phase_ID" Visible="false">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DesignConnectionString %>" DeleteCommand="DELETE FROM [OL_MasterPhase] WHERE [Phase_ID] = @Phase_ID" InsertCommand="INSERT INTO [OL_MasterPhase] ([Course], [T_2187], [T_2193], [T_2195], [T_2197], [T_2103], [T_2105], [T_2107]) VALUES (@Course, @T_2187, @T_2193, @T_2195, @T_2197, @T_2103, @T_2105, @T_2107)" SelectCommand="SELECT [Course], [T_2187], [T_2193], [T_2195], [T_2197], [T_2103], [T_2105], [T_2107], [Phase_ID] FROM [OL_MasterPhase] WHERE ([Course] = @Course)" UpdateCommand="UPDATE [OL_MasterPhase] SET [T_2187] = @T_2187, [T_2193] = @T_2193, [T_2195] = @T_2195, [T_2197] = @T_2197, [T_2103] = @T_2103, [T_2105] = @T_2105, [T_2107] = @T_2107 WHERE [Phase_ID] = @Phase_ID">
            <DeleteParameters>
                <asp:Parameter Name="Phase_ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Course" Type="String" />
                <asp:Parameter Name="T_2187" Type="String" />
                <asp:Parameter Name="T_2193" Type="String" />
                <asp:Parameter Name="T_2195" Type="String" />
                <asp:Parameter Name="T_2197" Type="String" />
                <asp:Parameter Name="T_2103" Type="String" />
                <asp:Parameter Name="T_2105" Type="String" />
                <asp:Parameter Name="T_2107" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:Parameter DefaultValue="cgs1060C" Name="Course" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Course" Type="String" />
                <asp:Parameter Name="T_2187" Type="String" />
                <asp:Parameter Name="T_2193" Type="String" />
                <asp:Parameter Name="T_2195" Type="String" />
                <asp:Parameter Name="T_2197" Type="String" />
                <asp:Parameter Name="T_2103" Type="String" />
                <asp:Parameter Name="T_2105" Type="String" />
                <asp:Parameter Name="T_2107" Type="String" />
                <asp:Parameter Name="Phase_ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
