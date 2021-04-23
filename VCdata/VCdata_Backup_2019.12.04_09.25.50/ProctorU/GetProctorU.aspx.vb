Imports System.IO
Imports System.Data.SqlClient
Imports System.Data.Sql
Imports Telerik.Web.UI

Public Class GetProctorU
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        lblTerm.Text = ddlTerm.SelectedValue
        lblSession.Text = ddlSession.SelectedValue
        lblExam.Text = radioExam.SelectedValue
        getworkinglist()
        'Panel1.Visible = False
        ' Panel2.Visible = True
    End Sub
    Protected Sub getworkinglist()
        Dim SqlDataSource1 As New SqlDataSource()
        SqlDataSource1.ID = "SqlDataSource1"
        Me.Page.Controls.Add(SqlDataSource1)
        SqlDataSource1.ConnectionString = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString

        Dim mysql As String = ""
        'Response.Write(radioSelect.SelectedItem.Text)

        mysql = "SELECT [ID], [MasterProctor_ID], [Course], [Reference], [Instructor], [ExamStart], [ExamEnd], [ExamTime], [LExamName], [RExamName], [LPassword], [RPassword], [Lockdown], [Instructions] FROM [MasterProctorTesting]  "
        mysql += " WHERE [Term] ='" & ddlTerm.SelectedValue & "' AND [ExamType] ='" & radioExam.SelectedValue & "' AND [Session] = '" & ddlSession.SelectedValue & "' And ProctorX=1 Order By Course"

        'Response.Write(mysql)
        SqlDataSource1.SelectCommand = mysql '"SELECT Reference,Course, Course_ID, MDCID,IsAssociated,iscopyready, copyReadyDate from BBCourses where course='" & mycourse & "' and Term_Key='20152' And Category <>  'Master' Order By MDCID"



        'Response.Write("SELECT Course, Course_ID from BBCourses where course='" & mycourse & "' and Term_Key='20152'")

        RadGrid1.DataSource = SqlDataSource1
        RadGrid1.DataBind()
    End Sub

    Function GetmyExam(ByVal Course As String, ByVal Reference As String, ByVal ExamName As String) As String
        Dim myReturn As String = ""
        Dim myreference As String = Replace(Reference, "2197-", "")
        myReturn = myreference & " - " & Course & " - " & ExamName

        Return myReturn
    End Function

    Function GetStart(ByVal mystart As Date) As String
        Dim myreturn As String = mystart.ToShortDateString
        myreturn = myreturn & "  12:00 AM"

        Return myreturn
    End Function

    Function GetStop(ByVal mystart As Date) As String
        Dim myreturn As String = mystart.ToShortDateString
        myreturn = myreturn & "  9:30 PM"

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


    Function getFinalInstructions(ByVal myID As Integer) As String

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