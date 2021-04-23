<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ExamReports.aspx.vb" Inherits="VCdata.ExamReports" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            font-size: x-large;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <strong><span class="auto-style1">Proctored Exam Reports</span><br />
            </strong>For all reporting, run the reports below and send the excel output to Amy&#39; Use the Excel download link on the reports on the upper right corner of the report.<br />
            <br />
            <a href="../ExamSetupTeam/BlackboardSetupMidTerm.aspx"><strong>Setup Tem - Mid Terms</strong></a>&nbsp; If processing 1 &amp; a, run this report for each session<strong>. <br />
            </strong>
            <br />
            <a href="../ExamSetupTeam/BlackboardSetupFinals.aspx"><strong>Setup Team - Finals</strong></a>&nbsp; If processing 1 &amp; a, run this report for each session<strong>. </strong><br />
            <br />
            <a href="../ProctorU/GetProctorU.aspx"><strong>ProctorU</strong></a><br />
            Both Sessions can be run from this report. If you are processing 1 @ A, run it twice; once for 1 (16 wk) and again for A<br />
            <br />
            <a href="../ExamSetupTeam/ExamSetup.aspx"><strong>Testing Center (Johnathan)</strong></a><br />
            Both Sessions can be run from this report. If you are processing 1 @ A, run it twice; once for 1 (16 wk) and again for A<br />
            Not Necessary if we are NOT using Testing Centers<br />
            <br />
            Deadlines:<br />
            Amy needs the ProcotrU data ASAP to allow students to register for exams.<br />
            The first priority is to get the data for1 &amp;A sessions processed and included in the MasterProctorTesting table. After the data is there, run the ProctorU report first.<br />
            Amy is expecting several reports organized by session and exam<br />
            ProctorU Session A midterms. ProctorU session A Finals.should be prepared ASAP.
            <br />
            This should be followed by the Setup Team Session A midterms and
            <br />
        </div>
    </form>
</body>
</html>
