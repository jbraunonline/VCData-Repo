Imports System.IO
Imports System.Data.SqlClient
Imports System.Data.Sql
Imports Telerik.Web.UI

Public Class BlackboardSetupMidTerm
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Response.Write("This is hard coded to use _BU for both MasterProctor")
    End Sub

    Function GetmyOutlook(ByVal myoutlook As String) As String
        Dim myreturn As String = ""
        Dim myemail As String = ""

        myemail = myoutlook & "@mdc.edu"
        myreturn = "<a href='mailto:" & myemail & " ' target='_top'>" & myoutlook & "</a>"
        Return myreturn
    End Function
    Function LocalMidPass(ByVal MyCourse As String) As String
        Dim myreturn As String = ""
        Dim myDetail As String = ""
        If lblSession.Text = "1" Then
            myDetail = "Mid1_LPass"
        ElseIf lblSession.Text = "8W1" Or lblSession.Text = "6W1" Then
            myDetail = "MidA_LPass"
        ElseIf lblSession.Text = "8W2" Or lblSession.Text = "6W2" Then
            myDetail = "MidB_LPass"
        End If
        Dim strsql As String = "select " & myDetail & " From MasterExamDates where Course ='" & MyCourse & "'"

        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)

        'Response.Write(strsql & "<br>")
        'Response.End()
        Dim myCommand As New SqlCommand(strsql, myConnection)

        ' Open the connection and execute the Command
        myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        If dr.HasRows Then
            While dr.Read()
                myreturn = dr("" & myDetail & "")



            End While
        End If
        dr.Close()
        dr = Nothing
        myConnection.Close()


        Return myreturn
    End Function

    Function RemoteMidPass(ByVal MyCourse As String) As String
        Dim myreturn As String = ""
        Dim myDetail As String = ""
        If lblSession.Text = "1" Then
            myDetail = "Mid1_RPass"
        ElseIf lblSession.Text = "8W1" Or lblSession.Text = "6W1" Then
            myDetail = "MidA_RPass"
        ElseIf lblSession.Text = "8W2" Or lblSession.Text = "6W2" Then
            myDetail = "MidB_RPass"
        End If
        Dim strsql As String = "select " & myDetail & " From MasterExamDates where Course ='" & MyCourse & "'"

        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)

        'Response.Write(strsql & "<br>")
        Dim myCommand As New SqlCommand(strsql, myConnection)

        ' Open the connection and execute the Command
        myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        If dr.HasRows Then
            While dr.Read()
                myreturn = dr("" & myDetail & "")



            End While
        End If
        dr.Close()
        dr = Nothing
        myConnection.Close()


        Return myreturn
    End Function

    Function getProctorMid(ByVal myID As Integer) As String
        Dim myreturn As String = ""

        ']]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]] change +BU
        Dim strsql As String = "select MidPaper,MidCalculator,MidGraph,Headphones,PM_ANXMTR From MasterProctor where ID =" & myID
        '''Dim strsql As String = "select MidPaper,MidCalculator,MidGraph,Headphones,PM_ANXMTR From MasterProctor_BU where ID =" & myID


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



    Protected Sub RadGrid1_ItemDataBound(ByVal sender As Object, ByVal e As GridItemEventArgs)
        If TypeOf e.Item Is GridDataItem Then
            Dim dataItem As GridDataItem = CType(e.Item, GridDataItem)
            dataItem("RowNumber").Text = Convert.ToString(e.Item.ItemIndex + 1)
        End If
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        lblTerm.Text = ddlTerm.SelectedValue
        lblSession.Text = ddlSession.SelectedValue
        lblExam.Text = radioExam.SelectedValue
    End Sub

    Protected Sub btnReturn_Click(sender As Object, e As EventArgs) Handles btnReturn.Click
        Response.Redirect("~/ProctorReporting/ExamReports.aspx")
    End Sub
End Class