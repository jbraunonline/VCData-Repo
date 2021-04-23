<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="NewMasterCourse.aspx.vb" Inherits="VCdata.NewMasterCourse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            font-size: large;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        NOTE: this form gets default data from the Class DesignModule.vb&nbsp;&nbsp; The default values must be changed in that file.<br />
        <strong><span class="auto-style1">Create new master shells</span></strong><br />
        <asp:Label ID="lblNextTerm" runat="server"></asp:Label>
&nbsp; Master Term<br />
        <asp:Label ID="lblNewMasterTerm" runat="server"></asp:Label>
&nbsp; New Master Term&nbsp;&nbsp; Start:<asp:TextBox ID="txtStart" runat="server">20180101</asp:TextBox>
&nbsp; End
        <asp:TextBox ID="txtEnd" runat="server">20191231</asp:TextBox>
    
        <br />
        <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
            <asp:ListItem Selected="True" Value="0">Master Source</asp:ListItem>
            <asp:ListItem Value="1">From Alternate Source</asp:ListItem>
        </asp:RadioButtonList>
    
        <asp:RadioButtonList ID="radioAction" runat="server" RepeatDirection="Horizontal">
            <asp:ListItem Selected="True">Hold</asp:ListItem>
            <asp:ListItem>Run</asp:ListItem>
        </asp:RadioButtonList>
&nbsp;&nbsp;&nbsp;&nbsp;
    
    </div>
        <asp:Button ID="btnGetShells" runat="server" Text="Get New Shell Data" />
        &nbsp;<br />
        <asp:Label ID="lblMyCount" runat="server" ForeColor="#CC0000" Text="Label"></asp:Label>
        <br />
        <asp:Label ID="lblData" runat="server" ForeColor="#CC0000"></asp:Label>
    </form>
</body>
</html>

