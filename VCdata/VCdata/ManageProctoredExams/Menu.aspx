<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Menu.aspx.vb" Inherits="VCdata.Menu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 1500px;
            height: 972px
        }
        .auto-style2 {
            color: #993333;
        }
        .auto-style3 {
            font-family: Arial, Helvetica, sans-serif;
            color: #FFFFFF;
            background-color: #003399;
        }
        .auto-style4 {
            width: 100%;
        }
        .auto-style5 {
            background-color: #FFFFE0;
        }



</style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="auto-style4">
        <div style="width: 10%; height: 800px; float: left; background: lightyellow;"> 
            <br />
            <strong><span class="auto-style3">&nbsp;MENU&nbsp;&nbsp;&nbsp;&nbsp; </span>
            <span class="auto-style2">
            <br />
            </span>
            </strong>
            <br />
    
          <a href="../ManageProctoredExams/GettingStarted/default.aspx" target="iframe_a">1. GettingStarted    </a><br>
            <br />
            <a href="../FacultyExamVerification/StepOne.aspx" target="iframe_a">2. Set Families   </a><br>
                        <br />
            <a href="../FacultyExamVerification/Step2.aspx" target="iframe_a">3. Reset BBcourses.db </a><br>
                                    <br />
            <a href="../FacultyExamVerification/Step3.aspx" target="iframe_a">4. Copy Content to MasterProctor</a><br>
                                    <br />
            <a href="../ManageProctoredexams/ModifyfacultyPortal/StepD.aspx" target="iframe_a">5. Open Faculty Portal</a><br>
                                                <br />
            When Exam Verification Closes <br />
                                                <br />
            <a href="../ManageProctoredexams/ModifyfacultyPortal/StepD.aspx" target="iframe_a">6. Close Faculty Portal</a><br>
                                                            <br />
            <a href="../ManageProctoredexams/VerifyFacultyInput/StepE.aspx" target="iframe_a">7. Verify Faculty Input</a><br>
                                                                        <br />
            8.<a href="../ManageProctoredExams/ProctorTestingDB/CreateProctorTestingDB.aspx" target="iframe_a"><span class="auto-style5">CreateProctorTestingDB</span></a><br />
                                                                        <br />
            <a href="../ManageProctoredexams/Reports/StepF.aspx" target="iframe_a">8. Create Amy's Reports</a><br />
            <br />
<br />
            <a href="../ManageProctoredexams/SessionB/SessionB_setup.aspx" target="iframe_a"><b></b>Session B</b></a><br />
            <br />

        </div>
        <div style="margin-left: 10%; height: 1200px; background: white;"> 
    
            <iframe src="blank1.aspx" name="iframe_a"  title="Iframe Example" class="auto-style1"></iframe>
        </div>
    </div>



    </form>
</body>
</html>
