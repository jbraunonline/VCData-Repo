<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="SessionB_Setup.aspx.vb" Inherits="VCdata.SessionB_Setup" %>

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
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <strong><span class="auto-style1">For Sesssion B
            </span></strong>
            <br />
            Backup MasterProctor to MasterProctor_BU<br />
            This preserves the CHANGED values for MasterProctor that were used to generate 1&amp;A exam data\<br />
            <asp:Button ID="btnBUMasterProctor" runat="server" BackColor="White" BorderColor="#CC0000" Text="Backup MasterProctor" />
&nbsp; this copies MasterProctor data to MasterProctor_BU and then deletes the data<br />
            We might want to keep MasterProctor and only add session B data to it.?&nbsp; I&#39;m going to try it with 2213 Session B<br />
            <br />
            From here on, we will only be working with Session B data <a href="mailto:(8@1">(8</a>W2 or 6W2}<br />
            <br />
            Get a list of parent/children from Lester after the end of the first week of session B (new courses and instructor changes should be complete by then)<br />
            review the info in Lester&#39;s file.&nbsp; Make sure there are ONLY courses with a start date for SessionB - <span class="auto-style2">delete all 1 and A courses when proparing for Session B from BBparentchile.</span><br />
            <strong>Go back to #2 Setup Famillies</strong>&nbsp; <span class="auto-style2">Run all steps in #2 </span>with the new data for Session B and <span class="auto-style2">use Session B</span> if a session is asked.<br />
            <br />
            <strong>Go back to #3.Copy Content to MasterProctor</strong>&nbsp; <span class="auto-style2">Make sure you select Session B Only </span>before running the data.<span class="auto-style2"> Run all steps</span><br />
            <br />
            ERROR CATCH: there may be a new course or a pilot course that is running that does not have content either in OL_MasterExam or the MasterExamDates tables.<br />
            Find missing data needed for the MasterProctor table. Otherwise the reports and faculty forms will have blank data for these courses.<br />
            <asp:Button ID="btnCatch" runat="server" BorderColor="#CC0000" Text="Error Catch Missing Dates" Width="232px" />
&nbsp;
            <asp:Label ID="lblMissing" runat="server"></asp:Label>
            <br />
            <br />
            <asp:Button ID="btnErrorExam" runat="server" BorderColor="#CC0000" Text="Error Catch Missing Exam" Width="231px" />
&nbsp;
            <asp:Label ID="lblMissingExam" runat="server"></asp:Label>
            <br />
            <br />
            <strong>Go to #5 and open up the faculty portal </strong>for exam verification for sesssion B courses.<br />
            <br />
            When the window closes, <strong>Go to #6&nbsp; and </strong>modify the portal to end data collection.<br />
            <br />
            <strong>Go to # 7 </strong>&nbsp;and Verify both Mid and final exams for the B Sessions<br />
            <br />
            <strong>Go to # 8 </strong>&nbsp; and create eports for SessionB exam setup and SessionB ProctorU
            <br />
            You need to generate <span class="auto-style2">four reports</span> for sessionB<br />
            SessionB Mid Setup<br />
            SessionB Mid ProctorU<br />
            SessionB Mid TestingCenters (not needed as we are not using Testing Centers during covid.<br />
            SessionB Final setup<br />
            Sessionb Final ProctorU.<br />
            SessionB FinalTestingCenters (not needed as we are not using Testing Centers during covid.<br />
        </div>
    </form>
    <p>
        &nbsp;</p>
</body>
</html>
