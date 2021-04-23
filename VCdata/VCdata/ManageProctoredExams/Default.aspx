<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Default.aspx.vb" Inherits="VCdata._Default3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">

 p.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	}
a:link
	{color:#0563C1;
	text-decoration:underline;
	text-underline:single;
        }
span.auto-style11
	{text-decoration:underline;
	text-underline:single;
        }
    </style>


<script "javascript">
var popupWindow = null;
function centeredPopup(url,winName,w,h,scroll){
LeftPosition = (screen.width) ? (screen.width-w)/2 : 0;
TopPosition = (screen.height) ? (screen.height-h)/2 : 0;
settings =
'height='+h+',width='+w+',top='+TopPosition+',left='+LeftPosition+',scrollbars='+scroll+',resizable'
popupWindow = window.open(url,winName,settings)
}
</script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <p class="MsoNormal">
                <b><span style="font-size:24.0pt;mso-fareast-font-family:
&quot;Times New Roman&quot;">Manage Proctored Exams</span></b><span style="mso-fareast-font-family:
&quot;Times New Roman&quot;"><br />
                This is a long, detailed, multi-step process. We are gathering data from multiple (not validated) sources, opening the data for faculty verification, changes and opting in/out of offering exams, verifying faculty input, and then preparing reports for our setup team and for ProctorU.
                <br />
                &nbsp;<b>Data Sources: </b>CMR.db, Lester parent/child.csv, BBcourses.db, ErnersExamDates.csv, Amy’s Passwords.txt, OL_MasterExam.Designer db (to get master exam settings)<br />
                We are creating two tables for the final reports: the MasterProtor.db (for setup - based on families) and the MasterProctorTestingdb (for Testing Centers and ProctorU listed by individual course, not family)<br />
                We must go through this process twice; Once at the start of term for 16wk and 8w1 courses, and again for session B (8w2 or summer 6w2)<br />
                There are approximately 70 individual steps (defined as data transfers, data manipulations, or data reports) needed to go from raw data to final output reports. This does not include the manual verification of all data that has been modified by individual faculty (E,g, for the 2213 term. for sessions 16wk and 8w1, there are 84 exams with faculty changes that need to be verified),<br />
                <br />
                &nbsp;We begin by gathering the data and creating the tables we will need for the final report;</span></p>
            <p class="MsoNormal">
                &nbsp;</p>
            <p class="MsoNormal">
                <span style="mso-fareast-font-family:
&quot;Times New Roman&quot;"><strong>GettingStated </strong>&nbsp;Preliminary Concerns&nbsp;and Actions&nbsp; <a href="GettingStarted/Default.aspx" target="_blank">Getting Started</a></span></p>
            <p class="MsoNormal">
 
                <a href='GettingStarted/Default.aspx' onclick="centeredPopup(this.href,'myWindow','1500','950','yes');return false">StartMe</a>
                
                <span style="mso-fareast-font-family:
&quot;Times New Roman&quot;"><br />
                <br />
                <b>Set Up Parent/Child </b>Gathering the data and preparing for Faculty Verification of Exams<br />
                T</span>his s<span style="mso-fareast-font-family:&quot;Times New Roman&quot;">tep creates the MasterProctor table orgnaized by families and parents (Course and Instructor Data added later)</span></p>
            <p class="MsoNormal">
                <a href="Families/StepA.aspx">StepA.aspx</a></p>
            <p class="MsoNormal">
                &nbsp;</p>
            <p class="MsoNormal">
                <strong>Reset the BBCourses table</strong> and import single courses to MasterProctor</p>
            <p class="MsoNormal">
                <a href="ResetBBcourses/StepB.aspx">StepB.aspx</a></p>
            <p class="MsoNormal">
                &nbsp;</p>
            <p class="MsoNormal">
                <strong>Add Data to MasterProctor</strong><span style="mso-fareast-font-family:&quot;Times New Roman&quot;">&nbsp; <a href="AddDate2MasterProctor/StepC.aspx">StepC.aspx</a></span></p>
            <p class="MsoNormal">
                this adds instructor, exam data to Master Proctor <span style="mso-fareast-font-family:&quot;Times New Roman&quot;">in preparation for faculty to verify exam data;</span></p>
            <p class="MsoNormal">
                At this point we can modify the faculty portal to allow Faculty Exam Verification</p>
            <p class="MsoNormal">
                &nbsp;</p>
            <p class="MsoNormal">
                <strong>Update faculty Portal</strong>&nbsp; <a href="ModifyFacultyPortal/StepD.aspx">StepD.aspx</a></p>
            <p class="MsoNormal">
                these files are located in the Telerik Project <span style="mso-fareast-font-family:&quot;Times New Roman&quot;">in Visual studio.</span></p>
            <p class="MsoNormal">
                <span style="mso-fareast-font-family:&quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp; A. Put a notification in the faculty portal notifying that the forms are available:&nbsp; file<a href="../PortalINI/FacultyPortal_INI.aspx"><span style="color:#0563C1">FacultyPortal_INI.aspx</span></a>&nbsp; (no dll reload necessary)<br />
