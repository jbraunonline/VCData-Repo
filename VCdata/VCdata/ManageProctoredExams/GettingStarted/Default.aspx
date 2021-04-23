<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Default.aspx.vb" Inherits="VCdata._Default4" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            font-size: large;
        }
        .auto-style2 {
            text-decoration: underline;
        }
        .auto-style3 {
            background-color: #FFFF66;
        }
        .auto-style4 {
            color: #FF0000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <br />
            Understanding the process of getting data ready for faculty to verify exam settings. In preparation to open the faculty portal for soliciting faculty input for proctored exams there are several steps that must be taken before proceeding with the stepOne.aspx, Step2.aspx and Step3.aspx.<br />
            <strong>OVERVIEW: </strong>Before you begin to generate date for the faculty portal exam verification you will need to<br />
            1. Update the CMR<br />
            2. Upload the correct Exam Dates<br />
&nbsp;&nbsp;&nbsp; Add Passwords<br />
            3. Import the exam data from the designer database<br />
            4. Format the parent/child csv file to get ready for StepA<br />
            Now the data is ready for the faculty portal and before opening it ot to the faculty you must<br />
            <br />
            NOTE Steps 2 &amp; 3 need to be done only once at the start of the term.<br />
            Step 1 &amp; 4 must be repeated at the start of Session B because there are MANY Changes and Additiions to the schedule Made diring the first weeks of a term.<br />
&nbsp;&nbsp;&nbsp;&nbsp; Special precautions must be taken when updating parent/child relationships for session B<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; The simplest solution would be to back up MasterProctor and then delete all content leaving only sessionB courses in MasterProctor.<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MasterProctortexting.db can be untouched as it is additive and clearly distinguishes the sessions and exams.<br />
            <br />
            <strong><span class="auto-style1">FIRST</span>&nbsp; [[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]</strong><br />
            Update the CMR ~.CMR/UploadCMR.aspx<br />
            You will need to download the latest CMR FROM Donna and run it through Liber&#39;s Excel template (see ~CMR/HOW_to_4_CMR.txt<br />
            A copy of the excel template can be found here: ~Excel (Template.xlsm you need to have the Macro.txt file in the same directory to run it on your desktop)&nbsp; <a href="../../Excel/Template.xlsm">Template.xlsm</a><br />
            <strong><span class="auto-style1">SECOND</span> </strong>[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[<br />
            Upload the exam dates to the dbo.MasterExamDates table<br />
            Note:&nbsp; point of confusion. We upload dates for master exams twice in two different places.<br />
&nbsp;&nbsp;&nbsp; We upload the dates to the designer database and upload the data again for the proctored exams,<br />
&nbsp;&nbsp;&nbsp;&nbsp; The designer db (Vc_vcdata1) includes isMid, isFinal, midstarat mid end finalstart, finalend&nbsp; These dates are set well before the start of the term, but because the dates for sessiona and sessionB may float, we<br />
&nbsp;&nbsp;&nbsp; add exam date&nbsp; data for our proctored exams only prior to gathering the paroctored exam data and include 12 dates, midstart, midend, finalstart, finalend for ALL THREE sessions.
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; The data for SessionA andSessionB doe NOT go into the designer database only into the MasterProctorDates table used for proctored exam data.<br />
            The next two links open as new windows. Close when complete to get back to this page.<br />
            ....&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; upload to vc_vcdata.masterexamdates from Ernest dates spreadsheet AddExamDates.aspx&nbsp;&nbsp; <a href="AddExamDates.aspx" target="_blank">AddExamDates.aspx</a><br />
            ....Update the passwords in the table after getting password keys from Amy: AddExamPasswords.aspx&nbsp;&nbsp; <a href="AddExamPasswords.aspx" target="_blank">AddMasterExamPasswords.aspx</a><br />
            <strong><span class="auto-style1">THIRD</span></strong> ]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]<br />
            Import the exam data from the designer database vc_vcdata1 into the general database vc_vcdata&#39;<br />
            <br />
            <asp:TextBox ID="txtTerm" runat="server">2215</asp:TextBox>
&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnImport" runat="server" BorderColor="Red" Text="Import Exam Data from Designer.db" />
            <br />
            <strong>FIX FIX FIX: </strong>This works, but for testing I created OL_MasterExam_BU (same structure as vc_vcData1.Ol_Masterexam without a primary key ...allows iusr to copy data No admin necessary.<br />
            Before runnint this for the 2215 data, delete the existing OL_MasterExam and recreate it using the script from HomeDesign/SQLschema/OL_MasterExam&nbsp;&nbsp; delete the _BU when creating the new table.<br />
            <br />
            \\\\\\\\\\\\\\\\\\\\\\\\\\\\\ there is a significant problem with that data beause it may contain severl null values that will cause errors if not corrected. (bad input from Designers)<br />
            This should be fixed in the Designer database by adding default values....someday I&#39;ll get aound to that
            <br />
            but before moving on, correct for some nulls that may have come over from the designers by running the lollowing commands (can be ganged into one command)<br />
            <br />
            Run fix against OL_MasterProctor after creating the table&nbsp;&nbsp; <a href="../Support/Fix_OL_MasterExam.txt">Fix_OL_MasterExam.txt</a><br />
            <asp:Button ID="btnRunFix" runat="server" BorderColor="#CC0000" Text="RunOL_MasterExam Fix" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            DITTO on the NOTE with the above buttons&nbsp; 
            this is now running against the_BU table not the corect one<br />
            <br />
            <br />
            <strong><span class="auto-style1">FOURTH</span></strong> ]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]
            <br />
            iin preparation for faculty access to the data, we must prepare the current parent child data<br />
            Ask Lester to get a list of parent/child courses rom the BlackBoard Database. (this is the only valid source of parent child data)<br />
            A raw file from Lester can be found in the ~FacultyExamVerification/Data/2213-merged-online-courses.xlsx<br />
            This file needs to be generated twice in the term. Once at the end of the first week of class to get data for the 16 and SessionA courses, and again at the strt of Session B to get the updated data for that session.<br />
            NOTE: this file has two problems that must be corrected. One is that it contains parent/child for all courses in the term (all sessions) and we need to parse it for the current sessions being processed (i.e. only 1 &amp; a or only B sessions)<br />
            And <span class="auto-style2">there may be duplicate records</span> cuased by having multiple insructors or because of instructor changes (old instructors may not have been deleted from the BB db.<br />
            So to get the data ready for the first group (Session 16 and Session A) we need to (in the XLS file)<br />
            A delete all courses in session B (go by start dates for 1 &amp; A&nbsp; or delete 1&amp;A if processing session b)<br />
            B Delete all duplicate child courses in the child column. Don&#39;t worry about the instructor name as the correct instructor will be added in the Step3.aspx page.<br />
            <br />
            what we get looks like this<br />
            parent_course child_course ``````` start_date end_date instructor_mdid instructor_first_name instructor_last_name<br />
            ENC1101-2213-2958 `ENC1101-2213-9926 6-Jan-21 30-Apr-21 1000010191 ``Patrick Anderson<br />
            CGS1060C-2213-2235 CGS1060C-2213-9872 6-Jan-21 30-Apr-21 1000069257 William Andrews<br />
            BSC1005-2213-1527 BSC1005-2213-6889 6-Jan-21 30-Apr-21 1000027393 Catalina Aristizabal<br />
            PHI2010-2213-6257 PHI2010-2213-10043 <span class="auto-style4">8-Mar-21 30-Apr-21 </span>1000057966 Darrell Arnold &lt;<span class="auto-style3">-thie record will be deleted--Processing 1&amp;A and this is a session B entry</span><br />
            MAC2311-2213-10114 MAC2311-2213-10115 6-Jan-21 30-Apr-21 1000020700 Luis Beltran,Jr<br />
            <br />
            So we first DELEte all coursee starting in session B (and if we&#39;re dealing with session B we delete all course starting in 16 and sessionA) to get<br />
            parent_course child_course ``````` start_date end_date instructor_mdid instructor_first_name instructor_last_name<br />
            ENC1101-2213-2958 ` ENC1101-2213-9926 6-Jan-21 30-Apr-21 1000010191 ``Patrick Anderson<br />
            CGS1060C-2213-2235 CGS1060C-2213-9872 6-Jan-21 30-Apr-21 1000069257 William Andrews<br />
            BSC1005-2213-1527 BSC1005-2213-6889 6-Jan-21 30-Apr-21 1000027393 Catalina Aristizabal<br />
            MAC2311-2213-10114 MAC2311-2213-10115 6-Jan-21 30-Apr-21 1000020700 Luis Beltran,Jr<br />
            <br />
            Then we delete everything except for the parent and child coursesl<br />
            parent_course child_course ```````
            <br />
            ENC1101-2213-2958 ` ENC1101-2213-9926
            <br />
            CGS1060C-2213-2235 CGS1060C-2213-9872
            <br />
            BSC1005-2213-1527 BSC1005-2213-6889
            <br />
            MAC2311-2213-10114 MAC2311-2213-10115
            <br />
            <br />
            then we use the excel find duplicates function and delete any duplicate child courses (non are in this example, but in the end we want a list as above with NO DUPLICAte child courses)<br />
            <br />
            Delete the headers and save as a CSV, <span class="auto-style2">This will become our data source for StepA</span><br />
            You will upload this file in StepA. and it will be saved as a .txt file.(ParentChild.txt)<br />
            if you manually upload it to Visual Studio rename your file as a txt file....the StepOne.aspx page is looking for a file in the directory called ParentChild.txt<br />
            Preview a correct data file in the data directory ~FacultyExamVerification/Data/ParentChild.txt
            <br />
            <br />
            Now you can ove on To StepA<br />
        </div>
    </form>
</body>
</html>
