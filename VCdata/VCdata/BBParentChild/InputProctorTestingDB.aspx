<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="InputProctorTestingDB.aspx.vb" Inherits="VCdata.InputProctorTestingDB" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-decoration: underline;
        }
        .auto-style2 {
            font-size: small;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            This form will copy data from MasterProctor to MasterProctorTesting DB<br />
            by term, session, and Exam (Mid/Final)&nbsp; See aboutProctorTesting.txt for summary.<br />
            <br />
            <asp:TextBox ID="txtTerm" runat="server">2207</asp:TextBox>
&nbsp; Term<br />
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
            <span class="auto-style2">StudentDates loads data to the MasterProctorTesting_BU table for student view of upcoming dates. This can be posted before actual data needed for setting up Exams has been verified change this to ExamSetup when the MasterProctor data can be uploaded to testing only AFTER exam data is verified and ready to be added to MasterProctorTesting table.. StudentDates can be done earlier to allow studs to see exam windows.</span><br />
            <asp:RadioButtonList ID="RadioBackup" runat="server" RepeatDirection="Horizontal">
                <asp:ListItem Selected="True">ExamSetup</asp:ListItem>
                <asp:ListItem>StudentDates</asp:ListItem>
            </asp:RadioButtonList>
            ^ Select Exam Setup to load into MasterProctorTesting!&nbsp;
            <asp:RadioButtonList ID="RadioButtonAction" runat="server" RepeatDirection="Horizontal">
                <asp:ListItem Selected="True">Preview</asp:ListItem>
                <asp:ListItem>Run</asp:ListItem>
            </asp:RadioButtonList>
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
</body>
</html>
