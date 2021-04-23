Imports System.IO
Imports System.Data.SqlClient
Imports System.Data.Sql
Imports Telerik.Web.UI


Public Class ExamSetup
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Panel1.Visible = True
        Panel2.Visible = True
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        lblTerm.Text = ddlTerm.SelectedValue
        lblSession.Text = ddlSession.SelectedValue
        lblExam.Text = radioExam.SelectedValue
        Panel1.Visible = True
        Panel2.Visible = True
    End Sub

    Function GetOutlook(ByVal myinstructor As String) As String
        Dim myreturn As String = ""
        Dim myemail As String = ""

        myemail = email(myinstructor) & "@mdc.edu"
        myreturn = "<a href='mailto:" & myemail & " ' target='_top'>" & myinstructor & "</a>"
        Return myreturn
    End Function

    Function GetExam(ByVal mySession As String, ByVal myExam As String) As String
        Dim myreturn As String = ""

        myreturn = mySession & " / " & myExam
        Return myreturn
    End Function

    Function email(ByVal myname As String) As String
        Dim myreturn As String = ""
        Dim myConnection2 As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
        Dim myCommand As New SqlCommand("Select Outlook from MasterProctor where Instructor= '" & myname & "'", myConnection2)
        'Response.Write("select Course, Credits from Courses where course_ID=" & CInt(courseID))
        ' Open the connection and execute the Command
        myConnection2.Open()
        Dim dr2 As SqlDataReader = myCommand.ExecuteReader(CommandBehavior.CloseConnection)
        Dim myCourseList As String = ""

        While dr2.Read()


            myreturn = dr2("Outlook")


        End While

        dr2.Close()
        dr2 = Nothing
        myConnection2.Close()


        Return myreturn
    End Function

    Protected Sub btnReset_Click(sender As Object, e As EventArgs) Handles btnReset.Click
        Panel1.Visible = True
        Panel2.Visible = False
    End Sub

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

    Public Function getTheInstructions(ByVal myID As Integer) As String
        '//While the data for this frequest is coming from the MasterProctorTesting.db, we keep the MasterProctor,id value in that table when it is created,
        'So this function retrieves data from the MasterProctor table even though the MasterProctor.id value is in the masterproctortesting table (which fills the teleric grid)

        Dim myreturn As String = ""
        Dim objMyMethod As ProctorExam
        objMyMethod = New ProctorExam
        myreturn = objMyMethod.getTestingInstructions(myID, lblExam.Text)
        Return myreturn
    End Function




    Function GetRemote(ByVal MyCourse As String) As String
        Dim myreturn As String = ""

        Dim objMyMethod As ProctorExam
        objMyMethod = New ProctorExam

        myreturn = objMyMethod.GetRemotePass(MyCourse, lblSession.Text, lblExam.Text)



        Return myreturn
    End Function

    Function GetLocalPass(ByVal MyCourse As String) As String
        Dim myreturn As String = ""

        Dim objMyMethod As ProctorExam
        objMyMethod = New ProctorExam

        myreturn = objMyMethod.GetLocalPass(MyCourse, lblSession.Text, lblExam.Text)



        Return myreturn
    End Function

    Function GetLockDown(ByVal myID As Integer) As String
        '//Note that you must pass in the Id from MasterProctor so get it from MasterProctor.id of MasterproctorTesting.MasterProctor_ID
        ' and it must be used on a page where the radioExam.SelectedVlue  is Mid or Final
        Dim myreturn As String = ""
        Dim objMyMethod As ProctorExam
        objMyMethod = New ProctorExam

        myreturn = objMyMethod.GetTheLockDown(myID, lblExam.Text)


        Return myreturn
    End Function

End Class