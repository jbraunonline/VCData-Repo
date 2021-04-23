<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="FInalProctorSetup.aspx.vb" Inherits="VCdata.FInnalProctorSetup" %>

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
        </div>
        <telerik:RadGrid ID="RadGrid1" runat="server" AllowAutomaticUpdates="True" AllowFilteringByColumn="True" AllowSorting="True" AutoGenerateEditColumn="True" DataSourceID="SqlDataSource1" Skin="WebBlue">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
            <MasterTableView AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource1">
                <Columns>
                    <telerik:GridTemplateColumn UniqueName="TemplateColumn" HeaderText="#" AllowFiltering="false">
                      <ItemTemplate>
                          <asp:Label ID="numberLabel" runat="server" Width="40px" />
                      </ItemTemplate>
                     <HeaderStyle Width="50px" />
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn DataField="ID" DataType="System.Int32" FilterControlAltText="Filter ID column" HeaderText="ID" ReadOnly="True" SortExpression="ID" UniqueName="ID" Visible="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Parent" FilterControlAltText="Filter Parent column" HeaderText="Parent" SortExpression="Parent" UniqueName="Parent">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Course" FilterControlAltText="Filter Course column" HeaderText="Course" SortExpression="Course" UniqueName="Course">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Instructor" FilterControlAltText="Filter Instructor column" HeaderText="Instructor" SortExpression="Instructor" UniqueName="Instructor">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Session" FilterControlAltText="Filter Session column" HeaderText="Session" SortExpression="Session" UniqueName="Session">
                    </telerik:GridBoundColumn>
                    <telerik:GridCheckBoxColumn DataField="IsFinal" DataType="System.Boolean" FilterControlAltText="Filter IsFinal column" HeaderText="IsFinal" SortExpression="IsFinal" UniqueName="IsFinal" Visible="false">
                    </telerik:GridCheckBoxColumn>
                    <telerik:GridBoundColumn DataField="FinalTime" DataType="System.Int32" FilterControlAltText="Filter FinalTime column" HeaderText="FinalTime" SortExpression="FinalTime" UniqueName="FinalTime" Visible="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridCheckBoxColumn DataField="FinalPaper" DataType="System.Boolean" FilterControlAltText="Filter FinalPaper column" HeaderText="Paper" SortExpression="FinalPaper" UniqueName="FinalPaper" AllowFiltering="false">
                    </telerik:GridCheckBoxColumn>
                    <telerik:GridCheckBoxColumn DataField="FinalCalculator" DataType="System.Boolean" FilterControlAltText="Filter FinalCalculator column" HeaderText="Calculator" SortExpression="FinalCalculator" UniqueName="FinalCalculator" AllowFiltering="false">
                    </telerik:GridCheckBoxColumn>
                    <telerik:GridCheckBoxColumn DataField="FinalGraph" DataType="System.Boolean" FilterControlAltText="Filter FinalGraph column" HeaderText="Graph" SortExpression="FinalGraph" UniqueName="FinalGraph" AllowFiltering="false">
                    </telerik:GridCheckBoxColumn>
                     <telerik:GridCheckBoxColumn DataField="FinalHeadphones" DataType="System.Boolean" FilterControlAltText="Filter FinalHeadphones column" HeaderText="Headphones" SortExpression="FInalHeadphones" UniqueName="FinalHeadphones" AllowSorting="false">
                    </telerik:GridCheckBoxColumn>
                    <telerik:GridBoundColumn DataField="FinalNotes" FilterControlAltText="Filter FinalNotes column" HeaderText="FinalNotes" SortExpression="FinalNotes" UniqueName="FinalNotes">
                    </telerik:GridBoundColumn>
                    <telerik:GridCheckBoxColumn DataField="FinalProctorX" DataType="System.Boolean" FilterControlAltText="Filter FinalProctorX column" HeaderText="FinalProctorU" SortExpression="FinalProctorX" UniqueName="FinalProctorX">
                    </telerik:GridCheckBoxColumn>
                    <telerik:GridCheckBoxColumn DataField="LockdownFinal" DataType="System.Boolean" FilterControlAltText="Filter LockdownFinal column" HeaderText="Lockdown" SortExpression="LockdownFinal" UniqueName="LockdownFinal">
                    </telerik:GridCheckBoxColumn>

                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [MasterProctor] WHERE [ID] = @ID" InsertCommand="INSERT INTO [MasterProctor] ([Parent], [Course], [Instructor], [Session], [IsFinal], [FinalTime], [FinalPaper], [FinalCalculator], [FinalGraph], [FinalNotes], [FinalProctorX], [LockdownFinal], [Final_Manual], [FinalHeadphones]) VALUES (@Parent, @Course, @Instructor, @Session, @IsFinal, @FinalTime, @FinalPaper, @FinalCalculator, @FinalGraph, @FinalNotes, @FinalProctorX, @LockdownFinal, @Final_Manual, @FinalHeadphones)" SelectCommand="SELECT [ID], [Parent], [Course], [Instructor], [Session], [IsFinal], [FinalTime], [FinalPaper], [FinalCalculator], [FinalGraph], [FinalNotes], [FinalProctorX], [LockdownFinal], [Final_Manual], [FinalHeadphones] FROM [MasterProctor] WHERE ([IsFinal] = @IsFinal)" UpdateCommand="UPDATE [MasterProctor] SET [Parent] = @Parent, [Course] = @Course, [Instructor] = @Instructor, [Session] = @Session, [IsFinal] = @IsFinal, [FinalTime] = @FinalTime, [FinalPaper] = @FinalPaper, [FinalCalculator] = @FinalCalculator, [FinalGraph] = @FinalGraph, [FinalNotes] = @FinalNotes, [FinalProctorX] = @FinalProctorX, [LockdownFinal] = @LockdownFinal, [Final_Manual] = @Final_Manual, [FinalHeadphones] = @FinalHeadphones WHERE [ID] = @ID">
            <DeleteParameters>
                <asp:Parameter Name="ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Parent" Type="String" />
                <asp:Parameter Name="Course" Type="String" />
                <asp:Parameter Name="Instructor" Type="String" />
                <asp:Parameter Name="Session" Type="String" />
                <asp:Parameter Name="IsFinal" Type="Boolean" />
                <asp:Parameter Name="FinalTime" Type="Int32" />
                <asp:Parameter Name="FinalPaper" Type="Boolean" />
                <asp:Parameter Name="FinalCalculator" Type="Boolean" />
                <asp:Parameter Name="FinalGraph" Type="Boolean" />
                <asp:Parameter Name="FinalNotes" Type="String" />
                <asp:Parameter Name="FinalProctorX" Type="Boolean" />
                <asp:Parameter Name="LockdownFinal" Type="Boolean" />
                <asp:Parameter Name="Final_Manual" Type="Boolean" />
                <asp:Parameter Name="FinalHeadphones" Type="Boolean" />
            </InsertParameters>
            <SelectParameters>
                <asp:Parameter DefaultValue="True" Name="IsFinal" Type="Boolean" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Parent" Type="String" />
                <asp:Parameter Name="Course" Type="String" />
                <asp:Parameter Name="Instructor" Type="String" />
                <asp:Parameter Name="Session" Type="String" />
                <asp:Parameter Name="IsFinal" Type="Boolean" />
                <asp:Parameter Name="FinalTime" Type="Int32" />
                <asp:Parameter Name="FinalPaper" Type="Boolean" />
                <asp:Parameter Name="FinalCalculator" Type="Boolean" />
                <asp:Parameter Name="FinalGraph" Type="Boolean" />
                <asp:Parameter Name="FinalNotes" Type="String" />
                <asp:Parameter Name="FinalProctorX" Type="Boolean" />
                <asp:Parameter Name="LockdownFinal" Type="Boolean" />
                <asp:Parameter Name="Final_Manual" Type="Boolean" />
                <asp:Parameter Name="FinalHeadphones" Type="Boolean" />
                <asp:Parameter Name="ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <telerik:RadFormDecorator ID="RadFormDecorator1" Runat="server" Skin="Material" />
    </form>
</body>
</html>
