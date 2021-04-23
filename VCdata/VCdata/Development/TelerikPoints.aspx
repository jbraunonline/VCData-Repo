<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="TelerikPoints.aspx.vb" Inherits="VCdata.TelerikPoints" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            font-size: large;
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
        <div class="auto-style1">
            <strong>2213 Points</strong></div>
        <telerik:RadGrid ID="RadGrid1" runat="server" DataSourceID="SqlDataSource1" Skin="WebBlue">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
            <MasterTableView AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                <Columns>
                    <telerik:GridBoundColumn DataField="CMR_ID" DataType="System.Int32" FilterControlAltText="Filter CMR_ID column" Visible="false" HeaderText="CMR_ID" SortExpression="CMR_ID" UniqueName="CMR_ID">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Username" FilterControlAltText="Filter Username column" HeaderText="Username" SortExpression="Username" UniqueName="Username">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="UserStatus" FilterControlAltText="Filter UserStatus column" HeaderText="PT/Ft" SortExpression="UserStatus" UniqueName="UserStatus">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Term" FilterControlAltText="Filter Term column" HeaderText="Term" SortExpression="Term" UniqueName="Term">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Reference" FilterControlAltText="Filter Reference column" HeaderText="Ref" SortExpression="Reference" UniqueName="Reference">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Course" FilterControlAltText="Filter Course column" HeaderText="Course" SortExpression="Course" UniqueName="Course">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Points_Source" FilterControlAltText="Filter Points_Source column" HeaderText="Src" SortExpression="Source" UniqueName="Points_Source">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Points" DataType="System.Decimal" FilterControlAltText="Filter Points column" HeaderText="Points" SortExpression="Points" UniqueName="Points">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="PointsInload" DataType="System.Decimal" FilterControlAltText="Filter PointsInload column" HeaderText="Inload" SortExpression="PointsInload" UniqueName="PointsInload">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="PointsOver" DataType="System.Decimal" FilterControlAltText="Filter PointsOver column" HeaderText="Over" SortExpression="PointsOver" UniqueName="PointsOver">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="PointsBanked" DataType="System.Decimal" FilterControlAltText="Filter PointsBanked column" HeaderText="Bank" SortExpression="PointsBanked" UniqueName="PointsBanked">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Points_Status" DataType="System.Int32" FilterControlAltText="Filter Points_Status column" HeaderText="OfferStat" SortExpression="Points_Status" UniqueName="Points_Status">
                    </telerik:GridBoundColumn>
                    <telerik:GridCheckBoxColumn DataField="Connect_Status" DataType="System.Boolean" FilterControlAltText="Filter Connect_Status column" HeaderText="ConnecStat" SortExpression="Connect_Status" UniqueName="Connect_Status">
                    </telerik:GridCheckBoxColumn>
                    <telerik:GridCheckBoxColumn DataField="Connect_Flag" DataType="System.Boolean" FilterControlAltText="Filter Connect_Flag column" HeaderText="Flag" SortExpression="Connect_Flag" UniqueName="Connect_Flag">
                    </telerik:GridCheckBoxColumn>
                    <telerik:GridCheckBoxColumn DataField="IsOffer" DataType="System.Boolean" FilterControlAltText="Filter IsOffer column" HeaderText="IsOffer" SortExpression="IsOffer" UniqueName="IsOffer">
                    </telerik:GridCheckBoxColumn>
                    <telerik:GridCheckBoxColumn DataField="IsOfferAccept" DataType="System.Boolean" FilterControlAltText="Filter IsOfferAccept column" HeaderText="IOfferAccept" SortExpression="IsOfferAccept" UniqueName="IsOfferAccept">
                    </telerik:GridCheckBoxColumn>
                    <telerik:GridCheckBoxColumn DataField="Points_confirmed" DataType="System.Boolean" FilterControlAltText="Filter Points_confirmed column" HeaderText="Points_confirmed" SortExpression="Points_confirmed" UniqueName="Points_confirmed">
                    </telerik:GridCheckBoxColumn>

                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT        Admin_Points.CMR_ID, Admin_Points.Username, Admin_Points.UserStatus, Admin_Points.Term, Admin_Points.Reference, CMR.Course, Admin_Points.Points, Admin_Points.PointsInload, Admin_Points.PointsOver, 
                         Admin_Points.PointsBanked, Admin_Points.Points_Status, Admin_Points.Connect_Status, Admin_Points.Connect_Flag, Admin_Points.IsOffer, Admin_Points.IsOfferAccept ,Admin_Points.Points_confirmed, Admin_Points.Points_Source 
FROM            Admin_Points LEFT OUTER JOIN
                         CMR ON Admin_Points.CMR_ID = CMR.ID"></asp:SqlDataSource>
        <telerik:RadFormDecorator ID="RadFormDecorator1" Runat="server" DecoratedControls="CheckBoxes" Skin="Material" />
        <telerik:RadSpreadsheet ID="RadSpreadsheet1" runat="server" Skin="WebBlue">
        </telerik:RadSpreadsheet>
        <br />
    </form>
</body>
</html>
