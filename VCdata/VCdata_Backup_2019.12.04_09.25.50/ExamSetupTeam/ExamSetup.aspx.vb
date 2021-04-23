Imports System.IO
Imports System.Data.SqlClient
Imports System.Data.Sql
Imports Telerik.Web.UI


Public Class ExamSetup
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Panel1.Visible = True
        Panel2.Visible = True
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        lblTerm.Text = ddlTerm.SelectedValue
        lblSession.Text = ddlSession.SelectedValue
        lblExam.Text = radioExam.SelectedValue
        Panel1.Visible = True
        Panel2.Visible = True
    End Sub

    Function GetOutlook(ByVal myinstructor As String) As String
        Dim myreturn As String = ""
        Dim myemail As String = ""

        myemail = email(myinstructor) & "@mdc.edu"
        myreturn = "<a href='mailto:" & myemail & " ' target='_top'>" & myinstructor & "</a>"
        Return myreturn
    End Function

    Function GetExam(ByVal mySession As String, ByVal myExam As String) As String
        Dim myreturn As String = ""

        myreturn = mySession & " / " & myExam
        Return myreturn
    End Function

    Function email(ByVal myname As String) As String
        Dim myreturn As String = ""
        Dim myConnection2 As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand("Select Outlook from MasterProctor where Instructor= '" & myname & "'", myConnection2)
        'Response.Write("select Course, Credits from Courses where course_ID=" & CInt(courseID))
        ' Open the connection and execute the Command
        myConnection2.Open()
        Dim dr2 As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        Dim myCourseList As String = ""

        While dr2.Read()


            myreturn = dr2("Outlook")


        End While

        dr2.Close()
        dr2 = Nothing
        myConnection2.Close()


        Return myreturn
    End Function

    Protected Sub btnReset_Click(sender As Object, e As EventArgs) Handles btnReset.Click
        Panel1.Visible = True
        Panel2.Visible = False
    End Sub

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

    Function getTestingInstructions(ByVal myID As Integer) As String

        Dim myreturn As String = ""
        If lblExam.Text = "Final" Then
            Dim strsql As String = "select FinalPaper,FinalCalculator,FinalGraph,FinalHeadphones,PF_ANXMTR From MasterProctor where ID =" & myID

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

                    If dr("FinalPaper") = True Then
                        mypaper = " SCRAP PAPER & PENCIL allowed - scrap paper must be disposed of when test is concluded."
                    End If

                    If dr("FInalCalculator") = True And dr("FinalGraph") = True Then
                        If dr("FinalGraph") = True Then
                            myGraph = " Any type calculator allowed (EXCEPT cell/mobile phone calculators). "
                            mycalc = ""
                        End If
                    Else


                        If dr("FinalCalculator") = True Then
                            mycalc = " CALCULATOR allowed, including scientific or financial calculator (NO GRAPHING or CELL/MOBILE PHONE calculators). "
                        End If


                        If dr("FInalGraph") = True Then
                            myGraph = " Any type calculator allowed (EXCEPT cell/mobile phone calculators). "
                        End If
                    End If

                    If dr("FInalHeadphones") = True Then
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



        Else
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

        End If
        Return myreturn
    End Function

End Class