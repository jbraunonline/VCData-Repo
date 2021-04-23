<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="UploadParentChild03.aspx.vb" Inherits="VCdata.UploadParentChild03" %>

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
            <strong>Upload data for BB_ParentChild.&nbsp; use this for UPCOMING Term Exam Dates at end of term.</strong></p>
        <p>
            This begins with Lester&#39;s parent/child report</p>
        <p>
            Remember to delte last term&#39;s BB_ParentChild table data</p>
        <p>
            <span class="style2">Data format exptected</span>:<br />
            <strong>Parentcourse, </strong>ChildCourse<br />
            <br />
            SPC1017-2197-8313,SPC1017-2197-8320</p>
        <p>
            Start:
            <asp:Button ID="btnClearTable" runat="server" BackColor="Red" Font-Bold="True" ForeColor="White" Text="Clear MasterProctor" />
&nbsp;
            <asp:Button ID="btnClearTable0" runat="server" BackColor="Red" Font-Bold="True" ForeColor="White" Text="Clear BB_ParentChild" />
        &nbsp;&nbsp; This must be done manually, these buttons do not work for preparing next Term dates.</p>
    
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

            Specify the term for these dates:
            <asp:TextBox ID="txtTerm" runat="server" BackColor="#C6E2FF">2197</asp:TextBox>
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
            <asp:Button ID="btnFamily" runat="server" Text="Set Families" />
                    &nbsp; This adds parents and familystring to MasterProctor<br />
            <asp:Button ID="btnAddSinglesMP03" runat="server" Text="Add singles to MasProctor03" />
        </asp:Panel>
        *****************************************************************************************************************<br />
        <span class="auto-style2"><strong><span class="auto-style3">STOP</span></strong></span> here and <span class="auto-style4">reset BBCourses</span> to correct parent/Child i<strong>n BBParentChild/resetBBCourse.aspx</strong><br />
        After resetting BBCourses parent child childof fields to match actual data in BB from Lester&#39;s List, we can now proceed to create the MasterProctor table.<br />
        Then come back.&nbsp;
        <br />
        ******************************************************************************************************************<br />
        <br />
        Select which session to modify MasterProctor<asp:RadioButtonList ID="RadioSession" runat="server" RepeatDirection="Horizontal">
            <asp:ListItem Value="1">1 Only</asp:ListItem>
            <asp:ListItem Value="A">A Only</asp:ListItem>
            <asp:ListItem>A &amp; 1</asp:ListItem>
            <asp:ListItem Value="B" Selected="True">B ONLY</asp:ListItem>
        </asp:RadioButtonList>
        <asp:RadioButtonList ID="RadioPreview" runat="server" RepeatDirection="Horizontal">
            <asp:ListItem Selected="True">Preview</asp:ListItem>
            <asp:ListItem>Run</asp:ListItem>
        </asp:RadioButtonList>
        <br />
        <asp:Button ID="btnCourseData" runat="server" Text="Add Course Data" />
&nbsp; Add parent course data to MasterProctor&nbsp;&nbsp;&nbsp; Course, instructor, username, CanChange, Session,MidProctorX(1),FinalProctorX(1),Access(0),MidNotes - FinalNotes - InstComments&nbsp; = all(&#39;&#39;)<br />
        <br />
        <asp:Button ID="btnAddExamData" runat="server" Text="Add Exam Data" />
&nbsp; Add isMid, midStart,MidEnd, isFin, FinStart, FinEnd to MasterProctor<br />
        Change this to get data from MasterExamDates by Course and Session<br />
        <br />
        <asp:Button ID="btnDetails" runat="server" Text="Add Exam Details" />
        <br />
        <br />
        The MasterProctor data is now ready for faculty to review and make changes.</form>
</body>
</html>

