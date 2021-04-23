<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FinalReview.aspx.vb" Inherits="VCdata.FinalReview" %>

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
        .auto-style3 {
            color: #993333;
        }
        .auto-style4 {
            color: #CC0000;
        }
        .auto-style5 {
            font-size: x-large;
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
            <strong><span class="auto-style5">Verification of Finals</span></strong><br />
            <asp:DropDownList ID="ddlTerm" runat="server">
                <asp:ListItem Selected="True">2213</asp:ListItem>
                <asp:ListItem>2215</asp:ListItem>
                <asp:ListItem>2217</asp:ListItem>
            </asp:DropDownList>
&nbsp;&nbsp; Term<br />
            <asp:DropDownList ID="ddlSession" runat="server">
                <asp:ListItem Value="1" Selected="True">1 </asp:ListItem>
                <asp:ListItem Value="6W1">6W1</asp:ListItem>
                <asp:ListItem>8W1</asp:ListItem>
                <asp:ListItem>6W2</asp:ListItem>
                <asp:ListItem>8W2</asp:ListItem>
            </asp:DropDownList>
            \&nbsp;&nbsp; Session<br />
            <asp:Button ID="btnGetData" runat="server" Text="Get Data" />
        </div>
        <p class="auto-style1">
            <strong>Proctor Settings Report for <span class="auto-style3">NOT DEFAULT </span>selection. <span class="auto-style4">&nbsp;&nbsp; Final Exams </span>Term =
            <asp:Label ID="lblSelection" runat="server"></asp:Label>
            </strong></p>
        <telerik:RadGrid ID="RadGrid1" runat="server" DataSourceID="SqlDataSource1" Skin="WebBlue" AllowSortingByColumn="True" AllowFilteringByColumn="True" AllowSorting="True" CellSpacing="-1" GridLines="Both">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
            <ClientSettings>
                <Selecting AllowRowSelect="True" />
            </ClientSettings>
            <MasterTableView AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource1"  commanditemdisplay="Top">
                <CommandItemSettings ShowAddNewRecordButton="False" />
                 <CommandItemSettings ShowRefreshButton ="True" />
                <Columns>
                    <telerik:GridBoundColumn DataField="ID" FilterControlAltText="Filter ID column" HeaderText="ID" SortExpression="ID" UniqueName="ID" DataType="System.Int32" ReadOnly="True" visible ="false">
                    </telerik:GridBoundColumn>
                                               <telerik:GridBoundColumn DataField="FinalNotes" FilterControlAltText="Filter FinalNotes column" HeaderText="FinalNotes" SortExpression="FinalNotes" UniqueName="FinalNotes" AllowSorting="true" AllowFiltering="false" >
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="FamilyString" FilterControlAltText="Filter FamilyString column" HeaderText="FamilyString" SortExpression="FamilyString" UniqueName="FamilyString" AllowFiltering="false" >
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Course" FilterControlAltText="Filter Course column" HeaderText="Course" SortExpression="Course" UniqueName="Course" >
                    </telerik:GridBoundColumn>
 
                        <telerik:GridBoundColumn DataField="Instructor" FilterControlAltText="Filter Instructor column" HeaderText="Instructor" SortExpression="Instructor" UniqueName="Instructor">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Outlook" FilterControlAltText="Filter Outlook column" HeaderText="Outlook" SortExpression="Outlook" UniqueName="Outlook" AllowFiltering="false" >
                    </telerik:GridBoundColumn>



                    <telerik:GridCheckBoxColumn DataField="CanChange" DataType="System.Boolean" FilterControlAltText="Filter CanChange column" HeaderText="CanChange" SortExpression="CanChange" UniqueName="CanChange" AllowFiltering="false" >
                    </telerik:GridCheckBoxColumn>
                    <telerik:GridBoundColumn DataField="Session" FilterControlAltText="Filter Session column" HeaderText="Session" SortExpression="Session" UniqueName="Session" AllowFiltering="true" AllowSorting="true">
                    </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="InstComments" FilterControlAltText="Filter InstComments column" HeaderText="InstComments" SortExpression="InstComments" UniqueName="InstComments" AllowSorting="true" AllowFiltering="false" >
                    </telerik:GridBoundColumn>
                                                 <telerik:GridCheckBoxColumn DataField="FinalVerified" DataType="System.Boolean" FilterControlAltText="Filter FinalVerified column" HeaderText="FinalVerified" SortExpression="FinalVerified" UniqueName="FinalVerified" >
                    </telerik:GridCheckBoxColumn>
                                            <telerik:GridTemplateColumn AllowFiltering="false" DataField="ID" FilterControlAltText="Filter alertflag column" HeaderText="Details" ReadOnly="true" SortExpression="alertflag" UniqueName="alertflag" >
                             <ItemTemplate>
                            <asp:Label ID="alertLink" runat="server" Text='<%# getPopUp(Eval("ID"))%>'></asp:Label>
                            </ItemTemplate>
                           </telerik:GridTemplateColumn>
                </Columns>
            </MasterTableView>
              <GroupingSettings CaseSensitive="false" />
        </telerik:RadGrid>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [ID], [FinalNotes], [FamilyString], [Course], [Instructor], [Outlook], [CanChange], [Session], [InstComments], [FinalVerified] FROM [MasterProctor] WHERE  term =@Term and isFinal =1 and UseDefault=0 and session in (@Session)">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlTerm" DefaultValue="2213" Name="Term" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="ddlSession" DefaultValue="'1','8W1','6W1'" Name="Session" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <telerik:RadFormDecorator ID="RadFormDecorator1" Runat="server" DecoratedControls="CheckBoxes" Skin="Material" />
    </form>
</body>
</html>
