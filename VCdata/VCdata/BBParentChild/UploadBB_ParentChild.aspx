<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="UploadBB_ParentChild.aspx.vb" Inherits="VCdata.UploadBB_ParentChild" MaintainScrollPositionOnPostback="true"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            font-size: x-large;
        }
        .auto-style2 {
            color: #CC0000;
        }
        .auto-style3 {
            background-color: #FFFF66;
        }
        .auto-style4 {
            text-decoration: underline;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <p class="auto-style1">
            <strong>Upload data for BB_ParentChild.</strong></p>
        <p>
            This begins with Lester&#39;s parent/child report</p>
        <p>
            <span class="style2">Data format exptected</span>:<br />
            <strong>Parentcourse, </strong>ChildCourse<br />
            <br />
            SPC1017-2197-8313,SPC1017-2197-8320</p>
        <p>
            Start:
            <asp:Button ID="btnClearTable" runat="server" BackColor="Red" Font-Bold="True" ForeColor="White" Text="Clear MasterProctor" Visible="False" />
&nbsp;
            <asp:Button ID="btnClearTable0" runat="server" BackColor="Red" Font-Bold="True" ForeColor="White" Text="Clear BB_ParentChild" />
        &nbsp;&nbsp; These Functions will run from localhost</p>
        <p>
            <asp:RadioButtonList ID="RadioDelete" runat="server" RepeatDirection="Horizontal">
                <asp:ListItem Selected="True">Hold</asp:ListItem>
                <asp:ListItem>Clear</asp:ListItem>
            </asp:RadioButtonList>
&nbsp;&nbsp;&nbsp; Tthis is for the clear parent child button above</p>
    
    </div>
        <asp:Panel ID="Panel1" runat="server">
            <asp:FileUpload ID="UploadFile" runat="server" />
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="Upload File" />
            &nbsp;
            <asp:Button ID="Button2" runat="server" Text="Show All" />
        </asp:Panel>
        <br />
        <asp:Panel ID="Panel2" runat="server" Visible="False">

            After uploading the file, now insert the data into gg_ParentChild<br /> Specify the term for these dates:
            <asp:TextBox ID="txtTerm" runat="server" BackColor="#C6E2FF">2207</asp:TextBox>
            <br />
            File Uploaded As:<asp:Label ID="lblFileName" runat="Server"></asp:Label>
            <br />
            Size:<asp:Label ID="lblFileSize" runat="Server"></asp:Label>
            <br />
            Type:<asp:Label ID="lblFileContentType" runat="Server"></asp:Label>
            <br />
            <br />
            <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
                <asp:ListItem Selected="True">Preview</asp:ListItem>
                <asp:ListItem>Input</asp:ListItem>
            </asp:RadioButtonList>
            <br />
            <asp:Button ID="btnUpload" runat="server" Text="Input Data" />
            &nbsp;&quot;Insert into BB_ParentChild (ParentCourse, parent, ChildCourse, child, course)
            <br />
            <br />
            &nbsp;&nbsp; set families for
            <asp:RadioButtonList ID="RadioFamily" runat="server" RepeatDirection="Horizontal">
                <asp:ListItem Value="1" Selected="True">Full and 1st Session</asp:ListItem>
                <asp:ListItem Value="2">B Term Only</asp:ListItem>
            </asp:RadioButtonList>
            <br />
            <asp:Button ID="btnFamily" runat="server" Text="Set Families in MasterProctor" />
            &nbsp; This adds parents and familystring to MasterProctor<br />
            <br />
            Don&#39;t forget to update the sessions&nbsp;&nbsp; run&nbsp; \\ actually not necessaryt as we updated the input data function to get the CMR session<br /> Update dbo.MasterProctor
            <br />
            set dbo.masterProctor.session=CMR.Session
            <br />
            From dbo.CMR where dbo.CMR.BBReference = dbo.MasterProctor.Parent<br />
            <br />
        </asp:Panel>
        *****************************************************************************************************************<br />
        <span class="auto-style2"><strong><span class="auto-style3">STOP</span></strong></span> here and <span class="auto-style4">reset BBCourses</span> to correct parent/Child i<strong>n BBParentChild/resetBBCourse.aspx<br />
        The course copy team may have made errors in Parent/Child. So we are going to reset bBCourses to the correct data from Lesters&#39;s list.<br />
        Before resetting, MAKE A BU of BBCourses!!!</strong><br />
        After resetting BBCourses parent child childof fields to match actual data in BB from Lester&#39;s List, we can now proceed to create the MasterProctor table.<br />
        The last step in resetBBCourses <span class="auto-style4">adds singletons to MasterProctor</span>&nbsp;&nbsp; only then can we continue<br />
        Then come back.&nbsp;
        <br />
        ******************************************************************************************************************<br />
        <strong>getting ready to release proctored exam data to faculty to select exam options.</strong><br />
        Select which session to modify MasterProctor<asp:RadioButtonList ID="RadioSession" runat="server" RepeatDirection="Horizontal">
            <asp:ListItem Value="1">1 Only</asp:ListItem>
            <asp:ListItem Value="A">A Only</asp:ListItem>
            <asp:ListItem Selected="True">A &amp; 1</asp:ListItem>
            <asp:ListItem Value="B">B ONLY</asp:ListItem>
        </asp:RadioButtonList>
        <asp:RadioButtonList ID="RadioPreview" runat="server" RepeatDirection="Horizontal">
            <asp:ListItem Selected="True">Preview</asp:ListItem>
            <asp:ListItem>Run</asp:ListItem>
        </asp:RadioButtonList>
        <br />
        <asp:Button ID="btnCourseData" runat="server" Text="Add Course Data" />
&nbsp; Add parent course data to MasterProctor&nbsp;&nbsp;&nbsp; Course, instructor, username, CanChange, Session,MidProctorX(1),FinalProctorX(1),Access(0),MidNotes - FinalNotes - InstComments&nbsp; = all(&#39;&#39;)<br />
        <br />
        <asp:Button ID="btnAddExamData" runat="server" Text="Add Exam Dates" />
&nbsp; Add isMid, midStart,MidEnd, isFin, FinStart, FinEnd to MasterProctor<br />
        Change this to get data from MasterExamDates by Course and Session<br />
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
            <asp:Button ID="btnBackupB" runat="server" BorderColor="Red" BorderWidth="3px" Text="BACKUP Session B to MasterProctor_BU" />
&nbsp; Use this only ONCE after Session B is in MasterProctor to backup original settings in MasterProctor sesion b for reference.</p>
    </form>
    <p>
        After Faculty have reviewed exam data and it has been reviewed (in Telerik2/ <strong>~/ProctorSettings/Reports/SpecialAttention.aspx</strong></p>
    <p>
        &nbsp;Add passwords(addmaserexampasswords.aspx)&nbsp; (from Ernest spreadsheet) ~/BBParentChild/AddMasterExamPasswords.aspx</p>
    <p>
        Finally, move on to create the texting db data; InputProctorestingDB.aspx </p>
    <p>
        This has to be done in two stages 1&amp;A&nbsp;&nbsp; and then again for B session courses after the B session is finalized by Donna.</p>
    <p>
        <span class="auto-style4">Make sure you run two runs here,</span> one for the exams and another for the MasterProctorTesting_BU tahle to make exam windows available to students in the Proctor application (virtual.mdc.edu/proctor/myproctor.aspxx)</p>
    <p>
        then you&#39;re ready to generate reports.</p>
    <p>
&nbsp;</p>
</body>
</html>

