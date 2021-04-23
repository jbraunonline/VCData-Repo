<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="AddScheduleApproval.aspx.vb" Inherits="VCdata.AddScheduleApproval" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Add Schedule Approval and AdminFacultyRequest</div>
        <asp:TextBox ID="txtTerm" runat="server">2207</asp:TextBox>
&nbsp;Term<br />
        <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
&nbsp;Username of Recipient<br />
        <asp:TextBox ID="txtRecipientName" runat="server"></asp:TextBox>
&nbsp;Recipient Name&nbsp;&nbsp; Last, First<br />
        <asp:TextBox ID="txtSender" runat="server">Dr. Donna Jennings</asp:TextBox>
&nbsp;Username of Sender<br />
        <asp:TextBox ID="txtSubject" runat="server">2213 Schedule Approval</asp:TextBox>
&nbsp;Subject<br />
        <asp:TextBox ID="txtTask" runat="server" Width="268px">Please review the 2213 Proposed Schedule and provide your input.</asp:TextBox>
&nbsp;Task what&nbsp; to do on task page<br />
        <asp:TextBox ID="txtActionRequest" runat="server" Height="53px" TextMode="MultiLine" Width="273px">Please provide feedback on the proposed 2213 schedule. Use the Go To Task button or the 2213 Approval Link on the left.</asp:TextBox>
&nbsp;Where to go and what to do in admin request to user<br />
        <asp:TextBox ID="txtActionEvent" runat="server">Approval</asp:TextBox>
&nbsp; Action Event<br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Create Single Request" BorderColor="#33CC33" />
        <br />
        The create button has two actions.<br />
        It creates a task in the AdminScheduleApproval table<br />
&nbsp;&nbsp;&nbsp;&nbsp; and retrieves the Task_ID (primary key of the new record)<br />
        It creates a message in the AdminRequest table that is linked to the primaruy key of the task<br />
        <br />
        <asp:Button ID="btnLoop" runat="server" Text="Create from List" BorderColor="Red" />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
    </form>
</body>
</html>
