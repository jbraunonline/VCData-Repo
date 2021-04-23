<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FInalSettingVerification.aspx.vb" Inherits="VCdata.FInalSettingVerification" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            font-size: x-large;
            font-family: Arial, Helvetica, sans-serif;
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
            <span class="auto-style1"><strong>Final Exam Setting Verification
            <asp:DropDownList ID="ddSession" runat="server">
                <asp:ListItem Selected="True">1</asp:ListItem>
                <asp:ListItem>8w1</asp:ListItem>
                <asp:ListItem>8w2</asp:ListItem>
                <asp:ListItem>6w1</asp:ListItem>
                <asp:ListItem>6w2</asp:ListItem>
            </asp:DropDownList>
&nbsp;
            <asp:Button ID="BtnChange" runat="server" Text="Change Session" />
&nbsp;
            <asp:Label ID="lblSession" runat="server"></asp:Label>
            </strong></span>&nbsp;<asp:CheckBox ID="CheckBox1" runat="server" Text="Use Default Settings" />
&nbsp;<telerik:RadGrid ID="RadGrid1" runat="server" AllowFilteringByColumn="True"  OnItemDataBound="RadGrid1_ItemDataBound" AllowSorting="True" AutoGenerateColumns="False" AutoGenerateEditColumn="True" DataSourceID="SqlDataSource1" Height="900px" Skin="WebBlue" Width="2300px" AllowAutomaticUpdates="True">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                <ClientSettings AllowColumnsReorder="True" ReorderColumnsOnClient="True">
                    <Scrolling AllowScroll="True" UseStaticHeaders="True" />
                    <Resizing AllowColumnResize="True" AllowResizeToFit="True" />
                </ClientSettings>
                <MasterTableView DataKeyNames="ID" DataSourceID="SqlDataSource1">
                    <Columns>

                       <telerik:GridTemplateColumn UniqueName="TemplateColumn" HeaderText="#" AllowFiltering="false">
                            <ItemTemplate>
                               <asp:Label ID="numberLabel" runat="server" Width="40px" />
                            </ItemTemplate>
                           <HeaderStyle Width="40px" />
                        </telerik:GridTemplateColumn>

                        <telerik:GridBoundColumn DataField="ID" DataType="System.Int32" FilterControlAltText="Filter ID column" HeaderText="ID" ReadOnly="True" SortExpression="ID" UniqueName="ID" Visible="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="FamilyString" FilterControlAltText="Filter FamilyString column" HeaderText="Family"  HeaderStyle-Width="165px" SortExpression="FamilyString" UniqueName="FamilyString">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Course" FilterControlAltText="Filter Course column" HeaderText="Course" HeaderStyle-Width="165px" SortExpression="Course" UniqueName="Course">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Instructor" FilterControlAltText="Filter Instructor column" HeaderText="Instructor"  HeaderStyle-Width="165px" SortExpression="Instructor" UniqueName="Instructor">
                        </telerik:GridBoundColumn>
                        <telerik:GridCheckBoxColumn DataField="CanChange" DataType="System.Boolean" FilterControlAltText="Filter CanChange column" HeaderText="CanChg" SortExpression="CanChange" UniqueName="CanChange" AllowFiltering="false"  >
                        </telerik:GridCheckBoxColumn>
                        <telerik:GridCheckBoxColumn DataField="IsFinal" DataType="System.Boolean" FilterControlAltText="Filter IsFinal column" HeaderText="IsFinal" SortExpression="IsFinal" UniqueName="IsFinal">
                        </telerik:GridCheckBoxColumn>


                         <telerik:GridBoundColumn DataField="FinalStart" DataFormatString="{0:MM/dd/yyyy}" DataType="System.DateTime" HeaderText="Start" AllowFiltering = "False"></telerik:GridBoundColumn>

                         <telerik:GridBoundColumn DataField="FinalEnd" DataFormatString="{0:MM/dd/yyyy}" DataType="System.DateTime" HeaderText="End" AllowFiltering = "False"></telerik:GridBoundColumn>

                        <telerik:GridBoundColumn DataField="FinalNameL" FilterControlAltText="Filter FinalNameL column" HeaderText="FinalNameL" SortExpression="FinalNameL" UniqueName="FinalNameL"  AllowFiltering="false" >
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="FinalNameR" FilterControlAltText="Filter FinalNameR column" HeaderText="FinalNameR" SortExpression="FinalNameR" UniqueName="FinalNameR" AllowFiltering="false"  >
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="FinalTime" FilterControlAltText="Filter FinalTime column" HeaderText="Time" SortExpression="FinalTime" UniqueName="FinalTime" DataType="System.Int32"  AllowFiltering="false" >
                        </telerik:GridBoundColumn>
                        <telerik:GridCheckBoxColumn DataField="FinalPaper" DataType="System.Boolean" FilterControlAltText="Filter FinalPaper column" HeaderText="Paper"   HeaderStyle-Width="65px" SortExpression="FinalPaper" UniqueName="FinalPaper" AllowFiltering="false"  >
                        </telerik:GridCheckBoxColumn>
                        <telerik:GridCheckBoxColumn DataField="FinalCalculator" DataType="System.Boolean" FilterControlAltText="Filter FinalCalculator column" HeaderText="Calc"   HeaderStyle-Width="65px" SortExpression="FinalCalculator" UniqueName="FinalCalculator" AllowFiltering="false" >
                        </telerik:GridCheckBoxColumn>
                        <telerik:GridCheckBoxColumn DataField="FinalGraph" DataType="System.Boolean" FilterControlAltText="Filter FinalGraph column" HeaderText="Graph"   HeaderStyle-Width="65px" SortExpression="FinalGraph" UniqueName="FinalGraph" AllowFiltering="false" >
                        </telerik:GridCheckBoxColumn>
                        <telerik:GridBoundColumn DataField="InstComments" FilterControlAltText="Filter InstComments column" HeaderText="InstCmts" SortExpression="InstComments" UniqueName="InstComments"  AllowFiltering="false" >
                        </telerik:GridBoundColumn>
                        <telerik:GridCheckBoxColumn DataField="FinalProctorX" DataType="System.Boolean" FilterControlAltText="Filter FinalProctorX column" HeaderText="ProcU"   HeaderStyle-Width="65px" SortExpression="FinalProctorX" UniqueName="FinalProctorX"  AllowFiltering="false" >
                        </telerik:GridCheckBoxColumn>
                        <telerik:GridCheckBoxColumn DataField="LockdownFinal" DataType="System.Boolean" FilterControlAltText="Filter Lockdwn column" HeaderText="Lockdwn"   HeaderStyle-Width="65px" SortExpression="LockdownFinal" UniqueName="LockdownFinal"  AllowFiltering="false" >
                        </telerik:GridCheckBoxColumn>
                        <telerik:GridCheckBoxColumn DataField="FinalEssay" DataType="System.Boolean" FilterControlAltText="Filter FinalEssay column" HeaderText="FinalEssay"   HeaderStyle-Width="65px" SortExpression="FinalEssay" UniqueName="FinalEssay"  AllowFiltering="false" >
                        </telerik:GridCheckBoxColumn>
                        <telerik:GridBoundColumn DataField="PF_ANXMTR" FilterControlAltText="Filter PF_ANXMTR column" HeaderText="PF_ANXMTR" SortExpression="PF_ANXMTR" UniqueName="PF_ANXMTR"  AllowFiltering="false" >
                        </telerik:GridBoundColumn>
                            <telerik:GridTemplateColumn AllowFiltering="false" DataField="ID"  HeaderText="??" ReadOnly="true" AllowSorting="false"  >
                             <ItemTemplate>
                            <asp:Label ID="alertLink" runat="server" Text='<%# getPopUp(Eval("ID"), Eval("Course"))%>'></asp:Label>
                            </ItemTemplate>
                           </telerik:GridTemplateColumn>
                    </Columns>
                </MasterTableView>
                  <GroupingSettings CaseSensitive="false" />
            </telerik:RadGrid>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [MasterProctor] WHERE [ID] = @ID" InsertCommand="INSERT INTO [MasterProctor] ([FamilyString], [Course], [Instructor], [CanChange], [IsFinal], [FinalEnd], [FinalStart], [FinalNameL], [FinalTime], [FinalPaper], [FinalCalculator], [FinalGraph], [InstComments], [FinalProctorX], [LockdownFinal], [FinalEssay], [PF_ANXMTR], [FinalNameR]) VALUES (@FamilyString, @Course, @Instructor, @CanChange, @IsFinal, @FinalEnd, @FinalStart, @FinalNameL, @FinalTime, @FinalPaper, @FinalCalculator, @FinalGraph, @InstComments, @FinalProctorX, @LockdownFinal, @FinalEssay, @PF_ANXMTR, @FinalNameR)" SelectCommand="SELECT [ID], [FamilyString], [Course], [Instructor], [CanChange], [IsFinal], [FinalEnd], [FinalStart], [FinalNameL], [FinalTime], [FinalPaper], [FinalCalculator], [FinalGraph], [InstComments], [FinalProctorX], [LockdownFinal], [FinalEssay], [PF_ANXMTR], [FinalNameR] FROM [MasterProctor] WHERE (([Session] = @Session) AND ([OptIn] = @OptIn) AND ([UseDefault] = @UseDefault)) ORDER BY [Course]" UpdateCommand="UPDATE [MasterProctor] SET [FamilyString] = @FamilyString, [Course] = @Course, [Instructor] = @Instructor, [CanChange] = @CanChange, [IsFinal] = @IsFinal, [FinalEnd] = @FinalEnd, [FinalStart] = @FinalStart, [FinalNameL] = @FinalNameL, [FinalTime] = @FinalTime, [FinalPaper] = @FinalPaper, [FinalCalculator] = @FinalCalculator, [FinalGraph] = @FinalGraph, [InstComments] = @InstComments, [FinalProctorX] = @FinalProctorX, [LockdownFinal] = @LockdownFinal, [FinalEssay] = @FinalEssay, [PF_ANXMTR] = @PF_ANXMTR, [FinalNameR] = @FinalNameR WHERE [ID] = @ID">
            <DeleteParameters>
                <asp:Parameter Name="ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="FamilyString" Type="String" />
                <asp:Parameter Name="Course" Type="String" />
                <asp:Parameter Name="Instructor" Type="String" />
                <asp:Parameter Name="CanChange" Type="Boolean" />
                <asp:Parameter Name="IsFinal" Type="Boolean" />
                <asp:Parameter DbType="Date" Name="FinalEnd" />
                <asp:Parameter DbType="Date" Name="FinalStart" />
                <asp:Parameter Name="FinalNameL" Type="String" />
                <asp:Parameter Name="FinalTime" Type="Int32" />
                <asp:Parameter Name="FinalPaper" Type="Boolean" />
                <asp:Parameter Name="FinalCalculator" Type="Boolean" />
                <asp:Parameter Name="FinalGraph" Type="Boolean" />
                <asp:Parameter Name="InstComments" Type="String" />
                <asp:Parameter Name="FinalProctorX" Type="Boolean" />
                <asp:Parameter Name="LockdownFinal" Type="Boolean" />
                <asp:Parameter Name="FinalEssay" Type="Boolean" />
                <asp:Parameter Name="PF_ANXMTR" Type="String" />
                <asp:Parameter Name="FinalNameR" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter DefaultValue="1" Name="Session" SessionField="mysession" Type="String" />
                <asp:Parameter DefaultValue="True" Name="OptIn" Type="Boolean" />
                <asp:Parameter DefaultValue="False" Name="UseDefault" Type="Boolean" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="FamilyString" Type="String" />
                <asp:Parameter Name="Course" Type="String" />
                <asp:Parameter Name="Instructor" Type="String" />
                <asp:Parameter Name="CanChange" Type="Boolean" />
                <asp:Parameter Name="IsFinal" Type="Boolean" />
                <asp:Parameter DbType="Date" Name="FinalEnd" />
                <asp:Parameter DbType="Date" Name="FinalStart" />
                <asp:Parameter Name="FinalNameL" Type="String" />
                <asp:Parameter Name="FinalTime" Type="Int32" />
                <asp:Parameter Name="FinalPaper" Type="Boolean" />
                <asp:Parameter Name="FinalCalculator" Type="Boolean" />
                <asp:Parameter Name="FinalGraph" Type="Boolean" />
                <asp:Parameter Name="InstComments" Type="String" />
                <asp:Parameter Name="FinalProctorX" Type="Boolean" />
                <asp:Parameter Name="LockdownFinal" Type="Boolean" />
                <asp:Parameter Name="FinalEssay" Type="Boolean" />
                <asp:Parameter Name="PF_ANXMTR" Type="String" />
                <asp:Parameter Name="FinalNameR" Type="String" />
                <asp:Parameter Name="ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <telerik:RadFormDecorator ID="RadFormDecorator1" Runat="server" DecoratedControls="CheckBoxes" Skin="Material" />
    </form>
</body>
</html>
