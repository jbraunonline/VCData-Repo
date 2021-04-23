<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="MidProctorSetup.aspx.vb" Inherits="VCdata.MidProctorSetup" MaintainScrollPositionOnPostback="true"%>

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
            <telerik:RadGrid ID="RadGrid1" runat="server" AllowFilteringByColumn="True" AllowSorting="True" OnItemDataBound="RadGrid1_ItemDataBound" DataSourceID="SqlDataSource1" Skin="WebBlue" AllowAutomaticUpdates="True" Height="1000px">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                <ClientSettings>
                    <Scrolling AllowScroll="True" UseStaticHeaders="True" />
                </ClientSettings>
                <MasterTableView AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource1" >
                    <Columns>
                        <telerik:GridEditCommandColumn ButtonType="ImageButton" HeaderStyle-Width="25" />
                       <telerik:GridTemplateColumn UniqueName="TemplateColumn" HeaderText="#" AllowFiltering="false">
                      <ItemTemplate>
                          <asp:Label ID="numberLabel" runat="server" Width="40px" />
                      </ItemTemplate>
                     <HeaderStyle Width="50px" />
                    </telerik:GridTemplateColumn>
                        <telerik:GridBoundColumn DataField="ID" DataType="System.Int32" FilterControlAltText="Filter ID column" HeaderText="ID" ReadOnly="True" SortExpression="ID" UniqueName="ID" Visible="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Parent" FilterControlAltText="Filter Parent column" HeaderText="Parent" SortExpression="Parent" UniqueName="Parent" AllowFiltering="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Course" FilterControlAltText="Filter Course column" HeaderText="Course" SortExpression="Course" UniqueName="Course">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Instructor" FilterControlAltText="Filter Instructor column" HeaderText="Instr" SortExpression="Instructor" UniqueName="Instructor">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Session" FilterControlAltText="Filter Session column" HeaderText="Session" SortExpression="Session" UniqueName="Session">
                        </telerik:GridBoundColumn>
                        <telerik:GridCheckBoxColumn DataField="IsMidterm" DataType="System.Boolean" HeaderStyle-Width="50" FilterControlAltText="Filter IsMidterm column" HeaderText="IsMidterm" SortExpression="IsMidterm" UniqueName="IsMidterm" Visible="false">
                        </telerik:GridCheckBoxColumn>
                        <telerik:GridCheckBoxColumn DataField="MidPaper" DataType="System.Boolean" HeaderStyle-Width="50"  FilterControlAltText="Filter MidPaper column" HeaderText="Paper" SortExpression="MidPaper" UniqueName="MidPaper" AllowFiltering="false">
                        </telerik:GridCheckBoxColumn>
                        <telerik:GridCheckBoxColumn DataField="MidCalculator" DataType="System.Boolean" FilterControlAltText="Filter MidCalculator column" HeaderStyle-Width="50"  HeaderText="Calc" SortExpression="MidCalculator" UniqueName="MidCalculator" AllowFiltering="false">
                        </telerik:GridCheckBoxColumn>
                        <telerik:GridCheckBoxColumn DataField="MidGraph" DataType="System.Boolean" FilterControlAltText="Filter MidGraph column" HeaderStyle-Width="50"  HeaderText="Graph" SortExpression="MidGraph" UniqueName="MidGraph" AllowFiltering="false">
                        </telerik:GridCheckBoxColumn>
                        <telerik:GridCheckBoxColumn DataField="Headphones" DataType="System.Boolean" FilterControlAltText="Filter Headphones column" HeaderText="Headphones" SortExpression="Headphones" UniqueName="Headphones" AllowFiltering="false" Visible="false">
                        </telerik:GridCheckBoxColumn>

                <telerik:GridTemplateColumn HeaderText="Notes" Visible="true" FilterControlAltText="Filter MidNotes column" AllowFiltering="true"  DataField="MidNotes" >
                      <ItemTemplate>
                                 <%#DataBinder.Eval(Container.DataItem, "MidNotes")%>
                      </ItemTemplate>
                        
                      <EditItemTemplate>
                            <telerik:RadEditor ID="RadID" runat="server" Content='<%# Bind("MidNotes") %>' BackColor="#99CCFF" Height="165">
                              <Tools>
                                  <telerik:EditorToolGroup>
                                      <telerik:EditorTool Name="Cut" />
                                      <telerik:EditorTool Name="Copy" />
                                      <telerik:EditorTool Name="Paste" />
                                  </telerik:EditorToolGroup>
                              </Tools>
                          </telerik:RadEditor>
                      </EditItemTemplate>
                    </telerik:GridTemplateColumn>


                        <telerik:GridCheckBoxColumn DataField="LockdownMid" DataType="System.Boolean" FilterControlAltText="Filter LockdownMid column" HeaderText="LockdownMid" SortExpression="LockdownMid" UniqueName="LockdownMid" Visible="false">
                        </telerik:GridCheckBoxColumn>
                        <telerik:GridCheckBoxColumn DataField="MidProctorX" DataType="System.Boolean" FilterControlAltText="Filter MidProctorX column" HeaderText="ProctorU" SortExpression="MidProctorX" UniqueName="MidProctorX" Visible="false">
                        </telerik:GridCheckBoxColumn>

                        <telerik:GridBoundColumn DataField="PM_ANXMTR" FilterControlAltText="Filter PM_ANXMTR column" HeaderText="ANXMTR" SortExpression="PM_ANXMTR" UniqueName="PM_ANXMTR">
                        </telerik:GridBoundColumn>
                        <telerik:GridCheckBoxColumn DataField="Essay" DataType="System.Boolean" FilterControlAltText="Filter Essay column" HeaderText="Essay" SortExpression="Essay" UniqueName="Essay" Visible="false">
                        </telerik:GridCheckBoxColumn>
                         <telerik:GridCheckBoxColumn DataField="MidVerified" DataType="System.Boolean" FilterControlAltText="Filter MidVerified column" HeaderText="Verified"  HeaderStyle-Width="50"  SortExpression="MidVerified" UniqueName="Midverified" Visible="true" AllowFiltering="false">
                        </telerik:GridCheckBoxColumn>
                    </Columns>
                </MasterTableView>
                  <GroupingSettings CaseSensitive="false" />
            </telerik:RadGrid>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [MasterProctor] WHERE [ID] = @ID" InsertCommand="INSERT INTO [MasterProctor] ([Parent], [Course], [Instructor], [Session], [IsMidterm], [MidPaper], [MidCalculator], [MidGraph], [MidNotes], [LockdownMid], [MidProctorX], [Headphones], [PM_ANXMTR], [Essay], [MidVerified]) VALUES (@Parent, @Course, @Instructor, @Session, @IsMidterm, @MidPaper, @MidCalculator, @MidGraph, @MidNotes, @LockdownMid, @MidProctorX, @Headphones, @PM_ANXMTR, @Essay, @MidVerified)" SelectCommand="SELECT [ID], [Parent], [Course], [Instructor], [Session], [IsMidterm], [MidPaper], [MidCalculator], [MidGraph], [MidNotes], [LockdownMid], [MidProctorX], [Headphones], [PM_ANXMTR], [Essay], [MidVerified] FROM [MasterProctor] WHERE ([IsMidterm] = @IsMidterm) ORDER BY [Course]" UpdateCommand="UPDATE [MasterProctor] SET [Parent] = @Parent, [Course] = @Course, [Instructor] = @Instructor, [Session] = @Session, [IsMidterm] = @IsMidterm, [MidPaper] = @MidPaper, [MidCalculator] = @MidCalculator, [MidGraph] = @MidGraph, [MidNotes] = @MidNotes, [LockdownMid] = @LockdownMid, [MidProctorX] = @MidProctorX, [Headphones] = @Headphones, [PM_ANXMTR] = @PM_ANXMTR, [Essay] = @Essay, [MidVerified] = @MidVerified WHERE [ID] = @ID">
            <DeleteParameters>
                <asp:Parameter Name="ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Parent" Type="String" />
                <asp:Parameter Name="Course" Type="String" />
                <asp:Parameter Name="Instructor" Type="String" />
                <asp:Parameter Name="Session" Type="String" />
                <asp:Parameter Name="IsMidterm" Type="Boolean" />
                <asp:Parameter Name="MidPaper" Type="Boolean" />
                <asp:Parameter Name="MidCalculator" Type="Boolean" />
                <asp:Parameter Name="MidGraph" Type="Boolean" />
                <asp:Parameter Name="MidNotes" Type="String" />
                <asp:Parameter Name="LockdownMid" Type="Boolean" />
                <asp:Parameter Name="MidProctorX" Type="Boolean" />
                <asp:Parameter Name="Headphones" Type="Boolean" />
                <asp:Parameter Name="PM_ANXMTR" Type="String" />
                <asp:Parameter Name="Essay" Type="Boolean" />
                <asp:Parameter Name="MidVerified" Type="Boolean" />
            </InsertParameters>
            <SelectParameters>
                <asp:Parameter DefaultValue="True" Name="IsMidterm" Type="Boolean" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Parent" Type="String" />
                <asp:Parameter Name="Course" Type="String" />
                <asp:Parameter Name="Instructor" Type="String" />
                <asp:Parameter Name="Session" Type="String" />
                <asp:Parameter Name="IsMidterm" Type="Boolean" />
                <asp:Parameter Name="MidPaper" Type="Boolean" />
                <asp:Parameter Name="MidCalculator" Type="Boolean" />
                <asp:Parameter Name="MidGraph" Type="Boolean" />
                <asp:Parameter Name="MidNotes" Type="String" />
                <asp:Parameter Name="LockdownMid" Type="Boolean" />
                <asp:Parameter Name="MidProctorX" Type="Boolean" />
                <asp:Parameter Name="Headphones" Type="Boolean" />
                <asp:Parameter Name="PM_ANXMTR" Type="String" />
                <asp:Parameter Name="Essay" Type="Boolean" />
                <asp:Parameter Name="MidVerified" Type="Boolean" />
                <asp:Parameter Name="ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <telerik:RadFormDecorator ID="RadFormDecorator1" Runat="server" DecoratedControls="CheckBoxes" Skin="Material" />
    </form>
</body>
</html>
