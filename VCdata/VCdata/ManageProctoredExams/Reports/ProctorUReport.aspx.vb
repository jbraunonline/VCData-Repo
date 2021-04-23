Imports System.IO
Imports System.Data.SqlClient
Imports System.Data.Sql
Imports Telerik.Web.UI

Public Class ProctorUReport
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        lblTerm.Text = ddlTerm.SelectedValue
        lblSession.Text = ddlSession.SelectedValue
        lblExam.Text = radioExam.SelectedValue
        getworkinglist()
    End Sub



    Protected Sub getworkinglist()
        Dim SqlDataSource1 As New SqlDataSource()
        SqlDataSource1.ID = "SqlDataSource1"
        Me.Page.Controls.Add(SqlDataSource1)
        SqlDataSource1.ConnectionString = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString

        Dim mysql As String = ""
        'Response.Write(radioSelect.SelectedItem.Text)

        mysql = "SELECT [ID], [MasterProctor_ID], [Course], [Reference], [Instructor], [ExamStart], [ExamEnd], [ExamTime], [LExamName], [RExamName], [LPassword], [RPassword], [Lockdown], [Instructions] FROM [MasterProctorTesting]  "
        mysql += " WHERE [Term] ='" & ddlTerm.SelectedValue & "' AND [ExamType] ='" & radioExam.SelectedValue & "' AND [Session] = '" & ddlSession.SelectedValue & "' And ProctorX=1 Order By Course"

        Response.Write(mysql)
        Response.Write("<br>")
        SqlDataSource1.SelectCommand = mysql '"SELECT Reference,Course, Course_ID, MDCID,IsAssociated,iscopyready, copyReadyDate from BBCourses where course='" & mycourse & "' and Term_Key='20152' And Category <>  'Master' Order By MDCID"



        'Response.Write("SELECT Course, Course_ID from BBCourses where course='" & mycourse & "' and Term_Key='20152'")

        RadGrid1.DataSource = SqlDataSource1
        RadGrid1.DataBind()
    End Sub

    Function GetmyExam(ByVal Course As String, ByVal Reference As String, ByVal ExamName As String) As String
        Dim myReturn As String = ""
        Dim myreference As String = Replace(Reference, "2197-", "")
        myReturn = myreference & " - " & Course & " - " & ExamName

        Return myReturn
    End Function

    Function GetStart(ByVal mystart As Date) As String
        Dim myreturn As String = mystart.ToShortDateString
        myreturn = myreturn & "  12:00 AM"

        Return myreturn
    End Function

    Function GetStop(ByVal mystart As Date) As String
        Dim myreturn As String = mystart.ToShortDateString
        myreturn = myreturn & "  9:30 PM"

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


    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click

    End Sub



End Class