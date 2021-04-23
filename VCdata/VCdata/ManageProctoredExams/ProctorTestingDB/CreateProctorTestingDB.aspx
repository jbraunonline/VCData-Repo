<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="CreateProctorTestingDB.aspx.vb" Inherits="VCdata.CreateProctorTestingDB" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style3 {
            font-size: x-large;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <strong><span class="auto-style3">This form will copy data from MasterProctor to MasterProctorTesting DB</span></strong><br />
            This form parses families into individual courses to prepare ProctorU and TestingCenter Reporta<br />
            It runs
            by term, session, and Exam (Mid/Final)&nbsp; See aboutProctorTesting.txt for summary.<br />
            MasterProctorTesting has an idividual record for midterm and finals.<br />
            <asp:Button ID="btnFix" runat="server" BorderColor="Red" Text="Fix DB for NULLS" />
            <br />
            NOTE: If you get a db/hull error, run this file&nbsp;&nbsp; <a href="Fix_MasterProctorNulls.txt">Fix_MasterProctorNulls.txt</a><br />
            <br />
            <asp:TextBox ID="txtTerm" runat="server">2213</asp:TextBox>
&nbsp; Term<br />
&nbsp;<br />
&nbsp;
            <asp:DropDownList ID="DropDownList1" runat="server">
                <asp:ListItem>Select Session</asp:ListItem>
                <asp:ListItem>1</asp:ListItem>
                <asp:ListItem>8W1</asp:ListItem>
                <asp:ListItem>6W1</asp:ListItem>
                <asp:ListItem>8W2</asp:ListItem>
                <asp:ListItem>6W2</asp:ListItem>
                <asp:ListItem>12W</asp:ListItem>
            </asp:DropDownList>
&nbsp; Select Session&nbsp;&nbsp;
            <asp:CheckBox ID="chkOptIn" runat="server" Checked="True" Text="Opt In" />
&nbsp;<asp:RadioButtonList ID="radioExam" runat="server" RepeatDirection="Horizontal">
                <asp:ListItem Value="isMidTerm" Selected="True">Mid</asp:ListItem>
                <asp:ListItem Value="isFinal">Final</asp:ListItem>
            </asp:RadioButtonList>
            ^ Select Exam Setup to load into MasterProctorTesting!&nbsp;
            <asp:RadioButtonList ID="RadioButtonAction" runat="server" RepeatDirection="Horizontal">
                <asp:ListItem Selected="True">Preview</asp:ListItem>
                <asp:ListItem>Run</asp:ListItem>
            </asp:RadioButtonList>
            <asp:Button ID="btnCopy" runat="server" Text="Copy Data" />
            <br />
            <br />
            Note: passwords were originally entered into the masterproctortesting.db here but the process for adding passwords for all reports has changed to add them when the reports are generated.<br />
            Future change: Move the translation of ANXMTR to directives to the reports as well, as this will simplify future changes/additions by locating the code to only tow locations<br />
            <br />
            <br />
            <br />
        </div>
    </form>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
</body>
</html>
