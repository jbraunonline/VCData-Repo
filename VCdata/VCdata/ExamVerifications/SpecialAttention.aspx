<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="SpecialAttention.aspx.vb" Inherits="Telerik2.SpecialAttention" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
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
    <style type="text/css">
        .auto-style1 {
            font-family: Arial, Helvetica, sans-serif;
        }
        .auto-style2 {
            text-decoration: underline;
        }
        .auto-style3 {
            color: #993333;
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
        <div>
            <asp:DropDownList ID="ddlTerm" runat="server">
                <asp:ListItem Selected="True">2213</asp:ListItem>
            </asp:DropDownList>
&nbsp;&nbsp; Term<br />
            <asp:DropDownList ID="ddlSession" runat="server">
                <asp:ListItem>1</asp:ListItem>
                <asp:ListItem>8W1</asp:ListItem>
                <asp:ListItem>6W1</asp:ListItem>
                <asp:ListItem>8W2</asp:ListItem>
                <asp:ListItem>6W2</asp:ListItem>
            </asp:DropDownList>
            \&nbsp;&nbsp; Session<br />
            <asp:DropDownList ID="ddlExam" runat="server">
                <asp:ListItem Selected="True">Select Exam</asp:ListItem>
                <asp:ListItem>MidTerm</asp:ListItem>
                <asp:ListItem>Final</asp:ListItem>
            </asp:DropDownList>
            <br />
            <asp:Button ID="btnGetData" runat="server" Text="Get Data" />
        </div>
        <p class="auto-style1">
            <strong>Proctor Settings Report for <span class="auto-style3">NOT DEFAULT </span>selection. <span class="auto-style2">8w1 and 16 week</span> MID TERM sessions</strong></p>
        <telerik:RadGrid ID="RadGrid1" runat="server" DataSourceID="SqlDataSource1" Skin="WebBlue" AllowSortingByColumn="True" AllowFilteringByColumn="True" AllowSorting="True" CellSpacing="-1" GridLines="Both">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
            <ClientSettings>
                <Selecting AllowRowSelect="True" />
            </ClientSettings>
            <MasterTableView AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource1"  commanditemdisplay="Top">
                <CommandItemSettings ShowAddNewRecordButton="False" />
                 <CommandItemSettings ShowRefreshButton ="True" />
                <Columns>
                    <telerik:GridBoundColumn DataField="ID" FilterControlAltText="Filter ID column" HeaderText="ID" SortExpression="ID" UniqueName="ID" DataType="System.Int32" ReadOnly="True" Visible ="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="FamilyString" FilterControlAltText="Filter FamilyString column" HeaderText="FamilyString" SortExpression="FamilyString" UniqueName="FamilyString" AllowFiltering="false" >
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Course" FilterControlAltText="Filter Course column" HeaderText="Course" SortExpression="Course" UniqueName="Course"  AllowFiltering="false" >
                    </telerik:GridBoundColumn>
 
                        <telerik:GridTemplateColumn HeaderText="Instructor" AllowSorting="false" AllowFiltering="false">
                        <ItemTemplate>
                            <asp:Label ID="Outlook" runat="server" Text='<%# GetOutlook(Eval("Instructor"), Eval("Outlook"))%>'></asp:Label>
                        </ItemTemplate>
  </telerik:GridTemplateColumn>



                    <telerik:GridCheckBoxColumn DataField="CanChange" DataType="System.Boolean" FilterControlAltText="Filter CanChange column" HeaderText="CanChange" SortExpression="CanChange" UniqueName="CanChange" Visible ="false">
                    </telerik:GridCheckBoxColumn>
                    <telerik:GridBoundColumn DataField="Session" FilterControlAltText="Filter Session column" HeaderText="Session" SortExpression="Session" UniqueName="Session" AllowFiltering="true" AllowSorting="true">
                    </telerik:GridBoundColumn>
                                               <telerik:GridBoundColumn DataField="MidNotes" FilterControlAltText="Filter MidNotes column" HeaderText="MidNotes" SortExpression="MidNotes" UniqueName="MidNotes" AllowSorting="true"  AllowFiltering="false" >
                    </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="InstComments" FilterControlAltText="Filter InstComments column" HeaderText="InstComments" SortExpression="InstComments" UniqueName="InstComments" AllowSorting="true"  AllowFiltering="false" >
                    </telerik:GridBoundColumn>
                                                 <telerik:GridCheckBoxColumn DataField="MidVerified" DataType="System.Boolean" FilterControlAltText="Filter MidVerified column" HeaderText="MidVerified" SortExpression="MidVerified" UniqueName="MidVerified"  AllowFiltering="false" >
                    </telerik:GridCheckBoxColumn>

                        <telerik:GridTemplateColumn AllowFiltering="false" DataField="ID" FilterControlAltText="Filter alertflag column" HeaderText="Details" ReadOnly="true" SortExpression="alertflag" UniqueName="alertflag" >
                             <ItemTemplate>
                            <asp:Label ID="alertLink" runat="server" Text='<%# getPopUp(Eval("ID"))%>'></asp:Label>
                            </ItemTemplate>
                           </telerik:GridTemplateColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:VC_VCDataConnectionString %>" SelectCommand="SELECT [ID], [MidNotes], [FamilyString], [Course], [Instructor], [Outlook], [CanChange], [Session], [InstComments], [MidVerified] FROM [MasterProctor] WHERE (([Term] = @Term) AND ([UseDefault] = @UseDefault) AND ([IsMidterm] = @IsMidterm))">
            <SelectParameters>
                <asp:Parameter DefaultValue="2213" Name="Term" Type="String" />
                <asp:Parameter DefaultValue="False" Name="UseDefault" Type="Boolean" />
                <asp:Parameter DefaultValue="True" Name="IsMidterm" Type="Boolean" />
            </SelectParameters>
        </asp:SqlDataSource>


        <telerik:RadFormDecorator ID="RadFormDecorator1" Runat="server" DecoratedControls="CheckBoxes" Skin="Material" />
    </form>
</body>
</html>
