Imports System.IO
Imports System.Data.SqlClient
Imports System.Data.Sql

Public Class InputProctorTestingDB
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Response.Write("This is setup for using MasterProctor_BU and MasterProctorTesting_BU<br>")
    End Sub

    Protected Sub btnCopy_Click(sender As Object, e As EventArgs) Handles btnCopy.Click
        Dim mysession As String = DropDownList1.SelectedValue
        Dim myExam As String = radioExam.SelectedValue
        Dim strsql As String = ""
        '''Switch between _BU

        strsql = "Select ID, FamilyString, Course, instructor,MidStart,MidEnd,MidNameL, MidNameR, MidTime,LockdownMid,PM_ANXMTR,MidProctorX,FinalStart,FinalEnd,FinalNameL, FinalNameR,FinalTime, LockDownFinal,PF_ANXMTR,FinalProctorX from MasterProctor where Session='" & mysession & "' and " & myExam & "=1"


        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand(strsql, myConnection)
        Response.Write(strsql)
        'Response.End()
        Dim count As Integer = 0
        ' Open the connection and execute the Command
        myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        If dr.HasRows Then
            While dr.Read()
                count = count + 1
                Dim myMasterProctorID As Integer = dr("ID")
                Dim myfamily As String = dr("Familystring")
                Dim mycourse As String = dr("Course")
                Dim myinstructor As String = dr("Instructor")
                Dim myMidStart As Date = dr("MidStart")
                Dim myMidEnd As Date = dr("MidEnd")
                Dim myMidNameL As String = dr("MidNameL")
                Dim myMidNameR As String = dr("MidNameR")
                Dim mymidTime As Integer = dr("MidTime")
                Dim mymidLockdown As Boolean = dr("LockdownMid")
                Dim mymidProctorX As Boolean = dr("MidProctorX")

                '''Add for Finals

                Dim myFInalStart As Date = dr("FinalStart")
                Dim myFinalEnd As Date = dr("FinalEnd")
                Dim myFInalNameL As String = dr("FinalNameL")
                Dim myFinalNameR As String = dr("FinalNameR")
                Dim myFinalTime As Integer = dr("FinalTime")
                Dim myFinalLockdown As Boolean = dr("LockdownFinal")
                Dim myFinalProctorX As Boolean = dr("FInalProctorX")





                '''This splits the familystring into an array so we can save a record for each member of the familly
                Dim astrValues As String() = myfamily.Split(CChar(","))

                For i = LBound(astrValues) To UBound(astrValues)
                    Dim myReference As String = astrValues(i)
                    'Response.Write(dr("FamilyString") & "  " & dr("Course") & "-" & astrValues(i) & "  " & dr("Instructor") & "  " & CStr(dr("MidStart")) & "  " & CStr(dr("MidEnd")) & "  " & CStr(dr("MidTime")) & "  " & CStr(dr("LockdownMid")) & "  " & getProctor(dr("ID")) & "<br>")
                    ' Response.Write(myfamily & "  " & mycourse & "  " & astrValues(i) & "  " & myinstructor & "  " & CStr(myMidStart) & "  " & CStr(myMidEnd) & "  " & CStr(mymidTime) & "  " & CStr(myLockdown) & "  " & "<br>")

                    If radioExam.SelectedValue = "isMidTerm" Then
                        Response.Write("SavingMID<br>")
                        SaveData(myMasterProctorID, myfamily, myReference, mycourse, myinstructor, myMidStart, myMidEnd, myMidNameL, myMidNameR, mymidTime, mymidLockdown, mymidProctorX)
                    Else
                        Response.Write("SavingFINAL<br>")
                        SaveData(myMasterProctorID, myfamily, myReference, mycourse, myinstructor, myFInalStart, myFinalEnd, myFInalNameL, myFinalNameR, myFinalTime, myFinalLockdown, myFinalProctorX)
                    End If
                Next i




                'sponse.Write(dr("Familystring"))
                ' Response.Write("<br>")
            End While


        End If
        Response.Write("<br>count=" & count)
    End Sub

    Function getProctorMid(ByVal myID As Integer) As String
        Dim myreturn As String = ""
        Dim mycount As Integer = 0
        Dim mypaper As String = ""
        Dim mycalc As String = ""
        Dim myGraph As String = ""
        Dim myHeadphones As String = ""
        'Switch between _BIU [[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[
        Dim strsql As String = "select MidPaper,MidCalculator,MidGraph,Headphones,PM_ANXMTR From MasterProctor where ID =" & myID
        '''Dim strsql As String = "select MidPaper,MidCalculator,MidGraph,Headphones,PM_ANXMTR From MasterProctor_BU where ID =" & myID
        Response.Write("<br>" & strsql & "***************************************<br>")
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)


        Dim myCommand As New SqlCommand(strsql, myConnection)

        ' Open the connection and execute the Command
        myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        If dr.HasRows Then
            While dr.Read()




                If dr("MidPaper") = True Then
                    mypaper = " SCRAP PAPER & PENCIL allowed - scrap paper must be disposed of when test is concluded."
                End If

                If dr("MidCalculator") = True And dr("MidGraph") = True Then

                    mycalc = " ANY TYPE CALCULAOR allowed (EXCEPT cell/mobile phone calculators). "

                Else

                    If dr("MidCalculator") = True Then
                        mycalc = " CALCULATOR allowed, including scientific or financial calculator (NO GRAPHING or CELL/MOBILE PHONE calculators). "

                    End If

                    If dr("MidGraph") = True Then
                        mycalc = " Any type calculator allowed (EXCEPT cell/mobile phone calculators). "
                    End If

                End If


                If dr("Headphones") = True Then
                    myHeadphones = " The computer on which the exam is taken must have a media player installed and the student will need to use headphones."
                End If

                Dim myBlob As String = ""
                If InStr(dr("PM_ANXMTR"), "PDF") > 0 Then
                    myBlob = " Students need access, open and read PDF files "
                End If
                If InStr(dr("PM_ANXMTR"), "Excel") > 0 Then
                    myBlob += " Students need access to Microsoft Excel with Data Analysis add-in and Adobe Reader. Students will prepare spreadsheet during test. "
                End If
                If InStr(dr("PM_ANXMTR"), "Protractor") > 0 Then
                    myBlob += " Protractor and ruler allowed. "
                End If

                myreturn = mypaper & mycalc & myHeadphones & myBlob

                'sponse.Write(dr("Familystring"))
                Response.Write("<br>-<font color=red>-----------------  " & myreturn & "</font><br>")
            End While
        End If
        dr.Close()
        dr = Nothing
        myConnection.Close()


        Return myreturn
    End Function

    Function getProctorFinal(ByVal myID As Integer) As String
        Dim myreturn As String = ""
        'Switcch between _BU [[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[
        Dim strsql As String = "select FInalPaper,FinalCalculator,FinalGraph,FinalHeadphones,PF_ANXMTR From MasterProctor where ID =" & myID
        '''Dim strsql As String = "select FInalPaper,FinalCalculator,FinalGraph,FinalHeadphones,PF_ANXMTR From MasterProctor_BU where ID =" & myID
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)

        'Response.Write(strsql & "<br>")
        Dim myCommand As New SqlCommand(strsql, myConnection)

        ' Open the connection and execute the Command
        myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        If dr.HasRows Then
            While dr.Read()
                Dim mypaper As String = ""
                Dim mycalc As String = ""
                Dim myGraph As String = ""
                Dim myHeadphones As String = ""

                If dr("FInalPaper") = True Then
                    mypaper = " SCRAP PAPER & PENCIL allowed - scrap paper must be disposed of when test is concluded."
                End If

                If dr("FinalCalculator") = True And dr("FinalGraph") = True Then

                    mycalc = " ANY TYPE CALCULAOR allowed (EXCEPT cell/mobile phone calculators). "

                Else

                    If dr("FinalCalculator") = True Then
                        mycalc = " CALCULATOR allowed, including scientific or financial calculator (NO GRAPHING or CELL/MOBILE PHONE calculators). "

                    End If

                    If dr("FinalGraph") = True Then
                        mycalc = " Any type calculator allowed (EXCEPT cell/mobile phone calculators). "
                    End If

                End If


                If dr("FinalHeadphones") = True Then
                    myHeadphones = " The computer on which the exam is taken must have a media player installed and the student will need to use headphones."
                End If

                Dim myBlob As String = ""
                If InStr(dr("PF_ANXMTR"), "PDF") > 0 Then
                    myBlob = " Students need access, open and read PDF files "
                End If
                If InStr(dr("PF_ANXMTR"), "Excel") > 0 Then
                    myBlob += " Students need access to Microsoft Excel with Data Analysis add-in and Adobe Reader. Students will prepare spreadsheet during test. "
                End If
                If InStr(dr("PF_ANXMTR"), "Protractor") > 0 Then
                    myBlob += " Protractor and ruler allowed. "
                End If
                myreturn = mypaper & mycalc & myGraph & myHeadphones & myBlob

                'sponse.Write(dr("Familystring"))
                ' Response.Write("<br>")
            End While
        End If
        dr.Close()
        dr = Nothing
        myConnection.Close()


        Return myreturn
    End Function

    Sub SaveData(ByVal myMasterProctorID As Integer, ByVal myfamily As String, ByVal myReference As String, ByVal mycourse As String, ByVal myinstructor As String, ByVal myStart As Date, ByVal myEnd As Date, ByVal myNameL As String, ByVal myNameR As String, ByVal myTime As Integer, ByVal myLockdown As Boolean, ByVal myproctorX As Boolean)
        Dim theLock As Integer = 0
        Dim theLock2 As Integer = 0
        Dim myexam As String = "Mid"
        If radioExam.SelectedValue = "isFinal" Then
            myexam = "Final"
        End If


        Dim strsql As String = ""
        'Switcch between _BU [[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[\  save to MasterProctorTesting_BU or MasterProctorTesting (for actual setup data_
        If RadioBackup.SelectedValue = "StudentDates" Then
            strsql = "Insert into MasterProctorTesting_BU (MasterProctor_ID,ExamType,Term,Session,Course,FamilyString,Reference,Instructor,ExamStart,ExamEnd,ExamTime,LExamName,RExamName,lockdown,ProctorX,Instructions) Values ("
        ElseIf RadioBackup.SelectedValue = "ExamSetup" Then
            strsql = "Insert into MasterProctorTesting (MasterProctor_ID,ExamType,Term,Session,Course,FamilyString,Reference,Instructor,ExamStart,ExamEnd,ExamTime,LExamName,RExamName,lockdown,ProctorX,Instructions) Values ("
        End If
        strsql += myMasterProctorID & ",'"

            strsql += myexam & "','"
        strsql += txtTerm.Text & "','"
        strsql += DropDownList1.SelectedValue & "','"
        strsql += mycourse & "','"
        strsql += myfamily & "','"
        strsql += myReference & "','"
        strsql += myinstructor & "','"
        strsql += myStart & "','"
        strsql += myEnd & "',"
        strsql += myTime & ",'"
        strsql += myNameL & "','"
        strsql += myNameR & "',"
        If myLockdown = True Then
            theLock = 1

        End If
        strsql += theLock & ","
        ''add proctorU data......................................................

        If myproctorX = True Then
            theLock2 = 1
        End If
        strsql += theLock2 & ",'"

        If radioExam.SelectedValue = "isMidTerm" Then
            Response.Write("<br>isMidTerm<br>")
            strsql += getProctorMid(myMasterProctorID) & "')"
        Else
            Response.Write("<br>isFinal<br>")
            strsql += getProctorFinal(myMasterProctorID) & "')"
        End If


        Response.Write(strsql & "<br>")

        Dim myConnection2 As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand(strsql, myConnection2) '

        ' Execute the command in a try/catch to catch duplicate username errors'
        Try

            ' Open the connection and execute the Command
            myConnection2.Open()
            ' mycounter = mycounter + 1

            If RadioButtonAction.SelectedValue = "Run" Then
                'HOLD SQL HOLD........................................................................
                myCommand.ExecuteNonQuery()
            End If
        Catch

            ' failed to create a new record
            Response.Write("<Font color = red>********************************************   FAIL   FAIL  *********************************************</font><br>")


        Finally

            'Close the Connection
            If myConnection2.State = ConnectionState.Open Then
                myConnection2.Close()
            End If

        End Try


    End Sub

    Protected Sub btnPasswords_Click(sender As Object, e As EventArgs) Handles btnPasswords.Click
        Dim strsql As String = ""
        If (DropDownList1.SelectedValue = "1") And radioExam.SelectedValue = "isMidTerm" Then
            strsql += "use VC_VCData <br>"

            strsql += "Update dbo.MasterProctorTesting_BU <br>"
            strsql += "set MasterProctorTesting_BU.LPassword = MasterExamDates.Mid1_LPass,  <br>"
            strsql += "MasterProctorTesting_BU.RPassword =MasterExamDates.Mid1_RPass  <br>"
            strsql += "From MasterExamDates  <br>"
            strsql += "where MasterExamDates.Course = MasterProctorTesting_BU.course and MasterProctorTesting_BU.Session = '1' and MasterProctorTesting_BU.ExamType='Mid' <br>"
        End If
        If (DropDownList1.SelectedValue = "1") And radioExam.SelectedValue = "isFinal" Then
            strsql += "use VC_VCData <br>"
            strsql += "Update dbo.MasterProctorTesting_BU <br>"
            strsql += "set MasterProctorTesting_BU.LPassword = MasterExamDates.FInal1_LPass,  <br>"
            strsql += "MasterProctorTesting_BU.RPassword =MasterExamDates.Final1_RPass  <br>"
            strsql += "From MasterExamDates  <br>"
            strsql += "where MasterExamDates.Course = MasterProctorTesting_BU.course and MasterProctorTesting_BU.Session = '1' and MasterProctorTesting_BU.ExamType='Final' <br>"
        End If
        If (DropDownList1.SelectedValue = "8W1") And radioExam.SelectedValue = "isMidTerm" Then
            strsql += "use VC_VCData <br>"
            strsql += "Update dbo.MasterProctorTesting_BU <br>"
            strsql += "set MasterProctorTesting_BU.LPassword = MasterExamDates.MidA_LPass,  <br>"
            strsql += "MasterProctorTesting_BU.RPassword =MasterExamDates.MidA_RPass  <br>"
            strsql += "From MasterExamDates  <br>"
            strsql += "where MasterExamDates.Course = MasterProctorTesting_BU.course and MasterProctorTesting_BU.Session = '8W1' and MasterProctorTesting_BU.ExamType='Mid' <br>"
        End If
        If (DropDownList1.SelectedValue = "8W1") And radioExam.SelectedValue = "isFinal" Then
            strsql += "use VC_VCData <br>"
            strsql += "Update dbo.MasterProctorTesting_BU <br>"
            strsql += "set MasterProctorTesting_BU.LPassword = MasterExamDates.FInalA_LPass,  <br>"
            strsql += "MasterProctorTesting_BU.RPassword =MasterExamDates.FinalA_RPass  <br>"
            strsql += "From MasterExamDates  <br>"
            strsql += "where MasterExamDates.Course = MasterProctorTesting_BU.course and MasterProctorTesting_BU.Session = '8W1' and MasterProctorTesting_BU.ExamType='Final' <br>"
        End If
        If (DropDownList1.SelectedValue = "8W2") And radioExam.SelectedValue = "isMidTerm" Then
            strsql += "use VC_VCData <br>"
            strsql += "Update dbo.MasterProctorTesting_BU <br>"
            strsql += "set MasterProctorTesting_BU.LPassword = MasterExamDates.MidB_LPass,  <br>"
            strsql += "MasterProctorTesting_BU.RPassword =MasterExamDates.MidB_RPass  <br>"
            strsql += "From MasterExamDates  <br>"
            strsql += "where MasterExamDates.Course = MasterProctorTesting_BU.course and MasterProctorTesting_BU.Session = '8W2' and MasterProctorTesting_BU.ExamType='Mid' <br>"
        End If

        If (DropDownList1.SelectedValue = "8W2") And radioExam.SelectedValue = "isFinal" Then
            strsql += "use VC_VCData <br>"
            strsql += "Update dbo.MasterProctorTesting_BU <br>"
            strsql += "set MasterProctorTesting_BU.LPassword = MasterExamDates.FinalB_LPass,  <br>"
            strsql += "MasterProctorTesting_BU.RPassword =MasterExamDates.FinalB_RPass  <br>"
            strsql += "From MasterExamDates  <br>"
            strsql += "where MasterExamDates.Course = MasterProctorTesting_BU.course and MasterProctorTesting_BU.Session = '8W2' and MasterProctorTesting_BU.ExamType='Final' <br>"
        End If


        If (DropDownList1.SelectedValue = "6W1") And radioExam.SelectedValue = "isMidTerm" Then
            strsql += "use VC_VCData <br>"
            strsql += "Update dbo.MasterProctorTesting_BU <br>"
            strsql += "set MasterProctorTesting_BU.LPassword = MasterExamDates.MidA_LPass,  <br>"
            strsql += "MasterProctorTesting_BU.RPassword =MasterExamDates.MidA_RPass  <br>"
            strsql += "From MasterExamDates  <br>"
            strsql += "where MasterExamDates.Course = MasterProctorTesting_BU.course and MasterProctorTesting_BU.Session = '6W1' and MasterProctorTesting_BU.ExamType='Mid' <br>"
        End If
        If (DropDownList1.SelectedValue = "6W1") And radioExam.SelectedValue = "isFinal" Then
            strsql += "use VC_VCData <br>"
            strsql += "Update dbo.MasterProctorTesting_BU <br>"
            strsql += "set MasterProctorTesting_BU.LPassword = MasterExamDates.FInalA_LPass,  <br>"
            strsql += "MasterProctorTesting_BU.RPassword =MasterExamDates.FinalA_RPass  <br>"
            strsql += "From MasterExamDates  <br>"
            strsql += "where MasterExamDates.Course = MasterProctorTesting_BU.course and MasterProctorTesting_BU.Session = '6W1' and MasterProctorTesting_BU.ExamType='Final' <br>"
        End If

        If (DropDownList1.SelectedValue = "6W2") And radioExam.SelectedValue = "isMidTerm" Then
            strsql += "use VC_VCData <br>"
            strsql += "Update dbo.MasterProctorTesting_BU <br>"
            strsql += "set MasterProctorTesting_BU.LPassword = MasterExamDates.MidB_LPass,  <br>"
            strsql += "MasterProctorTesting_BU.RPassword =MasterExamDates.MidB_RPass  <br>"
            strsql += "From MasterExamDates  <br>"
            strsql += "where MasterExamDates.Course = MasterProctorTesting_BU.course and MasterProctorTesting_BU.Session = '6W2' and MasterProctorTesting_BU.ExamType='Mid' <br>"
        End If
        If (DropDownList1.SelectedValue = "6W2") And radioExam.SelectedValue = "isFinal" Then
            strsql += "use VC_VCData <br>"
            strsql += "Update dbo.MasterProctorTesting_BU <br>"
            strsql += "set MasterProctorTesting_BU.LPassword = MasterExamDates.FInalB_LPass,  <br>"
            strsql += "MasterProctorTesting_BU.RPassword =MasterExamDates.FinalB_RPass  <br>"
            strsql += "From MasterExamDates  <br>"
            strsql += "where MasterExamDates.Course = MasterProctorTesting_BU.course and MasterProctorTesting_BU.Session = '6W2' and MasterProctorTesting_BU.ExamType='Final' <br>"
        End If


        lblCode.Text = strsql & "<br>.................................<br><br>" & Replace(strsql, "_BU", "") & "<br>"
    End Sub
End Class