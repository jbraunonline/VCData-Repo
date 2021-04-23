Imports System.IO
Imports System.Data.SqlClient
Imports System.Data.Sql
Imports Telerik.Web.UI

Public Class BlackboardSetup
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Page.IsPostBack Then
            lblSession.Text = ddlSession.SelectedItem.Text
            lblExam.Text = radioExam.SelectedItem.Text
            lblTerm.Text = ddlTerm.SelectedItem.Text
            getworkinglist()
        End If
    End Sub
    Function showLockdown(ByVal mylockdown As String) As String
        Dim myreturn As String = "+"
        If mylockdown = "True" Then
            myreturn = "False"
        End If


        Return myreturn
    End Function


    Protected Sub getworkinglist()
        Dim SqlDataSource1 As New SqlDataSource()
        SqlDataSource1.ID = "SqlDataSource1"
        Me.Page.Controls.Add(SqlDataSource1)
        SqlDataSource1.ConnectionString = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString

        Dim mysql As String = ""
        If lblExam.Text = "Final" Then
            'Response.Write(radioSelect.SelectedItem.Text)

            mysql += "Select  [ID], [FamilyString], [Parent], [Course], [Instructor], [Outlook], [Session], [FinalStart] as ExamStart, [FinalEnd] As ExamEnd, [FinalTime] As ExamTime, [FinalEssay] as HasEssay  FROM [MasterProctor] "
            mysql += "WHERE [Session] = '" & lblSession.Text & "' And ([IsFinal] = 1) And OptIn = 1 Order By Course"

        ElseIf lblExam.Text = "Mid" Then
            mysql += "Select  [ID], [FamilyString], [Parent], [Course], [Instructor], [Outlook], [Session], [MidStart] as ExamStart, [MidEnd] As ExamEnd, [MidTime] As ExamTime, [Essay] as HasEssay FROM [MasterProctor] "
            mysql += "WHERE [Session] = '" & lblSession.Text & "' And ([IsMidTerm] = 1) And OptIn = 1 Order By Course"
        End If

        Response.Write(mysql)
        Response.Write("<br>")


        SqlDataSource1.SelectCommand = mysql '"SELECT Reference,Course, Course_ID, MDCID,IsAssociated,iscopyready, copyReadyDate from BBCourses where course='" & mycourse & "' and Term_Key='20152' And Category <>  'Master' Order By MDCID"



        'Response.Write("SELECT Course, Course_ID from BBCourses where course='" & mycourse & "' and Term_Key='20152'")

        RadGrid1.DataSource = SqlDataSource1
        RadGrid1.DataBind()
    End Sub
    Function GetRemotePass(ByVal MyCourse As String) As String
        Dim myreturn As String = ""

        Dim objMyMethod As ProctorExam
        objMyMethod = New ProctorExam

        myreturn = objMyMethod.GetRemotePass(MyCourse, lblSession.Text, lblExam.Text)



        Return myreturn
    End Function


    Function GetLocalPass(ByVal MyCourse As String) As String
        Dim myreturn As String = ""

        Dim objMyMethod As ProctorExam
        objMyMethod = New ProctorExam

        myreturn = objMyMethod.GetLocalPass(MyCourse, lblSession.Text, lblExam.Text)



        Return myreturn
    End Function

    Function GetLockDown(ByVal myID As Integer) As String
        '//Note that you must pass in the Id from MasterProctor so get it from MasterProctor.id of MasterproctorTesting.MasterProctor_ID
        ' and it must be used on a page where the radioExam.SelectedVlue  is Mid or Final
        Dim myreturn As String = ""
        Dim objMyMethod As ProctorExam
        objMyMethod = New ProctorExam

        myreturn = objMyMethod.GetTheLockDown(myID, lblExam.Text)


        Return myreturn
    End Function



    Public Function getTheInstructions(ByVal myID As Integer) As String

        Dim myreturn As String = ""
        Dim objMyMethod As ProctorExam
        objMyMethod = New ProctorExam
        myreturn = objMyMethod.getTestingInstructions(myID, lblExam.Text)
        Return myreturn
    End Function

    Function getProctor2(ByVal myID As Integer) As String
        Dim myreturn As String = ""
        Dim strsql As String = "select MidPaper,MidCalculator,MidGraph,Headphones,PM_ANXMTR From MasterProctor where ID =" & myID

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

                If dr("MidPaper") = True Then
                    mypaper = " SCRAP PAPER & PENCIL allowed - scrap paper must be disposed of when test is concluded."
                End If

                If dr("MidCalculator") = True And dr("MidGraph") = True Then
                    If dr("MidGraph") = True Then
                        myGraph = " Any type calculator allowed (EXCEPT cell/mobile phone calculators). "
                        mycalc = ""
                    End If
                Else


                    If dr("MidCalculator") = True Then
                        mycalc = " CALCULATOR allowed, including scientific or financial calculator (NO GRAPHING or CELL/MOBILE PHONE calculators). "
                    End If


                    If dr("MidGraph") = True Then
                        myGraph = " Any type calculator allowed (EXCEPT cell/mobile phone calculators). "
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

    Function GetOutlook2(ByVal myoutlook As String) As String
        Dim myreturn As String = ""
        Dim myemail As String = ""

        myemail = myoutlook & "@mdc.edu"
        myreturn = "<a href='mailto:" & myemail & " ' target='_top'>" & myoutlook & "</a>"
        Return myreturn
    End Function
    Protected Sub RadGrid1_ItemDataBound(ByVal sender As Object, ByVal e As GridItemEventArgs)
        If TypeOf e.Item Is GridDataItem Then
            Dim rowCounter As Integer = New Integer()
            Dim lbl As Label = TryCast(e.Item.FindControl("numberLabel"), Label)
            rowCounter = RadGrid1.MasterTableView.PageSize * RadGrid1.MasterTableView.CurrentPageIndex
            lbl.Text = (e.Item.ItemIndex + 1 + rowCounter).ToString()
        End If
    End Sub

    Protected Sub btnReturn_Click(sender As Object, e As EventArgs) Handles btnReturn.Click
        Response.Redirect("~/ProctorReporting/ExamReports.aspx")
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click

    End Sub
End Class