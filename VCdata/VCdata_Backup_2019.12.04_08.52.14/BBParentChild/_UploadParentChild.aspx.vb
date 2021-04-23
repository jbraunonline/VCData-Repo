Imports System.IO
Imports System.Data.SqlClient
Imports System.Data.Sql
Public Class UploadParentChild
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand("Select Distinct Family from BBcourses where term_key= '2197' ", myConnection)
        'Response.Write("select Course, Credits from Courses where course_ID=" & CInt(courseID))
        ' Open the connection and execute the Command
        myConnection.Open()
        Dim dr As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        Dim myCIP As String = "<font color=red>99.99</font>"

        While dr.Read()

            'response.Write("<br>" & dr("family"))
            If Not IsDBNull(dr("family")) Then
                Response.Write("<br>" & getCourse(dr("family")) & "," & dr("family") & " " & getExams(dr("family")))
                getMembers(dr("family"))
            End If
        End While
        myConnection.Close()
    End Sub


    Sub getMembers(ByVal myfamily As String)
        Dim myConnection2 As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand("Select Reference, ischild from BBcourses where family= '" & myfamily & "' Order by isChild ", myConnection2)
        'Response.Write("select Course, Credits from Courses where course_ID=" & CInt(courseID))
        ' Open the connection and execute the Command
        myConnection2.Open()
        Dim dr2 As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        Dim myCourseList As String = ""

        While dr2.Read()


            myCourseList += dr2("Reference") & ","


        End While

        myCourseList = myCourseList.Remove(myCourseList.LastIndexOf(","))
        Response.Write("<br>" & myCourseList)
        myConnection2.Close()

    End Sub
    Function getCourse(ByVal myfamily As String) As String
        Dim myreturn As String = ""
        Dim myConnection3 As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
        Dim strsql As String = "Select Course, UserName from BBcourses where Reference= '" & myfamily & "'"
        Dim myCommand3 As New SqlCommand(strsql,myConnection3)

        myConnection3.Open()
        Dim dr3 As SqlDataReader = myCommand3.ExecuteReader(CommandBehavior.CloseConnection)
        If dr3.HasRows Then
            While dr3.Read()
                myreturn = dr3("Course") & "," & dr3("UserName") & "," & getExamData(dr3("Course"))
            End While
        End If


        myConnection3.Close()

        Return myreturn
    End Function
    Function getExams(ByVal myfamily As String) As String
        Dim myreturn As String = ""
        myfamily = Replace(myfamily, "2197-", "")
        Dim myConnection3 As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
        Dim strsql As String = "select IsMidterm,MidStart,MidEnd,IsFinal,FinalStart,FinalEnd,term from examdates  where Reference= '" & myfamily & "' and Term = '2197'"
        Dim myCommand3 As New SqlCommand(strsql, myConnection3)

        myConnection3.Open()
        Dim dr3 As SqlDataReader = myCommand3.ExecuteReader(CommandBehavior.CloseConnection)
        If dr3.HasRows Then
            While dr3.Read()
                myreturn = "," & dr3("isMidterm") & "," & dr3("MidStart") & "," & dr3("MidEnd") & "," & dr3("isFinal") & "," & dr3("FinalStart") & "," & dr3("FinalEnd")
            End While
        End If


        myConnection3.Close()

        Return myreturn
    End Function

    Function getExamData(ByVal mycourse As String) As String
        Dim myreturn As String = ""
        Dim myConnection3 As New SqlConnection(ConfigurationManager.ConnectionStrings("DesignConnectionString").ConnectionString)
        Dim strsql As String = " select  PM_LCL_NAME,PM_RMT_NAME,PF_LCL_NAME,PF_RMT_NAME  FROM [VC_VCData1].[dbo].[OL_MasterExam] where term = '2197' and Course = '" & mycourse & "'"
        Dim myCommand3 As New SqlCommand(strsql, myConnection3)

        myConnection3.Open()
        Dim dr3 As SqlDataReader = myCommand3.ExecuteReader(CommandBehavior.CloseConnection)
        If dr3.HasRows Then
            While dr3.Read()
                myreturn = "," & dr3("PM_LCL_NAME") & "," & dr3("PM_RMT_NAME") & "," & dr3("PF_LCL_NAME") & "," & dr3("PF_RMT_NAME") & ","
            End While
        End If


        myConnection3.Close()

        Return myreturn
    End Function





End Class