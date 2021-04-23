Imports System.IO
Imports System.Data.SqlClient
Imports System.Data.Sql
Public Class _2207CWCS_test
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnReference_Click(sender As Object, e As EventArgs) Handles btnReference.Click
        Dim myterm As String = "2207"
        Dim myround As String = ""
        Dim myincount As Integer = 0
        Dim myovercount As Integer = 0

        Dim fileStream As FileStream = File.Open(Server.MapPath("Data/2207_CWCSx.csv"), FileMode.Open, FileAccess.Read)

        Dim streamReader As StreamReader = New StreamReader(fileStream)

        Dim nLine As Integer = 0

        While (streamReader.Peek() > -1)

            Dim strLine As String = streamReader.ReadLine()

            nLine = nLine + 1
            Dim myTotal As String = "0'"
            Dim myInload As String = "0"
            Dim myOverload As String = "0"
            Dim myBanked As String = "0"


            'Response.Write(nLine & "<br>")
            'Response.Write(strLine & "<br>")
            Dim astrValues As String() = strLine.Split(CChar(","))
            'Dim newname As String = "<font color=red>not here </font>"
            If astrValues.Length <> 7 Then
                '''''changed 6 t0 7
                Response.Write("<B> An error occurred while processing Line " & nLine.ToString() & ":<B><br><br>")
                Response.Write(strLine)

                Exit While

            End If

            Dim mystring0 As String = astrValues(0)  'round distributed
            Dim mystring1 As String = astrValues(1)  'reference
            Dim mystring2 As String = astrValues(2)  ''MDID
            Dim mystring3 As String = astrValues(3)  'Points
            Dim mystring4 As String = astrValues(4)  'Paid
            Dim mystring5 As String = astrValues(5)   ''Banked
            Dim mystring6 As String = astrValues(6)   'CWCSdconfirm


            Response.Write(mystring6 & "<BR>")
            If mystring6 = "1" Then
                If mystring0.Contains("Inload") Then
                    myincount = myincount + 1
                    myInload = mystring3
                    Response.Write("<font color=red>Inload</font>")
                End If

                If astrValues(0).Contains("Overload") Then
                    myovercount = myovercount + 1
                    myOverload = astrValues(4)
                End If
                If astrValues(6) <> "0" Then
                    myBanked = astrValues(5)


                End If

                myTotal = astrValues(3)
                Response.Write(astrValues(0) & "," & astrValues(1) & "," & astrValues(2) & "," & astrValues(3) & "," & astrValues(4) & "," & astrValues(5) & "," & astrValues(6) & "|<br>")

                Response.Write(getusername(astrValues(2)) & "<BR>")
                Response.Write(getcourse(astrValues(1)) & "<BR>")

                Response.Write(myterm & "," & astrValues(1) & "," & getusername(astrValues(2)) & "," & myTotal & "," & myInload & "," & myOverload & "," & myBanked & "<br>")
                Response.Write(getCMR(astrValues(2), astrValues(1)) & "<br><br>")

            End If
        End While
        Response.Write(" In=" & myincount & " MyOverload  = " & myovercount)

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
                Dim myvar As String = ""

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

    Function getcourse(ByVal MyReference As String) As String
        Dim myreturn As String = "UNKNOWN_Course"
        Dim strsql As String = "select  course from CMR where Reference ='" & MyReference & "'"
        'Response.Write(strsql)
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand(strsql, myConnection)
        myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        If dr.HasRows Then
            While dr.Read()
                Dim myvar As String

                myreturn = dr("Course")


            End While
        Else
            ' Response.Write("NO DATa")
        End If
        dr.Close()
        dr = Nothing
        myConnection.Close()




        Return myreturn
    End Function
    Function getCMR(ByVal myMDCID As String, ByVal myReference As String) As String
        Dim myreturn As String = "UNKNOWN_CMR"
        Dim strsql As String = "select ID from CMR where MDCID ='" & myMDCID & "' And reference ='" & myReference & "'"
        'Response.Write(strsql)
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand(strsql, myConnection)
        myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        If dr.HasRows Then
            While dr.Read()


                myreturn = CStr(dr("ID"))


            End While
        Else
            ' Response.Write("NO DATa")
        End If
        dr.Close()
        dr = Nothing
        myConnection.Close()




        Return myreturn
    End Function

End Class