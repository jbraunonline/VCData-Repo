<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="UploadExamDates.aspx.vb" Inherits="VCdata.UploadExamDates" %>

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
    <div>
    
        <p class="auto-style1">
            <strong>Upload data for faculty to confirm proctored exam Dates.</strong></p>
        <p>
            All faculty are required to confirm receipt of their upcoming proctored exam date windows.<br />
            This is ONLY to publish the exam windows. There is no ability to manage dates or modify proctored exams.</p>
        <p>
            <span class="style2">Data format exptected</span>:<br />
            <strong>Reference, course, instructorname, MDCID,outlook,isMidterm,MidStart,MidEnd,isFinal,FinalStart,FinalEnd</strong><br />
            USE <span class="style1"><strong>1/1/2013</strong></span> as a dateplace holder for a date where there is no exam start or end date.<br />
            <br />
            741124,LIS2004,A.DELABARRERA,A97626954,adelabar,<span class="style1"><strong>No,1/1/2013,1/1/2013</strong></span>,Yes,6/20/2013,6/21/2013
        </p>
        <p class="style1">
            The Data format is:&nbsp;&nbsp;&nbsp;&nbsp; <a href="DetailSample.txt" target="_blank">Sample Upload</a></p>
        <p class="style1">
            &nbsp;</p>
    
    </div>
        <asp:Panel ID="Panel1" runat="server">
            <asp:FileUpload ID="UploadFile" runat="server" />
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="Upload File" />
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
                    </asp:Panel>
    </form>
</body>
</html>
