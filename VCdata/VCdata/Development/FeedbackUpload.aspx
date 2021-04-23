<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FeedbackUpload.aspx.vb" Inherits="VCdata.FeedbackUpload" %>

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
            <strong>Upload data for FeedbackList</strong></p>
        <p>
            <span class="style2"><strong>Data format exptected</strong></span><strong>: </strong>5 Fields&nbsp; A - U on spreadsheet&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br />
        </p>
    
    </div>
        <asp:Panel ID="Panel1" runat="server">
            <asp:FileUpload ID="UploadFile" runat="server" BorderColor="#009933" BorderStyle="Solid" BorderWidth="2px" />
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="Upload File" BorderColor="#CC0000" BorderStyle="Double" BorderWidth="2px" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button2" runat="server" Text="Show All" />
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
            <asp:RadioButtonList ID="RadioButtonList1" runat="server" Font-Bold="True" RepeatDirection="Horizontal">
                <asp:ListItem Selected="True">Preview</asp:ListItem>
                <asp:ListItem>Hold</asp:ListItem>
                <asp:ListItem>Input</asp:ListItem>
            </asp:RadioButtonList>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>Preview</strong> checks data.&nbsp; <strong>Hold</strong> shows action and sql&nbsp;&nbsp; <strong>Input</strong> inputs the data.<br />
            <br />
            <asp:Button ID="btnUpload" runat="server" BackColor="#CC0000" Font-Bold="True" ForeColor="White" Text="Input Data" />
            <br />
            <br />
            <br />
            <br />
            <br />
            </asp:Panel>
    </form>
</body>
</html>
