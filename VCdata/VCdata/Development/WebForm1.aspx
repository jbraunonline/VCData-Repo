<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="WebForm1.aspx.vb" Inherits="VCdata.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script>
function checkDec(el){
 var ex = /^[0-9]+\.?[0-9]*$/;
 if(ex.test(el.value)==false){
    alert('Incorrect Number');
  }
}
</script>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <input type="text"  önblur="checkDec(this);" />
        <div>
            <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
&nbsp; UserName<br />
            <asp:TextBox ID="txtPasswsord" runat="server" TextMode="Password"></asp:TextBox>
&nbsp; Password<br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="Sign In" />
        </div>

        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:Button ID="Button2" runat="server" Text="check string" />
        </form>
</body>
</html>
