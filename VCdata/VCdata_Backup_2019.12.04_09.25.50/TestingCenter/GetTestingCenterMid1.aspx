<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="GetTestingCenterMid1.aspx.vb" Inherits="VCdata.GetTestingCenterMid1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Term<asp:TextBox ID="TxtTerm" runat="server"></asp:TextBox>
            <br />
            <asp:DropDownList ID="DropDownList1" runat="server">
                <asp:ListItem>Select Session</asp:ListItem>
                <asp:ListItem>1</asp:ListItem>
                <asp:ListItem>8W1</asp:ListItem>
                <asp:ListItem>6w1</asp:ListItem>
                <asp:ListItem>8W2</asp:ListItem>
                <asp:ListItem>6W2</asp:ListItem>
            </asp:DropDownList>
            <br />
            Exam</div>
    </form>
</body>
</html>
