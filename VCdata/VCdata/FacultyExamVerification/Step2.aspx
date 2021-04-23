<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Step2.aspx.vb" Inherits="VCdata.Step2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            background-color: #FFFF99;
        }
        .auto-style2 {
            font-size: x-large;
        }
        .auto-style3 {
            font-size: large;
        }
        .auto-style4 {
            color: #CC0000;
        }
        .auto-style5 {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <span class="auto-style2"><strong>STEP 2</strong>&nbsp;&nbsp; </span><span class="auto-style3">Reset BBcourses&nbsp;table. Firelds:&nbsp; ischild,, childof, family</span><br />
            <br />
            <asp:Panel ID="Panel1" runat="server" BackColor="#CCFFCC">
                Run 2 SQLfrom SQL Mgmt Studio. <span class="auto-style5">This is a major security requirement</span>.&nbsp; <span class="auto-style4"><strong>If someone is running this without SQL admin privileges, Lestet must do this!</strong></span><br /> .................................Back up BB_Courses before making changes<br /> use VC_VCData
                <br />
                DROP TABLE dbo.BBcourses_BU;
                <br />
                <br />
                use VC_VCData
                <br />
                Select * into dbo.BBcourses_BU from dbo.BBcourses;<br />
                <br />
                <asp:Button ID="btnContinue1" runat="server" Text="Continue after BU" />
                <br />
                ..............................................................................</asp:Panel>
            <br />
            <asp:Panel ID="Panel2" runat="server" BackColor="#CCFFFF" Visible="False">
                <br />
                Reset BBCourse Parent/Child for term:
                <asp:TextBox ID="txtTerm" runat="server">2213</asp:TextBox>
                &nbsp;&nbsp; Select the session.&nbsp; use 1 at start and B only when you are working on Session B
                <asp:RadioButtonList ID="RadioSession" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="1" Selected="True">Session 1 &amp; a</asp:ListItem>
                    <asp:ListItem Value="2">B Session</asp:ListItem>
                    <asp:ListItem>12W</asp:ListItem>
                </asp:RadioButtonList>
                <asp:RadioButtonList ID="RadioPreview" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Selected="True">Hold</asp:ListItem>
                    <asp:ListItem>Run</asp:ListItem>
                </asp:RadioButtonList>
                <span class="auto-style1">Term&nbsp; Hold\Run and Session <span class="auto-style5">Applies to all buttons</span> below: Hole shows SQL but does not run, RUN&nbsp; fires the data.</span><br /> ................................................................................................<br />
                <asp:Button ID="btnResetBBcourses" runat="server" Text="Reset ischild/childof" />
                &#39;&#39;&nbsp; Set ischild=0 and childof = &quot;&quot;<br />
                <br />
                <asp:Button ID="btnResetFamilies" runat="server" Text="Reset Family" />
                <br />
                <br />
                <asp:Button ID="btnContinue2" runat="server" Text="Continue after BOTH resets are complete" />
            </asp:Panel>
            <br />
            <asp:Panel ID="Panel3" runat="server" BackColor="#CCFFCC" Visible="False">
                Update BBCourses with correct parent/child records&nbsp; This ASSUMES that only the courses from the correct term are in the BBparentchild table.<br /> Only parent/child courss in BBparentchild are going to be reset. IF there ae only full session&amp; A are there, only those will be changed, ditto for session B because the source for parent and child is coming from bbparentchild<br /> Update bbcourses set ischild=1, childof = parent, family= parent where reference = child<br />
                <asp:Button ID="btnUpdateChildren" runat="server" Text="UpdateChildren" />
                <br />
                <asp:Button ID="btnConeinue3" runat="server" Text="Continue" />
            </asp:Panel>
            <br />
        </div>
 
        <div>
            <asp:Panel ID="Panel4" runat="server" BackColor="#99FFCC" Visible="False">
                Add nonparents and non children to MasterProctor<br />
                <br />
                <asp:Button ID="AddSingles" runat="server" Text="Add singles to MasterProctor" />
                <br />
                <br />
                <asp:Label ID="lblMoveOn" runat="server" Font-Bold="True" ForeColor="#CC0000" Text="Continue with Setp3.aspx" Visible="False"></asp:Label>
            </asp:Panel>
            <br />
            <br />
        </div>
    </form>
</body>
</html>

