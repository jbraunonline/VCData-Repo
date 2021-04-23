<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="CMR_sp.aspx.vb" Inherits="VCdata.CMR_sp" %>

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
            font-size: medium;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <p class="auto-style1">
            <strong>Upload data for </strong>CMR_SP</p>
        <p class="auto-style3">
            Currently going to tables _sp&nbsp;&nbsp; cmr_sp etc.&nbsp;&nbsp; Add schedule_Notes to al</p>
        <p class="auto-style3">
            Switch and run first with 2215&nbsp; term. change to CMR_sp from SMRSHORT-sp</p>
        <p>
            <span class="style2"><strong>Data format exptected</strong></span><strong>: </strong>21 Fields&nbsp; A - U on spreadsheet&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br />
        </p>
        <p>
            <strong>Term,Class Nbr,Subject,Catalog Nbr,Class Descr,Comp,Class Status,Progress Units,Session Code,Start Date,End Date,Class Section,Class Type,Schedule Notes,Last Name,First Name,UserName,Chair,ChairOutlook,ADJ/FULL,MDCID</strong></p>
        <p>
            2195,1038,ACG,2071,Managerial Accountng,LEC,A,3,6W2,6/24/2019,8/2/2019,21,E,FIND INSTRUCTOR$ Unassign from M Mari (per DLJ) &amp; T d,MARI,MARIA,mmari,Tuskey; Sarah,stuskey,FULL,1000071442</p>
        <p class="style1">
            &nbsp; <a href="SampleCMR.txt" target="_blank">Sample Upload</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="DataPrepREADME.txt" target="_blank">Excel Prep Sheet</a></p>
        <p class="style1">
            &nbsp;</p>
    
    </div>
        <asp:Panel ID="Panel1" runat="server">
            <asp:FileUpload ID="UploadFile" runat="server" BorderColor="#009933" BorderStyle="Solid" BorderWidth="2px" />
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="Upload File" BorderColor="#CC0000" BorderStyle="Double" BorderWidth="2px" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
            <asp:RadioButtonList ID="RadioButtonList1" runat="server" Font-Bold="True" RepeatDirection="Horizontal">
                <asp:ListItem Value="data">Show Data Only</asp:ListItem>
                <asp:ListItem Selected="True" Value="run">RUN</asp:ListItem>
                <asp:ListItem Value="showall">Show Data &amp; Run</asp:ListItem>
            </asp:RadioButtonList>
            &nbsp;<br />
            <asp:Button ID="btnUpload" runat="server" BackColor="#CC0000" Font-Bold="True" ForeColor="White" Text="Input Data" />
            <br />
            </asp:Panel>
    </form>
</body>
</html>
