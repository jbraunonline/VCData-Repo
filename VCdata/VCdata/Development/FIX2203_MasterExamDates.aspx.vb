Imports System.Configuration
Imports System.Data
Imports System.Data.SqlClient
Imports System.IO

Public Class FIX2203_MasterExamDates
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnUpload_Click(sender As Object, e As EventArgs) Handles btnUpload.Click
        Dim myflag As Integer

        Dim fileStream As FileStream = File.Open(Server.MapPath("Data/2203MasterProctorDatesFix.txt"), FileMode.Open, FileAccess.Read)

        Dim streamReader As StreamReader = New StreamReader(fileStream)

        Dim nLine As Integer = 0
        Dim newCount As Integer = 0
        Dim changeCount As Integer = 0
        Dim noCHange As Integer = 0

        While (streamReader.Peek() > -1)



            Dim strLine As String = streamReader.ReadLine()
            strLine = Replace(strLine, ",", "|")
            myflag = 1
            Dim mymaster As String = ""
            nLine = nLine + 1
            Response.Write(nLine & " ")



            If (strLine = "") Then
                Exit While
            End If
            'Response.Write(nLine & "<br>")
            'Response.Write(strLine & "<br>")
            Dim astrValues As String() = strLine.Split(CChar("|"))

            If astrValues.Length = 5 Then
                '''''changed 6 t0 7



                'Response.Write("<br>")
                mymaster = astrValues(0)

                Response.Write(astrValues(0))
                Response.Write("|")
                Response.Write(astrValues(1))
                Response.Write("|")
                Response.Write(astrValues(2))
                Response.Write("|")
                Response.Write(astrValues(3))
                Response.Write("|")
                Response.Write(astrValues(4))


                Response.Write("<br>")

            Else
                Response.Write("<B> ERROR Line " & nLine.ToString() & ":</B>" & strLine & "<br>")
            End If
            'HOLD SQL HOLD........................................................................

            UpdateData(astrValues(0), astrValues(1), astrValues(2), astrValues(3), astrValues(4))





        End While

        streamReader.Close()
        fileStream.Close()




    End Sub

    Sub UpdateData(ByVal myCourse As String, ByVal myMidStart As String, ByVal myMidEnd As String, ByVal myFinalStart As String, ByVal myFinalEnd As String)
        Dim strsql As String = ""
        strsql = "Update MasterExamDates set "
        strsql += "Mid1_Start ='" & myMidStart & "',"
        strsql += "Mid1_End ='" & myMidEnd & "',"
        strsql += "Final1_Start ='" & myFinalStart & "',"
        strsql += "Final1_End ='" & myFinalEnd & "'"
        strsql += " where term = '2203' and Course ='" & myCourse & "'"

        Response.Write(Strsql & "<br>")

        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand(Strsql, myConnection)
        Try

            myConnection.Open()
            'HOLD SQL HOLD...]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]].....................................................................

            If RadioButtonList1.SelectedValue = "Input" Then
                'HOLD SQL HOLD..[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[_HOLD_[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[..
                myCommand.ExecuteNonQuery()
                Response.Write("I ran <br>")

            End If


        Catch
            Response.Write("failed to update record <br>")
        Finally
            If myConnection.State = ConnectionState.Open Then
                myConnection.Close()
            End If
        End Try



    End Sub

End Class