&nbsp;&nbsp;&nbsp; B&nbsp; Update the exam verification form to make sure it is looking for the correct term and session.&nbsp; (requires telerik2 dll&nbsp; reload)<br />
&nbsp;&nbsp;&nbsp; C. Modify the faculty portal index.aspx page to display the link to the exam verification forms. (can be done by remotely editing the portal/index aspx page, no dll reload needed)</span></p>
            <p class="MsoNormal">
                &nbsp;</p>
            <p class="MsoNormal">
                <strong>After Verification window is closed</strong></p>
            <p class="MsoNormal">
                <span style="mso-fareast-font-family:&quot;Times New Roman&quot;">Go back to the Faculty Portal (above) and update the faculty notification (ini file) and set the exam verification tab visibility to Falis</span></p>
            <p class="MsoNormal">
                <a href="Reports/StepF.aspx">StepF.aspx</a></p>
            <p class="MsoNormal">
                <span style="mso-fareast-font-family:&quot;Times New Roman&quot;">This form links to files that create XLSX files that must be saved (locally) and then sent to Amy<br />
                <br />
                There are thee sessions (16wk, 8w1, 8w2) or for summer (12wk. 6w1, 6w2)<br />
                Amy needs a ProcorU and an exam team report for each session and each exam, (12 reports per term)<br />
                <br />
                16wk Mid ProctorU<br />
                16wk Mid SetupReport<br />
                16wk Final ProctorU<br />
                16wi Final SetupReport;<br />
                <br />
                8w1 Mid ProctorU<br />
                8w1 Mid SetupReport<br />
                8w1 Final ProctorU<br />
                8w1Final SetupReport;<br />
                <br />
                8w2 Mid ProctorU<br />
                8w2 Mid SetupReport<br />
                8w2 Final ProctorU<br />
                8w2Final SetupReport;<o:p></o:p></span></p>
            <p class="MsoNormal">
                <span style="mso-fareast-font-family:&quot;Times New Roman&quot;">&nbsp;<o:p></o:p></span></p>
            <p class="MsoNormal">
                <b><span style="font-size:18.0pt;mso-fareast-font-family:
&quot;Times New Roman&quot;">I do two checks to verify the files before I send them to Amy</span></b><span style="mso-fareast-font-family:&quot;Times New Roman&quot;"><br />
                <b><u>the first is a simple record count o</u></b>f what I expect to get from the database making sure that the record count matches what I send to Amy<br />
                Example: for term 2213, session 8w1, exam Midterm I run<br />
                <br />
                SELECT * FROM [VC_VCData].[dbo].[MasterProctor] where term = &#39;2213&#39; AND session = &#39;8w1&#39; and ismidterm = 1 and optin = 1<br />
                this gives me 35 records. So the row count on the setup file should be 35 rows.<br />
                <br />
                Then I count (manually, unfortunately) the number of&nbsp; records where the familystring has multiple courses:<br />
                In the above query, there are no family strings with multiple courses, so the number of records for ProctorU should be the same as for the setup team.<br />
                <br />
                For the 16 week term,<br />
                SELECT * FROM [VC_VCData].[dbo].[MasterProctor] where term = &#39;2213&#39; AND session = &#39;1&#39; and ismidterm = 1 and optin = 1<br />
                this gives me 332 records. So the row count on the setup file should be 35 rows.&nbsp;&nbsp; == 332 records (which should be the line count on the setup file for this term,session and exam..<br />
                <br />
                But I notice for the 16wk session, that there are many famlies with multiple records (70 have 2 courses, and 22 have three courses).<br />
                So the line count on the ProctorU file(which converts families into individual courses) should be&nbsp; 332&nbsp; + 70 + 22 = 424 individual courses which should be the line total for ProctorUl<br />
                <br />
                <b>If the counts match, we&#39;re good to go with one more check.&nbsp; </b>
                <br />
                Because the passwords are generated differently for the two processes, <u>I check the password of the first and last record on each form&nbsp; ( i.e setup team and proctorU reports)</u><br />
                to make sure that the passwords are synched&nbsp; I also&nbsp; randomly check one or two in the middle of the files.<br />
                <b>WARNING: </b>O<u>ne screw up and you may waste an entire day deleting data and starting over again.</u></span><span style="mso-ascii-font-family:Calibri;
mso-ascii-theme-font:minor-latin;mso-hansi-font-family:Calibri;mso-hansi-theme-font:
minor-latin;mso-bidi-font-family:&quot;Times New Roman&quot;;mso-bidi-theme-font:minor-bidi"><o:p></o:p></span></p>
            <br />
        </div>
    </form>
</body>
</html>
