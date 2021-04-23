<%@ Page Language="VB" AutoEventWireup="false" CodeBehind="_Default.aspx.vb" Inherits="VCdata._Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <telerik:RadStyleSheetManager id="RadStyleSheetManager1" runat="server" />
    <style type="text/css">
        .auto-style1 {
            font-size: x-large;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
        <Scripts>
            <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.Core.js" />
            <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQuery.js" />
            <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQueryInclude.js" />
        </Scripts>
    </telerik:RadScriptManager>
    <script type="text/javascript">
        //Put your JavaScript code here.
    </script>
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    </telerik:RadAjaxManager>
    <div>

    </div>
        <strong><span class="auto-style1">Virtual College Data Administration</span></strong><br />
        <br />
        <asp:FileUpload ID="FileUpload1" runat="server" Visible="False" />
        <br />
        <br />
        <asp:Label ID="StatusLabel" runat="server"></asp:Label>
        <br />
        <asp:Label ID="lblFileName" runat="server"></asp:Label>
        <br />
        <asp:Label ID="lblFileSize" runat="server"></asp:Label>
        <br />
        <asp:Label ID="lblFileContentType" runat="server"></asp:Label>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Upload Studeent Exam Dates" />
        <br />
        <br />
        <asp:Button ID="Button2" runat="server" Text="2195 Data Archive" />
        <br />
        <br />
        <asp:Button ID="uploadbutton" runat="server" Text="Submit" Visible="False" />
    </form>
</body>
</html>
