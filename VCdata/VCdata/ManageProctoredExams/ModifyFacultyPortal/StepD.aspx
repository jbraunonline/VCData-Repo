<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="StepD.aspx.vb" Inherits="VCdata.StepD" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 837px;
            height: 416px;
        }
        .auto-style2 {
            width: 911px;
            height: 344px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            After the data in MasterProctor.db is correct&nbsp; you have to open up the Faculty Portal for full time faculty to review, make changes or opt in/out of proctord exams.<br />
            The process is the same for session 1&amp;A and Session B<br />
            <br />
            <strong>ONE: </strong>&nbsp;change the login message for faculty announcing the availability of exam verification for these sessions.<br />
            &nbsp; A working copy of that file is in this Project&nbsp; located at&nbsp; ManageProctoredExams/Support/ <a href="../Support/FacultyPortal_INI.aspx">FacultyPortal_INI.aspx</a> PopUp--Close Window when done.<br />
            <br />
            <strong>TWO&nbsp; </strong>Modify the faculty portal page to allow the correct exams to be preiewed in the exam review.<br />
            The data that needs to be changes is in the Page_Load Sub ar the top.<br />
            This page is in the Telerik2 project.
            ::&nbsp; Telerik2 project&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ProctorSettings/authenticate3.aspx.vb<br />
            <img alt="Modify Portal" class="auto-style2" src="FacultyPortal.png" /><br />
            <br />
            <strong>THREE </strong>&nbsp;Modify the index.aspx page in the Telerik2 Project to show the Exam Verification Tab in the portal.<br />
            File:: telerik2/index.aspx&nbsp; (in the root directory)<br />
&nbsp;&nbsp; Simply toggle the visible setting between true and false to allow the tab to show/hide.<br />
            <img alt="Verification" class="auto-style1" longdesc="show verification" src="../Support/ShowExamVerification.png" /><br />
            <br />
            the Portal is now ready for Faculty Input.<br />
            Wgeb the exam verification window is closed,(Amy sets the dates) then go To Step E<br />
            <br />
            After&nbsp; the Faculty <strong>&nbsp;forms are hidden, we go to Step F, verifying faculty changes.</strong><br />
        </div>
    </form>
</body>
</html>
