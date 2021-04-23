<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="CWCSupload.aspx.vb" Inherits="VCdata.CWCSupload" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            font-size: x-large;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <p class="auto-style1">
            <strong>Upload data CWCS.</strong></p>
        <p class="style1">
            &nbsp;</p>
    
    </div>
        <asp:Panel ID="Panel1" runat="server">
            <asp:FileUpload ID="UploadFile" runat="server" />
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="Upload File" />
            &nbsp;
            <asp:Button ID="btnShow" runat="server" Text="Show All" />
        </asp:Panel>
        <br />
        <asp:Panel ID="Panel2" runat="server">

        <br />
        File Uploaded As:<asp:Label ID="lblFileName" runat="Server"></asp:Label>
        <br />
        Size:<asp:Label ID="lblFileSize" runat="Server"></asp:Label>
        <br />
        Type:<asp:Label ID="lblFileContentType" runat="Server"></asp:Label>
        <br />
        <br />
        <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
            <asp:ListItem Selected="True">Preview</asp:ListItem>
            <asp:ListItem>SQL</asp:ListItem>
            <asp:ListItem>Input</asp:ListItem>
        </asp:RadioButtonList>
        <br />
        <asp:Button ID="btnInput" runat="server" Text="Input Data" />
                    &nbsp;
            <asp:Button ID="Button3" runat="server" Text="Uplaod With SP" />
                    </asp:Panel>
        <asp:Button ID="Button4" runat="server" Text="Insert One by SP" />
    </form>
</body>
</html>
