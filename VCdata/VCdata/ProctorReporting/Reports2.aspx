<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Reports2.aspx.vb" Inherits="VCdata.Reports2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            color: #CC0000;
        }
        .auto-style2 {
            font-size: x-large;
        }
        .auto-style3 {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <span class="auto-style2"><strong>This page creates the data for the proctored exam reports.</strong></span><br />
            The MasterProctor data that the faculty reviewed was organized by families/parentcourse.&nbsp; The setup team only needs to setup one exam for the family of courses by setting up the paent course.<br />
            But when it comes to preparing data for the testing centers and proctorU, they need the data organized for each indivicual course.<br />
            We do this by creating a MasterProctorTesting dataset where we parse the families into individual courses (using the family string as an array of individual courses.)<br />
            So for each family in the MasterProctor table, we create an identical record for each individual course;&nbsp; I.e. a family of three courses will create three records in the MasterProctorTesting table.<br />
            The MasterProctorTesting table has two records for each course.. One for the Midterm and one for the Fianl.<br />
            <br />
            This form creates records based on term, course, session, and exam type (mid or final),<br />
            This form must be run by indivicual sessions and exams after the exam verifiation is completed by faculty. So for session 1, we run it for mid, and again for final (two times0<br />
            If we are running session 1 and A we wo;; need to run it four times 16 wk and Mid, 16 wk and final,&nbsp; and 8w1mid, plus 8w1 final.<br />
            If we are processing session B we will run it for B and mid, and again for B and final.<br />
            Please note that we are also (During COVID) allowing faculty to opt in/out. All records by default are ope in. Checking the opt in box processes only courses marked opt in (skipping any opt out records).<br />
            Once COVID is over, leave the box checked as all records are by default opt in.<br />
            <br />
        </div>
                <div>
                    <br />
            <br />
            <asp:TextBox ID="txtTerm" runat="server">2213</asp:TextBox>
&nbsp; Term&nbsp; &lt;-- <span class="auto-style1"><strong>Make sure the term is correct. </strong></span>It&#39;s best to set this in the code behind.<br />
                    Note the terminology, 1=16 week<br />
&nbsp;<br />
&nbsp;
            <asp:DropDownList ID="DropDownList1" runat="server">
                <asp:ListItem>Select Session</asp:ListItem>
                <asp:ListItem>1</asp:ListItem>
                <asp:ListItem>8W1</asp:ListItem>
                <asp:ListItem>6W1</asp:ListItem>
                <asp:ListItem>8W2</asp:ListItem>
                <asp:ListItem>6W2</asp:ListItem>
            </asp:DropDownList>
&nbsp; Select Session&nbsp;&nbsp;
            <asp:CheckBox ID="chkOptIn" runat="server" Checked="True" Text="Opt In" />
&nbsp;<asp:RadioButtonList ID="radioExam" runat="server" RepeatDirection="Horizontal">
                <asp:ListItem Value="isMidTerm" Selected="True">Mid</asp:ListItem>
                <asp:ListItem Value="isFinal">Final</asp:ListItem>
            </asp:RadioButtonList>
            <asp:RadioButtonList ID="RadioButtonAction" runat="server" RepeatDirection="Horizontal">
                <asp:ListItem Selected="True">Preview</asp:ListItem>
                <asp:ListItem>Run</asp:ListItem>
            </asp:RadioButtonList>
                    <strong>Preview</strong> will display the sql but <span class="auto-style3">not run it</span>, <strong>Run</strong> will <span class="auto-style3">run without displaying SQL </span>&nbsp;I preview to make sure the counts are correct and verify the SQL<span class="auto-style3">.</span><br />
            <asp:Button ID="btnCopy" runat="server" Text="Copy Data" />
            <br />
            <br />
            <asp:Button ID="btnPasswords" runat="server" Text="Get Passwords" />
            <br />
            <br />
            <asp:Label ID="lblCode" runat="server" BackColor="#D5EAFF"></asp:Label>
            <br />
            <br />
        </div>
        <asp:RadioButtonList ID="RadioButtonList1" runat="server">
        </asp:RadioButtonList>
    </form>
    <p>
        Finally, add the passwords to masterproctortesting for session - 8w1 and exam type mid use</p>
    <p>
        <span class="auto-style1">Note: change the where clause to session and examtype and change the passwords to correct masterexamd</span>ates field appropriate to session&nbsp; RUN SQL:</p>
    <p>
        use VC_VCData </p>
    <p>
        Update dbo.MasterProctorTesting_BU</p>
    <p>
        &nbsp;set MasterProctorTesting_BU.LPassword = MasterExamDates.MidB_LPass, </p>
    <p>
        MasterProctorTesting_BU.RPassword =MasterExamDates.MidB_RPass </p>
    <p>
        From MasterExamDates </p>
    <p>
        where MasterExamDates.Course = MasterProctorTesting_BU.course and MasterProctorTesting_BU.Session = &#39;8W2&#39; and MasterProctorTesting_BU.ExamType=&#39;Mid&#39;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        use VC_VCData
    </p>
    <p>
        Update dbo.MasterProctorTesting
    </p>
    <p>
        set MasterProctorTesting.LPassword = MasterExamDates.Mid1_LPass,
    </p>
    <p>
        MasterProctorTesting.RPassword =MasterExamDates.Mid1_RPass
    </p>
    <p>
        From MasterExamDates
    </p>
    <p>
        where MasterExamDates.Course = MasterProctorTesting.course</p>


    </form>
</body>
</html>
