Imports Telerik.Web.UI
Imports Telerik.Web.UI.Skins
Imports System.IO
Imports System.Data.SqlClient
Imports System.Data.Sql
Public Class GetSetupData
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        lblTerm.Text = "7"
    End Sub
    Function GetWindow(ByVal mydate As Date) As String
        Dim myreturn As String = ""
        Dim oldDate As Date
        Dim oldWeekDayName As String
        oldDate = mydate
        oldWeekDayName = WeekdayName(Weekday(oldDate))
        ' lblDay.Text = "They day is a " & oldWeekDayName
        Dim newDate1 As Date = oldDate
        Dim newDate2 As Date = DateAdd("d", 1, oldDate)
        Dim newDate3 As Date = DateAdd("d", 2, oldDate)
        Dim newDate4 As Date = DateAdd("d", 3, oldDate)
        Dim newDate5 As Date = DateAdd("d", 4, oldDate)
        If oldWeekDayName = "Friday" Then

            If lblTerm.Text <> "5" Then
                myreturn = newDate1.ToShortDateString & " - " & newDate4.ToShortDateString & " - " & newDate5.ToShortDateString
            Else
                myreturn = newDate1.ToShortDateString & " - " & newDate4.ToShortDateString
            End If
        Else
            If lblTerm.Text <> "5" Then
                myreturn = newDate1.ToShortDateString & " - " & newDate2.ToShortDateString & " - " & newDate3.ToShortDateString
            Else
                myreturn = newDate1.ToShortDateString & " - " & newDate2.ToShortDateString
            End If
        End If
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

    Function getProctor(ByVal myID As Integer) As String
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

End Class