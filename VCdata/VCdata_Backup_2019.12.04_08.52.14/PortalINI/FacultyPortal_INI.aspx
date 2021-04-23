<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FacultyPortal_INI.aspx.vb" Inherits="VCdata.FacultyPortal_INI" %>

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
    
        <h3>Term&nbsp;
            <asp:TextBox ID="txtTerm" runat="server"></asp:TextBox>
        </h3>
        <p><strong>Tab Visibility</strong>
            <asp:CheckBox ID="chkHome" runat="server" Text="Home" />
&nbsp;
            <asp:CheckBox ID="chkDates" runat="server" Text="Proctoed Exam Dates" />
&nbsp;
            <asp:CheckBox ID="chkSettings" runat="server" Text="Proctored Exam Settings" />
&nbsp;
            <asp:CheckBox ID="chkCourseSetup" runat="server" Text="Next Term Course Setup" />
&nbsp;
            <asp:CheckBox ID="ChkObservations" runat="server" Text="Observations" />
        </p>
        <p><strong>Observation Term</strong>
            <asp:TextBox ID="txtObservationTerm" runat="server"></asp:TextBox>
        </p>
        <h3>Faculty Portal Main Message</h3>
        </div>
        <telerik:RadEditor ID="RadEditor1" Runat="server" Height="534px" Width="991px" RenderMode="Lightweight">
                <Tools>
        <telerik:EditorToolGroup>
            <telerik:EditorTool Name="Cut"/>
            <telerik:EditorTool Name="Copy"/>
            <telerik:EditorTool Name="Paste"/>
            <telerik:EditorTool Name="Bold"/>
            <telerik:EditorTool Name="Underline"/>
            <telerik:EditorTool Name="ForeColor"/>
            <telerik:EditorTool Name="FontName"/>
            <telerik:EditorTool Name="FontSize"/>
            <telerik:EditorTool Name="InsertLink"/>
        </telerik:EditorToolGroup>
    </Tools>

        </telerik:RadEditor>
        <asp:Button ID="btnUpdate" runat="server" Text="Update" />
    </form>
</body>
</html>
