<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="MidTermSettingVerification.aspx.vb" Inherits="VCdata.MidTermSettingVerification" %>

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
            <span class="auto-style1"><strong>Review MidTerm Proctor Exam Selections&nbsp;
            <asp:DropDownList ID="ddlSession" runat="server">
                <asp:ListItem Selected="True" Value="1">1</asp:ListItem>
                <asp:ListItem>8W1</asp:ListItem>
                <asp:ListItem>8W2</asp:ListItem>
                <asp:ListItem>6w1</asp:ListItem>
                <asp:ListItem>6w2</asp:ListItem>
            </asp:DropDownList>
&nbsp;<asp:Button ID="btnChange" runat="server" Text="ChangeSession" />
&nbsp;Showing Data for
            <asp:Label ID="lblSession" runat="server"></asp:Label>
            </strong></span>&nbsp;<telerik:RadGrid ID="RadGrid1" runat="server"  OnItemDataBound="RadGrid1_ItemDataBound" AllowAutomaticUpdates="True" AllowFilteringByColumn="True" AllowSorting="True" AutoGenerateEditColumn="True" DataSourceID="SqlDataSource1" Skin="WebBlue" Height="900px">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                <ClientSettings AllowColumnsReorder="True" ReorderColumnsOnClient="True">
                    <Selecting AllowRowSelect="True" />
                    <Scrolling AllowScroll="True" UseStaticHeaders="True" />
                    <Resizing AllowColumnResize="True" />
                </ClientSettings>
                <MasterTableView AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource1" >
                    <Columns>
                                    <telerik:GridTemplateColumn UniqueName="TemplateColumn" HeaderText="#" AllowFiltering="false">
                <ItemTemplate>
                    <asp:Label ID="numberLabel" runat="server" Width="40px" />
                </ItemTemplate>
                <HeaderStyle Width="40px" />
            </telerik:GridTemplateColumn>

                        <telerik:GridBoundColumn DataField="Parent" FilterControlAltText="Filter Parent column" HeaderText="Parent" SortExpression="Parent" UniqueName="Parent">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Course" FilterControlAltText="Filter Course column" HeaderText="Course" SortExpression="Course" UniqueName="Course" AllowFiltering="false" >
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Instructor" FilterControlAltText="Filter Instructor column" HeaderText="Instructor" SortExpression="Instructor" UniqueName="Instructor">
                        </telerik:GridBoundColumn>
                        <telerik:GridCheckBoxColumn DataField="CanChange" DataType="System.Boolean" FilterControlAltText="Filter CanChange column" HeaderText="CanChg" SortExpression="CanChange" UniqueName="CanChange"  AllowFiltering="false">
                        </telerik:GridCheckBoxColumn>

                         
                        <telerik:GridCheckBoxColumn DataField="Signoff" DataType="System.Boolean" FilterControlAltText="Filter Signoff column" HeaderText="Signoff" SortExpression="Signoff" UniqueName="Signoff" AllowFiltering="false">
                        </telerik:GridCheckBoxColumn>

                        <telerik:GridCheckBoxColumn DataField="UseDefault" DataType="System.Boolean" FilterControlAltText="Filter UseDefault column" HeaderText="UseDefault" SortExpression="UseDefault" UniqueName="UseDefault" AllowFiltering="True">
                        </telerik:GridCheckBoxColumn>
                        <telerik:GridCheckBoxColumn DataField="IsMidterm" DataType="System.Boolean" FilterControlAltText="Filter IsMidterm column" HeaderText="IsMid" SortExpression="IsMidterm" UniqueName="IsMidterm" AllowFiltering="true">
                        </telerik:GridCheckBoxColumn>

                        <telerik:GridBoundColumn DataField="MidStart" DataFormatString="{0:MM/dd/yyyy}" DataType="System.DateTime" HeaderText="MidStart" AllowFiltering = "False"></telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="MidNameL" FilterControlAltText="Filter MidNameL column" HeaderText="MidNameL" SortExpression="MidNameL" UniqueName="MidNameL" AllowFiltering="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="MidNameR" FilterControlAltText="Filter MidNameR column" HeaderText="MidNameR" SortExpression="MidNameR" UniqueName="MidNameR" AllowFiltering="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="MidTime" DataType="System.Int32" FilterControlAltText="Filter MidTime column" HeaderText="MidTime" SortExpression="MidTime" UniqueName="MidTime" AllowFiltering="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridCheckBoxColumn DataField="MidPaper" DataType="System.Boolean" FilterControlAltText="Filter MidPaper column" HeaderText="MidPaper" SortExpression="MidPaper" UniqueName="MidPaper" AllowFiltering="false">
                        </telerik:GridCheckBoxColumn>
                        <telerik:GridCheckBoxColumn DataField="MidCalculator" DataType="System.Boolean" FilterControlAltText="Filter MidCalculator column" HeaderText="MidCalc" SortExpression="MidCalculator" UniqueName="MidCalculator" AllowFiltering="false">
                        </telerik:GridCheckBoxColumn>
                        <telerik:GridCheckBoxColumn DataField="MidGraph" DataType="System.Boolean" FilterControlAltText="Filter MidGraph column" HeaderText="MidGraph" SortExpression="MidGraph" UniqueName="MidGraph" AllowFiltering="false">
                        </telerik:GridCheckBoxColumn>
                        <telerik:GridBoundColumn DataField="MidNotes" FilterControlAltText="Filter MidNotes column" HeaderText="MidNotes" SortExpression="MidNotes" UniqueName="MidNotes" AllowFiltering="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="InstComments" FilterControlAltText="Filter InstComments column" HeaderText="InstComments" SortExpression="InstComments" UniqueName="InstComments" AllowFiltering="false">
                        </telerik:GridBoundColumn>


                        <telerik:GridBoundColumn DataField="SignoffDate" DataFormatString="{0:MM/dd/yyyy}" DataType="System.DateTime" HeaderText="SignoffDate" AllowFiltering = "False" Visible="false">

                        </telerik:GridBoundColumn>
                        <telerik:GridCheckBoxColumn DataField="MidProctorX" DataType="System.Boolean" FilterControlAltText="Filter MidProctorX column" HeaderText="MidProctorX" SortExpression="MidProctorX" UniqueName="MidProctorX" AllowFiltering="false" Visible="true">
                        </telerik:GridCheckBoxColumn>

                        <telerik:GridCheckBoxColumn DataField="LockdownMid" DataType="System.Boolean" FilterControlAltText="Filter LockdownMid column" HeaderText="LockMid" SortExpression="LockdownMid" UniqueName="LockdownMid" AllowFiltering="false">
                        </telerik:GridCheckBoxColumn>
                        <telerik:GridCheckBoxColumn DataField="Lockdown" DataType="System.Boolean" FilterControlAltText="Filter Lockdown column" HeaderText="Lockdown" SortExpression="Lockdown" UniqueName="Lockdown" AllowFiltering="false" Visible ="false">
                        </telerik:GridCheckBoxColumn>
                        <telerik:GridCheckBoxColumn DataField="Essay" DataType="System.Boolean" FilterControlAltText="Filter Essay column" HeaderText="Essay" SortExpression="Essay" UniqueName="Essay" AllowFiltering="false">
                        </telerik:GridCheckBoxColumn>
                        <telerik:GridBoundColumn DataField="PM_ANXMTR" FilterControlAltText="Filter PM_ANXMTR column" HeaderText="PM_ANXMTR" SortExpression="PM_ANXMTR" UniqueName="PM_ANXMTR" AllowFiltering="false">
                        </telerik:GridBoundColumn>
                           <telerik:GridTemplateColumn AllowFiltering="false" DataField="ID"  HeaderText="Details" ReadOnly="true" AllowSorting="false"  >
                             <ItemTemplate>
                            <asp:Label ID="alertLink" runat="server" Text='<%# getPopUp(Eval("ID"), Eval("Course"))%>'></asp:Label>
                            </ItemTemplate>
                           </telerik:GridTemplateColumn>
                        <telerik:GridBoundColumn DataField="ID" DataType="System.Int32" FilterControlAltText="Filter ID column" HeaderText="ID" ReadOnly="True" SortExpression="ID" UniqueName="ID" Visible="false">
                        </telerik:GridBoundColumn>
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
        </div>
        <telerik:RadFormDecorator ID="RadFormDecorator1" Runat="server" DecoratedControls="CheckBoxes" Skin="Material" />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [MasterProctor] WHERE [ID] = @ID" InsertCommand="INSERT INTO [MasterProctor] ([Parent], [Course], [Instructor], [CanChange], [IsMidterm], [MidStart], [MidNameL], [MidNameR], [MidTime], [MidPaper], [MidCalculator], [MidGraph], [MidNotes], [InstComments], [Signoff], [SignoffDate], [MidProctorX], [UseDefault], [LockdownMid], [Lockdown], [Essay], [PM_ANXMTR]) VALUES (@Parent, @Course, @Instructor, @CanChange, @IsMidterm, @MidStart, @MidNameL, @MidNameR, @MidTime, @MidPaper, @MidCalculator, @MidGraph, @MidNotes, @InstComments, @Signoff, @SignoffDate, @MidProctorX, @UseDefault, @LockdownMid, @Lockdown, @Essay, @PM_ANXMTR)" SelectCommand="SELECT [Parent], [Course], [Instructor], [CanChange], [IsMidterm], [MidStart], [MidNameL], [MidNameR], [MidTime], [MidPaper], [MidCalculator], [MidGraph], [MidNotes], [InstComments], [Signoff], [SignoffDate], [MidProctorX], [UseDefault], [LockdownMid], [Lockdown], [Essay], [PM_ANXMTR], [ID] FROM [MasterProctor] WHERE ([Session] = @Session) and optin=1 ORDER BY [Course]" UpdateCommand="UPDATE [MasterProctor] SET [Parent] = @Parent, [Course] = @Course, [Instructor] = @Instructor, [CanChange] = @CanChange, [IsMidterm] = @IsMidterm, [MidStart] = @MidStart, [MidNameL] = @MidNameL, [MidNameR] = @MidNameR, [MidTime] = @MidTime, [MidPaper] = @MidPaper, [MidCalculator] = @MidCalculator, [MidGraph] = @MidGraph, [MidNotes] = @MidNotes, [InstComments] = @InstComments, [Signoff] = @Signoff, [SignoffDate] = @SignoffDate, [MidProctorX] = @MidProctorX, [UseDefault] = @UseDefault, [LockdownMid] = @LockdownMid, [Lockdown] = @Lockdown, [Essay] = @Essay, [PM_ANXMTR] = @PM_ANXMTR WHERE [ID] = @ID">
            <DeleteParameters>
                <asp:Parameter Name="ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Parent" Type="String" />
                <asp:Parameter Name="Course" Type="String" />
                <asp:Parameter Name="Instructor" Type="String" />
                <asp:Parameter Name="CanChange" Type="Boolean" />
                <asp:Parameter Name="IsMidterm" Type="Boolean" />
                <asp:Parameter DbType="Date" Name="MidStart" />
                <asp:Parameter Name="MidNameL" Type="String" />
                <asp:Parameter Name="MidNameR" Type="String" />
                <asp:Parameter Name="MidTime" Type="Int32" />
                <asp:Parameter Name="MidPaper" Type="Boolean" />
                <asp:Parameter Name="MidCalculator" Type="Boolean" />
                <asp:Parameter Name="MidGraph" Type="Boolean" />
                <asp:Parameter Name="MidNotes" Type="String" />
                <asp:Parameter Name="InstComments" Type="String" />
                <asp:Parameter Name="Signoff" Type="Boolean" />
                <asp:Parameter DbType="Date" Name="SignoffDate" />
                <asp:Parameter Name="MidProctorX" Type="Boolean" />
                <asp:Parameter Name="UseDefault" Type="Boolean" />
                <asp:Parameter Name="LockdownMid" Type="Boolean" />
                <asp:Parameter Name="Lockdown" Type="Boolean" />
                <asp:Parameter Name="Essay" Type="Boolean" />
                <asp:Parameter Name="PM_ANXMTR" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlSession" DefaultValue="6w1" Name="Session" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Parent" Type="String" />
                <asp:Parameter Name="Course" Type="String" />
                <asp:Parameter Name="Instructor" Type="String" />
                <asp:Parameter Name="CanChange" Type="Boolean" />
                <asp:Parameter Name="IsMidterm" Type="Boolean" />
                <asp:Parameter DbType="Date" Name="MidStart" />
                <asp:Parameter Name="MidNameL" Type="String" />
                <asp:Parameter Name="MidNameR" Type="String" />
                <asp:Parameter Name="MidTime" Type="Int32" />
                <asp:Parameter Name="MidPaper" Type="Boolean" />
                <asp:Parameter Name="MidCalculator" Type="Boolean" />
                <asp:Parameter Name="MidGraph" Type="Boolean" />
                <asp:Parameter Name="MidNotes" Type="String" />
                <asp:Parameter Name="InstComments" Type="String" />
                <asp:Parameter Name="Signoff" Type="Boolean" />
                <asp:Parameter DbType="Date" Name="SignoffDate" />
                <asp:Parameter Name="MidProctorX" Type="Boolean" />
                <asp:Parameter Name="UseDefault" Type="Boolean" />
                <asp:Parameter Name="LockdownMid" Type="Boolean" />
                <asp:Parameter Name="Lockdown" Type="Boolean" />
                <asp:Parameter Name="Essay" Type="Boolean" />
                <asp:Parameter Name="PM_ANXMTR" Type="String" />
                <asp:Parameter Name="ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>