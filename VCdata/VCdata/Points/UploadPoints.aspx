<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="UploadPoints.aspx.vb" Inherits="VCdata.UploadPoints" %>

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
            <strong>Upload data for </strong>Point Distribution</p>
        <p>
            <span class="style2"><strong>Data format exptected</strong></span><strong>: </strong>7 Fields&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Select Term
            <asp:DropDownList ID="DropDownList1" runat="server">
                <asp:ListItem Selected="True">2213</asp:ListItem>
                <asp:ListItem>2216</asp:ListItem>
            </asp:DropDownList>
        </p>
        <p class="style1">
            <strong>Reference,Username,FT/PT,Total,Inload,Overload,Banked </strong></p>
        <p class="style1">
            1003,ngomez,FT,6,0,0,0&nbsp; </p>
        <p class="style1">
            &nbsp;</p>
    
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
        <asp:Panel ID="Panel2" runat="server" Visible="False">

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
            </asp:Panel>
    </form>
</body>
</html>