UploadBB_ParentChild.aspx  -- 

From GUI    Clear MasterProctor      &   Clear BB_ParentChild

then Upload File  = Lester's BB ParntChild Data  line=ENC1101-2197-4051,ENC1101-2197-4052

SUB InputData (btnUpload_Click)------------------------------------ two things happen on inputdata-click
A.  loop through data and   addData(astrValues(0), parentRef, astrValues(1), childRef, mycourse)

     SUB inputdata()---------------------------------------------------------
      Insert into BB_ParentChild (ParentCourse, parent, ChildCourse, child, course
B.  We input data into BB_ParentChild

Sub btnFamily_Click(sender As Object, e As EventArgs) Handles btnFamily.Click-----------------------------
Select Distinct Parent from BB_ParentChild
get distinct parents and then loop through running
       getMembers(parent)

Sub getMembers(ByVal myfamily As String)
Select child from BB_ParentChild where parent= '" & myfamily 
read the results and build family string
   myCourseList += dr2("Child") & ","
addMasterProctor(myfamilystring, myfamily)  (first step in building MasterProctor....adding familystring, family from Lester's list.)

Sub addMasterProctor(ByVal strTextField1 As String, ByVal strTextField2 As String)
Insert into MasterProctor (FamilyString,Parent)

*************************************************************************************************************

BREAK BREAK = now conform BBcourses to the data from Lester's list (Wendy may or may not have updated the copy data for parents/child)
             BBParentChild/resetBBCourse.aspx
       NOTE:  The above file adds all singletons to MasterProctor
Now we can move forward to add course data to MasterProctor for all courses since all couses in MasterProctor are parents
BREAK BREAK

****************************************************************************************************************


Sub btnCourseData_Click(sender As Object, e As EventArgs) Handles btnCourseData.Click-----------------------------------------------
This adds important course data from CMR for Parents in MasterProctor
   StrSql = " Update dbo.MasterProctor "
        set dbo.masterProctor.course=CMR.course,"
          "dbo.masterProctor.Instructor= CMR.InstructorFirst + ' ' + CMR.InstructorLast,"
          "dbo.MasterProctor.Outlook = CMR.username,"
          "dbo.MasterProctor.Session = CMR.session,"
          "dbo.MasterProctor.Canchange = CMR.CanChange "
           From dbo.CMR "
          "Where dbo.CMR.BBReference = dbo.MasterProctor.Parent"


Sub btnAddExamData_Click(sender As Object, e As EventArgs) Handles btnAddExamData.Click-------------------------------
        StrSql = " Update dbo.MasterProctor "
          
          " dbo.masterProctor.MidStart=ExamDates.Midstart,"
          " dbo.masterProctor.MidEnd=ExamDates.MidEnd,"
          " dbo.masterProctor.isFinal=ExamDates.IsFinal,"
          " dbo.masterProctor.FinalStart=ExamDates.Finalstart,"
          " dbo.masterProctor.FinalEnd=ExamDates.FinalEnd"
          " From dbo.ExamDates"
          " where dbo.ExamDates.Reference = replace(MasterProctor.parent,'2197-','') and dbo.examDates.term = '2197'"

NOTE: This should be changed. The dates should come from MasterExamDates by course/session  not from ExamDates which is data given to my by Amy
For 8w2 the dates must com from MasterExamDates because the data from Amy was only for 16 and 8w1

For 8w2  mid= 11/25 - 11/27   fin=12/17 - 12/19

Sub btnDetails_Click(sender As Object, e As EventArgs) Handles btnDetails.Click------------------------------------------------------------

For this to work, we need to copy an OL_MasterExam table from VC_VCdata1 to VC_VCdata for the term  IE make sure you only copy into VC_VCData.OL_MasterExam
        StrSql = " Update dbo.MasterProctor"
          " set dbo.MasterProctor.Course = dbo.OL_MasterExam.Course,"
          " dbo.MasterProctor.MidTime = dbo.OL_MasterExam.PM_DURATION,"
          " dbo.MasterProctor.MidPaper = dbo.OL_MasterExam.PM_LIST_MTRLS_OPT1,"
          " dbo.MasterProctor.MidCalculator = dbo.OL_MasterExam.PM_LIST_MTRLS_OPT2,"
          " dbo.MasterProctor.MidGraph = dbo.OL_MasterExam.PM_LIST_MTRLS_OPT3,"
          " dbo.MasterProctor.MidNotes  = dbo.OL_MasterExam.PM_LIST_ANXMTRLS,"
          " dbo.MasterProctor.MidNameL = dbo.OL_MasterExam.PM_LCL_NAME,"
          " dbo.MasterProctor.MidNameR = dbo.OL_MasterExam.PM_RMT_NAME,"
          " dbo.MasterProctor.FinalTime = dbo.OL_MasterExam.PF_DURATION,"
          " dbo.MasterProctor.FinalPaper = dbo.OL_MasterExam.PF_LIST_MTRLS_OPT1,"
          " dbo.MasterProctor.FinalCalculator = dbo.OL_MasterExam.PF_LIST_MTRLS_OPT2,"
          " dbo.MasterProctor.FinalGraph = dbo.OL_MasterExam.PF_LIST_MTRLS_OPT3,"
          " dbo.MasterProctor.FinalNotes = dbo.OL_MasterExam.PF_LIST_ANXMTRLS,"
          " dbo.MasterProctor.FinalNameL  = dbo.OL_MasterExam.PF_LCL_NAME,"
          " dbo.MasterProctor.FinalNameR = dbo.OL_MasterExam.PF_RMT_NAME"
          " From dbo.OL_MasterExam"
          " where dbo.OL_MasterExam.Course = dbo.MasterProctor.course"
NOTE: Seems to my the above had problems due to nulls.  Therefore I ran this sql on the db  Try the form, but if that fails, use this:
******************************************
use VC_VCData
Update dbo.MasterProctor

set MasterProctor.Course = OL_MasterExam.Course,
MasterProctor.MidTime = OL_MasterExam.PM_DURATION,
MasterProctor.MidPaper = OL_MasterExam.PM_LIST_MTRLS_OPT1,
MasterProctor.MidCalculator = OL_MasterExam.PM_LIST_MTRLS_OPT2,
MasterProctor.MidGraph = OL_MasterExam.PM_LIST_MTRLS_OPT3,
MasterProctor.MidNotes  = OL_MasterExam.PM_LIST_ANXMTRLS,
MasterProctor.MidNameL = OL_MasterExam.PM_LCL_NAME,
MasterProctor.MidNameR = OL_MasterExam.PM_RMT_NAME,
MasterProctor.FinalTime = OL_MasterExam.PF_DURATION,
MasterProctor.FinalPaper = OL_MasterExam.PF_LIST_MTRLS_OPT1,
MasterProctor.FinalCalculator = OL_MasterExam.PF_LIST_MTRLS_OPT2,
MasterProctor.FinalGraph = OL_MasterExam.PF_LIST_MTRLS_OPT3,
MasterProctor.FinalNotes = OL_MasterExam.PF_LIST_ANXMTRLS,
MasterProctor.FinalNameL  = OL_MasterExam.PF_LCL_NAME,
MasterProctor.FinalFolderR = OL_MasterExam.PF_RMT_NAME
From dbo.OL_MasterExam
where dbo.OL_MasterExam.Course = MasterProctor.course
********************************************************


The masterproctor table is now open for faculty to validate the settings for their exam.

Once faculty have verified their setting for the exam, we now need to audit any changes that they have made.  Any records that have had changes will be marked UsesDefault=False

Amy/Jerry validate here: ??????????????????????????????

After vallidation, there are a few manual SQL queries that must be run (Modify the masterproctor table to make these changes unnecessary)!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!   !!         !!

We can now generate the BB Course Copy Team setup information because we need to see familystrings for merged sections.

But the Data for ProctorU and Testing centers must come from the MasterProctorTesting table which is created in the BBParentChild/InputProctorTesting DB.aspx file.