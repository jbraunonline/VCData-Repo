Imports System.Web
Imports System.Net
Imports System.Xml
Imports System.Configuration
Imports System.Data
Imports System.Data.SqlClient
Imports System.IO

Public Class ProctorExam
    Implements IHttpModule

    Private WithEvents _context As HttpApplication

    ''' <summary>
    '''  You will need to configure this module in the Web.config file of your
    '''  web and register it with IIS before being able to use it. For more information
    '''  see the following link: http://go.microsoft.com/?linkid=8101007
    ''' </summary>
#Region "IHttpModule Members"

    Public Sub Dispose() Implements IHttpModule.Dispose

        ' Clean-up code here

    End Sub

    Public Sub Init(ByVal context As HttpApplication) Implements IHttpModule.Init
        _context = context
    End Sub

#End Region

    Public Sub OnLogRequest(ByVal source As Object, ByVal e As EventArgs) Handles _context.LogRequest

        ' Handles the LogRequest event to provide a custom logging 
        ' implementation for it

    End Sub

    Public Function getThisTerm() As String
        Dim myreturn As String = "2197"
        Return myreturn
    End Function

    Public Function getNextTerm() As String
        Dim myreturn As String = "2203"
        Return myreturn
    End Function


    Public Function getNewMasterTerm() As String
        Dim myreturn As String = "2205"
        Return myreturn
    End Function


    Public Function getCourseByID(ByVal myID As String) As String
        Using myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
            Dim myreturn As String = "Not Founc"
            Dim strsql As String
            strsql = "SELECT Course FROM CMR Where ID=" & myID

            Dim myCommand As New SqlCommand(strsql, myConnection)

            ' Open the connection and execute the Command
            myConnection.Open()
            Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
            If dr.HasRows Then
                While dr.Read()
                    myreturn = dr("Course")
                End While
            End If
            Return myreturn
            dr.Close()
            dr = Nothing
        End Using


    End Function

    Function getINI(ByVal mypage As String, ByVal myItem As String) As String
        Dim myreturn As String = ""
        Dim strSQL As String = "SELECT Value"
        strSQL += " FROM  dbo.VC_INI "
        strSQL += "WHERE (Page = '" & mypage & "' and item='" & myItem & "')"
        ' Create Instance of Connection and Command Object
        Using myConnection As New SqlConnection(ConfigurationManager.AppSettings("ConnectionString"))
            Dim myCommand As New SqlCommand(strSQL, myConnection)

            ' Open the connection and execute the Command
            myConnection.Open()
            Using dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
                While dr.Read
                    If Not IsDBNull(dr("value")) Then
                        myreturn = dr("Value")
                    End If
                End While
                myConnection.Close()


            End Using
        End Using
        Return myreturn
    End Function

    Public Function GetLockDown(ByVal myID As Integer, ByVal myExam As String) As String
        '//Note that you must pass in the Id from MasterProctor so get it from MasterProctor.id of MasterproctorTesting.MasterProctor_ID
        ' and it must be used on a page where the radioExam.SelectedVlue  is Mid or Final
        '******************OBSOLETE********************************* this only checks for essay   Use GetTheLoackdown function
        Dim myreturn As String = "True"
        Dim Myessay As String = "False"
        Dim strsql As String = ""

        If myExam = "Mid" Then
            strsql += "Select Essay from MasterProctor where ID =" & myID
        End If

        If myExam = "Final" Then
            strsql += "Select FinalEssay as Essay from MasterProctor where ID =" & myID
        End If

        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
        'Response.Write(strsql & "<br>")
        Dim myCommand As New SqlCommand(strsql, myConnection)

        ' Open the connection and execute the Command
        myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        If dr.HasRows Then
            While dr.Read()
                Myessay = CStr(dr("Essay"))
            End While
        End If
        dr.Close()
        dr = Nothing
        myConnection.Close()
        If Myessay = "True" Then
            myreturn = "False"
        End If


        Return myreturn
    End Function




    Public Function getTestingInstructions(ByVal myID As Integer, ByVal myExam As String) As String

        Dim myreturn As String = ""
        If myExam = "Final" Then
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
                    If InStr(dr("PF_ANXMTR"), "Headphones") > 0 Or InStr(dr("PF_ANXMTR"), "Speakers") > 0 Then

                        myBlob += " The computer on which the exam is taken must have a media player installed and the student will need to use headphones."
                    End If
                    If InStr(dr("PF_ANXMTR"), "Note Pad") > 0 Then
                        myBlob += " Student allowed to open Microsoft NotePad on testing computer to create computer code.  "
                    End If
                    myreturn = mypaper & mycalc & myGraph & myHeadphones & myBlob


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
                    If InStr(dr("PM_ANXMTR"), "Headphones") > 0 Or InStr(dr("PM_ANXMTR"), "Speakers") > 0 Then

                        myBlob += " The computer on which the exam is taken must have a media player installed and the student will need to use headphones."
                    End If
                    If InStr(dr("PM_ANXMTR"), "Note Pad") > 0 Then
                        myBlob += " Student allowed to open Microsoft NotePad on testing computer to create computer code.  "
                    End If
                    myreturn = mypaper & mycalc & myGraph & myHeadphones & myBlob


                End While
            End If
            dr.Close()
            dr = Nothing
            myConnection.Close()

        End If
        Return myreturn
    End Function

    Public Function GetRemotePass(ByVal MyCourse As String, ByVal mySession As String, myExam As String) As String
        Dim myreturn As String = ""
        Dim myDetail As String = ""

        If myExam = "Mid" Then
            If mySession = "1" Then
                myDetail = "Mid1_RPass"
            ElseIf mySession = "8W1" Or mySession = "6W1" Then
                myDetail = "MidA_RPass"
            ElseIf mySession = "8W2" Or mySession = "6W2" Then
                myDetail = "MidB_RPass"
            ElseIf mySession = "12W" Then
                myDetail = "Mid1_RPass"
            End If

        End If

        If myExam = "Final" Then

            If mySession = "1" Then
                myDetail = "Final1_RPass"
            ElseIf mySession = "8W1" Or mySession = "6W1" Then
                myDetail = "FInalA_RPass"
            ElseIf mySession = "8W2" Or mySession = "6W2" Then
                myDetail = "FinalB_RPass"
            ElseIf mySession = "12W" Then
                myDetail = "Final1_RPass"
            End If

        End If

        Dim strsql As String = "select " & myDetail & " From MasterExamDates where Course ='" & MyCourse & "'"

        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)

        Dim myCommand As New SqlCommand(strsql, myConnection)

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

    Public Function GetLocalPass(ByVal MyCourse As String, ByVal mySession As String, myExam As String) As String
        Dim myreturn As String = ""
        Dim myDetail As String = ""

        If myExam = "Mid" Then
            If mySession = "1" Then
                myDetail = "Mid1_LPass"
            ElseIf mySession = "8W1" Or mySession = "6W1" Then
                myDetail = "MidA_LPass"
            ElseIf mySession = "8W2" Or mySession = "6W2" Then
                myDetail = "MidB_LPass"
            ElseIf mySession = "12W" Then
                myDetail = "Mid1_LPass"
            End If

        End If

        If myExam = "Final" Then

            If mySession = "1" Then
                myDetail = "Final1_LPass"
            ElseIf mySession = "8W1" Or mySession = "6W1" Then
                myDetail = "FInalA_LPass"
            ElseIf mySession = "8W2" Or mySession = "6W2" Then
                myDetail = "FinalB_LPass"
            ElseIf mySession = "12W" Then
                myDetail = "Final1_LPass"
            End If

        End If

        Dim strsql As String = "select " & myDetail & " From MasterExamDates where Course ='" & MyCourse & "'"

        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)

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


    Public Function GetTheLockDown(ByVal myID As Integer, ByVal myExam As String) As String
        Dim myreturn As String = "True"
        Dim mycount As Integer = 0

        If myExam = "Final" Then
            Dim strsql As String = "select FinalEssay, FinalHeadphones,PF_ANXMTR From MasterProctor where ID =" & myID

            Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)

            Dim myCommand As New SqlCommand(strsql, myConnection)

            ' Open the connection and execute the Command
            myConnection.Open()
            Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
            If dr.HasRows Then
                While dr.Read()

                    If dr("FinalEssay") = True Then
                        mycount = mycount + 1
                    End If

                    If dr("FinalHeadphones") = True Then
                        mycount = mycount + 1
                    End If

                    If InStr(dr("PF_ANXMTR"), "PDF") > 0 Then
                        mycount = mycount + 1
                    End If

                    If InStr(dr("PF_ANXMTR"), "Excel") > 0 Then
                        mycount = mycount + 1
                    End If
                    If InStr(dr("PF_ANXMTR"), "Headphones") > 0 Then
                        mycount = mycount + 1
                    End If

                End While
            End If
            dr.Close()
            dr = Nothing
            myConnection.Close()



        ElseIf myExam = "Mid" Then
            Dim strsql As String = "select Essay,Headphones,PM_ANXMTR From MasterProctor where ID =" & myID

            Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)

            Dim myCommand As New SqlCommand(strsql, myConnection)

            ' Open the connection and execute the Command
            myConnection.Open()
            Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
            If dr.HasRows Then
                While dr.Read()

                    If dr("Essay") = True Then
                        mycount = mycount + 1
                    End If

                    If dr("Headphones") = True Then
                        mycount = mycount + 1
                    End If

                    If InStr(dr("PM_ANXMTR"), "PDF") > 0 Then
                        mycount = mycount + 1
                    End If

                    If InStr(dr("PM_ANXMTR"), "Excel") > 0 Then
                        mycount = mycount + 1
                    End If

                    If InStr(dr("PM_ANXMTR"), "Headphones") > 0 Then
                        mycount = mycount + 1
                    End If


                End While
            End If
            dr.Close()
            dr = Nothing
            myConnection.Close()

        End If
        If mycount > 0 Then

            myreturn = "False"
        End If
        Return myreturn
    End Function



End Class
