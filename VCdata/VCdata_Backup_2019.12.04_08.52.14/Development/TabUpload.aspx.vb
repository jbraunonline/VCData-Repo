Imports System.IO
Imports System.Data.SqlClient
Imports System.Data.Sql

Public Class TabUpload
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim strFileName As String

        If UploadFile.PostedFile.FileName.Length > 0 Then
            strFileName = System.IO.Path.GetFileName(UploadFile.PostedFile.FileName)
            UploadFile.PostedFile.SaveAs(Server.MapPath("Data/TABupload.txt"))
            Panel1.Visible = True
            Panel2.Visible = True
        End If

        lblFileName.Text = UploadFile.PostedFile.FileName
        lblFileSize.Text = UploadFile.PostedFile.ContentLength
        lblFileContentType.Text = UploadFile.PostedFile.ContentType
    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Panel2.Visible = True
    End Sub

    Protected Sub btnUpload_Click(sender As Object, e As EventArgs) Handles btnUpload.Click
        Dim changecount As Integer = 0
        Dim fileStream As FileStream = File.Open(Server.MapPath("Data/TABupload.txt"), FileMode.Open, FileAccess.Read)

        Dim streamReader As StreamReader = New StreamReader(fileStream)

        Dim nLine As Integer = 0

        While (streamReader.Peek() > -1)

            Dim strLine As String = streamReader.ReadLine()

            nLine = nLine + 1

            Response.Write(nLine & "<br>")
            'Response.Write(nLine & "<br>")
            'Response.Write(strLine & "<br>")
            Dim astrValues As String() = strLine.Split(CChar(","))
            'Dim newname As String = "<font color=red>not here </font>"
            If astrValues.Length <> 23 Then
                '''''changed 6 t0 7
                Response.Write("<B> An error occurred while processing Line " & nLine.ToString() & ":<B><br><br>")
                Response.Write(strLine)

                Exit While

            End If

            Dim EMPLID As String = astrValues(0)  'Term,
            Dim MDID As String = astrValues(1)  'reference
            Dim instructor As String = astrValues(2)  'Subject,'
            Dim LastName As String = astrValues(3)  'Catalog,
            Dim FirstName As String = astrValues(4)  'Descr,
            Dim Calendar As String = astrValues(5)  'Component,
            Dim NewVC As Integer = 0
            If astrValues(6) = "1" Then
                NewVC = 1
            End If
            Dim Outlook As String = astrValues(7)  'Status,
            Dim FTorPT As String = astrValues(8)  'Credits,
            Dim Chair As String = Replace(astrValues(9), "$", ",")  'Session,
            Dim ChairOutlook As String = astrValues(10)  'StartDate,
            Dim Location As String = astrValues(11)  'EndDate,
            Dim Campus As String = astrValues(12)  'Section,
            Dim ReportingSchool As String = astrValues(13)  'SectionNotes,
            Dim ReportingCampus As String = astrValues(14)  'SectionNotes,
            Dim Canchange As Integer = 1
            If astrValues(15) = "0" Then
                Canchange = 0
            End If
            Dim BBTrain As Integer = 1
            If astrValues(16) = "0" Then  'First,
                BBTrain = 0
            End If
            Dim VCCertComp As Integer = 1
            If astrValues(17) = "0" Then
                VCCertComp = 0
            End If

            Dim VCDevComp As Integer = 1
            If astrValues(18) = "0" Then
                VCDevComp = 0
            End If


            Dim Developer As String = astrValues(19)  'Chair
            Dim CredentialsApproved As String = astrValues(20)  'Chairoutlook
            Dim CredentialsPending As String = astrValues(21)  'InstrAssig Cls, - CanChANGE
            Dim Notes As String = Replace(astrValues(22), "$", ",")  'MDIC,


            '    working list of data:   term, reference, subject, catalog, descr, status, credits, component, section, session, startdate, enddate, classtype, mdcid, instassign, last, first, email
            If RadioButtonList1.SelectedValue = "Preview" Then
                Dim i As Integer = 0
                For i = 0 To 22
                    Response.Write(astrValues(i) & "|")
                Next
                Response.Write("<br>")
            End If

            Dim strSQL As String = "Insert into VC_InstructorTab (EMPLID,MDID,Instructor,LastName,FirstName,Calendar,NewVC,Outlook,FTorPT,Chair,ChairOutlook,Location,Campus,ReportingSchool,ReportingCampus,CanChange,BBTrain,VCCertComp,VCDevComp,Developer,CredentialsApproved,CredentialsPending,Notes)" &
                            "VALUES ('" & EMPLID &
                            "','" & MDID &
                            "','" & instructor &
                            "','" & LastName &
                            "','" & FirstName &
                            "','" & Calendar &
                            "'," & NewVC &
                            ",'" & Outlook &
                            "','" & FTorPT &
                            "','" & Chair &
                            "','" & ChairOutlook &
                            "','" & Location &
                           "','" & Campus &
                           "','" & ReportingSchool &
                           "','" & ReportingCampus &
                            "'," & Canchange &
                            "," & BBTrain &
                            "," & VCCertComp &
                            "," & VCDevComp &
                            ",'" & Developer &
                             "','" & CredentialsApproved &
                             "','" & CredentialsPending &
                             "','" & Notes & "')"


            Response.Write(strSQL & "<br>")
            Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
            ' Create Instance of Connection and Command Object
            Dim myCommand As New SqlCommand(strSQL, myConnection)

            If RadioButtonList1.SelectedValue = "Input" Then
                Try

                    ' Open the connection and execute the Command
                    myConnection.Open()


                    'HOLD SQL HOLD.........]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]
                    myCommand.ExecuteNonQuery()

                Catch

                    Response.Write("<font color=red>failed to create a new record</font>")


                Finally

                    ' Close the Connection
                    If myConnection.State = ConnectionState.Open Then
                        myConnection.Close()
                    End If

                End Try
            End If

            CopyVC_Instructors()

        End While
    End Sub

    Sub DeleteVC_Instructors()
        Dim strsql As String = "Delete From dbo.VC_Instructor_BU"
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
        ' Create Instance of Connection and Command Object
        Dim myCommand As New SqlCommand(strsql, myConnection)

        If RadioButtonList1.SelectedValue = "Input" Then
            Try

                ' Open the connection and execute the Command
                myConnection.Open()


                'HOLD SQL HOLD.........]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]
                myCommand.ExecuteNonQuery()

            Catch

                Response.Write("<font color=red>failed to create a new record</font>")


            Finally
                Response.Write("Data Deleted<br>")
                ' Close the Connection
                If myConnection.State = ConnectionState.Open Then
                    myConnection.Close()
                End If

            End Try

        End If



    End Sub
    Sub CopyVC_Instructors()
        DeleteVC_Instructors()

        Dim strsql As String = "Insert into VC_Instructor_BU (EMPLID, MDID, instructor, LastName, FirstName, Calendar, NewVC, Outlook, FTorPT, Chair, ChairOutlook, Location, Campus, ReportingSchool, ReportingCampus, Canchange, BBTrain, VCCertComp, VCDevComp, Developer, CredentialsApproved, CredentialsPending, Notes)"
        strsql += " Select EMPLID,MDID,Instructor,LastName,FirstName,Calendar,NewVC,Outlook,FTorPT,Chair,ChairOutlook,Location,Campus,ReportingSchool,ReportingCampus,CanChange,BBTrain,VCCertComp,VCDevComp,Developer,CredentialsApproved,CredentialsPending,Notes"
        strsql += " From dbo.VC_InstructorTab"

        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
        ' Create Instance of Connection and Command Object
        Dim myCommand As New SqlCommand(strsql, myConnection)

        If RadioButtonList1.SelectedValue = "Input" Then
            Try

                ' Open the connection and execute the Command
                myConnection.Open()


                'HOLD SQL HOLD.........]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]
                myCommand.ExecuteNonQuery()

            Catch

                Response.Write("<font color=red>failed to create a new record</font>")


            Finally
                Response.Write("Data Copied <br>")
                ' Close the Connection
                If myConnection.State = ConnectionState.Open Then
                    myConnection.Close()
                End If

            End Try
        End If
    End Sub


End Class