<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="StepA.aspx.vb" Inherits="VCdata.StepA" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            font-size: x-large;
        }
        .auto-style2 {
            color: #CC0000;
        }
        .auto-style3 {
            text-decoration: underline;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <p class="auto-style1">
            <strong>Upload data for BB_ParentChild.</strong></p>
        <p>
            </p>
        <asp:Panel ID="Panel1" runat="server" BackColor="#CCFF99">
            Is this for 16wk and first session?<asp:RadioButtonList ID="RadioIsSessionB" runat="server" RepeatDirection="Horizontal">
                <asp:ListItem>Yes</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
            </asp:RadioButtonList>
            <asp:Button ID="btnSelectSession" runat="server" Text="Continue" />
            &nbsp;&nbsp;&nbsp;
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="RadioIsSessionB" ErrorMessage="You must select yes or no" ForeColor="#CC0000"></asp:RequiredFieldValidator>
            <br />
        </asp:Panel>
        <asp:Panel ID="Panel2" runat="server" BackColor="#FFFFCC" Visible="False">
            <p>
                &nbsp;</p>
            <p>
                <asp:Button ID="btnClearTable" runat="server" BackColor="Red" Font-Bold="True" ForeColor="White" Text="Clear MasterProctor" />
                &nbsp;&nbsp;Run this <span class="auto-style3">only </span>at the start of a term. <strong>Do <span class="auto-style2">NOT</span> run this if you are working on Session B</strong>, We need&nbsp; Session 1&amp; B records!</p>
            <p>
                &nbsp;<asp:Button ID="btnClearTable0" runat="server" BackColor="Red" Font-Bold="True" ForeColor="White" Text="Clear BB_ParentChild" />
                &nbsp;&nbsp;
            </p>
            <p>
                <asp:Button ID="BtbContine" runat="server" Text="Continue to Upload" />
                &nbsp; If&nbsp; all data has been cleared, then continue to upload Lester&#39;s Parent/Child data.</p>
        </asp:Panel>
    
    </div>
        <asp:Panel ID="Panel3" runat="server" Visible="False">
            <span class="style2">Data format exptected</span>:<br />&nbsp; <strong>Parentcourse, </strong>ChildCourse<br /> SPC1017-2197-8313,SPC1017-2197-8320<br /> <br />
            <asp:FileUpload ID="UploadFile" runat="server" />
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="Upload File" />
            &nbsp;
            <asp:Button ID="Button2" runat="server" Text="Continue after Uploading Data" />
            <br />
            File Uploaded As:<asp:Label ID="lblFileName" runat="Server"></asp:Label>
            <br />
            Size:<asp:Label ID="lblFileSize" runat="Server"></asp:Label>
            <br />
            Type:<asp:Label ID="lblFileContentType" runat="Server"></asp:Label>
            <br />
        </asp:Panel>
        <br />
        <asp:Panel ID="Panel4" runat="server" Visible="False">

            After uploading the file, now insert the data into gg_ParentChild&nbsp;
            <br />
            Specify the term for these dates:&nbsp;<asp:TextBox ID="txtTerm" runat="server" BackColor="#C6E2FF">2213</asp:TextBox>
            &nbsp;<span class="auto-style2"><strong>&lt;-- Make sure this term is correct!</strong></span><br />
            <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
                <asp:ListItem Selected="True">Preview</asp:ListItem>
                <asp:ListItem>Input</asp:ListItem>
            </asp:RadioButtonList>
            <br />
            <asp:Button ID="btnUpload" runat="server" Text="Input Data" />
            &nbsp;&quot;Insert into BB_ParentChild (ParentCourse, parent, ChildCourse, child, course)
            <br />
            <br />
            &nbsp;&nbsp; set families for
            <asp:RadioButtonList ID="RadioFamily" runat="server" RepeatDirection="Horizontal">
                <asp:ListItem Value="1" Selected="True">Full and 1st Session</asp:ListItem>
                <asp:ListItem Value="2">B Term Only</asp:ListItem>
            </asp:RadioButtonList>
            <br />
            <asp:Button ID="btnFamily" runat="server" Text="Set Families in MasterProctor" />
            &nbsp; This adds parents and familystring to MasterProctor<br /> Note: Double check yourself here run SQL to make sure that the correct number of new entries in MasterProctor are correct.<br /> In 2213/8w2 nine parent/child records, one was a triple, others were doubles, so 8 new family records were added.<br />
            <br />
            <asp:Label ID="lblStep2" runat="server" Font-Bold="True" ForeColor="#CC0000" Text="Go to StepB" Visible="False" Font-Size="Large"></asp:Label>
            &nbsp; Reset BB Ciyrses<br />
            <br />
            <br />
        </asp:Panel>
      </form>
</body>
</html>

