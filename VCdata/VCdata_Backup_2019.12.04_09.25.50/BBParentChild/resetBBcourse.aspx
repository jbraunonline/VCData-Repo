<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="resetBBcourse.aspx.vb" Inherits="VCdata.resetBBcourse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Reset BBcourses&nbsp; ischild,, childof, family<br />
            <asp:Button ID="btnDropBU" runat="server" BackColor="Red" Font-Bold="True" ForeColor="White" Text="Dro BBCourses_BU" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="BtnCreateBU" runat="server" BackColor="Red" Font-Bold="True" ForeColor="White" Text="Create BBCoures_BU" />
            <br />
            <br />
            <asp:Button ID="btnResetBBcourses" runat="server" Text="Reset ischild/childof" />
            <br />
            <br />
            <asp:Button ID="btnResetFamilies" runat="server" Text="Reset Family" />
            <br />
            <br />
            Update BBCourses with correct parent/child records&nbsp; 
            Do this AFTER you have uploaded Lester&#39;s Parent/Child data to BB_ParentChild<br />
            Update bbcourses set ischild=1, childof = parent, family= parent where reference = child<br />
            <asp:Button ID="btnUpdateChildren" runat="server" Text="UpdateChildren" />
            <br />
            <br />
            Add nonparents and non children to MasterProctor<br />
            <asp:RadioButtonList ID="RadioSelectSession" runat="server" RepeatDirection="Horizontal">
                <asp:ListItem>1 &amp; A</asp:ListItem>
                <asp:ListItem Selected="True">B</asp:ListItem>
            </asp:RadioButtonList>
            <asp:RadioButtonList ID="RadioPreview" runat="server" RepeatDirection="Horizontal">
                <asp:ListItem Selected="True">Preview</asp:ListItem>
                <asp:ListItem>Run</asp:ListItem>
            </asp:RadioButtonList>
            <br />
            <asp:Button ID="AddSingles" runat="server" Text="Add singles to MasterProctor" />
        </div>
    </form>
</body>
</html>
