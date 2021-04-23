<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="StepC.aspx.vb" Inherits="VCdata.StepC" %>

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
        .auto-style4 {
            text-decoration: underline;
        }
    </style>
    </head>
<body>
    <form id="form1" runat="server">
        <strong><span class="auto-style1"><span class="auto-style3">Step C:&nbsp; Preparing&nbsp; Data for Faculty Proctored Exam Verification</span> </span>
        <br />
&nbsp;<br />
        </strong>
        <asp:TextBox ID="txtTerm" runat="server"></asp:TextBox>
&nbsp;<strong>&lt;-- Make sure term is correct!<br />
        <asp:Label ID="lblWorking" runat="server" ForeColor="#0066FF"></asp:Label>
        &nbsp;
        <asp:Label ID="lblMode" runat="server" ForeColor="#CC0000" BackColor="White"></asp:Label>
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
            <br />
            Preview will only display all sql queries Run will run the queries without displaying them.&nbsp; Use the back button if you preview and then want to run. This will preserve the selections above.<asp:RadioButtonList ID="RadioPreview" runat="server" RepeatDirection="Horizontal" AutoPostBack="True">
                <asp:ListItem>Preview</asp:ListItem>
                <asp:ListItem>Run</asp:ListItem>
            </asp:RadioButtonList>
            <br />
            <asp:Button ID="btnContinue" runat="server" Text="Continue" />
        </asp:Panel>
        <br />

        <asp:Panel ID="Panel2" runat="server" Visible="False">
            <br />
            <asp:Button ID="btnCourseData" runat="server" Text="A. Add Course Data from CMR" Width="205px" />
            &nbsp; Add parent course data to MasterProctor&nbsp;&nbsp;&nbsp; Course, instructor, username, CanChange, Session,MidProctorX(1),FinalProctorX(1),Access(0),MidNotes - FinalNotes - InstComments&nbsp; = all(&#39;&#39;)<br />
            <br />
            <asp:Button ID="btnAddExamData" runat="server" Text="B. Add Exam Data From MasterProctorDates" Width="290px" />
            &nbsp; Add isMid, midStart,MidEnd, isFin, FinStart, FinEnd to MasterProctor<br /> Note For 12W session&nbsp;&nbsp; this is an outlier&nbsp; the Case statement was manually changed to adjust for no 12W data in MasterExamDates table<br />
            <br />
            <asp:Button ID="btnDetails" runat="server" Text="C, Add Exam Details from DesignerDB" Width="249px" />
            <br />
            <br />
            <br />
            <br />
            <p>
                <span class="auto-style2"><strong>One Last Thing:</strong></span> Backup MasterProctor to MasterProctor_BU to preserve a record of the original settings prior to allowing faculty to select exam options.</p>
            <p>
                Do this <strong>AFTER</strong> you create the data for MasterProctor and <strong>BEFORE </strong>you release the data to faculty for updates</p>
            <p>
                <asp:Button ID="btnBackup1A" runat="server" BorderColor="#CC0000" BorderWidth="2px" Text="BACKUP Session 1 &amp; A to MasterProctor_BU_1A" Visible="False" Width="398px" />
            </p>
            <p>
                <asp:Button ID="btnBackupB" runat="server" BorderColor="Red" BorderWidth="3px" Text="BACKUP Session B to MasterProctor_BU_B" Visible="False" />
                &nbsp;
            </p>
            <asp:Label ID="lblFinish" runat="server" BackColor="#FFFFCC" Font-Bold="True" ForeColor="#CC0000" Text="You have now created the data for faculty to review exam settings for this Session" Visible="False"></asp:Label>
            <br />
            <span class="auto-style4"><strong>Proceed to StepD</strong></span> to open the faculty portal so instructors can veriry their exam settings</asp:Panel>
        <br />

    </form>
    <p>
&nbsp;</p>
    </form>
</body>
</html>