Imports System.Data.SqlClient
Imports System.Data.Sql
Public Class Day
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not Page.IsPostBack Then
            Calendar1.SelectedDate = DateTime.Today
        End If

    End Sub
    Protected Sub Calendar1_DayRender(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DayRenderEventArgs) Handles Calendar1.DayRender
        If e.Day.Date.DayOfWeek = DayOfWeek.Sunday Or e.Day.Date.DayOfWeek = DayOfWeek.Saturday Then
            e.Day.IsSelectable = False
            e.Cell.BackColor = System.Drawing.Color.Gray
        End If


    End Sub
    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click

        Dim oldDate As Date
        Dim oldWeekDayName As String
        oldDate = txtDate.Text
        oldWeekDayName = WeekdayName(Weekday(oldDate))
        lblDay.Text = "They day is a " & oldWeekDayName
        Dim newDate1 As Date = oldDate
        Dim newDate2 As Date = DateAdd("d", 1, oldDate)
        Dim newDate3 As Date = DateAdd("d", 2, oldDate)
        Dim newDate4 As Date = DateAdd("d", 3, oldDate)
        Dim newDate5 As Date = DateAdd("d", 4, oldDate)
        If oldWeekDayName = "Friday" Then

            If lblTerm.Text <> "5" Then
                lblWindow.Text = newDate1.ToShortDateString & " - " & newDate4.ToShortDateString & " - " & newDate5.ToShortDateString
            Else
                lblWindow.Text = newDate1.ToShortDateString & " - " & newDate4.ToShortDateString
            End If
        Else
            If lblTerm.Text <> "5" Then
                lblWindow.Text = newDate1.ToShortDateString & " - " & newDate2.ToShortDateString & " - " & newDate3.ToShortDateString
            Else
                lblWindow.Text = newDate1.ToShortDateString & " - " & newDate2.ToShortDateString
            End If
        End If

    End Sub

    Function getwindow(ByVal myreference As String) As String
        Dim strsql As String
        strsql = "Select course, instructor, isMidterm,MidStart,isFinal,FinalStart from MasterProctor "
        strsql += "where FamilyString like '%2197-" & myreference & "%'"

        Response.Write(strsql)
        ' Response.End()
        Dim myConnection2 As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand(strsql, myConnection2)
        'Response.Write("select Course, Credits from Courses where course_ID=" & CInt(courseID))
        ' Open the connection and execute the Command
        myConnection2.Open()
        Dim dr2 As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        Dim myReturn As String = ""
        Dim mycourse As String = ""
        Dim myinstructor As String = ""
        Dim mymidwindow As String = ""
        Dim myfinalwindow As String = ""
        If dr2.HasRows = True Then
            While dr2.Read()


                mycourse = dr2("Course") & "-2197-" & myreference
                myinstructor = dr2("Instructor")
                If dr2("isMidterm") = False Then
                    mymidwindow = "No midterm listed, please check your syllabus"
                Else
                    mymidwindow = getwindowdates(dr2("MidStart"))
                End If

                If dr2("isFinal") = False Then
                    myfinalwindow = "No final is listed, please check your syllabus"
                Else
                    myfinalwindow = getwindowdates(dr2("FinalStart"))

                End If

                myReturn = "<b>Course: </b>" & mycourse & "<br>"
                myReturn += "<b>Instructor: </b>" & myinstructor & "<br><br>"
                myReturn += "<b>MidTerm Exam WIndow: </b>"
                myReturn += mymidwindow & "<br>"
                myReturn += "<b>Final Exam Window: </b>"
                myReturn += myfinalwindow & "<br>"
                myReturn += "<br> <span class=""auto-style1"">NOTE: Your instructor may have made changes to these dates. Your syllabus is the final authority for your exam dates.</span>:"
            End While
        Else   'no rows -- no course found
            myReturn = "Course Not Found.  Try again."

        End If
        'addMasterProctor(myfamilystring, myfamily)
        myConnection2.Close()

        Return myReturn
    End Function

    Function getwindowdates(ByVal myDate As String) As String
        Dim myreturn As String = ""
        Dim termlastdigit = "7"
        Dim oldDate As Date
        Dim oldWeekDayName As String
        oldDate = myDate
        oldWeekDayName = WeekdayName(Weekday(oldDate))
        Dim newDate1 As Date = oldDate
        Dim newDate2 As Date = DateAdd("d", 1, oldDate)
        Dim newDate3 As Date = DateAdd("d", 2, oldDate)
        Dim newDate4 As Date = DateAdd("d", 3, oldDate)
        Dim newDate5 As Date = DateAdd("d", 4, oldDate)
        If oldWeekDayName = "Friday" Then

            If termlastdigit <> "5" Then
                myreturn = newDate1.ToShortDateString & " - " & newDate4.ToShortDateString & " - " & newDate5.ToShortDateString
            Else
                myreturn = newDate1.ToShortDateString & " - " & newDate4.ToShortDateString
            End If
        Else
            If termlastdigit <> "5" Then
                myreturn = newDate1.ToShortDateString & " - " & newDate2.ToShortDateString & " - " & newDate3.ToShortDateString
            Else
                myreturn = newDate1.ToShortDateString & " - " & newDate2.ToShortDateString
            End If
        End If

        Return myreturn
    End Function


    Protected Sub txtDate_TextChanged(sender As Object, e As EventArgs) Handles txtDate.TextChanged

    End Sub

    Protected Sub btnSelectDate_Click(sender As Object, e As EventArgs) Handles btnSelectDate.Click
        txtDate.Text = Calendar1.SelectedDate.ToShortDateString
        lblTerm.Text = TxtTerm.Text(TxtTerm.Text.Length - 1)
        Button1.Visible = True
    End Sub

    Protected Sub btnShow_Click(sender As Object, e As EventArgs) Handles btnShow.Click
        lblExamWindows.Text = getwindow(txtReference.Text)
    End Sub
End Class