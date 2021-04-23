Imports System.IO
Imports System.Data.SqlClient
Imports System.Data.Sql

Public Class ProctorDataTest
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim myfamily As String = "2197-10087,2197-10881,2197-10882"

        Dim astrValues As String() = myfamily.Split(CChar(","))

        For i = LBound(astrValues) To UBound(astrValues)
            'Response.Write(astrValues(i) & "<br>")
        Next i
        getfamily()

    End Sub

    Sub getfamily()
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
        Dim myreturn As Boolean = 0
        Dim strsql As String
        strsql = "SELECT ID, Familystring,Course, Instructor, MidStart,MidEnd,MidTime, MidPaper, MidCalculator  FROM MasterProctor Where session = '1' and isMidterm = 1"
        'Response.Write(strsql & "<br>")
        Dim myCommand As New SqlCommand(strsql, myConnection)

        ' Open the connection and execute the Command
        myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        If dr.HasRows Then
            While dr.Read()
                Dim myfamily As String = dr("Familystring")
                Dim mypaper As String = ""
                If dr("MidPaper") = True Then
                    mypaper = "Uses Paper and Pencil"
                End If

                Dim mycalc As String = ""

                If dr("MidCalculator") = True Then
                    mypaper = "Calculator allowed,- including scientific Or financial calculator (no graphing Or cell/mobile phone calculators)"
                End If


                If dr("MidPaper") = True Then
                    mypaper = "Uses Paper and Pencil"
                End If
                Dim astrValues As String() = myfamily.Split(CChar(","))

                For i = LBound(astrValues) To UBound(astrValues)
                    Response.Write(dr("Course") & "-" & astrValues(i) & "  " & dr("Instructor") & "  " & getProctor(dr("ID")) & "<br>")


                Next i




                'sponse.Write(dr("Familystring"))
                ' Response.Write("<br>")
            End While
        End If
        dr.Close()
        dr = Nothing
        myConnection.Close()
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
                If dr("MidPaper") = True Then
                    mypaper = " SCRAP PAPER & PENCIL allowed - scrap paper must be disposed of when test is concluded."
                End If

                Dim mycalc As String = ""
                If dr("MidCalculator") = True Then
                    mypaper = " CALCULATOR allowed, including scientific or financial calculator (no graphing or cell/mobile phone calculators). "
                End If

                Dim myGraph As String = ""
                If dr("MidGraph") = True Then
                    mypaper = "Uses Paper and Pencil"
                End If

                Dim myHeadphones As String = ""
                If dr("Headphones") = True Then
                    mypaper = " The computer on which the exam is taken must have a media player installed and the student will need to use headphones."
                End If

                Dim myBlob As String = ""
                If InStr(dr("PM_ANXMTR"), "PDF") > 0 Then
                    myBlob = " Students need access, open and read PDF files "
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