<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FLVCsections.aspx.vb" Inherits="VCdata.FLVCsecrions" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            font-family: Arial, Helvetica, sans-serif;
            font-size: x-small;
        }
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
    
        <asp:Panel ID="Panel1" runat="server">
            <strong><span class="auto-style1">CREATE FLVC Sections&nbsp; Data&nbsp; </span><span class="auto-style2">(Run FLVC Courses first!)</span><br /> </strong>
            <br />
            <asp:TextBox ID="txtMDCTerm" runat="server">2195</asp:TextBox>
            &nbsp;<span class="style1"><strong>MDC Term&nbsp; e.g. 2</strong>197</span><br />
            <br />
            <asp:TextBox ID="txtTermYear" runat="server">2019</asp:TextBox>
            &nbsp;<span class="style1"><strong>Term Year</strong></span><br />
            <asp:TextBox ID="txtSchoolTerm" runat="server">Summer</asp:TextBox>
            &nbsp; <span class="style1"><strong>SchoolTerm</strong></span><br />
            <asp:TextBox ID="txtTermChoiceID" runat="server" 
                ontextchanged="txtTermChoiceID_TextChanged">71</asp:TextBox>
            &nbsp;<span class="style1"><strong>TermChoiceID&nbsp; Fall 2019=71&nbsp; Get curent number from FLVC upload site.</strong></span><br />&nbsp;<asp:TextBox ID="txtGSFIS" runat="server">15</asp:TextBox>
            &nbsp;<span class="style1"><strong>VCFee GSFIS</strong></span><br />
            <asp:TextBox ID="txtTuitionIS" runat="server">118.22</asp:TextBox>
            &nbsp;<span class="style1"><strong>TuitionIS</strong></span><br />
            <asp:TextBox ID="txtTuitionOS" runat="server">402.51</asp:TextBox>
            &nbsp;<span class="style1"><strong>TuitionOS</strong></span><br />
            <asp:TextBox ID="txtTuitionUpperIS" runat="server" 
                ontextchanged="txtTuitionUpperIS_TextChanged">129.89</asp:TextBox>
            &nbsp;<span class="style1"><strong>Tuition Upper Division IS</strong></span><br />
            <asp:TextBox ID="txtTuitionUpperOS" runat="server" >535.97</asp:TextBox>
            &nbsp;<span class="style1"><strong>Tuition Upper Division OS</strong></span><br />
            <br />
            <asp:Button ID="getData" runat="server" onclick="getData_Click" 
                Text="Get FLVC Section Data" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button1" runat="server" Text="Upload" Visible="False" />
            &nbsp;
            <asp:Label ID="lblDownload" runat="server"></asp:Label>
            <br />
            <br />
            <asp:TextBox ID="txtOutput" runat="server" BackColor="#D7EBFF" Height="244px" TextMode="MultiLine" Width="1293px" Visible="False"></asp:TextBox>
            <br />
            <br />
        </asp:Panel>
    
    </div>
    </form>
</body>
</html>

