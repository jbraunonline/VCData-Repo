Imports System.IO
Imports System.Data.SqlClient
Imports System.Data.Sql

Public Class UploadCMR
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub


    Protected Sub btnUpload_Click(sender As Object, e As EventArgs) Handles btnUpload.Click
        'DeleteFromFDLC()
        Dim changecount As Integer = 0
        Dim fileStream As FileStream = File.Open(Server.MapPath("Data/CMRupload.txt"), FileMode.Open, FileAccess.Read)

        Dim streamReader As StreamReader = New StreamReader(fileStream)

        Dim nLine As Integer = 0

        While (streamReader.Peek() > -1)

            Dim strLine As String = streamReader.ReadLine()

            nLine = nLine + 1

            Response.Write(nLine & "<br>")
            'Response.Write(nLine & "<br>")
            'Response.Write(strLine & "<br>")
            Dim astrValues As String() = strLine.Split(CChar(","))
            'Dim newname As String = "<font color=red>not here </font>"
            If astrValues.Length <> 22 Then
                '''''changed 6 t0 7
                Response.Write("<B> An error occurred while processing Line " & nLine.ToString() & ":<B><br><br>")
                Response.Write(strLine)

                Exit While

            End If

            Dim term As String = astrValues(0)  'Term,
            Dim reference As String = astrValues(1)  'reference
            Dim subject As String = astrValues(2)  'Subject,'
            Dim catalog As String = astrValues(3)  'Catalog,
            Dim descr As String = astrValues(4)  'Descr,
            Dim component As String = astrValues(5)  'Component,
            Dim status As String = astrValues(6)  'Status,
            Dim credits As String = astrValues(7)  'Credits,
            Dim session As String = astrValues(8)  'Session,
            Dim startdate As String = astrValues(9)  'StartDate,
            Dim enddate As String = astrValues(10)  'EndDate,
            Dim section As String = astrValues(11)  'Section,
            Dim classtype As String = astrValues(12) 'ClassType,
            Dim scheduleNotes As String = Replace(astrValues(13), "$", ",")  'SectionNotes,
            Dim last As String = astrValues(14)  'Last,
            Dim first As String = astrValues(15)  'First,
            Dim UserName As String = astrValues(16)  'Username

            Dim email As String = ""
            If Len(UserName) > 2 Then
                email = UserName & "@mdc.edu"
            Else
                email = ""
            End If

            Dim Chair As String = astrValues(17)  'Chair
            Dim chairoutlook As String = astrValues(18)  'Chairoutlook
            Dim instAssign As String = astrValues(19)  'InstrAssig Cls, - CanChANGE
            Dim mdcid As String = astrValues(20)  'MDIC,
            Dim course As String = subject & catalog

            '    working list of data:   term, reference, subject, catalog, descr, status, credits, component, section, session, startdate, enddate, classtype, mdcid, instassign, last, first, email
            If RadioButtonList1.SelectedValue = "Preview" Then
                Dim i As Integer = 0
                For i = 0 To 20
                    Response.Write(astrValues(i) & "|")
                Next
                Response.Write("<br>")
            End If

            'Response.Write(term & "--" & reference & "--" & Chair & "--" & chairoutlook & "--" & scheduleNotes & "<br>")
            'UpgradeCMR(term, reference, Chair, chairoutlook, scheduleNotes)
            If RadioButtonList1.SelectedValue <> "Preview" Then
                If classtype = "E" Then
                    If DoesCMRexist(term, reference) = False Then
                        If addCMR(term, reference, subject, catalog, descr, status, credits, component, section, session, startdate, enddate, classtype, mdcid, instAssign, last, first, email, Chair, chairoutlook, scheduleNotes) = True Then
                            CMRchange(term, reference, session, startdate, enddate, mdcid, email, first, last, status, instAssign, course)  'adds a base record for the CMRchange table
                            addBBCourses(reference, term, course, section, session, startdate, enddate, first, last, email)
                        End If
                    Else
                        ' find out if the record has changed, and if it is, update cmr, bbcourses and create a change log record.
                        Response.Write(IsCMRchange(term, reference, session, mdcid, status, instAssign, last) & "  -myreturn <br>")
                        If IsCMRchange(term, reference, session, mdcid, status, instAssign, last) = True Then  'did mdcid, status, or session change?
                            Response.Write("SAME<br>")
                        Else
                            Response.Write("CHANGED <br>")
                            changecount = changecount + 1
                            UpdateCMR(term, reference, session, startdate, enddate, mdcid, last, first, email, status, instAssign)
                            CMRchange(term, reference, session, startdate, enddate, mdcid, email, first, last, status, instAssign, course) 'Adds a CMRchange record
                            updateBBCourse(term, reference, startdate, enddate, session, first, last, email)
                        End If
                    End If
                End If
            End If
        End While

        streamReader.Close()
        fileStream.Close()
        Response.Write("<br>The Change Count is " & CStr(changecount))
    End Sub

    Private Function addCMR(ByVal term As String, ByVal reference As String, ByVal subject As String, ByVal catalog As String, ByVal descr As String, ByVal status As String, ByVal credits As String, ByVal component As String, ByVal section As String, ByVal session As String, ByVal startdate As String, ByVal enddate As String, ByVal classtype As String, ByVal mdcid As String, ByVal instassign As String, ByVal last As String, ByVal first As String, ByVal email As String, ByVal chair As String, ByVal chairoutlook As String, ByVal schedulenotes As String) As Boolean
        Dim myOK As Boolean = 1
        Dim mycanChange As Integer = 0
        If LCase(instassign) = "full" Then
            mycanChange = 1
        End If


        If classtype = "E" Then
            Dim strSQL As String = "Insert into CMR (Term, Reference, BBreference, Prefix, Catalog, Course, Description, Comp, Section, Session, Status, Credits, StartDate, EndDate, Type, InstructorLast, InstructorFirst, MDCID,InstAssign, canchange, Email, UserName,chair,chairoutlook,RecordCreated, schedulenotes) " &
                               "VALUES ('" & term &
                               "','" & reference &
                               "','" & term & "-" & reference &
                               "','" & subject &
                               "','" & catalog &
                               "','" & subject & catalog &
                               "','" & descr &
                               "','" & component &
                               "','" & section &
                               "','" & session &
                               "','" & status &
                               "'," & credits &
                               ",'" & startdate &
                              "','" & enddate &
                              "','" & classtype &
                              "','" & last &
                               "','" & first &
                               "','" & mdcid &
                               "','" & instassign &
                               "'," & mycanChange &
                               ",'" & LCase(email) &
                               "','" & Replace(LCase(email), "@mdc.edu", "") &
                                "','" & chair &
                                "','" & chairoutlook &
                                "','" & Now.ToShortDateString &      'ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp
                                "','" & schedulenotes & "')"

            'Course_ID,Course,Term,MidStdFolder,MidAltFolder,IsMidterm,MidTime,MidStart,MidEnd,MidPass,Final,FinalTime,FinalStart,FinalEnd,FinalPass,FinalSpecial,FinalPaper,FinalCalculator,FinalMedia,FinalSpecialNotes
            Response.Write(strSQL & "<BR><BR>")
            Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
            ' Create Instance of Connection and Command Object
            Dim myCommand As New SqlCommand(strSQL, myConnection)

            If RadioButtonList1.SelectedValue = "Input" Then
                Try

                    ' Open the connection and execute the Command
                    myConnection.Open()


                    'HOLD SQL HOLD.........]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]
                    myCommand.ExecuteNonQuery()

                Catch

                    Response.Write("<font color=red>failed to create a new record</font>")
                    CMRerror(term, reference, "InsertCMR", strSQL)
                    myOK = 0

                Finally

                    ' Close the Connection
                    If myConnection.State = ConnectionState.Open Then
                        myConnection.Close()
                    End If

                End Try
            End If

        End If
            Return myOK
    End Function

    Private Sub CMRchange(ByVal myterm As String, ByVal myreference As String, ByVal mysession As String, ByVal myStartDate As String, ByVal myEndDate As String, ByVal myMDCID As String, ByVal myusername As String, ByVal myFirstName As String, ByVal myLastName As String, ByVal mystatus As String, ByVal myInstAssign As String, ByVal mycourse As String)

        Dim strsql As String = "Insert into CMRchange(status,term,reference,BBreference,session,StartDate,EndDate,MDCID,username,FirstName,LastName,InstAssign,course,changeDate) Values("
        strsql += "'" & mystatus
        strsql += "','" & myterm
        strsql += "','" & myreference
        strsql += "','" & myterm & "-" & myreference
        strsql += "','" & mysession
        strsql += "','" & myStartDate
        strsql += "','" & myEndDate
        strsql += "','" & myMDCID
        strsql += "','" & Replace(LCase(myusername), "@mdc.edu", "")
        strsql += "','" & myFirstName
        strsql += "','" & myLastName
        strsql += "','" & myInstAssign
        strsql += "','" & mycourse
        strsql += "','" & Now() & "')"

        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand(strsql, myConnection) '
        ' Execute the command in a try/catch to catch duplicate username errors'
        Response.Write("CMRChange sql = <br>")
        Response.Write(strsql & "<br>")
        Response.Write("CMRChange sql = <br>")
        If RadioButtonList1.SelectedValue = "Input" Then
            Try
                ' Open the connection and execute the Command
                myConnection.Open()
                ' mycounter = mycounter + 1
                'HOLD SQL HOLD.[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[.....
                myCommand.ExecuteNonQuery()
            Catch
                ' failed to create a new record
                Response.Write("<br>FAIL<br>")
            Finally
                'Close the Connection
                If myConnection.State = ConnectionState.Open Then
                    myConnection.Close()
                End If

            End Try

        End If
    End Sub
    Private Sub CMRerror(ByVal myterm As String, ByVal myreference As String, ByVal theFunction As String, ByVal mysql As String)

        Dim strsql As String = "Insert into CMR_Error(term,reference,theFunction,mysql,TheDate) Values("
        strsql += "'" & myterm
        strsql += "','" & myreference
        strsql += "','" & theFunction
        strsql += "','" & Replace(mysql, "'", "''")
        strsql += "','" & Now() & "')"

        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand(strsql, myConnection) '
        ' Execute the command in a try/catch to catch duplicate username errors'

        Response.Write("<br>" & strsql & " <b><font color=red>CMR Error Log************************************</font></b><br>")
        Try
            ' Open the connection and execute the Command
            myConnection.Open()
            ' mycounter = mycounter + 1
            'HOLD SQL HOLD.[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[.....
            myCommand.ExecuteNonQuery()
        Catch
            ' failed to create a new record
            Response.Write("<br>FAIL<br>")
        Finally
            'Close the Connection
            If myConnection.State = ConnectionState.Open Then
                myConnection.Close()
            End If

        End Try


    End Sub







    Private Sub UpdateCMR(ByVal term As String, ByVal reference As String, ByVal session As String, ByVal startdate As String, ByVal enddate As String, ByVal mdcid As String, ByVal last As String, ByVal first As String, ByVal email As String, ByVal status As String, ByVal InstAssign As String)
        Dim strsql As String = "Update CMR set "
        strsql += "session = '" & session & "', "
        strsql += "status = '" & status & "', "
        strsql += "startdate = '" & startdate & "', "
        strsql += "enddate = '" & enddate & "', "
        strsql += "MDCID = '" & mdcid & "', "
        strsql += "InstructorLast = '" & last & "', "
        strsql += "InstructorFirst = '" & first & "', "
        strsql += "email = '" & email & "', "
        strsql += "Username = '" & Replace(LCase(email), "@mdc.edu", "") & "', "
        Dim mycanchange As Integer = 0
        If LCase(InstAssign) = "full" Then
            mycanchange = 1
        End If
        strsql += "canchange =" & mycanchange & ", "
        strsql += "InstAssign = '" & InstAssign & "'"
        strsql += " Where term ='" & term & "' And  reference ='" & reference & "'"
        Response.Write("CMRChange sql = <br>")
        'Response.Write(strsql & "<br>")

        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand(strsql, myConnection) '

        ' Execute the command in a try/catch to catch duplicate username errors'
        Response.Write("CMRUPDATE sql = <br>")
        Response.Write(strsql & "<br>")
        Response.Write("CMRupdate sql = <br>")

        If RadioButtonList1.SelectedValue = "Input" Then
            Try
                ' Open the connection and execute the Command
                myConnection.Open()
                ' mycounter = mycounter + 1
                'HOLD SQL HOLD..[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[.
                myCommand.ExecuteNonQuery()
            Catch
                ' failed to create a new record 
                Response.Write("Fail")
            Finally
                'Close the Connection
                If myConnection.State = ConnectionState.Open Then
                    myConnection.Close()
                End If
            End Try
        End If

    End Sub

    Private Function IsCMRchange(ByVal myterm As String, ByVal myreference As String, ByVal mysession As String, ByVal mymdcid As String, ByVal mystatus As String, myassign As String, mylast As String) As Boolean

        Dim myreturn As Boolean = 0
        Dim mycount As Integer = 0
        Response.Write(mysession & "--myfilesession<br>")
        'Response.Write(mymdcid & "<br>")
        Dim strSQL As String = "Select Session, MDCID,status, InstAssign, InstructorLast from CMR where term='" & myterm & "' and reference='" & myreference & "'"
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
        ' Response.Write(strSQL & "<br>")
        Dim myCommand As New SqlCommand(strSQL, myConnection)

        ' Open the connection and execute the Command
        myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        If dr.HasRows Then
            While dr.Read()
                Response.Write(dr("Session") & "--myDBsession<br>")
                If dr("Session") = mysession And dr("MDCID") = mymdcid And dr("status") = mystatus And dr("InstAssign") = myassign And dr("InstructorLast") = mylast Then
                    myreturn = 1
                Else
                    myreturn = 0
                End If

                If radioSetup.Checked = True Then   ' If faculty selection is live, then if the MDCID has changed this function clears invalid setup data from previous instructor
                    If dr("MDCID") <> mymdcid Then
                        clearsetup(myterm, myreference)
                        'see note in the sub.  this has not been tried or implemented. 
                    End If
                End If

            End While
        End If
        dr.Close()
        dr = Nothing
        myConnection.Close()
        Return myreturn

    End Function


    Private Function DoesCMRexist(ByVal myterm As String, myreference As String) As Boolean

        'check to see if this master exists in the VC_VCdata BBMasterCourse table  NOTE this is not the VC_VCdata1 db -- connectionstring points to db
        Dim mysetup As Boolean = False
        Dim mySQL As String = "Select term, reference from CMR where term='" & myterm & "' and reference='" & myreference & "'"
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
            Dim myCommand As New SqlCommand(mySQL, myConnection)
            'Response.Write(mySQL & " -Does aauditstatusExist<br>")
            'Response.End()
            'Response.Write("does sweep details exist <br>")
            ' Open the connection and execute the Command
            myConnection.Open()
            Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
            Dim myFlag As String = ""
            If dr.Read() Then
                If Not IsDBNull(dr("Reference")) Then
                    myFlag = dr("Reference")
                    If Len(myFlag) > 2 Then
                        mysetup = True
                    End If
                Else
                    mysetup = False
                End If
            Else
            End If

            dr.Close()
            myConnection.Close()
            'Response.Write("<br>" & CStr(mysetup) & "<br>")
            Return mysetup



    End Function

    Sub addBBCourses(ByVal myreference As String, ByVal myterm As String, ByVal mycourse As String, ByVal mysection As String, ByVal mysession As String, ByVal mystartdate As String, ByVal myenddate As String, ByVal myfirst As String, ByVal mylast As String, ByVal myemail As String)


        Dim therefno As String = myterm & "-" & myreference
        Dim thecourse As String = mycourse & "-" & myterm & "-" & myreference
        Dim strSQL As String = "Insert into BBCourses(Reference,Family,Course_Name,Course_ID,TERM_KEY,Course,Section,Org_Name,Org_Type,Category,Start_Date,End_Date,DateIn,session,instructor,username) " &
                                   "VALUES ('" & therefno &
                                   "','" & therefno &
                                   "','" & thecourse &
                                   "','" & thecourse &
                                   "','" & myterm &
                                   "','" & mycourse &
                                   "','" & mysection &
                                   "','" & "ONLN" &
                                   "','" & "VIRT" &
                                   "','" & "College Credit" &
                                   "','" & mystartdate &
                                   "','" & myenddate &
                                   "','" & Now() &
                                   "','" & mysession &
                                   "','" & mylast & ", " & Left(myfirst, 1) &
                                   "','" & Replace(LCase(myemail), "@mdc.edu", "") & "')"


        Response.Write("NEWBBBBB<br>")

        Response.Write("<BR>" & strSQL & "<BR>")
        Response.Write("NEWBBBBB<br>")


        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)

        Dim myCommand As New SqlCommand(strSQL, myConnection)
        If RadioButtonList1.SelectedValue = "Input" Then
            Try

                myConnection.Open()
                'HOLD SQL HOLD..[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[....
                myCommand.ExecuteNonQuery()

            Catch
                Response.Write("<font color=red>failed to create a new record</font>")
                CMRerror(myterm, myreference, "InsertBB", strSQL)
            Finally
                If myConnection.State = ConnectionState.Open Then
                    myConnection.Close()
                End If
            End Try
        End If

    End Sub

    Sub updateBBCourse(ByVal myterm As String, ByVal myreference As String, ByVal mystartdate As String, ByVal myenddate As String, ByVal mysession As String, ByVal myFirst As String, ByVal myLast As String, ByVal myemail As String)

        Dim strSQL As String = "Update BBCourses set "
        strSQL += "Start_Date ='" & mystartdate
        strSQL += "', End_Date='" & myenddate
        strSQL += "', Session='" & mysession
        strSQL += "', Instructor='" & myLast & ", " & Left(myFirst, 1)
        strSQL += "', UserName='" & Replace(LCase(myemail), "@mdc.edu", "")
        strSQL += "',alertflag=1"
        strSQL += " where reference ='" & myterm & "-" & myreference & "'"
        Response.Write("BBChange sql = <br>")
        Response.Write(strSQL & "<BR>")
        Response.Write("BBChange sql = <br>")
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand(strSQL, myConnection)

        If RadioButtonList1.SelectedValue = "Input" Then
            Try
                myConnection.Open()
                ' HOLD Sql HOLD...;;[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[....................
                myCommand.ExecuteNonQuery()
            Catch
                Response.Write("failed to update record <br>")

            Finally
                If myConnection.State = ConnectionState.Open Then
                    myConnection.Close()
                End If
            End Try
        End If
    End Sub

    Private Sub clearsetup(ByVal myterm As String, ByVal myreference As String)
        'NOTE: this is a good idea, but it is not currently being used. It depends on selecting a radio button on the aspx page.  It's a good idea, but not implmented.
        'the idea was to clear any new course setup info if the instructor changed after the content selection form has been filled out by the outgoing instructor.
        'More thought and thinking would need to be used to enable this idea


        Dim strSQL As String = "Update CMR set SectionSetup = NULL, SectionMaster = NULL, SectionGroup = NULL, SectionNotes = NULL "
        strSQL += " where term ='" & myterm & "' and reference ='" & myreference & "'"
        Response.Write("Cancel Setup = <br>")
        Response.Write(strSQL & "<BR>")
        Response.Write("Cancel Setup = <br>")
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand(strSQL, myConnection)

        If RadioButtonList1.SelectedValue = "Input" Then
            Try
                myConnection.Open()
                ' HOLD Sql HOLD...;;[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[....................
                myCommand.ExecuteNonQuery()
            Catch
                Response.Write("failed to update record <br>")

            Finally
                If myConnection.State = ConnectionState.Open Then
                    myConnection.Close()
                End If
            End Try
        End If
    End Sub


    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim strFileName As String

        If UploadFile.PostedFile.FileName.Length > 0 Then
            strFileName = System.IO.Path.GetFileName(UploadFile.PostedFile.FileName)
            UploadFile.PostedFile.SaveAs(Server.MapPath("Data/CMRupload.txt"))
            Panel1.Visible = True
            Panel2.Visible = True
        End If

        lblFileName.Text = UploadFile.PostedFile.FileName
        lblFileSize.Text = UploadFile.PostedFile.ContentLength
        lblFileContentType.Text = UploadFile.PostedFile.ContentType

    End Sub

    ' Upgrade CMR[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[adding new data to all courses

    Private Sub UpgradeCMR(ByVal term As String, ByVal reference As String, ByVal chair As String, ByVal chairoutlook As String, ByVal sectionnotes As String)
        Dim strsql As String = "Update CMR set "
        strsql += "chair = '" & chair & "', "
        strsql += "chairoutlook = '" & chairoutlook & "', "
        strsql += "schedulenotes = '" & sectionnotes & "' "
        strsql += " Where term ='" & term & "' And  reference ='" & reference & "'"
        Response.Write("CMRChange sql = <br>")
        'Response.Write(strsql & "<br>")

        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand(strsql, myConnection) '

        ' Execute the command in a try/catch to catch duplicate username errors'
        Response.Write("CMRnoteUpgradeE sql = <br>")
        Response.Write(strsql & "<br>")
        Response.Write("CMRnoteUpgrade = <br>")


        Try
            ' Open the connection and execute the Command
            myConnection.Open()
            ' mycounter = mycounter + 1
            'HOLD SQL HOLD..[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[.
            myCommand.ExecuteNonQuery()
        Catch
            ' failed to create a new record 
            Response.Write("<font color=red>Fail****************************   FAIL   **********************************</font>")
        Finally
            'Close the Connection
            If myConnection.State = ConnectionState.Open Then
                myConnection.Close()
            End If
        End Try

    End Sub

    Protected Sub btnNotes_Click(sender As Object, e As EventArgs) Handles btnNotes.Click
        'I run this as a special strp to insure that all of Donna's notes get recorded even if there were not major changes to the CMR data
        Dim changecount As Integer = 0
        Dim fileStream As FileStream = File.Open(Server.MapPath("Data/CMRupload.txt"), FileMode.Open, FileAccess.Read)

        Dim streamReader As StreamReader = New StreamReader(fileStream)

        Dim nLine As Integer = 0

        While (streamReader.Peek() > -1)

            Dim strLine As String = streamReader.ReadLine()

            nLine = nLine + 1

            Response.Write(nLine & "<br>")
            'Response.Write(nLine & "<br>")
            'Response.Write(strLine & "<br>")
            Dim astrValues As String() = strLine.Split(CChar(","))
            'Dim newname As String = "<font color=red>not here </font>"
            If astrValues.Length <> 22 Then
                '''''changed 6 t0 7
                Response.Write("<B> An error occurred while processing Line " & nLine.ToString() & ":<B><br><br>")
                Response.Write(strLine)

                Exit While

            End If

            Dim term As String = astrValues(0)  'Term,
            Dim reference As String = astrValues(1)  'reference
            Dim subject As String = astrValues(2)  'Subject,'
            Dim catalog As String = astrValues(3)  'Catalog,
            Dim descr As String = astrValues(4)  'Descr,
            Dim component As String = astrValues(5)  'Component,
            Dim status As String = astrValues(6)  'Status,
            Dim credits As String = astrValues(7)  'Credits,
            Dim session As String = astrValues(8)  'Session,
            Dim startdate As String = astrValues(9)  'StartDate,
            Dim enddate As String = astrValues(10)  'EndDate,
            Dim section As String = astrValues(11)  'Section,
            Dim classtype As String = astrValues(12) 'ClassType,
            Dim scheduleNotes As String = Replace(astrValues(13), "$", ",")  'SectionNotes,
            Dim last As String = astrValues(14)  'Last,
            Dim first As String = astrValues(15)  'First,
            Dim UserName As String = astrValues(16)  'Username

            Dim email As String = ""
            If Len(UserName) > 2 Then
                email = UserName & "@mdc.edu"
            Else
                email = ""
            End If

            UpdateNotes(reference, term, scheduleNotes)
        End While

        streamReader.Close()
        fileStream.Close()
        Response.Write("<br>The Change Count is " & CStr(changecount))
    End Sub

    Protected Sub UpdateNotes(ByVal myreference As String, ByVal myterm As String, ByVal mynotes As String)
        Dim strSQL As String = "Update CMR set "
        strSQL += "ScheduleNotes ='" & mynotes & "'"
        strSQL += " where reference ='" & myreference & "'  and term ='" & myterm & "'"
        Response.Write("NoteChange sql = <br>")
        Response.Write(strSQL & "<BR>")
        Response.Write("NoteChange sql = <br>")
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand(strSQL, myConnection)

        Try
            myConnection.Open()
            ' HOLD Sql HOLD...;;[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[....................
            myCommand.ExecuteNonQuery()
        Catch
            Response.Write("failed to update record <br>")

        Finally
            If myConnection.State = ConnectionState.Open Then
                myConnection.Close()
            End If
        End Try
    End Sub


    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Panel2.Visible = True

    End Sub
End Class