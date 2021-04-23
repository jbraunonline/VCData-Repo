<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="AddMasterExamPasswords.aspx.vb" Inherits="VCdata.AddMasterExamPasswords" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            This page adds proctored exam passwords to table MasterExamDates<br />
            No add&#39;l data source necessary.<br />
            Change code for new base words used for passwords in code behind<br />
            <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
                <asp:ListItem Selected="True">Preview</asp:ListItem>
                <asp:ListItem>Run</asp:ListItem>
            </asp:RadioButtonList>
            <br />
            <asp:Button ID="Button1" runat="server" Text="Button" />
        </div>
    </form>
</body>