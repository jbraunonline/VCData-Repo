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
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Term&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtTerm" runat="server" BackColor="#CCFFFF">2213</asp:TextBox>
            ;;;<br />
            <br />
            Local Pass&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="txtLocal" runat="server" BackColor="#CCFFFF">palm</asp:TextBox>
            <br />
            <br />
            Remote Pass
            <asp:TextBox ID="txtRemote" runat="server" BackColor="#CCFFFF">calm</asp:TextBox>
            <br />
            <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
                <asp:ListItem Selected="True">Preview</asp:ListItem>
                <asp:ListItem>Run</asp:ListItem>
            </asp:RadioButtonList>
            <br />
            <asp:Button ID="Button1" runat="server" Text="Button" />
        </div>
    </form>
</body>