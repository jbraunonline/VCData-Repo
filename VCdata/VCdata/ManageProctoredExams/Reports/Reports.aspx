<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Reports.aspx.vb" Inherits="VCdata.Reports" %>

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
            text-decoration: underline;
        }
        .auto-style3 {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <strong><span class="auto-style1">Proctored Exam Reports</span><br />
            </strong>For all reporting, run the reports below and send the excel output to Amy&#39; 
            <br />
            Use the Excel download link on the reports on the upper right corner of the report.<br />
            <span class="auto-style3">T</span><span class="auto-style2"><strong>hese reports will open up in a new window.</strong></span> Run the report, download the xlsx data and save it to your own desktop so you can send it to Amy<br />
            <br />
            <a href="BlackboardSetupteam.aspx" target="_blank">Blackboard SetUp Team</a><br />
            <br />
            <a href="ProctorUReport.aspx" target="_blank">ProctorU Report</a><br />
            <br />
            <a href="TestingCenterReport.aspx" target="_blank">Testing Center Report (Johnathan)</a><br />
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
