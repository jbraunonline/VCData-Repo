<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="_GetProctorUMidA.aspx.vb" Inherits="VCdata.GetProctorUMidA" %>

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
        <telerik:RadGrid ID="RadGrid1" runat="server" DataSourceID="SqlDataSource1" Skin="WebBlue">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
            <MasterTableView AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource1"   CommandItemDisplay="Top" >
                 <CommandItemSettings ShowExportToExcelButton="true" ShowAddNewRecordButton="false" ShowRefreshButton="true" />
                <Columns>
                    <telerik:GridBoundColumn DataField="ID" DataType="System.Int32" FilterControlAltText="Filter ID column" HeaderText="ID" ReadOnly="True" SortExpression="ID" UniqueName="ID" Visible="false">
                    </telerik:GridBoundColumn>

   <telerik:GridTemplateColumn  HeaderText="Estimated # of Students" AllowSorting="false" AllowFiltering="false">
                        <ItemTemplate>
                            <asp:Label ID="Studs" runat="server" Text='30'></asp:Label>
                        </ItemTemplate>
  </telerik:GridTemplateColumn>


   <telerik:GridTemplateColumn HeaderText="Exam Name" AllowSorting="false" AllowFiltering="false">
                        <ItemTemplate>
                            <asp:Label ID="ExamName" runat="server" Text='<%#GetWindow(Eval("Course"), Eval("Reference"), Eval("RExamName"))%>'></asp:Label>
                        </ItemTemplate>
  </telerik:GridTemplateColumn>

                    <telerik:GridBoundColumn DataField="Course" FilterControlAltText="Filter Course column" HeaderText="Course" SortExpression="Course" UniqueName="Course" Visible="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Reference" FilterControlAltText="Filter Reference column" HeaderText="Reference" SortExpression="Reference" UniqueName="Reference" Visible="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Instructor" FilterControlAltText="Filter Instructor column" HeaderText="Instructor Name" SortExpression="Instructor" UniqueName="Instructor">
                    </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="ExamTime" DataType="System.Int32" FilterControlAltText="Filter ExamTime column" HeaderText="Iteration Time (minutes)" SortExpression="ExamTime" UniqueName="ExamTime">
                    </telerik:GridBoundColumn>

   <telerik:GridTemplateColumn  HeaderText="Iteration Time URL (Not required)" AllowSorting="false" AllowFiltering="false">
                        <ItemTemplate>
                            <asp:Label ID="IterationURL" runat="server" Text=''></asp:Label>
                        </ItemTemplate>
  </telerik:GridTemplateColumn>
                           <telerik:GridBoundColumn DataField="RPassword" FilterControlAltText="Filter LPassword column" HeaderText="Iteration Exam Password" SortExpression="RPassword" UniqueName="RPassword" >
                    </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="Instructions" FilterControlAltText="Filter Instructions column" HeaderText="Resources" SortExpression="Instructions" UniqueName="Instructions">
                    </telerik:GridBoundColumn>

 <telerik:GridTemplateColumn  HeaderText="Addional Exam Notes & Accomodations" AllowSorting="false" AllowFiltering="false">
                        <ItemTemplate>
                            <asp:Label ID="AddlNotes" runat="server" Text='N/A'></asp:Label>
                        </ItemTemplate>
  </telerik:GridTemplateColumn>




 <telerik:GridTemplateColumn  HeaderText="Contact Name" AllowSorting="false" AllowFiltering="false">
                        <ItemTemplate>
                            <asp:Label ID="Contact" runat="server" Text='Proctored Exam Support'></asp:Label>
                        </ItemTemplate>
  </telerik:GridTemplateColumn>

