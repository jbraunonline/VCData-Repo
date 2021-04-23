Imports System.IO
Imports System.Data.SqlClient
Imports System.Data.Sql

Public Class CWCSupload
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim strFileName As String

        If UploadFile.PostedFile.FileName.Length > 0 Then
            strFileName = System.IO.Path.GetFileName(UploadFile.PostedFile.FileName)
            UploadFile.PostedFile.SaveAs(Server.MapPath("Data/CWCS.csv"))

        End If

        lblFileName.Text = UploadFile.PostedFile.FileName
        lblFileSize.Text = UploadFile.PostedFile.ContentLength
        lblFileContentType.Text = UploadFile.PostedFile.ContentType

    End Sub

    Protected Sub btnInput_Click(sender As Object, e As EventArgs) Handles btnInput.Click
        Dim myterm As String = "2213"
        Dim myround As String = ""


        Dim fileStream As FileStream = File.Open(Server.MapPath("Data/CWCS.csv"), FileMode.Open, FileAccess.Read)

        Dim streamReader As StreamReader = New StreamReader(fileStream)

        Dim nLine As Integer = 0

        While (streamReader.Peek() > -1)

            Dim strLine As String = streamReader.ReadLine()

            nLine = nLine + 1
            Dim myTotal As String = "0'"



            'Response.Write(nLine & "<br>")
            'Response.Write(strLine & "<br>")
            Dim astrValues As String() = strLine.Split(CChar(","))
            'Dim newname As String = "<font color=red>not here </font>"
            If astrValues.Length <> 8 Then
                '''''changed 6 t0 7
                Response.Write("<B> An error occurred while processing Line " & nLine.ToString() & ":<B><br><br>")
                Response.Write(strLine)

                Exit While

            End If
            ''''''Inload,5265,FT,aaguadoj,12,12,0,0
            '''
            Dim mySelect As String = astrValues(0)  'round distributed
            Dim myReference As String = astrValues(1)  'reference
            Dim myUserStatus As String = astrValues(2)  'userstatus
            Dim myUsername As String = astrValues(3)  'MDID
            Dim myPoints As String = astrValues(4)  'TotalPoints
            Dim myInload As String = astrValues(5)   'Paid
            Dim myOverload As String = astrValues(6)   'Overpaid
            Dim myBanked As String = astrValues(7)   'Overpaid
            Response.Write(astrValues(0) & "," & astrValues(1) & "," & astrValues(2) & "," & astrValues(3) & "," & astrValues(4) & "," & astrValues(5) & "," & astrValues(6) & "," & astrValues(7) & "|<br>")

            'If astrValues(0).Contains("Inload") Then
            '     myround = "Inload"
            '     myInload = astrValues(4)
            '     myOverload = "0"
            '     myBanked = "0"
            ' End If

            'If astrValues(0).Contains("Overload") Then
            ' myround = "Overload"
            ' myInload = "0"
            ' myOverload = astrValues(4)
            ' myBanked = "0"
            'End If

            'If astrValues(6) <> "" Then
            'myround = "Banked"
            'myBanked = astrValues(6)
            'myInload = "0"
            'myOverload = "0"
            'End If
            'myTotal = astrValues(4)
            'Response.Write(myterm & " " & astrValues(1) & " " & getusername(astrValues(3)) & " " & myTotal & " " & myInload & " " & myOverload & " " & myBanked & "<br>")


            InsertPoints(myterm, myReference, myUsername, myPoints, myInload, myOverload, myBanked, mySelect)

            ' Response.Write(astrValues(0) & "--- " & myround & "<br>")

            'If RadioButtonList1.SelectedValue <> "Preview" Then
            'Dim i As Integer = 0
            'For i = 0 To 6
            'Response.Write(astrValues(i) & ",")
            'Next
            'Response.Write("<br>")
            'Response.Write(getusername(astrValues(3)))
            'Response.Write("<br>")
            'End If
        End While
    End Sub

    Function getusername(ByVal myMDCID As String) As String
        Dim myreturn As String = "UNKNOWN_FACULTY"
        Dim strsql As String = "select top 1 username from CMR where MDCID ='" & myMDCID & "'"
        'Response.Write(strsql)
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand(strsql, myConnection)
        myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        If dr.HasRows Then
            While dr.Read()
                Dim myvar As String

                myreturn = dr("Username")


            End While
        Else
            ' Response.Write("NO DATa")
        End If
        dr.Close()
        dr = Nothing
        myConnection.Close()




        Return myreturn
    End Function

    Protected Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        Dim myerror As Integer = 0
        Using conn As New SqlConnection(ConfigurationManager.ConnectionStrings("VC_VCDataConnectionString").ConnectionString)
            Using mycommand As New SqlCommand()
                With mycommand
                    .Connection = conn
                    mycommand.CommandText = "sp_InsertAdmin_Points"
                    mycommand.CommandType = CommandType.StoredProcedure

                    mycommand.Parameters.Add("@id", SqlDbType.Int).Direction = ParameterDirection.Output

                    'mycommand.Parameters.Add("@Term", SqlDbType.VarChar).Value = txtTerm.Text
                    '  mycommand.Parameters.Add("@Reference", SqlDbType.VarChar).Value = txtReference.Text
                    '  mycommand.Parameters.Add("@UserName", SqlDbType.VarChar).Value = txtUsername.Text
                    ''  mycommand.Parameters.Add("@Points", SqlDbType.Decimal).Value = CDec(txtTotalPoints.Text)
                    ' mycommand.Parameters.Add("@PointsPaid", SqlDbType.Decimal).Value = CDec(txtPtPaid.Text)
                    ''  mycommand.Parameters.Add("@PointsOver", SqlDbType.Decimal).Value = CDec(txtPtOver.Text)
                    ' mycommand.Parameters.Add("@PointsBanked", SqlDbType.Decimal).Value = CDec(txtPtBank.Text)
                    ' mycommand.Parameters.Add("@Points_Source", SqlDbType.VarChar).Value = "CWCS"

                    Try
                        conn.Open()
                        mycommand.ExecuteNonQuery() '
                    Catch Ex As Exception
                        'Response.Write(Ex.Message)
                        If Ex.Message.Contains("UC_CMRID") Then
                            Response.Write("<font color=red>DuplicateMessage</font><br>")
                            myerror = 1
                        End If
                    Finally

                    End Try

                    If myerror = 0 Then
                        Response.Write("My CMR_ID = " & mycommand.Parameters("@id").Value.ToString())
                        Response.Write("<br>")
                    End If

                End With
            End Using
        End Using
    End Sub

    Function InsertPoints(ByVal myTerm As String, ByVal myReference As String, ByVal myUsername As String, ByVal myPoints As String, ByVal myPointsPaid As String, ByVal myPointsOver As String, ByVal myPointsBanked As String, ByVal myselect As String) As String
        Dim myerror As Integer = 0
        Dim CMR_ID As String = ""
        Using conn As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
            Using mycommand As New SqlCommand()
                With mycommand
                    .Connection = conn
                    conn.Open()
                    mycommand.CommandText = "sp_InsertAdmin_Point"
                    mycommand.CommandType = CommandType.StoredProcedure

                    mycommand.Parameters.Add("id", SqlDbType.Int).Direction = ParameterDirection.Output

                    mycommand.Parameters.Add("Term", SqlDbType.VarChar, 50).Value = myTerm
                    mycommand.Parameters.Add("Reference", SqlDbType.VarChar, 50).Value = myReference
                    mycommand.Parameters.Add("MDCID", SqlDbType.VarChar, 50).Value = myUsername
                    mycommand.Parameters.Add("Points", SqlDbType.Decimal, 18).Value = CDec(myPoints)
                    mycommand.Parameters.Add("PointsInload", SqlDbType.Decimal, 18).Value = CDec(myPointsPaid)
                    mycommand.Parameters.Add("PointsOver", SqlDbType.Decimal, 18).Value = CDec(myPointsOver)
                    mycommand.Parameters.Add("PointsBanked", SqlDbType.Decimal, 18).Value = CDec(myPointsBanked)
                    mycommand.Parameters.Add("Points_Source", SqlDbType.VarChar, 10).Value = myselect
                    mycommand.Parameters.Add("UserStatus", SqlDbType.VarChar, 10).Value = "FT"
                    Try

                        mycommand.ExecuteNonQuery() '
                    Catch Ex As Exception
                        'Response.Write(Ex.Message)
                        'If Ex.Message.Contains("UC_CMRID") Then
                        Response.Write("<font color=red>DuplicateMessage</font><br>")
                        Response.Write(Ex.Message.ToString)
                        'End If
                    Finally

                    End Try


                    'mycommand.Parameters("id").Value.ToString()



                End With
            End Using

        End Using
        Return CMR_ID
    End Function

    Protected Sub Button4_Click(sender As Object, e As EventArgs) Handles Button4.Click
        InsertPoints("2213", "5265", "jimbo", 12, 12, 0, 0, "Inload")
    End Sub
End Class