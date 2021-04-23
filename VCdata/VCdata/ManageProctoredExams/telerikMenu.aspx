<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="telerikMenu.aspx.vb" Inherits="VCdata.telerikMenu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 1302px;
            height: 1434px;
            margin-left: 0px;
            margin-right: 73px;
        }
        
             
    div.RadMenu_Simple ul.rmRootGroup
    {
        background-color: white;
    }
     
     div.RadMenu_Simple .rmLink
     {
         color: black;
     }
      
     /* for hover, focused, expanded items */
     div.RadMenu_Simple .rmItem .rmLink:hover,
     div.RadMenu_Simple .rmItem .rmFocused {
         color: red;
         background:#fff ;
     }
     div.RadMenu_Simple .rmItem .rmSelected {
         color: green;
         border-width:4px;
         background-color:black ;
     }

     

</style>
    
<style type="text/css">
    .div.RadMenu_Simple.rmSelected
    {
        background-color: Green !important;
    }
</style>


</head>
<body>
    <form id="form1" runat="server">
        <telerik:RadStyleSheetManager ID="RadStyleSheetManager1" runat="server">
        </telerik:RadStyleSheetManager>
        <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
            <Scripts>
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.Core.js">
                </asp:ScriptReference>
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQuery.js">
                </asp:ScriptReference>
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQueryInclude.js">
                </asp:ScriptReference>
            </Scripts>
        </telerik:RadScriptManager>
        <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
        </telerik:RadAjaxManager>
 <div class="auto-style4">
                <div style="width: 10%; height: 800px; float: left; background: white;"> 
             
            <br />
   x
    
            
<telerik:RadMenu ID="RadMenu_Simple" runat="server" Flow="Vertical" Skin="Simple" >
    <Items >
        <telerik:RadMenuItem runat="server" BorderWidth="3"  Text="Getting Started -DatePrep" NavigateUrl="gettingstarted/default.aspx" Target="iframe_a">
        </telerik:RadMenuItem>
        <telerik:RadMenuItem runat="server" BorderWidth="3" Text="Step A - Families" NavigateUrl= "../ManageProctoredexams/Families/StepA.aspx" Target="iframe_a">
        </telerik:RadMenuItem>
        <telerik:RadMenuItem runat="server" BorderWidth="3" Text="Step B - Reset BB" NavigateUrl="../ManageProctoredexams/ResetBBCourses/StepB.aspx"  Target="iframe_a">
        </telerik:RadMenuItem>
                <telerik:RadMenuItem runat="server" BorderWidth="3" Text="Step C - Update MasterProctor" NavigateUrl="../ManageProctoredexams/AddData2MasterProctor/StepC.aspx"  Target="iframe_a">
        </telerik:RadMenuItem>
                        <telerik:RadMenuItem runat="server" BorderWidth="3" Text="Step D - Open FacultyPortal" NavigateUrl="../ManageProctoredexams/ModifyfacultyPortal/StepD.aspx"  Target="iframe_a">
        </telerik:RadMenuItem>
                                <telerik:RadMenuItem runat="server" BorderWidth="3" Text="Step E - Close FacultyPortal" NavigateUrl="../ManageProctoredexams/ModifyfacultyPortal/StepE.aspx"  Target="iframe_a">
        </telerik:RadMenuItem>
                                <telerik:RadMenuItem runat="server" BorderWidth="3" Text="Step F - Verify Input" NavigateUrl="../ManageProctoredexams/verifyFacultyInput/verify.aspx"  Target="iframe_a">
        </telerik:RadMenuItem>
                                <telerik:RadMenuItem runat="server" BorderWidth="3" Text="Step G-CreateReportData" NavigateUrl="../ManageProctoredExams/ProctorTestingDB/CreateProctorTestingDB.aspx"  Target="iframe_a">
        </telerik:RadMenuItem>
                                <telerik:RadMenuItem runat="server" BorderWidth="3" Text="Create Reports" NavigateUrl="../ManageProctoredexams/Reports/Reports.aspx"  Target="iframe_a">
        </telerik:RadMenuItem>
                                        <telerik:RadMenuItem runat="server" BorderWidth="3" Text="Data Flow" NavigateUrl="../ManageProctoredexams/support/DataFlow.pdf"  Target="iframe_a">
        </telerik:RadMenuItem>

    </Items>
</telerik:RadMenu>


    


        </div>
             <div style="margin-left: 10%; height: 1200px; background: white;"> 
    
            <iframe src="blank1.aspx" name="iframe_a"  title="Iframe Example" class="auto-style1" style="border-color: #FFFFFF" width="1800"></iframe>
        </div>

    </div>

    </form>
</body>
</html>
