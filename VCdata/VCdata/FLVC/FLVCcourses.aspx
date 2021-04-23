<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FLVCcourses.aspx.vb" Inherits="VCdata.FLVCcourses" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            font-size: x-large;
        }
        .auto-style2 {
            font-family: Arial, Helvetica, sans-serif;
        }
        .auto-style3 {
            font-weight: normal;
        }
        .auto-style4 {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    

    <p class="auto-style1">
        <strong>CREATE FLVC Course Data</strong></p>
        <p>
            <asp:Button ID="Button1" runat="server" BackColor="#CC0000" Font-Bold="True" ForeColor="White" Text="CLEAR FLVCdistinct" />
        &nbsp;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; do once at start of each term &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;</p>
        <p>
            <asp:TextBox ID="txtTerm" runat="server">2197</asp:TextBox>
&nbsp; Enter Term (e.g. 2197)&nbsp;&nbsp; THEN
            <asp:Button ID="txtLoad" runat="server" BackColor="#009900" Font-Bold="True" ForeColor="White" Text="LOAD FLVCdistinct" />
        </p>
        <p>
        Get All distinct course from CMR into a temp table (minus the no credit courses) then run Get FLVC Course Data below.</p>
    <p>
        &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;Do only once at start of each term &gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;</p>
           <asp:Panel ID="Panel1" runat="server">
            <br />
            <asp:Button ID="getData" runat="server"  Text="Get FLVC Course Data" />
               &nbsp;&nbsp;
               <asp:Button ID="Button2" runat="server" Text="Upload" Visible="False" />
               &nbsp;
               <asp:Label ID="lblDownload" runat="server" BackColor="#FFFF99" CssClass="auto-style2" Font-Bold="True"></asp:Label>
               <span class="auto-style2">&nbsp;
               <br />
               </span>
               <asp:Label ID="lblNotice" runat="server" Font-Names="Arial" ForeColor="#CC0000" Text="Label" Visible="False"></asp:Label>
               <br />
               <br />
               <asp:TextBox ID="txtOutput" runat="server" BackColor="#D7EBFF" Height="244px" TextMode="MultiLine" Visible="False" Width="1293px"></asp:TextBox>
            <br />
            <br />
        </asp:Panel>
            </div>
    </form>
</body>
</html>
