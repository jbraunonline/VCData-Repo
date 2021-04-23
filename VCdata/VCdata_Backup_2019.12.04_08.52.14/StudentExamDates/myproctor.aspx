<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="myproctor.aspx.vb" Inherits="VCdata.myproctor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            font-size: x-large;
        }
        .auto-style3 {
            text-decoration: underline;
        }
        .auto-style4 {
            color: #CC0000;
        }
        </style>

     <script "javascript">
var popupWindow = null;
function centeredPopup(url,winName,w,h,scroll){
LeftPosition = (screen.width) ? (screen.width-w)/2 : 0;
TopPosition = (screen.height) ? (screen.height-h)/2 : 0;
settings =
'height='+h+',width='+w+',top='+TopPosition+',left='+LeftPosition+',scrollbars='+scroll+',resizable'
popupWindow = window.open(url,winName,settings)
}
</script>

</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <p class="auto-style1">
            <strong>Upload data for student proctored exam Dates.</strong></p>
        <p>
            &nbsp;<span class="style2">This form adds data to the SQL table so that FIN can be added after MID&nbsp; or different sessions can be handled in separate file.</span></p>
            The SQL table should be cleared before the start of the term.&nbsp; It holds values for only the current term.&nbsp; [VC_VCData].[dbo].[BB_MustTakeMaster}<br>
        
            <p>
            <span class="auto-style3"><strong>Data format exptected</strong></span>:<br />
            <strong>Reference, course, instructorname, </strong>Dates,ExamType&nbsp;&nbsp;&nbsp; (FIN or MID)<br />
            Multiple dates are separated by $&nbsp;&nbsp; (see example below).&nbsp; 
            Three dates for weekend sessions are OK. The student page parses each line by the $<br />
            1029,ACG2021,COLLEEN CHUNG,4/22/2019$ 4/23/2019$ 4/24/2019,FIN</p>
        <p class="style1">
            <a href="data/studentDatesSample.txt" onclick="centeredPopup(this.href,'myWindow','950','860','yes');return false">Show Sample File</a>.</p>
        <p class="style1">
            <strong>TO UPLOAD A FILE</strong>: User the browse button to find a file on your computer and then select Upload File. Ignore the Show All button.</p>
    
    </div>
        <asp:Panel ID="Panel1" runat="server">
            <asp:FileUpload ID="UploadFile" runat="server" />
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="Upload File" />
            &nbsp;
            <asp:Button ID="Button2" runat="server" Text="Show All" />
        </asp:Panel>
        <br />
        <asp:Panel ID="Panel2" runat="server">

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
        <br />
        <br />
        <br />
        <asp:Button ID="btnDelete" runat="server" BackColor="#CC0000" Font-Bold="True" ForeColor="White" Text="CLEAR SQL Table" />
&nbsp;&nbsp; Use this to clear the table of all exam data visible to students.<br />
        <span class="auto-style4"><strong>CAUTION:</strong></span> this will remove all proctored exam dates for students from the database.<br />
        If you clear the SQL table, you MUST go to the 2195 data archive (below) DOWNLOAD those files to your computer and reupload the previous files using this form.<br />
        CLEAR dumps all data in the table, You must get the data current again by reuploading the appropriate data you just deleted.<br />
        This is an additive process because the complete dataset cannot be created at the same time..<br />
        <asp:Button ID="Button3" runat="server" Text="2195 Data Archive" BackColor="#C4FFD7" Font-Bold="True" />
    </form>
</body>
</html>

