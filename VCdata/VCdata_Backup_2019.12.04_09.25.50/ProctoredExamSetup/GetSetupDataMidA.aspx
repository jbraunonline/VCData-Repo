<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="GetSetupDataMidA.aspx.vb" Inherits="VCdata.GetSetupData" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
            MidTerm Setup
            <telerik:RadGrid ID="RadGrid1" runat="server" DataSourceID="SqlDataMidA" Skin="WebBlue" OnItemDataBound="RadGrid1_ItemDataBound" AllowSorting="True"   CommandItemDisplay="Top" AutoGenerateColumns="False" AllowFilteringByColumn="True" CellSpacing="-1" GridLines="Both" >
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                <ExportSettings OpenInNewWindow="True">
                    <Excel Format="Xlsx" />
                </ExportSettings>
                <MasterTableView DataSourceID="SqlDataMidA"   CommandItemDisplay="Top" >
                    <CommandItemSettings ShowExportToExcelButton="true" ShowAddNewRecordButton="false" ShowRefreshButton="true" />
                    <Columns>

                      
                    <telerik:GridTemplateColumn UniqueName="TemplateColumn" HeaderText="#" AllowFiltering="false">
                        <ItemTemplate>
                           <asp:Label ID="numberLabel" runat="server" Width="40px" />
                         </ItemTemplate>
                        <HeaderStyle Width="50px" />
            </telerik:GridTemplateColumn>


                        <telerik:GridBoundColumn DataField="FamilyString" FilterControlAltText="Filter FamilyString column" HeaderText="FamilyString" SortExpression="FamilyString" UniqueName="FamilyString" AllowFiltering="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Parent" FilterControlAltText="Filter Parent column" HeaderText="Parent" SortExpression="Parent" UniqueName="Parent" AllowFiltering="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Course" FilterControlAltText="Filter Course column" HeaderText="Course" SortExpression="Course" UniqueName="Course" AllowFiltering="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Instructor" FilterControlAltText="Filter Instructor column" HeaderText="Instructor" SortExpression="Instructor" UniqueName="Instructor" AllowFiltering="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Outlook" FilterControlAltText="Filter Outlook column" HeaderText="Outlook" SortExpression="Outlook" UniqueName="Outlook" AllowFiltering="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Session" FilterControlAltText="Filter Session column" HeaderText="Session" SortExpression="Session" UniqueName="Session" AllowFiltering="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridCheckBoxColumn DataField="IsMidterm" DataType="System.Boolean" FilterControlAltText="Filter IsMidterm column" HeaderText="IsMidterm" SortExpression="IsMidterm" UniqueName="IsMidterm" AllowFiltering="false">
                        </telerik:GridCheckBoxColumn>

                                    <telerik:GridDateTimeColumn  DataField="MidA_Start" HeaderText="MidA_Start" SortExpression="MidA_Start" UniqueName="MidA_Start"  DataFormatString="{0:d}" AllowFiltering="false">
            </telerik:GridDateTimeColumn>

                                    <telerik:GridDateTimeColumn  DataField="MidA_End" HeaderText="MidA_End" SortExpression="MidA_End" UniqueName="MidA_End"  DataFormatString="{0:d}" AllowFiltering="false">
            </telerik:GridDateTimeColumn>
                        <telerik:GridBoundColumn DataField="MidTime" FilterControlAltText="Filter MidTime column" HeaderText="MidTime" SortExpression="MidTime" UniqueName="MidTimes" AllowFiltering="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridCheckBoxColumn DataField="LockdownMid" DataType="System.Boolean" FilterControlAltText="Filter LockdownMid column" HeaderText="LockdownMid" SortExpression="LockdownMid" UniqueName="LockdownMid" AllowFiltering="false">
                        </telerik:GridCheckBoxColumn>

                        <telerik:GridBoundColumn DataField="MidA_LPass" FilterControlAltText="Filter MidA_LPass column" HeaderText="MidA_LPass" SortExpression="MidA_LPass" UniqueName="MidA_LPass" AllowFiltering="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="MidA_RPass" FilterControlAltText="Filter MidA_RPass column" HeaderText="MidA_RPass" SortExpression="MidA_RPass" UniqueName="MidA_RPass" AllowFiltering="false">
                        </telerik:GridBoundColumn>
   <telerik:GridTemplateColumn DataField="MidStart" HeaderText="WindowDays" SortExpression="MidStart" UniqueName="MidStart1"  AllowFiltering="false">
                        <ItemTemplate>
                            <asp:Label ID="WindowDate" runat="server" Text='<%#GetWindow(Eval("MidA_Start"))%>'></asp:Label>
                        </ItemTemplate>
  </telerik:GridTemplateColumn>
   <telerik:GridTemplateColumn  HeaderText="Special Instructions" allowsorting="false"  AllowFiltering="false">
                        <ItemTemplate>
                            <asp:Label ID="setup" runat="server" Text='<%# getproctor(Eval("ID"))%>'></asp:Label>
                        </ItemTemplate>
     </telerik:GridTemplateColumn>
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
        </div>
        <asp:SqlDataSource ID="SqlDataMidA" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT MasterProctor.ID, MasterProctor.FamilyString, MasterProctor.Parent, MasterProctor.Course, MasterProctor.Outlook, MasterProctor.Session,MasterProctor.Instructor, MasterProctor.LockdownMid,   MasterProctor.MidTime, MasterProctor.IsMidterm, MasterExamDates.MidA_Start, MasterExamDates.MidA_End, MasterExamDates.MidA_LPass, MasterExamDates.MidA_RPass FROM MasterProctor LEFT OUTER JOIN MasterExamDates ON MasterProctor.Course = MasterExamDates.Course WHERE  (MasterProctor.IsMidterm = 1) And Session ='8W1'"></asp:SqlDataSource>
        <telerik:RadFormDecorator ID="RadFormDecorator1" Runat="server" DecoratedControls="CheckBoxes" Skin="Material" />
        <asp:Label ID="lblTerm" runat="server"></asp:Label>
    </form>
</body>
</html>
