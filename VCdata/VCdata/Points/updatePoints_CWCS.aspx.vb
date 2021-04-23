Imports System.IO
Imports System.Data.SqlClient
Imports System.Data.Sql

Public Class updatePoints_CWCS
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim changecount As Integer = 0
        Dim fileStream As FileStream = File.Open(Server.MapPath("Data/CWCSrefonly.txt"), FileMode.Open, FileAccess.Read)

        Dim srReader As StreamReader = New StreamReader(fileStream)
        Dim line As String
        Dim nLine As Integer = 0

        line = srReader.ReadLine
        While (line IsNot Nothing)
            nLine = nLine + 1
            'process the line
            line = srReader.ReadLine
            Dim mytrimed = Trim(line)
            Response.Write(mytrimed & "<BR>")

            updatedata(mytrimed)
        End While

        Try
            srReader.Close()
        Catch ex As IOException
            Console.WriteLine(ex.Message)
        End Try
        Response.Write("<br>The Change Count is " & CStr(nLine))
    End Sub
    Sub updatedata(ByVal mydetails As String)

        Dim strsql As String

        strsql = "update Admin_Points set " &
           "Points_Source = 'CWCS'" &
         " where Reference='" & mydetails & "'"
        Response.Write("<br>" & strsql & "<br>")

        ' Create Instance of Connection and Command Object
        Dim myConnection As New SqlConnection(ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
        'Dim myConnection As New SqlConnection(ConfigurationSettings.AppSettings("connectionString"))
        Dim myCommand As New SqlCommand(strsql, myConnection)
        ' Execute the command in a try/catch to catch duplicate username errors
        Try
            ' Open the connection and execute the Command
            myConnection.Open()
            'HOLD SQL HOLD........................................................................
            myCommand.ExecuteNonQuery()
        Catch Ex As Exception
            Response.Write("<font color=red>")
            Response.Write(Ex.Message)
            Response.Write("</font>")
        Finally
            ' Close the Connection
            If myConnection.State = ConnectionState.Open Then
                myConnection.Close()
            End If
        End Try
        Response.Write("Updated <br>")

    End Sub
End Class