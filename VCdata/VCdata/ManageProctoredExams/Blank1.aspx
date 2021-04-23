<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Blank1.aspx.vb" Inherits="VCdata.Blank11" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            font-size: x-large;
            font-family: Arial, Helvetica, sans-serif;
        }
        .auto-style2 {
            font-size: medium;
            font-family: Arial, Helvetica, sans-serif;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
    </form>
    <p class="auto-style1">
        <strong>Welcome to the Proctored Exam Report Generation Appliction</strong></p>
    <p class="auto-style2">
        This application was designed to process the first two sessions of a term (1 and A) after the end of the first week of the start of a term.
    </p>
    <p class="auto-style2">
        Session B or any other outlier sessions should follow the procedures outlined in Session B at the end of the menu</p>
    <p class="auto-style2">
        Most repetitive functions have been abstracted to the ProctorExam.vb class file in the root of this directory and are reinstated as needed throughout the application. This simplifies any changes that may be needed as the data needs change.</p>
    <p class="auto-style2">
        A major shortcoming of this application is that the exam dates supplied by the Program Manager is geared towards the development of master courses and not towards generating data used in the actual deployent of the exams. So there may be some dates in data supplied by the Program Manager that is a placeholder and not a legal exam date. (1/1/2021 is used as a placeholder for the Desgin Team, but generates an incorrect date for the actual exam should a faculty member opt in to an exam that has a placeholder and not an actual date).&nbsp; Somewhat major changes will need to be made in the event that unanticipated sessions are added beyond the 16 wk, 8w1.6w1. and 12 wk sessions.</p>
</body>
</html>
