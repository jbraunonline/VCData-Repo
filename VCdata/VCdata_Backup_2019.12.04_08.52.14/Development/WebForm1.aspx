<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="WebForm1.aspx.vb" Inherits="VCdata.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
&nbsp; UserName<br />
            <asp:TextBox ID="txtPasswsord" runat="server" TextMode="Password"></asp:TextBox>
&nbsp; Password<br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="Sign In" />
        </div>
    </form>
</body>
</html>
