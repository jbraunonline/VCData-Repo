Imports System.Data.SqlClient
Imports System.Data.Sql
Imports System.DirectoryServices

Public Class WebForm1
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim username As String = System.Threading.Thread.CurrentPrincipal.Identity.Name
        username = Replace(username, "mdcc\", "")
        Response.Write("My name is " & username)
    End Sub
    Public Function IsAuthenticated(ByVal srvr As String, ByVal usr As String, ByVal pwd As String) As Boolean
        Dim authenticated As Boolean = False
        Try
            Dim entry As DirectoryEntry = New DirectoryEntry(srvr, usr, pwd)
            Dim nativeObject As Object = entry.NativeObject
            authenticated = True
        Catch cex As DirectoryServicesCOMException
        Catch ex As Exception
        End Try
        Return authenticated
    End Function

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        If IsAuthenticated("LDAP://Mdc.edu", txtUsername.Text, txtPasswsord.Text) = True Then
            Response.Write(txtUsername.Text & " is here")
        Else
            Response.Write("Tough Luck")
        End If
    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Dim Mytext As String = TextBox1.Text
        Dim myreturn As String = Mytext.Substring(0, Mytext.LastIndexOf("."))
        Response.Write(myreturn)
        Dim Rightpart As String = Mytext.Split(".")(1)
        Response.Write("<br>" & Rightpart)
    End Sub

    'Note: ldaps://mdcadlds.mdc.edu:6636  does not return result
End Class