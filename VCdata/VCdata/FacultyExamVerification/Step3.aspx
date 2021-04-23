<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Step3.aspx.vb" Inherits="VCdata.Step3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            font-size: x-large;
        }
        .auto-style2 {
            font-weight: normal;
        }
        .auto-style3 {
            font-family: Arial, Helvetica, sans-serif;
        }
    </style>
    </head>
<body>
    <form id="form1" runat="server">
        <strong><span class="auto-style1"><span class="auto-style3">Preparing&nbsp; Data for Faculty Proctored Exam Verification</span> </span>
        <br />
&nbsp;<br />
        </strong>
        <asp:TextBox ID="txtTerm" runat="server"></asp:TextBox>
&nbsp;<strong>&lt;-- Make sure term is correct!<br />
        <asp:Label ID="lblWorking" runat="server" ForeColor="#0066FF"></asp:Label>
        <br />
        </strong>
        <asp:Panel ID="Panel1" runat="server">
            Select which session to modify MasterProctor<asp:RadioButtonList ID="RadioSession" runat="server" RepeatDirection="Horizontal" AutoPostBack="True">
                <asp:ListItem Value="1" Enabled="False">1 Only</asp:ListItem>
                <asp:ListItem Value="A" Enabled="False">A Only</asp:ListItem>
                <asp:ListItem>A &amp; 1</asp:ListItem>
                <asp:ListItem Value="B">B ONLY</asp:ListItem>
                <asp:ListItem>12W</asp:ListItem>
            </asp:RadioButtonList>
            <asp:RadioButtonList ID="RadioPreview" runat="server" RepeatDirection="Horizontal">
                <asp:ListItem Selected="True">Preview</asp:ListItem>
                <asp:ListItem>Run</asp:ListItem>
            </asp:RadioButtonList>
            <br />
            <asp:Button ID="btnContinue" runat="server" Text="Continue" />
        </asp:Panel>
        <br />

        <asp:Panel ID="Panel2" runat="server" Visible="False">
            <br />
            <asp:Button ID="btnCourseData" runat="server" Text="Add Course Data" />
            &nbsp; Add parent course data to MasterProctor&nbsp;&nbsp;&nbsp; Course, instructor, username, CanChange, Session,MidProctorX(1),FinalProctorX(1),Access(0),MidNotes - FinalNotes - InstComments&nbsp; = all(&#39;&#39;)<br />
            <br />
            <asp:Button ID="btnAddExamData" runat="server" Text="Add Exam Dates" />
            &nbsp; Add isMid, midStart,MidEnd, isFin, FinStart, FinEnd to MasterProctor<br /> Change this to get data from MasterExamDates by Course and Session<br />
            <br />
            <asp:Button ID="btnDetails" runat="server" Text="Add Exam Details" />
            <br />
            <br />
            The MasterProctor data is now ready for faculty to review and make changes.after running this:<br />
            <asp:Button ID="btnLockDown" runat="server" BorderColor="#00CC99" Text="Update Lockdown" />
            &nbsp; Run this after adding course data for all sessions<br />
            <br />
            <p>
                <span class="auto-style2"><strong>One Last Thing:</strong></span> Backup MasterProctor to MasterProctor_BU to preserve a record of the original settings prior to allowing faculty to select exam options.</p>
            <p>
                Do this <strong>AFTER</strong> you create the data for MasterProctor and <strong>BEFORE </strong>you release the data to faculty for updates</p>
            <p>
                <asp:Button ID="btnBackup1A" runat="server" BorderColor="#CC0000" BorderWidth="2px" Text="BACKUP Session 1 &amp; A to MasterProctor_BU_1A" Width="398px" Visible="False" />
            </p>
            <p>
                <asp:Button ID="btnBackupB" runat="server" BorderColor="Red" BorderWidth="3px" Text="BACKUP Session B to MasterProctor_BU_B" Visible="False" />
                &nbsp;
            </p>
            <asp:Label ID="lblFinish" runat="server" BackColor="#FFFFCC" Font-Bold="True" ForeColor="#CC0000" Text="You have now created the data for faculty to review exam settings for this Session" Visible="False"></asp:Label>
            <br />
            After Faculty have reviewed exam data and it has been reviewed
            <br />
            Close the Faculty Portal to end input and go on to verifying their changes and creating the reports for the SetUp Team, Testing Centers and ProctorU.</asp:Panel>
        <br />

    </form>
    <p>
&nbsp;</p>
    </form>
</body>
</html>
