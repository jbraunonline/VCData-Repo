<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="reports1.aspx.vb" Inherits="VCdata.reports1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Preparing for Report Creation.<br />
            <br />
            Sometimes we find null db values in the MasterProctor Table after faculty have provided input. To prevent nulls from throwing errors when you run the reports,&nbsp; run the InputProctorTesting DB.aspx<br />
            <strong>This needs to be done twice</strong>. <span class="auto-style1">Once after 1&amp;A data </span>has been collected, and a<span class="auto-style1">gain when session B data has been collected.</span><br />
            <asp:Button ID="btnClearNulls" runat="server" Text="1. Clear Nulls is MasterProctor" />
            <br />
            <br />
            <br />
            <br />
            We add Proctored Exam Passwords to the Masterexam Dates Table<br />
            This o<span class="auto-style1">nly needs to be done once</span> before creading reports. This adds password to MasterExamDates table for ALL sessions.<br />
            <br />
            Tern&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="txtTerm" runat="server" BackColor="#CCFFFF"></asp:TextBox>
&nbsp; &lt;--- Make sure the term is correct!<br />
            Local Password&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtLclPwd" runat="server" BackColor="#CCFFFF"></asp:TextBox>
            <br />
            Remote Password&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtRemotePwd" runat="server" BackColor="#CCFFFF"></asp:TextBox>
            <br />
            <br />
            <asp:RadioButtonList ID="RadioButtonAction" runat="server" RepeatDirection="Horizontal">
                <asp:ListItem Selected="True">Preview</asp:ListItem>
                <asp:ListItem>Run</asp:ListItem>
            </asp:RadioButtonList>
            <br />
            <asp:Button ID="btnAddPwd" runat="server" Text="Add Passwords" />
        </div>
    </form>
</body>
</html>
