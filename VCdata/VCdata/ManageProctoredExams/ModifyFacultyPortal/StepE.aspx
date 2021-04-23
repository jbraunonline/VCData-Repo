<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="StepE.aspx.vb" Inherits="VCdata.StepE1" %>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 837px;
            height: 416px;
        }
        .auto-style3 {
            font-size: x-large;
            font-family: Arial, Helvetica, sans-serif;
        }
        .auto-style4 {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <span class="auto-style3">After the faculty have reviewed and made changes to their exam settings, we must CLOSE the Faculty Poral and freeze the date for the session(s) being reviewed..</span><br />
            <br />
            <strong>ONE: </strong>&nbsp;change the login message for faculty announcing the availability of exam verification for these sessions.<br />
            &nbsp; A working copy of that file is in this Project&nbsp; located at&nbsp; ManageProctoredExams/Support/ <a href="../Support/FacultyPortal_INI.aspx">FacultyPortal_INI.aspx</a><br />
&nbsp; Typically the message should be something like: &quot;The window for verifying the proctored exams for sessions&nbsp; xxx,yyy, and zzz is now closed,&quot;<br />
            <br />
            <br />
            <br />
            <strong>TWO </strong>&nbsp;Modify the index.aspx page in the Telerik2 Project to <span class="auto-style4">HIDE the Exam Verification Tab</span> in the portal.<br />
            File:: telerik2/index.aspx&nbsp; (in the root directory)<br />
&nbsp;&nbsp;Set the visible setting to flase in the properties of the tab. This will hide the link to the verifications pages.<br />
            <img alt="Verification" class="auto-style1" longdesc="show verification" src="../Support/ShowExamVerification.png" /><br />
            <br />
            <br />
            <strong>when the verification forms are hidden, you now go to Step F, verifying faculty changes.</strong><br />
        </div>
    </form>
</body>
</html>
