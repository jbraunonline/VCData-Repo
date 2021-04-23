<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="UploadDetails.aspx.vb" Inherits="VCdata.UploadDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            font-size: x-large;
        }
        .auto-style2 {
            font-size: medium;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <p class="auto-style1">
            <strong>Upload data for faculty to confirm/edit proctored exam settings.</strong></p>
        <p class="style1">
            This uses the masterproctor1 table land contains only courses for the current upcoming term. </p>
        <p class="style1">
            <span class="auto-style2">It must be cleared of last term&#39;s courses before uploading new data</span>. This form adds data to the table. It only contains one term&#39;s data.</p>
        <p class="style1">
            Table: VC_VCData.<strong>MasterProctor1</strong></p>
        <p class="style1">
            Data comes from a spreadsheet from Amy, converted to CSV.&nbsp; NO duplicates. Synched courses&nbsp; are in the form:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 8216_8217_8218,SPC1017,DAVID WADLE,,,,,,,,,,,,,,</p>
        <p class="style1">
            The Data format is:&nbsp;&nbsp;&nbsp;&nbsp; <a href="DetailSample.txt" target="_blank">Sample Upload</a></p>
        <p class="style1">
            Reference,Course,Instructor,Outlook,CanChange,IsMidterm,MidStart,MidEnd,MidTime,MidPaper,MidCalculator,MidGraph,MidNotes,IsFinal,finalStart,FinalEnd,FinalTime,FinalPaper,FinalCalculator,FinalGraph,FinalNotes,Access,InstComments,MidName,MidFolder,FinalName,FinalFolder,MidProctorX,FinalProctorX,LMS<br />
            <span class="style2">865064,ACG2001,M.CAVALARIS,mcavalar,1,0,1/1/2015,1/1/2015,0,0,0,0,,1,12/7/2015,12/9/2015,120,1,1,0,--,0,Comments,--,Proctored Assessments,Final Exam (Local), ProctoredAssessments\P,&nbsp; 1,1,BB</span></p>
    
    </div>
        <asp:Panel ID="Panel1" runat="server">
            <asp:FileUpload ID="UploadFile" runat="server" />
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="Upload File" />
            &nbsp;
            <asp:Button ID="btnShow" runat="server" Text="Show All" />
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
            <asp:ListItem>SQL</asp:ListItem>
            <asp:ListItem>Input</asp:ListItem>
        </asp:RadioButtonList>
        <br />
        <asp:Button ID="btnUpload" runat="server" Text="Input Data" />
                    </asp:Panel>
    </form>
</body>
</html>
