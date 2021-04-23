<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="AddMasterProctorWindow.aspx.vb" Inherits="VCdata.AddMasterProctorWindow" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Add MasterProctorWindow data/<br />
&nbsp;Data Fields:&nbsp; Term, Course, session1, SessionA, SessionB<br />
            The session fied data is varchar and should be in the format&nbsp; 1/1/1000&nbsp;&nbsp; with dates separated with $&nbsp;&nbsp; eg. 1/1/1000$1/1/1000$1/1/1000&nbsp;&nbsp;&nbsp;&nbsp; Dates 2 or 3 separated by $<br />
            <br />
            Term&nbsp;&nbsp;&nbsp; Course&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Session1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SessionA&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SessionB<br />
            2197,&nbsp; CGS1060C,&nbsp; 8/14/2019$8/2/2019 , 8/14/2019$8/2/2019 , 8/14/2019$8/2/2019&nbsp;&nbsp; Spaces added for clarity<br />
        </div>
        <asp:Panel ID="Panel1" runat="server">
            <asp:FileUpload ID="UploadFile" runat="server" BackColor="#CCFFCC" />
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="Upload File" />
            &nbsp;
            <asp:Button ID="btnShowPanel" runat="server" Text="Show Input Panel" />
        </asp:Panel>
               <br />
        <asp:Panel ID="Panel2" runat="server" Visible="False">

            <br />
            File Uploaded As:<asp:Label ID="lblFileName" runat="Server"></asp:Label>
            <br />
            Size:<asp:Label ID="lblFileSize" runat="Server"></asp:Label>
            <br />
            Type:<asp:Label ID="lblFileContentType" runat="Server"></asp:Label>
            <br />
            <br />
            <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
                <asp:ListItem Selected="True">Preview</asp:ListItem>
                <asp:ListItem>Input</asp:ListItem>
            </asp:RadioButtonList>
            <br />
            <asp:Button ID="btnUpload" runat="server" Text="Input Data" />
            &nbsp;&quot;Insert into BB_ParentChild (ParentCourse, parent, ChildCourse, child, course)
            <br />
            <br />
            <br />
            <asp:TextBox ID="txtTerm" runat="server" BackColor="#FFCCFF"></asp:TextBox>
            <asp:Button ID="btnClearTerm" runat="server" BackColor="Red" Font-Bold="True" ForeColor="White" Text="Clear Term" />
            &nbsp; This will clear all values in the table for the term specified in the textbox. 2197, 2205 etc.<br />
            <br />
            </asp:Panel>
        <br />
    </form>
</body>
</html>
