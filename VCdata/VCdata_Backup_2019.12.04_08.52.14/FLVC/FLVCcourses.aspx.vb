Imports System.IO
Imports System.Data.SqlClient
Imports System.Data.Sql

Public Class FLVCcourses
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)

        Dim strSQL As String = " delete from distinctFLVC "
        Dim myCommand As New SqlCommand(strSQL, myConnection)
        Using myConnection
            myConnection.Open()

            myCommand.ExecuteNonQuery()
            myConnection.Close()

        End Using
    End Sub

    Protected Sub txtLoad_Click(sender As Object, e As EventArgs) Handles txtLoad.Click
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)

        Dim strSQL As String = " Insert into dbo.distinctFLVC(course)  select distinct course FROM [VC_VCData].[dbo].[CMR] where term = '" & txtTerm.Text & "' and Status <>'X' and Course NOT IN "
        strSQL += "('HIM0450','HSC0003','REA0007','REA0017','MAT0028','ENC0015','ENC0025','HIM0434')"
        Dim myCommand As New SqlCommand(strSQL, myConnection)
        Using myConnection
            myConnection.Open()

            myCommand.ExecuteNonQuery()
            myConnection.Close()

        End Using
    End Sub

    Protected Sub getData_Click(sender As Object, e As EventArgs) Handles getData.Click
        'Response.Write("CourseID,")
        'Response.Write("CIPChoiceID,")
        'Response.Write("Publicly,")
        'Response.Write("StatePublicly,")
        ' Response.Write("CourseDept,")
        'Response.Write("CourseNo,")
        ' Response.Write("CourseTitle,")
        'Response.Write("CourseDescription,")
        ' Response.Write("ForCredit,")
        'Response.Write("MinCredits,")
        ' Response.Write("MaxCredits,")
        ' Response.Write("CEU,")
        'Response.Write("CreditType,")
        'Response.Write("CourseLevel,")
        'Response.Write("CoursePrereqs,")
        'Response.Write("EnrollProcedure,")
        'Response.Write("Admitted,")
        'Response.Write("AdmissInternet,")
        'Response.Write("RegInternet,")
        'Response.Write("RegistrarURL,")
        'Response.Write("CompleteFL<br>")

        Dim mytext As String
        mytext = "CourseID,CIPChoiceID,Publicly,StatePublicly,CourseDept,CourseNo,CourseTitle,CourseDescription,ForCredit,MinCredits,MaxCredits,CEU,CreditType,CourseLevel,CoursePrereqs,EnrollProcedure,Admitted,AdmissInternet,RegInternet,RegistrarURL,CompleteFL" & vbCrLf

        'Server.ScriptTimeout = 520

        ' Declare a streamwriter object
        'Dim streamWriter As New StreamWriter(Server.MapPath("./aspnet.txt"))
        'Dim streamWriter As New StreamWriter("d:\webs\filewriter\test.txt")

        ' Create a text File and assign this textfile obj to streamwriter
        ' Object created above

        Dim DR As SqlDataReader = getcourseData()

        Try

            'Iterate through the list of students
            While DR.Read()
                'Response.Write(DR("Catalog_ID") & ",")
                mytext += DR("Catalog_ID") & ","

                'Response.Write("CIPChoiceID,")
                ' Response.Write(GetCIP(DR("CatalogName")) & ",")
                mytext += GetCIP(DR("CatalogName")) & ","

                'Response.Write("Publicly,")
                'Response.Write("T,")
                mytext += "T,"
                'Response.Write("StatePublicly,")
                ' Response.Write("T,")
                mytext += "T,"

                'Response.Write("CourseDept,")
                ' Response.Write(GetPrefix(DR("CatalogName")) & ",")
                mytext += GetPrefix(DR("CatalogName")) & ","

                'Response.Write("CourseNo,")
                'Response.Write(GetSuffix(DR("CatalogName")) & ",")
                mytext += GetSuffix(DR("CatalogName")) & ","

                'Response.Write("CourseTitle,")
                Dim mytitle As String = Replace(DR("Title"), ",", "$")
                Dim textInfo As System.Globalization.TextInfo = New System.Globalization.CultureInfo("en-US", False).TextInfo
                'Response.Write(textInfo.ToTitleCase(mytitle) & ",")
                mytext += textInfo.ToTitleCase(mytitle) & ","

                'Response.Write("CourseDescription,")
                Dim mydescription As String = DR("CourseDescription")
                mydescription = Replace(mydescription, ",", "$")
                If Len(mydescription) < 5 Then
                    mydescription = textInfo.ToTitleCase(mytitle)
                End If

                'Response.Write(mydescription)
                mytext += mydescription & ","
                'Response.Write(",")
                'Response.Write("ForCredit,")
                ' Response.Write("T,")
                mytext += "T,"
                'Response.Write("MinCredits,")  'min and max credits are the same
                'Response.Write("MaxCredits,")
                'Response.Write(DR("Credits") & ",")
                mytext += DR("Credits") & ","

                'Response.Write(DR("Credits") & ",")
                mytext += DR("Credits") & ","

                'Response.Write("CEU,")
                ' Response.Write("0,")

                'Response.Write("CreditType,")
                'Response.Write("S,")

                'Response.Write("CourseLevel,")
                'Response.Write("U,")
                mytext += "0,S,U,"

                'Response.Write("CoursePrereqs,")

                'Response.Write(Replace(DR("Pre_Requisites"), ",", "$"))
                mytext += Replace(DR("Pre_Requisites"), ",", "$") & ","

                'Response.Write(",")
                'Response.Write("EnrollProcedure,")
                mytext += "EnrollProcedure,"

                'Response.Write("Admitted,")
                ' Response.Write("T,")

                'Response.Write("AdmissInternet,")
                'Response.Write("T,")

                'Response.Write("RegInternet,")
                'Response.Write("T,")

                'Response.Write("RegistrarURL,")
                'Response.Write(" www.mdc.edu/admissions/ ,")

                'Response.Write("CompleteFL")
                'Response.Write("F")
                mytext += "T,T,T,www.mdc.edu/admissions/ ,F" & vbCrLf


                'Response.Write(" < br > ")


            End While

        Catch Ex As Exception
            'Throw 'Ex
        Finally

            DR.Close()
        End Try
        txtOutput.Text = mytext
        txtOutput.Visible = True
        CreateFile(txtOutput.Text)
        lblDownload.Text = "<a href='FLVCdata/courses.csv' >Download</a>"
        lblNotice.Text = "NOTE: the <b>CSV file substitutes $ for commas</b>, please do global replace $/, before saving as XLSX file for upload."
        lblNotice.Visible = True

    End Sub

    Function GetCIP(ByVal course As String) As String
        Dim myPrefix As String = "XXX"
        myPrefix = Left(course, 3)

        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand("Select CIP from CIP_Codes where Prefix='" & myPrefix & "'", myConnection)
        'Response.Write("select Course, Credits from Courses where course_ID=" & CInt(courseID))
        ' Open the connection and execute the Command
        myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        Dim myCIP As String = "<font color=red>99.99</font>"

        If dr.Read() Then

            'Response.Write("<br>" & dr("Course"))
            myCIP = Left(dr("CIP"), 5)

        End If
        myConnection.Close()
        Return myCIP
    End Function



    Function GetPrefix(ByVal course As String) As String
        Dim Prefix As String = "XXX"
        Prefix = Left(course, 3)

        Return Prefix
    End Function

    Function GetSuffix(ByVal course As String) As String
        Dim Prefix As String = "XXX"
        Dim Suffix As String = "XXX"
        Dim myoutput As String = ""
        Prefix = Left(course, 3)
        Suffix = Replace(course, Prefix, "")
        'myoutput = Replace(Suffix, " ", "")
        Return Suffix
    End Function

    Public Function GetCourseData() As SqlDataReader

        Dim strSQL As String = "Select dbo.OL_Catalog.Title , dbo.OL_Catalog.Pre_Requisites, dbo.OL_Catalog.Catalog_ID, dbo.OL_Catalog.CatalogName, dbo.OL_Catalog.Credits,  dbo.OL_Catalog.CourseDescription "
        strSQL += " From dbo.distinctFLVC LEFT OUTER Join    dbo.OL_Catalog ON dbo.distinctFLVC.Course = dbo.OL_Catalog.CatalogName"
        'Response.Write(strSQL)
        ' Response.End()
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand(strSQL, myConnection)

        ' Open the connection and execute the Command
        myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)

        Return dr

    End Function

    Sub CreateFile(ByVal mydata As String)
        Dim mytextbox As String = mydata

        Dim time As DateTime = DateTime.Now
        Dim format As String = "M_dd_yy_HHmm_ss"
        Dim myfilename As String = "Courses.csv"
        ' Response.Write(myfilename & "<br>")

        Dim myfile As String = Server.MapPath("FLVCdata") & "\" & myfilename
        ' Response.Write(myfile)


        Dim file As System.IO.StreamWriter
        file = My.Computer.FileSystem.OpenTextFileWriter(myfile, False)



        file.WriteLine(mydata)
        file.Close()




    End Sub


    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        CreateFile(txtOutput.Text)
        lblDownload.Text = "<a href='FLVCdata/courses.csv' >Download</a>"
    End Sub
End Class