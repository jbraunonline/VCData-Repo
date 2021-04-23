<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Default.aspx.vb" Inherits="VCdata._Default2" %>

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
            Preparing Data for Faculty Exam Verification<br />
            In preparation to open the faculty portal for soliciting faculty input for proctored exams there are several steps that must be taken before proceeding with the 
stepOne.aspx, Step2.aspx and Step3.aspx.<br>

            <br />
            <br>

FIRST&nbsp; [[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]<br>
Update the CMR ~.CMR/UploadCMR.aspx<br>
You will need to download the latest CMR FROM Donna and run it through Liber's Excel template (see ~CMR/HOW_to_4_CMR.txt<br>
A copy of the excel template can be found here:  ~Excel  (Template.xlsm  you may need to have the Macro.txt file in the same directory to run it on your desktop)<br />
            <br />
            SECOND [[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[<br>

Upload the exam dates to the dbo.MasterExamDates table<br>
....upload to masterexamdates from Ernest dates spreadsheet  ~/MasterExamDates/AddMasterExamDates.aspx<br>
....Update the passwords in the table after getting password keys from Amy: ~/BBParentChild/AddMasterExamPasswords.aspx<br />
            <br />
            NOTE: If there are new courses and pilot courses, we may not be getting all the data we need. Before we funally use this data we need to verify dates and passords before generating reports;<br />
            We may <span class="auto-style1">MOVE this step</span> until after the MasteerProcotr table is generated;<br />
            <br />
            THIRD [[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[<br />
           Import the exam data from the designer database vc_vcdata1 into the general database vc_vcdata'<br>
Select * into [VC_VCData].[dbo].[OL_MasterExam] from<br>
[VC_VCData1].[dbo].[OL_MasterExam]<br>Where [VC_VCData1].[dbo].[OL_MasterExam].[Term]= '2213'       
            <br />
            Note that we are using the term in the designer's term for the exam term being offered to the faculty for their changes/input<br>
<br>
\\\\\\\\\\\\\\\\\\\\\\\\\\\\\  there is a significant problem with that data beause it may contain severl null values that will cause errors if not corrected.<br>
This should be fixed in the Designer database by adding default values....someday I'll get aound to that <br>
but before moving on, correct for some nulls that may have come over from the designers by running the lollowing commands (can be ganged into one command)<br>

<br>
Run these against OL_MasterProctor after creating the table&nbsp; <a href="Fix_OL_MasterExam.txt">Fix_OL_MasterExam.txt</a><br />
            <br />

            FOURTH  ]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]] <br>

iin preparation for faculty access to the data, we must prepare the current parent child data<br>
Ask Lester to get a list of parent/child courses rom the BlackBoard Database. (this is the only valid source of parent child data)<br>
A raw file from Lester can be found in the ~FacultyExamVerification/Data/2213-merged-online-courses.xlsx<br>
This file needs to be generated twice in the term. Once at the end of the first week of class to get data for the  16 and SessionA courses, and again at the strt of Session B to get the updated data for that session.<br>
NOTE: this file has two problems that must be corrected. One is that it contains parent/child for all courses in the term (all sessions) and we need to parse it for the current sessions being uploaded<br>
And there may be duplicate records cuased by having multiple insructors or because of instructor changes (old instructors may not have been deleted from the BB db.<br>
So to get the data ready for the first group (Session 16 and Session A) we need to (in the XLS file)<br>
  A delete all courses in session B (go by start dates)<br>
  B Delete all duplicate child courses in the child column.  Don't worry about the instructor name as the correct instructor will be added in the Step3.aspx page.<br>
  <br>
  what we get looks like this<br>
  parent_course	     	  child_course	```````        start_date	end_date	instructor_mdid	instructor_first_name	instructor_last_name<br>
ENC1101-2213-2958	`ENC1101-2213-9926		    6-Jan-21	30-Apr-21	1000010191	``Patrick	Anderson<br>
CGS1060C-2213-2235	CGS1060C-2213-9872	6-Jan-21	30-Apr-21	1000069257	William	Andrews<br>
BSC1005-2213-1527	BSC1005-2213-6889			6-Jan-21	30-Apr-21	1000027393	Catalina	Aristizabal<br>
PHI2010-2213-6257	PHI2010-2213-10043			8-Mar-21	30-Apr-21	1000057966	Darrell	Arnold        <strong><-thie record will be deleted</strong> session B<br>
MAC2311-2213-10114	MAC2311-2213-10115			6-Jan-21	30-Apr-21	1000020700	Luis	Beltran,Jr<br>
<br>
So we first  DELEte all coursee starting in session B   (and if we're dealing with session B we delete all course starting in 16 and sessionA) to get<br>
  parent_course	     	  child_course	```````        start_date	end_date	instructor_mdid	instructor_first_name	instructor_last_name<br>
ENC1101-2213-2958	`	ENC1101-2213-9926		    6-Jan-21	30-Apr-21	1000010191	``Patrick	Anderson<br>
CGS1060C-2213-2235	CGS1060C-2213-9872	6-Jan-21	30-Apr-21	1000069257	William	Andrews<br>
BSC1005-2213-1527		BSC1005-2213-6889			6-Jan-21	30-Apr-21	1000027393	Catalina	Aristizabal<br>
MAC2311-2213-10114		MAC2311-2213-10115			6-Jan-21	30-Apr-21	1000020700	Luis	Beltran,Jr<br>
<br>
Then we delete everything except for the parent and child coursesl<br>
  parent_course	     	  child_course	```````       <br>
ENC1101-2213-2958	`	ENC1101-2213-9926		<br>
CGS1060C-2213-2235	CGS1060C-2213-9872	<br>
BSC1005-2213-1527		BSC1005-2213-6889		<br>
MAC2311-2213-10114		MAC2311-2213-10115		<br>
<br>
then we use the excel find duplicates function and delete any duplicate child courses (non are in this example, but in the end we want a list as above with NO DUPLICAte child courses)<br>
<br>
Delete the headers and save as a CSV, This will become our data source for StepOne.aspx<br>
            We&#39;re going to&nbsp; upload this file in Step1.aspx and it will be saved as a .txt file.(ParentChild.txt)<br>
   if you manually upload it to Visual Studio rename your file as a txt file....the StepOne.aspx page is looking for a file in the directory called ParentChild.txt<br>
Preview a correct data file in the data directory  ~FacultyExamVerification/Data/ParentChild.txt <br>
<br>
FIFTH ]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]<br />
            Now go on to<br />
            <a href="StepOne.aspx">StepOne.aspx</a><br />
            <br />
            <a href="Step2.aspx">Step2.aspx</a><br />
            <br />
            <a href="Step3.aspx">Step3.aspx</a><br />
            <br>
After completing Steps one through 3 .aspx and the data is ready for faculty, then we need to go to the faculty portal (Teleric2 in Visual Studio) to get the portal open for the faculty<br>
I'm not going to cover this here, but right now Jerry is the only one with access and knowledge to do that.<br>
This can be rewritten to allow anyone to manage the portal, but because of all the COVID changes, remote control of the faculty portal has been disabled and manual changes are necssary<br>
To restore remote management from the PortalIni.aspx file, the pages in the faculty portal must re-allow dynamic changes in the facuty portal.<br>
            <br> <br>




        </div>
    </form>
</body>
</html>
