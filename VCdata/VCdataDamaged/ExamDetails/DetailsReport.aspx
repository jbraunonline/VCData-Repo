<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="DetailsReport.aspx.vb" Inherits="VCdata.DetailsReport" %>

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
            <telerik:RadGrid ID="RadGrid1" runat="server" DataSourceID="SqlDataSource1" Skin="WebBlue" AllowSorting="True">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                <ExportSettings ExportOnlyData="True">
                </ExportSettings>
                <MasterTableView AutoGenerateColumns="False" DataSourceID="SqlDataSource1"  CommandItemDisplay="Top" >
                    <CommandItemSettings ShowExportToExcelButton="true" ShowAddNewRecordButton="false" ShowRefreshButton="true" />

                   <Columns>
                        <telerik:GridBoundColumn DataField="FamilyString" FilterControlAltText="Filter FamilyString column" HeaderText="FamilyString" SortExpression="FamilyString" UniqueName="FamilyString">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Parent" FilterControlAltText="Filter Parent column" HeaderText="Parent" SortExpression="Parent" UniqueName="Parent">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Course" FilterControlAltText="Filter Course column" HeaderText="Course" SortExpression="Course" UniqueName="Course">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Outlook" FilterControlAltText="Filter Outlook column" HeaderText="Outlook" SortExpression="Outlook" UniqueName="Outlook">
                        </telerik:GridBoundColumn>
                        <telerik:GridCheckBoxColumn DataField="CanChange" DataType="System.Boolean" FilterControlAltText="Filter CanChange column" HeaderText="CanChange" SortExpression="CanChange" UniqueName="CanChange">
                        </telerik:GridCheckBoxColumn>
                        <telerik:GridBoundColumn DataField="Session" FilterControlAltText="Filter Session column" HeaderText="Session" SortExpression="Session" UniqueName="Session">
                        </telerik:GridBoundColumn>
                        <telerik:GridCheckBoxColumn DataField="IsMidterm" DataType="System.Boolean" FilterControlAltText="Filter IsMidterm column" HeaderText="IsMidterm" SortExpression="IsMidterm" UniqueName="IsMidterm">
                        </telerik:GridCheckBoxColumn>
                        <telerik:GridBoundColumn DataField="MidStart" DataType="System.DateTime" FilterControlAltText="Filter MidStart column" HeaderText="MidStart" SortExpression="MidStart" UniqueName="MidStart"   DataFormatString="{0:d}" >
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="MidEnd" DataType="System.DateTime" FilterControlAltText="Filter MidEnd column" HeaderText="MidEnd" SortExpression="MidEnd" UniqueName="MidEnd"   DataFormatString="{0:d}">
                        </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="MidNameL" FilterControlAltText="Filter MidNameL column" HeaderText="MidNameL" SortExpression="MidNameL" UniqueName="MidNameL">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="MidNameR" FilterControlAltText="Filter MidNameR column" HeaderText="MidNameR" SortExpression="MidNameR" UniqueName="MidNameR">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="MidTime" DataType="System.Int32" FilterControlAltText="Filter MidTime column" HeaderText="MidTime" SortExpression="MidTime" UniqueName="MidTime">
                        </telerik:GridBoundColumn>
                        <telerik:GridCheckBoxColumn DataField="MidPaper" DataType="System.Boolean" FilterControlAltText="Filter MidPaper column" HeaderText="MidPaper" SortExpression="MidPaper" UniqueName="MidPaper">
                        </telerik:GridCheckBoxColumn>
                        <telerik:GridCheckBoxColumn DataField="MidCalculator" DataType="System.Boolean" FilterControlAltText="Filter MidCalculator column" HeaderText="MidCalculator" SortExpression="MidCalculator" UniqueName="MidCalculator">
                        </telerik:GridCheckBoxColumn>
                        <telerik:GridCheckBoxColumn DataField="MidGraph" DataType="System.Boolean" FilterControlAltText="Filter MidGraph column" HeaderText="MidGraph" SortExpression="MidGraph" UniqueName="MidGraph">
                        </telerik:GridCheckBoxColumn>
                        <telerik:GridBoundColumn DataField="MidNotes" FilterControlAltText="Filter MidNotes column" HeaderText="MidNotes" SortExpression="MidNotes" UniqueName="MidNotes">
                        </telerik:GridBoundColumn>
                        <telerik:GridCheckBoxColumn DataField="IsFinal" DataType="System.Boolean" FilterControlAltText="Filter IsFinal column" HeaderText="IsFinal" SortExpression="IsFinal" UniqueName="IsFinal">
                        </telerik:GridCheckBoxColumn>
                        <telerik:GridBoundColumn DataField="FinalStart" DataType="System.DateTime" FilterControlAltText="Filter FinalStart column" HeaderText="FinalStart" SortExpression="FinalStart" UniqueName="FinalStart"   DataFormatString="{0:d}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="FinalEnd" DataType="System.DateTime" FilterControlAltText="Filter FinalEnd column" HeaderText="FinalEnd" SortExpression="FinalEnd" UniqueName="FinalEnd"   DataFormatString="{0:d}">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="FinalNameL" FilterControlAltText="Filter FinalNameL column" HeaderText="FinalNameL" SortExpression="FinalNameL" UniqueName="FinalNameL">
                        </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="FinalFolderR" FilterControlAltText="Filter FinalFolderR column" HeaderText="FinalFolderR" SortExpression="FinalFolderR" UniqueName="FinalFolderR">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="FinalTime" DataType="System.Int32" FilterControlAltText="Filter FinalTime column" HeaderText="FinalTime" SortExpression="FinalTime" UniqueName="FinalTime">
                        </telerik:GridBoundColumn>
                        <telerik:GridCheckBoxColumn DataField="FinalPaper" DataType="System.Boolean" FilterControlAltText="Filter FinalPaper column" HeaderText="FinalPaper" SortExpression="FinalPaper" UniqueName="FinalPaper">
                        </telerik:GridCheckBoxColumn>
                        <telerik:GridCheckBoxColumn DataField="FinalCalculator" DataType="System.Boolean" FilterControlAltText="Filter FinalCalculator column" HeaderText="FinalCalculator" SortExpression="FinalCalculator" UniqueName="FinalCalculator">
                        </telerik:GridCheckBoxColumn>
                        <telerik:GridCheckBoxColumn DataField="FinalGraph" DataType="System.Boolean" FilterControlAltText="Filter FinalGraph column" HeaderText="FinalGraph" SortExpression="FinalGraph" UniqueName="FinalGraph">
                        </telerik:GridCheckBoxColumn>
                        <telerik:GridBoundColumn DataField="FinalNotes" FilterControlAltText="Filter FinalNotes column" HeaderText="FinalNotes" SortExpression="FinalNotes" UniqueName="FinalNotes">
                        </telerik:GridBoundColumn>
                        <telerik:GridCheckBoxColumn DataField="MidProctorX" DataType="System.Boolean" FilterControlAltText="Filter MidProctorX column" HeaderText="MidProctorX" SortExpression="MidProctorX" UniqueName="MidProctorX">
                        </telerik:GridCheckBoxColumn>
                        <telerik:GridCheckBoxColumn DataField="FinalProctorX" DataType="System.Boolean" FilterControlAltText="Filter FinalProctorX column" HeaderText="FinalProctorX" SortExpression="FinalProctorX" UniqueName="FinalProctorX">
                        </telerik:GridCheckBoxColumn>
                       <telerik:GridTemplateColumn DataField="alertflag" FilterControlAltText="Filter alertflag column" HeaderText="alertflag" SortExpression="alertflag" UniqueName="alertflag"  AllowFiltering="false"  ReadOnly="true" >
                             <ItemTemplate>
                            <asp:Label ID="alertLink" runat="server" Text='<%# getalertPop(Eval("Parent"))%>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [FamilyString], [Parent], [Course], [Outlook], [CanChange], [Session], [IsMidterm], [MidStart], [MidEnd], [MidNameR], [MidTime], [MidPaper], [MidCalculator], [MidGraph], [MidNotes], [IsFinal], [FinalStart], [FinalEnd], [FinalNameL], [FinalTime], [FinalPaper], [FinalCalculator], [FinalGraph], [FinalNotes], [MidProctorX], [FinalProctorX], [MidNameL], [FinalFolderR] FROM [MasterProctor]"></asp:SqlDataSource>
        <telerik:RadFormDecorator ID="RadFormDecorator1" Runat="server" DecoratedControls="CheckBoxes" Skin="Material" />
    </form>
</body>
</html>
