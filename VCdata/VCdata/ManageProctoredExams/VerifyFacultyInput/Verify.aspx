<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Verify.aspx.vb" Inherits="VCdata.StepE" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Exam Verification<br />
            these forms will show only exams that have been modified by instructors.<br />
            There is a link for each exam that will show a pop up window where you can compare faculty input against the original defaullt settings.<br />
            Each exam must be verified to make sure that exams will be properly set up.&nbsp; Look for bogus dats,and strange data.<br />
            There are seperate forms for Mid Terms and Finals.&nbsp; (these forms should be recreated in the support folder) right now they are only linked.<br />
            these pages need revision to allow the drop downs to work. Currently you mut manually change the sessions in the Sql connection.<br />
            I generally filter by the sesssion (1 or 8W1)
            <br />
            <br />
            <a href="../../ExamVerifications/MidTermReview.aspx">MidTermReview.aspx</a><br />
            <br />
            <br />
            <a href="../../ExamVerifications/FinalReview.aspx">FinalReview.aspx</a></div>
    </form>
    <p class="auto-style1">
        <strong>When the reviews are complete, you can go on to create the exam reports In StepF</strong></p>
</body>
</html>
