<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="BackupDB.aspx.vb" Inherits="VCdata.BackupDB" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            font-size: x-large;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="auto-style1">
    
        <strong>Baclup CMR and BBCourses tables</strong></div>
        Note: this page uses integrated windows security to make a sql connection; It will only work if the user with SQL access is logged into a MDC computer and the local IIS is on the same computer.i.e http:\\localhost<br />
        <br />
        <asp:Button ID="btnCMR" runat="server" Text="Backup CMR" />
        <br />
        <br />
        <asp:Button ID="btnBBCourses" runat="server" Text="Backup BBCourses" />
    </form>
</body>
</html>
