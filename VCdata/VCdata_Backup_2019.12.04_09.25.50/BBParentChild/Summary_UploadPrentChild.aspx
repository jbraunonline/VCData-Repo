UpdateParentChild.aspx  --  appears to be developmental pate for UploadBB_ParentChild.aspx

appears that all that runs on this page is Button1 and getmembers   nothing gets written anywhere

Button1_click.........................................
Select Distinct Family from BBcourses where term_key= '2197' 
while read
   getmembers(family)

SUB Getmembers(family)............................................
Select Reference, ischild from BBcourses where family= '" & myfamily &
while read build course list for family
   courselist = reference += all other references in family

FUNC GetCourse(by family)  returns course,Username
Select Course, UserName from BBcourses where Reference= '" & myfamily

FUNC GetExams (by family)  returns isMid, Middates,IsFinal, FinalDates
select IsMidterm,MidStart,MidEnd,IsFinal,FinalStart,FinalEnd,term from examdates  where Reference= '" & myfamily & "' and Term = '2197'"

FUNC GetExamData(byCourse)  returns exam data from VCDATA1  (designer db)
select  PM_LCL_NAME,PM_RMT_NAME,PF_LCL_NAME,PF_RMT_NAME  FROM [VC_VCData1].[dbo].[OL_MasterExam] where term = '2197' and Course = '" & mycourse