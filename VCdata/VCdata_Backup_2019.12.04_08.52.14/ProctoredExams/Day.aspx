<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Day.aspx.vb" Inherits="VCdata.Day" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        body {
    font-family: Arial, Helvetica, sans-serif;

        }
        .auto-style1 {
            font-size: smaller;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <br />
            <asp:TextBox ID="TxtTerm" runat="server">2197</asp:TextBox>
            <asp:Calendar ID="Calendar1" runat="server">
                <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
            </asp:Calendar>
            <asp:Button ID="btnSelectDate" runat="server" Text="Select Date" />
            &nbsp;&nbsp;
            <asp:Label ID="lblTerm" runat="server"></asp:Label>
            <br />
            <asp:TextBox ID="txtDate" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="Button1" runat="server" Text="Get Window" Visible="False" />
        </div>
        <br />
        <asp:Label ID="lblDay" runat="server"></asp:Label>
        <br />
        <strong>
        <asp:Label ID="lblWindow" runat="server"></asp:Label>
        <br />
        <br />
        Reference:
        <asp:TextBox ID="txtReference" runat="server"></asp:TextBox>
&nbsp;<asp:Button ID="btnShow" runat="server" Text="Show Exam Windows" />
        <br />
        <br />
        </strong>
        <asp:Label ID="lblExamWindows" runat="server"></asp:Label>
    </form>
    <p>

</body>
</html>
