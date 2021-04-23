Imports System.IO
Imports System.Data.SqlClient
Imports System.Data.Sql

Public Class CMR_sp
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub


    Protected Sub btnUpload_Click(sender As Object, e As EventArgs) Handles btnUpload.Click
        'DeleteFromFDLC()
        Dim changecount As Integer = 0
        Dim fileStream As FileStream = File.Open(Server.MapPath("Data/CMRupload.txt"), FileMode.Open, FileAccess.Read)

        Dim streamReader As StreamReader = New StreamReader(fileStream)

        Dim nLine As Integer = 0
        Dim mySPcount As Integer = 0
        Dim myLinecount As Integer = 0
        While (streamReader.Peek() > -1)

            Dim strLine As String = streamReader.ReadLine()
            'Dim strline As String = "2213,1003,ACG,2021L,Financial Acct Lab,LAB,A,1.00,2,1/06/2021,4/30/2021,14,E,Changed Cap Enrl to 30 from 45,Hog,Gung,ghong,Portuondo$ Alexis (interim),aportuon,FULL,100003333,"
            myLinecount = myLinecount + 1
            nLine = nLine + 1

            'Response.Write(nLine & "<br>")
            'Response.Write(nLine & "<br>")
            'Response.Write(strLine & "<br>")
            Dim astrValues As String() = strLine.Split(CChar(","))
            'Dim newname As String = "<font color=red>not here </font>"
            If astrValues.Length <> 22 Then
                ''''''''''''''''''''''''''changed 6 t0 7
                'Response.Write("<B> An error occurred while processing Line " & nLine.ToString() & ":<B><br><br>")
                'Response.Write(strLine)

                '

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
            Dim mdcid As String = astrValues(14) 'MDIC,
            Dim course As String = subject & catalog


            Dim sp_Term As String = astrValues(0)
            Dim sp_Reference As String = astrValues(1)  'reference
            Dim sp_Subject As String = astrValues(2)  '
            Dim sp_BBreference As String = sp_Term & "-" & sp_Reference
            Dim sp_Prefix As String = sp_Subject
            Dim sp_Catalog As String = astrValues(3)  'Catalog,
            Dim sp_Course As String = sp_Prefix & sp_Catalog
            Dim sp_Course_Name As String = sp_Course & "-" & sp_BBreference
            Dim sp_Description As String = astrValues(4)
            Dim sp_Comp As String = astrValues(5)
            Dim sp_Section As String = astrValues(11)
            Dim sp_Session As String = astrValues(8)
            Dim sp_Status As String = astrValues(6)
            Dim sp_Credits As String = astrValues(7)
            Dim sp_StartDate As String = astrValues(9)
            Dim sp_EndDate As String = astrValues(10)
            Dim sp_Type As String = astrValues(12) '
            Dim sp_InstructorLast As String = astrValues(14)
            Dim sp_InstructorFirst As String = astrValues(15)
        Dim sp_MDCID As String = astrValues(20)
        Dim sp_InstAssign As String = astrValues(19)

        Dim mycanChange As String = "False"
        If LCase(sp_InstAssign) = "full" Then
            mycanChange = "True"
        End If

        Dim sp_canchange As String = mycanChange
        Dim sp_Email As String = astrValues(16) & "@mdc.edu"
            Dim sp_UserName As String = astrValues(16)
            Dim sp_chair As String = astrValues(17)
            Dim sp_chairoutlook As String = astrValues(18)

            Dim sp_schedulenotes As String
            If Len(astrValues(13)) > 2 Then
                sp_schedulenotes = Replace(astrValues(13), "$", ",")  '
            Else
                sp_schedulenotes = "  "
            End If
            '    working list of data:   term, reference, subject, catalog, descr, status, credits, component, section, session, startdate, enddate, classtype, mdcid, instassign, last, first, email
            If RadioButtonList1.SelectedValue = "data" Or RadioButtonList1.SelectedValue = "showall" Then
                Dim i As Integer = 0
                For i = 0 To 20
                    Response.Write(astrValues(i) & "|")
                Next
                Response.Write("<br>")
            End If

            '    Response.Write(sp_Reference & "  sp_Reference<br>")
            '       Response.Write(sp_Subject & "  sp_Subject<br>")
            '      Response.Write(sp_BBreference & "  sp_BBreference<br>")
            '     Response.Write(sp_Prefix & "  sp_Prefix<br>")
            'Response.Write(sp_Catalog & "  sp_Catalog <br>")
            '    Response.Write(sp_Course & "  sp_Course<br>")
            'Response.Write(sp_Course_Name & "  sp_Course_Name<br>")
            'Response.Write(sp_Description & "  sp_Description<br>")
            'Response.Write(sp_Comp & "  sp_Comp<br>")
            'Response.Write(sp_Section & "  sp_Section<br>")
            'Response.Write(sp_Session & "  sp_Session<br>")
            'Response.Write(sp_Status & "  sp_Status<br>")
            'Response.Write(sp_Credits & "  sp_Credits<br>")
            'Response.Write(sp_StartDate & "  sp_StartDate<br>")
            'Response.Write(sp_EndDate & "  sp_EndDate<br>")
            'Response.Write(sp_Type & "  sp_Type<br>")
            'Response.Write(sp_InstructorLast & "  sp_InstructorLast<br>")
            'Response.Write(sp_InstructorFirst & "  sp_InstructorFirst<br>")
            'Response.Write(sp_MDCID & "  sp_MDCID<br>")
            'Response.Write(sp_InstAssign & "  sp_InstAssign<br>")
            'Response.Write(sp_canchange & "  sp_canchange<br>")
            'Response.Write(sp_Email & "  sp_Email<br>")
            'Response.Write(sp_UserName & "  sp_UserName<br>")
            'Response.Write(sp_chair & "  sp_chair<br>")
            'Response.Write(sp_chairoutlook & "  sp_chairoutlook<br>")
            'Response.Write(sp_schedulenotes & "  sp_schedulenotes<br>")
            If sp_Type = "E" Then
                mySPcount = mySPcount + 1
                If RadioButtonList1.SelectedValue <> "data" Then
                    SPTest(sp_Term, sp_Reference, sp_Subject, sp_BBreference, sp_Prefix, sp_Catalog, sp_Course, sp_Course_Name, sp_Description, sp_Comp, sp_Section, sp_Session, sp_Status, sp_Credits, sp_StartDate, sp_EndDate, sp_Type, sp_InstructorLast, sp_InstructorFirst, sp_MDCID, sp_InstAssign, sp_canchange, sp_Email, sp_UserName, sp_chair, sp_chairoutlook, sp_schedulenotes)
                End If
            End If
        End While

        streamReader.Close()
        fileStream.Close()
        Response.Write("<br>The Line Count is " & CStr(myLinecount) & "<br>")
        Response.Write("<br>The SP Count is " & CStr(mySPcount) & "<br>")
    End Sub

    Sub TestSub(ByVal sp_Term As String, ByVal sp_Reference As String, ByVal sp_Subject As String, ByVal sp_BBreference As String, ByVal sp_Prefix As String, ByVal sp_Catalog As String, ByVal sp_Course As String, ByVal sp_Course_Name As String, ByVal sp_Description As String, ByVal sp_Comp As String, ByVal sp_Section As String, ByVal sp_Session As String, ByVal sp_Status As String, ByVal sp_Credits As String, ByVal sp_StartDate As String, ByVal sp_EndDate As String, ByVal sp_Type As String, ByVal sp_InstructorLast As String, ByVal sp_InstructorFirst As String, ByVal sp_MDCID As String, ByVal sp_InstAssign As String, ByVal sp_canchange As String, ByVal sp_Email As String, ByVal sp_UserName As String, ByVal sp_chair As String, ByVal sp_chairoutlook As String, ByVal sp_schedulenotes As String)
        Response.Write("OH SHIT <br>  ")
        Response.Write(sp_Course_Name)
    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Panel2.Visible = True

    End Sub

    Sub SPTest(ByVal sp_Term As String, ByVal sp_Reference As String, ByVal sp_Subject As String, ByVal sp_BBreference As String, ByVal sp_Prefix As String, ByVal sp_Catalog As String, ByVal sp_Course As String, ByVal sp_Course_Name As String, ByVal sp_Description As String, ByVal sp_Comp As String, ByVal sp_Section As String, ByVal sp_Session As String, ByVal sp_Status As String, ByVal sp_Credits As String, ByVal sp_StartDate As String, ByVal sp_EndDate As String, ByVal sp_Type As String, ByVal sp_InstructorLast As String, ByVal sp_InstructorFirst As String, ByVal sp_MDCID As String, ByVal sp_InstAssign As String, ByVal sp_canchange As String, ByVal sp_Email As String, ByVal sp_UserName As String, ByVal sp_chair As String, ByVal sp_chairoutlook As String, ByVal sp_schedulenotes As String)

        Dim myerror As Integer = 0
        Using conn As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
            Using mycommand As New SqlCommand()
                With mycommand
                    .Connection = conn
                    mycommand.CommandText = "sp_CMRSHORT"
                    mycommand.CommandType = CommandType.StoredProcedure



                    mycommand.Parameters.Add("@Term", SqlDbType.VarChar).Value = sp_Term
                    mycommand.Parameters.Add("@Reference", SqlDbType.VarChar).Value = sp_Reference
                    mycommand.Parameters.Add("@UserName", SqlDbType.VarChar).Value = sp_UserName
                    mycommand.Parameters.Add("@BBReference", SqlDbType.VarChar).Value = sp_BBreference
                    mycommand.Parameters.Add("@MDCID", SqlDbType.VarChar).Value = sp_MDCID
                    mycommand.Parameters.Add("@Session", SqlDbType.VarChar).Value = sp_Session '
                    mycommand.Parameters.Add("@StartDate", SqlDbType.Date).Value = sp_StartDate
                    mycommand.Parameters.Add("@EndDate", SqlDbType.Date).Value = sp_EndDate
                    mycommand.Parameters.Add("@SectionNotes", SqlDbType.Text).Value = sp_schedulenotes
                    mycommand.Parameters.Add("@Credits", SqlDbType.Decimal).Value = CDec(sp_Credits)
                    mycommand.Parameters.Add("@CanChange", SqlDbType.Bit).Value = CBool(sp_canchange)
                    mycommand.Parameters.Add("@Subject", SqlDbType.VarChar).Value = sp_Subject
                    mycommand.Parameters.Add("@Prefix", SqlDbType.VarChar).Value = sp_Prefix
                    mycommand.Parameters.Add("@Course", SqlDbType.VarChar).Value = sp_Course
                    mycommand.Parameters.Add("@Description", SqlDbType.VarChar).Value = sp_Description
                    mycommand.Parameters.Add("@Comp", SqlDbType.VarChar).Value = sp_Comp
                    mycommand.Parameters.Add("@Section", SqlDbType.VarChar).Value = sp_Section
                    mycommand.Parameters.Add("@Status", SqlDbType.VarChar).Value = sp_Status
                    mycommand.Parameters.Add("@Type", SqlDbType.VarChar).Value = sp_Type
                    mycommand.Parameters.Add("@InstructorLast", SqlDbType.VarChar).Value = sp_InstructorLast
                    mycommand.Parameters.Add("@InstructorFirst", SqlDbType.VarChar).Value = sp_InstructorFirst
                    mycommand.Parameters.Add("@InstAssign", SqlDbType.VarChar).Value = sp_InstAssign
                    mycommand.Parameters.Add("@Email", SqlDbType.VarChar).Value = sp_Email
                    mycommand.Parameters.Add("@chair", SqlDbType.VarChar).Value = sp_chair
                    mycommand.Parameters.Add("@chairoutlook", SqlDbType.VarChar).Value = sp_chairoutlook
                    mycommand.Parameters.Add("@Catalog", SqlDbType.VarChar).Value = sp_Catalog
                    mycommand.Parameters.Add("@Course_Name", SqlDbType.VarChar).Value = sp_Course_Name
                    mycommand.Parameters.Add("@myStatus", SqlDbType.VarChar, 20).Direction = ParameterDirection.Output
                    Try
                        conn.Open()
                        mycommand.ExecuteNonQuery() '
                    Catch Ex As Exception
                        'Response.Write(Ex.Message)

                        Response.Write(Ex.Message.ToString & "<br>")

                    Finally

                    End Try



                End With
                Response.Write(sp_BBreference & " - " & mycommand.Parameters("@myStatus").Value & "<br>")
            End Using
        End Using


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
End Class