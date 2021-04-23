Imports System.IO
Imports System.Data.SqlClient
Imports System.Data.Sql
Imports Telerik.Web.UI

Public Class BlackboardSetup
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
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
End Class