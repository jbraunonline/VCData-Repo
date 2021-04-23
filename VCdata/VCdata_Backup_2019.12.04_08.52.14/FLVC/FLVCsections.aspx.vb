Imports System.IO
Imports System.Data.SqlClient
Imports System.Data.Sql

Public Class FLVCsecrions
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub


    Protected Sub getData_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles getData.Click
        Response.Write("CourseID,")
        Response.Write("ReferenceNumber,")
        Response.Write("EnrollEnd,")
        Response.Write("CourseStart,")
        Response.Write("CourseEnd,")
        Response.Write("TermYear,")
        Response.Write("SchoolTerm,")
        Response.Write("TermChoiceID,")
        Response.Write("TuitionIS,")
        Response.Write("GSFIS,")
        Response.Write("TuitionOS,")
        Response.Write("GSFOS,")
        Response.Write("Title,")
        Response.Write("InstructorName,")
        Response.Write("CourseAvailability,")
        Response.Write("FormatChoiceID,")
        Response.Write("CourseType,")
        Response.Write("DeliveryID,")
        Response.Write("VisitRequired,")
        Response.Write("TechRequirements,")
        Response.Write("OtherConsiderations,")
        Response.Write("SynchronousMeetingsRequired,")
        Response.Write("ScheduleNotes,")
        Response.Write("RegistrationStatus<br>")

        Dim mytext As String
        mytext = "CourseID,ReferenceNumber,EnrollEnd,CourseStart,CourseEnd,TermYear,SchoolTerm,TermChoiceID,TuitionIS,GSFIS,TuitionOS,GSFOS,Title,InstructorName,CourseAvailability,FormatChoiceID,CourseType,DeliveryID,VisitRequired,TechRequirements,OtherConsiderations,SynchronousMeetingsRequired,ScheduleNotes,RegistrationStatus" & vbCrLf
        Server.ScriptTimeout = 320

        '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        Dim strsql As String
        strsql = "Select  dbo.OL_Catalog.Catalog_ID, dbo.CMR.Reference, dbo.CMR.Course, dbo.CMR.Description, dbo.CMR.Credits, dbo.CMR.StartDate, dbo.CMR.EndDate, dbo.CMR.InstructorLast, dbo.CMR.InstructorFirst "
        strsql += "From dbo.OL_Catalog INNER Join "
        strsql += " dbo.CMR On dbo.OL_Catalog.CatalogName = dbo.CMR.Course RIGHT OUTER Join "
        strsql += "dbo.distinctFLVC On dbo.CMR.Course = dbo.distinctFLVC.Course "
        strsql += "Where (dbo.CMR.Term = '2197') AND (dbo.CMR.Status <> 'X') AND (dbo.CMR.Type = 'E')"


        'Response.Write(strsql & "<br>")
        ' Create Instance of Connection and Command Object
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand(strsql, myConnection)

        ' Open the connection and execute the Command
        myConnection.Open()
        Dim DR As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''



        'Iterate through the list of students
        While DR.Read()

            mytext += DR("Catalog_ID") & ","
            ' Response.Write(CStr(DR("Catalog_ID")) & ",")

            'Response.Write(DR("Reference") & ",")
            mytext += DR("Reference") & ","
            Dim closedate As Date = Convert.ToDateTime(DR("StartDate")).AddDays(-1).ToShortDateString()
            'Response.Write(closedate & ",")
            mytext += closedate & ","

            Dim mydate As Date = Convert.ToDateTime(DR("StartDate")).ToShortDateString()
            'Response.Write(mydate & ",")
            mytext += mydate & ","

            Dim myEnddate As Date = Convert.ToDateTime(DR("EndDate")).ToShortDateString()
            'Response.Write(myEnddate & ",")
            mytext += myEnddate & ","

            ' Response.Write(txtTermYear.Text & ",")
            mytext += txtTermYear.Text & ","

            'Response.Write(txtSchoolTerm.Text & ",")
            mytext += txtSchoolTerm.Text & ","

            'Response.Write(txtTermChoiceID.Text & ",")
            mytext += txtTermChoiceID.Text & ","

            'Response.Write(DR("Credits") & "-")
            Dim MyISTuition As Single
            MyISTuition = GetPrice(DR("Course"), DR("Credits"))
            'Response.Write(MyISTuition & ",")
            mytext += MyISTuition & ","

            Dim MyGSFIS As Decimal = (CDec(txtGSFIS.Text) * CInt(DR("Credits")))
            'Response.Write(MyGSFIS & ",")
            mytext += MyGSFIS & ","


            Dim MyOSTuition As Single
            MyOSTuition = GetPriceOutState(DR("Course"), DR("Credits"))
            'Response.Write(MyOSTuition & ",")
            mytext += MyOSTuition & ","


            ' Response.Write(MyGSFIS & ",")  'outstate and instage gsfis are the same
            mytext += MyGSFIS & ","

            'Response.Write(DR("Description") & ",")
            mytext += DR("Description") & ","

            'Response.Write(StrConv(DR("InstructorFirst"), VbStrConv.ProperCase) & " " & StrConv(DR("InstructorLast"), VbStrConv.ProperCase) & ",")
            mytext += StrConv(DR("InstructorFirst"), VbStrConv.ProperCase) & " " & StrConv(DR("InstructorLast"), VbStrConv.ProperCase) & ","


            'Response.Write("CourseAvailability,")
            'Response.Write(GetAvailability(DR("Course")) & ",")
            mytext += GetAvailability(DR("Course")) & ","

            'Response.Write("FormatChoiceID,")
            ' Response.Write("9" & ",")
            mytext += "9,1,1,F,High Speed Internet - MS Office,Contact instructor for further information.,F,None,1" & vbCrLf


            'Response.Write("CourseType,")
            'Response.Write("1" & ",")


            'Response.Write("DeliveryID,")
            'Response.Write("1" & ",")


            'Response.Write("VisitRequired,")
            'Response.Write("F" & ",")


            'Response.Write("TechRequirements,")
            'Response.Write("High Speed Internet - MS Office" & ",")


            'Response.Write("OtherConsiderations,")
            'Response.Write("Contact instructor for further information." & ",")


            'Response.Write("SynchronousMeetingsRequired,")
            'Response.Write("F" & ",")


            'Response.Write("ScheduleNotes,")
            'Response.Write("None" & ",")


            'Response.Write("RegistrationStatus")
            'Response.Write("1")


            'Response.Write("<br>")


        End While



        DR.Close()


        txtOutput.Text = mytext
        txtOutput.Visible = True
        CreateFile(txtOutput.Text)
        lblDownload.Text = "<a href='FLVCdata/sections.csv' >Download</a>"
    End Sub

    Sub CreateFile(ByVal mydata As String)
        Dim mytextbox As String = mydata

        Dim time As DateTime = DateTime.Now
        Dim format As String = "M_dd_yy_HHmm_ss"
        Dim myfilename As String = "Sections.csv"
        ' Response.Write(myfilename & "<br>")

        Dim myfile As String = Server.MapPath("FLVCdata") & "\" & myfilename
        'Response.Write(myfile)


        Dim file As System.IO.StreamWriter
        file = My.Computer.FileSystem.OpenTextFileWriter(myfile, False)



        file.WriteLine(mydata)
        file.Close()




    End Sub




    Public Function GetSectionData() As SqlDataReader
        Dim strsql As String
        strsql = "Select  dbo.OL_Catalog.Catalog_ID, dbo.CMR.Reference, dbo.CMR.Course, dbo.CMR.Credits, dbo.CMR.StartDate, dbo.CMR.EndDate, dbo.CMR.InstructorLast, dbo.CMR.InstructorFirst "
        strsql += "From dbo.OL_Catalog INNER Join "
        strsql += " dbo.CMR On dbo.OL_Catalog.CatalogName = dbo.CMR.Course RIGHT OUTER Join "
        strsql += "dbo.distinctFLVC On dbo.CMR.Course = dbo.distinctFLVC.Course "
        strsql += "Where (dbo.CMR.Term = '2197') AND (dbo.CMR.Status <> 'X') AND (dbo.CMR.Type = 'E')"


        Response.Write(strsql & "<br>")
        ' Create Instance of Connection and Command Object
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand(strSQL, myConnection)

        ' Open the connection and execute the Command
        myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)

        Return dr

    End Function

    Function GetAvailability(ByVal mycourse As String) As Integer



        Dim myAvailability As Integer = 3
        If Left(mycourse, 3) = "NUR" Then
            myAvailability = 2
        End If

        Return myAvailability
    End Function



    Function GetPrice(ByVal mycourse As String, ByVal mycredits As String) As Single

        Dim course As String = mycourse
        Dim credits As Single = CSng(mycredits)

        'Process the data>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

        Dim mydivison As Integer = 1
        Dim Prefix As String = ""
        Dim Suffix As String = ""
        Prefix = Left(course, 3)
        Suffix = Replace(course, Prefix, "")
        mydivison = CInt(Left(Suffix, 2))
        Dim Myrate1 As Single = CSng(txtTuitionIS.Text)
        Dim Myrate2 As Single = CSng(txtTuitionUpperIS.Text)


        Dim myprice As Single

        If mydivison < 3 Then
            myprice = Myrate1 * mycredits
        Else
            myprice = Myrate2 * mycredits
        End If



        Dim myreturn As Single
        'myreturn = CStr(myprice)
        myreturn = FormatCurrency(myprice, 2)
        'Response.Write(myreturn)
        Return myreturn
    End Function





    Function GetPriceOutState(ByVal mycourse As String, ByVal mycredits As String) As Single

        Dim course As String = mycourse
        Dim credits As Single = CSng(mycredits)
        'Process the data>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

        Dim mydivison As Integer = 1
        Dim Prefix As String = ""
        Dim Suffix As String = ""
        Prefix = Left(course, 3)
        Suffix = Replace(course, Prefix, "")
        mydivison = CInt(Left(Suffix, 2))
        Dim Myrate1 As Single = CSng(txtTuitionOS.Text)
        Dim Myrate2 As Single = CSng(txtTuitionUpperOS.Text)


        Dim myprice As Single

        If mydivison < 3 Then
            myprice = Myrate1 * mycredits
        Else
            myprice = Myrate2 * mycredits
        End If



        Dim myreturn As Single
        'myreturn = CStr(myprice)
        myreturn = FormatCurrency(myprice, 2)

        Return myreturn
    End Function


    Protected Sub txtTermChoiceID_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtTermChoiceID.TextChanged

    End Sub

    Protected Sub txtTuitionUpperIS_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs)

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        CreateFile(txtOutput.Text)
        lblDownload.Text = "<a href='FLVCdata/sections.csv' >Download</a>"
    End Sub


End Class