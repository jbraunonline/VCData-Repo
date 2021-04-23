<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="resetBBcourse.aspx.vb" Inherits="VCdata.resetBBcourse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            background-color: #FFFF99;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Reset BBcourses&nbsp; ischild,, childof, family<br />
            <br />
            Run 2 SQL<br />
            .................................Back up BB_Courses before making changes<br />
            use VC_VCData
            <br />
            DROP TABLE dbo.BBcourses_BU;
            <br />
            <br />
            use VC_VCData
            <br />
            Select * into dbo.BBcourses_BU from dbo.BBcourses;<br />
            ..............................................................................<br />
            <br />
            Reset BBCourse Parent/Child for term:
            <asp:TextBox ID="txtTerm" runat="server">2207</asp:TextBox>
            &nbsp;&nbsp; and
            <asp:RadioButtonList ID="RadioSession" runat="server" RepeatDirection="Horizontal">
                <asp:ListItem Value="1" Selected="True">Session 1 &amp; a</asp:ListItem>
                <asp:ListItem Value="2">B Session</asp:ListItem>
            </asp:RadioButtonList>
            <asp:RadioButtonList ID="RadioPreview" runat="server" RepeatDirection="Horizontal">
                <asp:ListItem Selected="True">Hold</asp:ListItem>
                <asp:ListItem>Run</asp:ListItem>
            </asp:RadioButtonList>
            <span class="auto-style1">Term&nbsp; Hold\Run and Session Applies to all buttons below:</span><br />
            ................................................................................................<br />
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
            <br />
            <asp:Button ID="AddSingles" runat="server" Text="Add singles to MasterProctor" />
        </div>
    </form>
</body>
</html>