<telerik:GridTemplateColumn  HeaderText="Contact Email" AllowSorting="false" AllowFiltering="false">
                        <ItemTemplate>
                            <asp:Label ID="Email" runat="server" Text='<a href="mailto:vcproctor@mdc.edu">vcproctor@mdc.edu</a>'></asp:Label>
                        </ItemTemplate>
  </telerik:GridTemplateColumn>





 <telerik:GridTemplateColumn  HeaderText="Contact Phone Number" AllowSorting="false" AllowFiltering="false">
                        <ItemTemplate>
                            <asp:Label ID="Phone" runat="server" Text='305-299-2422'></asp:Label>
                        </ItemTemplate>
  </telerik:GridTemplateColumn>

 
   <telerik:GridTemplateColumn HeaderText="Scheduling Window Start" AllowSorting="false" AllowFiltering="false">
                        <ItemTemplate>
                            <asp:Label ID="ExamName" runat="server" Text='<%#GetStart(Eval("ExamStart"))%>'></asp:Label>
                        </ItemTemplate>
  </telerik:GridTemplateColumn>



  <telerik:GridTemplateColumn HeaderText="Scheduling Window End" AllowSorting="false" AllowFiltering="false">
                        <ItemTemplate>
                            <asp:Label ID="ExamName" runat="server" Text='<%#GetStop(Eval("ExamEnd"))%>'></asp:Label>
                        </ItemTemplate>
  </telerik:GridTemplateColumn>

                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [MasterProctorTesting] WHERE [ID] = @ID" InsertCommand="INSERT INTO [MasterProctorTesting] ([Course], [Reference], [Instructor], [ExamStart], [ExamEnd], [ExamTime], [LExamName], [RExamName], [LPassword], [RPassword], [Lockdown], [Instructions]) VALUES (@Course, @Reference, @Instructor, @ExamStart, @ExamEnd, @ExamTime, @LExamName, @RExamName, @LPassword, @RPassword, @Lockdown, @Instructions)" SelectCommand="SELECT [ID], [Course], [Reference], [Instructor], [ExamStart], [ExamEnd], [ExamTime], [LExamName], [RExamName], [LPassword], [RPassword], [Lockdown], [Instructions] FROM [MasterProctorTesting] WHERE (([ExamType] = @ExamType) AND ([Session] = @Session)) And ProctorX=1" UpdateCommand="UPDATE [MasterProctorTesting] SET [Course] = @Course, [Reference] = @Reference, [Instructor] = @Instructor, [ExamStart] = @ExamStart, [ExamEnd] = @ExamEnd, [ExamTime] = @ExamTime, [LExamName] = @LExamName, [RExamName] = @RExamName, [LPassword] = @LPassword, [RPassword] = @RPassword, [Lockdown] = @Lockdown, [Instructions] = @Instructions WHERE [ID] = @ID">
            <DeleteParameters>
                <asp:Parameter Name="ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Course" Type="String" />
                <asp:Parameter Name="Reference" Type="String" />
                <asp:Parameter Name="Instructor" Type="String" />
                <asp:Parameter DbType="Date" Name="ExamStart" />
                <asp:Parameter DbType="Date" Name="ExamEnd" />
                <asp:Parameter Name="ExamTime" Type="Int32" />
                <asp:Parameter Name="LExamName" Type="String" />
                <asp:Parameter Name="RExamName" Type="String" />
                <asp:Parameter Name="LPassword" Type="String" />
                <asp:Parameter Name="RPassword" Type="String" />
                <asp:Parameter Name="Lockdown" Type="Boolean" />
                <asp:Parameter Name="Instructions" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:Parameter DefaultValue="Mid" Name="ExamType" Type="String" />
                <asp:Parameter DefaultValue="8W1" Name="Session" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Course" Type="String" />
                <asp:Parameter Name="Reference" Type="String" />
                <asp:Parameter Name="Instructor" Type="String" />
                <asp:Parameter DbType="Date" Name="ExamStart" />
                <asp:Parameter DbType="Date" Name="ExamEnd" />
                <asp:Parameter Name="ExamTime" Type="Int32" />
                <asp:Parameter Name="LExamName" Type="String" />
                <asp:Parameter Name="RExamName" Type="String" />
                <asp:Parameter Name="LPassword" Type="String" />
                <asp:Parameter Name="RPassword" Type="String" />
                <asp:Parameter Name="Lockdown" Type="Boolean" />
                <asp:Parameter Name="Instructions" Type="String" />
                <asp:Parameter Name="ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <telerik:RadFormDecorator ID="RadFormDecorator1" Runat="server" DecoratedControls="CheckBoxes" Skin="Material" />
    </form>
</body>
</html>
