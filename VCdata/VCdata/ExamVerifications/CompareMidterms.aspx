<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="CompareMidterms.aspx.vb" Inherits="VCdata.CompareMidterms" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style2 {
            height: 37px;
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
            <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Height="50px" Width="125px">
                <AlternatingRowStyle BackColor="White" />
                <CommandRowStyle BackColor="#C5BBAF" Font-Bold="True" />
                <EditRowStyle BackColor="#7C6F57" />
                <FieldHeaderStyle BackColor="#D0D0D0" Font-Bold="True" />
                <Fields>
                    <asp:BoundField DataField="FamilyString" HeaderText="FamilyString" SortExpression="FamilyString" />
                    <asp:BoundField DataField="Parent" HeaderText="Parent" SortExpression="Parent" />
                    <asp:BoundField DataField="Course" HeaderText="Course" SortExpression="Course" />
                    <asp:BoundField DataField="Outlook" HeaderText="Outlook" SortExpression="Outlook" />
                    <asp:BoundField DataField="Instructor" HeaderText="Instructor" SortExpression="Instructor" />
                    <asp:BoundField DataField="CanChange" HeaderText="CanChange" SortExpression="CanChange" />
                    <asp:BoundField DataField="Session" HeaderText="Session" SortExpression="Session" />
                </Fields>
                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#E3EAEB" />
            </asp:DetailsView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [FamilyString], [Parent], [Course], [Outlook], [Instructor], [CanChange], [Session] FROM [MasterProctor] WHERE ([ID] = @ID)">
                <SelectParameters>
                    <asp:QueryStringParameter DefaultValue="1" Name="ID" QueryStringField="ID" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:Button ID="btnVerify" runat="server" BorderColor="#CC0000" Text="Verify and Close" />
        </div>
        <telerik:RadGrid ID="RadGrid1" runat="server" AutoGenerateEditColumn="True" DataSourceID="SqlDataSource4" Skin="WebBlue" CellSpacing="-1" GridLines="Both" AllowAutomaticUpdates="True">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
            <MasterTableView AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource4">
                <Columns>
                    <telerik:GridBoundColumn DataField="ID" DataType="System.Int32" FilterControlAltText="Filter ID column" HeaderText="ID" ReadOnly="True" SortExpression="ID" UniqueName="ID" Visible="false">
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn DataField="Course" FilterControlAltText="Filter Course column" HeaderText="Course" SortExpression="Course" UniqueName="Course">
                    </telerik:GridBoundColumn>
                    <telerik:GridCheckBoxColumn DataField="IsMidterm" DataType="System.Boolean" FilterControlAltText="Filter IsMidterm column" HeaderText="IsMidterm" SortExpression="IsMidterm" UniqueName="IsMidterm">
                    </telerik:GridCheckBoxColumn>

                     <telerik:GridTemplateColumn HeaderText="MidStart" ItemStyle-Width="300px" Visible="true">
                      <ItemTemplate>
                        <asp:Label runat="server" ID="MidStart" Text='<%# Eval("MidStart", "{0:MM/dd/yyyy}") %>'>           
                        </asp:Label>
                       </ItemTemplate>

                        <EditItemTemplate>
                           <telerik:RadDatePicker ID="RadDatePicker1" runat="server" SelectedDate='<%# Bind("MidStart")%>'></telerik:RadDatePicker>
                         </EditItemTemplate>
                       </telerik:GridTemplateColumn>

                     <telerik:GridTemplateColumn HeaderText="MidEnd" ItemStyle-Width="300px" Visible="true">
                      <ItemTemplate>
                        <asp:Label runat="server" ID="MidEnd" Text='<%# Eval("MidEnd", "{0:MM/dd/yyyy}") %>'>           
                        </asp:Label>
                       </ItemTemplate>

                        <EditItemTemplate>
                           <telerik:RadDatePicker ID="RadDatePicker2" runat="server" SelectedDate='<%# Bind("MidEnd")%>'></telerik:RadDatePicker>
                         </EditItemTemplate>
                       </telerik:GridTemplateColumn>

                    <telerik:GridBoundColumn DataField="MidTime" DataType="System.Int32" FilterControlAltText="Filter MidTime column" HeaderText="Time" SortExpression="MidTime" UniqueName="MidTime">
                    </telerik:GridBoundColumn>
                    <telerik:GridCheckBoxColumn DataField="MidPaper" DataType="System.Boolean" FilterControlAltText="Filter MidPaper column" HeaderText="Paper" SortExpression="MidPaper" UniqueName="MidPaper">
                    </telerik:GridCheckBoxColumn>
                    <telerik:GridCheckBoxColumn DataField="MidCalculator" DataType="System.Boolean" FilterControlAltText="Filter MidCalculator column" HeaderText="MidCalc" SortExpression="MidCalculator" UniqueName="MidCalculator">
                    </telerik:GridCheckBoxColumn>
                    <telerik:GridCheckBoxColumn DataField="MidGraph" DataType="System.Boolean" FilterControlAltText="Filter MidGraph column" HeaderText="MidGraph" SortExpression="MidGraph" UniqueName="MidGraph">
                    </telerik:GridCheckBoxColumn>
                    <telerik:GridCheckBoxColumn DataField="MidProctorX" DataType="System.Boolean" FilterControlAltText="Filter MidProctorX column" HeaderText="MidProctorU" SortExpression="MidProctorX" UniqueName="MidProctorX">
                    </telerik:GridCheckBoxColumn>
                    <telerik:GridCheckBoxColumn DataField="LockdownMid" DataType="System.Boolean" FilterControlAltText="Filter LockdownMid column" HeaderText="Lockdown" SortExpression="LockdownMid" UniqueName="LockdownMid">
                    </telerik:GridCheckBoxColumn>
                    <telerik:GridCheckBoxColumn DataField="Essay" DataType="System.Boolean" FilterControlAltText="Filter Essay column" HeaderText="Essay" SortExpression="Essay" UniqueName="Essay">
                    </telerik:GridCheckBoxColumn>
                    <telerik:GridBoundColumn DataField="PM_ANXMTR" FilterControlAltText="Filter PM_ANXMTR column" HeaderText="PM_ANXMTR" SortExpression="ANXMTR" UniqueName="PM_ANXMTR">
                    </telerik:GridBoundColumn>
                                        <telerik:GridCheckBoxColumn DataField="MidVerified" DataType="System.Boolean" FilterControlAltText="Filter MidVerified column" HeaderText="Verified" SortExpression="MidVerified" UniqueName="MidVerified">
                    </telerik:GridCheckBoxColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    <div style="width: 50%;">
        <div style="width: 50%; height: 800px; float: left; background: white;"> 
            User Input"
                    <asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateRows="False" CellPadding="4" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" Height="50px" Width="300px">
                        <AlternatingRowStyle BackColor="White" />
                        <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                        <EditRowStyle BackColor="#2461BF" />
                        <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                        <Fields>
                            <asp:CheckBoxField DataField="IsMidterm" HeaderText="IsMidterm" SortExpression="IsMidterm" />
                            <asp:BoundField DataField="MidStart" HeaderText="MidStart" SortExpression="MidStart" />
                            <asp:BoundField DataField="MidEnd" HeaderText="MidEnd" SortExpression="MidEnd"  />
                            <asp:BoundField DataField="MidNameL" HeaderText="MidNameL" SortExpression="MidNameL" />
                            <asp:BoundField DataField="MidNameR" HeaderText="MidNameR" SortExpression="MidNameR" />
                            <asp:BoundField DataField="MidTime" HeaderText="MidTime" SortExpression="MidTime" />
                            <asp:CheckBoxField DataField="MidPaper" HeaderText="MidPaper" SortExpression="MidPaper" />
                            <asp:CheckBoxField DataField="MidCalculator" HeaderText="MidCalculator" SortExpression="MidCalculator" />
                            <asp:CheckBoxField DataField="MidGraph" HeaderText="MidGraph" SortExpression="MidGraph" />
                            <asp:BoundField DataField="MidNotes" HeaderText="MidNotes" SortExpression="MidNotes" />
                            <asp:BoundField DataField="InstComments" HeaderText="InstComments" SortExpression="InstComments" />
                            <asp:CheckBoxField DataField="MidProctorX" HeaderText="MidProctorX" SortExpression="MidProctorX" />
                            <asp:BoundField DataField="PM_ANXMTR" HeaderText="PM_ANXMTR" SortExpression="PM_ANXMTR" />
                            <asp:CheckBoxField DataField="Essay" HeaderText="Essay" SortExpression="Essay" />
                            <asp:CheckBoxField DataField="LockdownMid" HeaderText="LockdownMid" SortExpression="LockdownMid" />
                        </Fields>
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                    </asp:DetailsView>




        </div>
        <div style="margin-left: 50%; height: 800px; background: yellow;"> 
Default Values
                    <asp:DetailsView ID="DetailsView3" runat="server" AutoGenerateRows="False" CellPadding="4" DataSourceID="SqlDataSource3" ForeColor="#333333" GridLines="None" Height="50px" Width="300px">
                        <AlternatingRowStyle BackColor="White" />
                        <CommandRowStyle BackColor="#C5BBAF" Font-Bold="True" />
                        <EditRowStyle BackColor="#7C6F57" />
                        <FieldHeaderStyle BackColor="#D0D0D0" Font-Bold="True" />
                        <Fields>
                            <asp:CheckBoxField DataField="IsMidterm" HeaderText="IsMidterm" SortExpression="IsMidterm" />
                            <asp:BoundField DataField="MidStart" HeaderText="MidStart" SortExpression="MidStart" DataFormatString="{0:MM/dd/yyyy}" />
                            <asp:BoundField DataField="MidEnd" HeaderText="MidEnd" SortExpression="MidEnd" DataFormatString="{0:MM/dd/yyyy}" />
                            <asp:BoundField DataField="MidNameL" HeaderText="MidNameL" SortExpression="MidNameL" />
                            <asp:BoundField DataField="MidNameR" HeaderText="MidNameR" SortExpression="MidNameR" />
                            <asp:BoundField DataField="MidTime" HeaderText="MidTime" SortExpression="MidTime" />
                            <asp:CheckBoxField DataField="MidPaper" HeaderText="MidPaper" SortExpression="MidPaper" />
                            <asp:CheckBoxField DataField="MidCalculator" HeaderText="MidCalculator" SortExpression="MidCalculator" />
                            <asp:CheckBoxField DataField="MidGraph" HeaderText="MidGraph" SortExpression="MidGraph" />
                            <asp:BoundField DataField="MidNotes" HeaderText="MidNotes" SortExpression="MidNotes" />
                            <asp:BoundField DataField="InstComments" HeaderText="InstComments" SortExpression="InstComments" />
                            <asp:CheckBoxField DataField="MidProctorX" HeaderText="MidProctorX" SortExpression="MidProctorX" />
                            <asp:BoundField DataField="PM_ANXMTR" HeaderText="PM_ANXMTR" SortExpression="PM_ANXMTR" />
                            <asp:CheckBoxField DataField="Essay" HeaderText="Essay" SortExpression="Essay" />
                            <asp:CheckBoxField DataField="LockdownMid" HeaderText="LockdownMid" SortExpression="LockdownMid" />
                        </Fields>
                        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#E3EAEB" />
                    </asp:DetailsView>





        </div>
    </div>



        <table >
            <tr>
                <td>
                </td>
                <td >
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [IsMidterm], [MidStart], [MidEnd], [MidNameL], [MidNameR], [MidTime], [MidPaper], [MidCalculator], [MidGraph], [MidNotes], [InstComments], [MidProctorX], [PM_ANXMTR], [Essay], [LockdownMid] FROM [MasterProctor] WHERE ([ID] = @ID)">
                        <SelectParameters>
                            <asp:QueryStringParameter DefaultValue="29" Name="ID" QueryStringField="ID" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
                <td class="auto-style2">
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [IsMidterm], [MidStart], [MidEnd], [MidNameL], [MidNameR], [MidTime], [MidPaper], [MidCalculator], [MidGraph], [MidNotes], [InstComments], [MidProctorX], [PM_ANXMTR], [Essay], [LockdownMid] FROM [MasterProctor_BU_1A] WHERE ([Parent] = @Parent)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="txtParent" DefaultValue="1" Name="Parent" PropertyName="Text" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
        </table>

            Final Details
        <table class="auto-style3">
            <tr>
                <td>User Input
                    <asp:DetailsView ID="DetailsView4" runat="server" AutoGenerateRows="False" CellPadding="4" DataSourceID="SqlDataSource5" ForeColor="#333333" GridLines="None" Height="50px" Width="300px">
                        <AlternatingRowStyle BackColor="White" />
                        <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                        <EditRowStyle BackColor="#2461BF" />
                        <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                        <Fields>
                            <asp:BoundField DataField="IsFinal" HeaderText="IsFinal" SortExpression="IsFinal" />
                            <asp:BoundField DataField="FinalStart" HeaderText="FinalStart" SortExpression="FinalStart" DataFormatString="{0:MM/dd/yyyy}" />
                            <asp:BoundField DataField="FinalEnd" HeaderText="FinalEnd" SortExpression="FinalEnd" DataFormatString="{0:MM/dd/yyyy}" />
                            <asp:BoundField DataField="FinalNameL" HeaderText="FinalNameL" SortExpression="FinalNameL" />
                            <asp:BoundField DataField="FinalNameR" HeaderText="FinalNameR" SortExpression="FinalNameR" />
                            <asp:BoundField DataField="FinalTime" HeaderText="FinalTime" SortExpression="FinalTime" />
                            <asp:BoundField DataField="FinalPaper" HeaderText="FinalPaper" SortExpression="FinalPaper" />
                            <asp:BoundField DataField="FinalCalculator" HeaderText="FinalCalculator" SortExpression="FinalCalculator" />
                            <asp:BoundField DataField="FinalGraph" HeaderText="FinalGraph" SortExpression="FinalGraph" />
                            <asp:BoundField DataField="FinalNotes" HeaderText="FinalNotes" SortExpression="FinalNotes" />
                            <asp:BoundField DataField="InstComments" HeaderText="InstComments" SortExpression="InstComments" />
                            <asp:BoundField DataField="FinalProctorX" HeaderText="FinalProctorX" SortExpression="FinalProctorX" />

                            <asp:BoundField DataField="PF_ANXMTR" HeaderText="PF_ANXMTR" SortExpression="PF_ANXMTR" />
                            <asp:BoundField DataField="LockdownFinal" HeaderText="LockdownFinal" SortExpression="LockdownFinal" />
                        </Fields>
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                    </asp:DetailsView>
                </td>
                <td style="vertical-align:top">Default Values
                    <asp:DetailsView ID="DetailsView5" runat="server" Height="50px" Width="300px" AutoGenerateRows="False" CellPadding="4" DataSourceID="SqlDataSource6" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" />
                        <CommandRowStyle BackColor="#C5BBAF" Font-Bold="True" />
                        <EditRowStyle BackColor="#7C6F57" />
                        <FieldHeaderStyle BackColor="#D0D0D0" Font-Bold="True" />
                        <Fields>
                            <asp:BoundField DataField="IsFinal" HeaderText="IsFinal" SortExpression="IsFinal" />
                            <asp:BoundField DataField="FinalStart" HeaderText="FinalStart" SortExpression="FinalStart" DataFormatString="{0:MM/dd/yyyy}" />
                            <asp:BoundField DataField="FinalEnd" HeaderText="FinalEnd" SortExpression="FinalEnd" DataFormatString="{0:MM/dd/yyyy}" />
                            <asp:BoundField DataField="FinalNameL" HeaderText="FinalNameL" SortExpression="FinalNameL" />
                            <asp:BoundField DataField="FinalNameR" HeaderText="FinalNameR" SortExpression="FinalNameR" />
                            <asp:BoundField DataField="FinalTime" HeaderText="FinalTime" SortExpression="FinalTime" />
                            <asp:BoundField DataField="FinalPaper" HeaderText="FinalPaper" SortExpression="FinalPaper" />
                            <asp:BoundField DataField="FinalCalculator" HeaderText="FinalCalculator" SortExpression="FinalCalculator" />
                            <asp:BoundField DataField="FinalGraph" HeaderText="FinalGraph" SortExpression="FinalGraph" />
                            <asp:BoundField DataField="FinalNotes" HeaderText="FinalNotes" SortExpression="FinalNotes" />
                            <asp:BoundField DataField="InstComments" HeaderText="InstComments" SortExpression="InstComments" />
                            <asp:BoundField DataField="FinalProctorX" HeaderText="FinalProctorX" SortExpression="FinalProctorX" />
                            <asp:BoundField DataField="PF_ANXMTR" HeaderText="PF_ANXMTR" SortExpression="PF_ANXMTR" />

                            <asp:BoundField DataField="LockdownFinal" HeaderText="LockdownFinal" SortExpression="LockdownFinal" />
                        </Fields>
                        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#E3EAEB" />
                    </asp:DetailsView>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [IsFinal], [FinalStart], [FinalEnd], [FinalNameL], [FinalNameR], [FinalTime], [FinalPaper], [FinalCalculator], [FinalGraph], [FinalNotes], [InstComments], [FinalProctorX], [LockdownFinal], [PF_ANXMTR] FROM [MasterProctor] WHERE ([ID] = @ID)">
                        <SelectParameters>
                            <asp:QueryStringParameter DefaultValue="1" Name="ID" QueryStringField="ID" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
                <td>
                    <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [IsFinal], [FinalStart], [FinalEnd], [FinalNameL], [FinalTime], [FinalPaper], [FinalCalculator], [FinalGraph], [FinalNotes], [InstComments], [FinalProctorX], [PF_ANXMTR], [FinalNameR], [LockdownFinal] FROM [MasterProctor_BU] WHERE ([ID] = @ID)">
                        <SelectParameters>
                            <asp:QueryStringParameter DefaultValue="1" Name="ID" QueryStringField="ID" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
        </table>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [MasterProctor] WHERE [ID] = @ID" InsertCommand="INSERT INTO [MasterProctor] ([Course], [IsMidterm], [MidStart], [MidEnd], [MidTime], [MidPaper], [MidCalculator], [MidGraph], [MidProctorX], [LockdownMid], [Essay], [PM_ANXMTR], [MidVerified]) VALUES (@Course, @IsMidterm, @MidStart, @MidEnd, @MidTime, @MidPaper, @MidCalculator, @MidGraph, @MidProctorX, @LockdownMid, @Essay, @PM_ANXMTR, @MidVerified)" SelectCommand="SELECT [ID], [Course], [IsMidterm], [MidStart], [MidEnd], [MidTime], [MidPaper], [MidCalculator], [MidGraph], [MidProctorX], [LockdownMid], [Essay], [PM_ANXMTR], [MidVerified] FROM [MasterProctor] WHERE ([ID] = @ID)" UpdateCommand="UPDATE [MasterProctor] SET [Course] = @Course, [IsMidterm] = @IsMidterm, [MidStart] = @MidStart, [MidEnd] = @MidEnd, [MidTime] = @MidTime, [MidPaper] = @MidPaper, [MidCalculator] = @MidCalculator, [MidGraph] = @MidGraph, [MidProctorX] = @MidProctorX, [LockdownMid] = @LockdownMid, [Essay] = @Essay, [PM_ANXMTR] = @PM_ANXMTR, [MidVerified] = @MidVerified WHERE [ID] = @ID">
            <DeleteParameters>
                <asp:Parameter Name="ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Course" Type="String" />
                <asp:Parameter Name="IsMidterm" Type="Boolean" />
                <asp:Parameter Name="MidStart" DbType="Date" />
                <asp:Parameter DbType="Date" Name="MidEnd" />
                <asp:Parameter Name="MidTime" Type="Int32" />
                <asp:Parameter Name="MidPaper" Type="Boolean" />
                <asp:Parameter Name="MidCalculator" Type="Boolean" />
                <asp:Parameter Name="MidGraph" Type="Boolean" />
                <asp:Parameter Name="MidProctorX" Type="Boolean" />
                <asp:Parameter Name="LockdownMid" Type="Boolean" />
                <asp:Parameter Name="Essay" Type="Boolean" />
                <asp:Parameter Name="PM_ANXMTR" Type="String" />
                <asp:Parameter Name="MidVerified" Type="Boolean" />
            </InsertParameters>
            <SelectParameters>
                <asp:QueryStringParameter Name="ID" QueryStringField="ID" Type="Int32" DefaultValue="1" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Course" Type="String" />
                <asp:Parameter Name="IsMidterm" Type="Boolean" />
                <asp:Parameter DbType="Date" Name="MidStart" />
                <asp:Parameter DbType="Date" Name="MidEnd" />
                <asp:Parameter Name="MidTime" Type="Int32" />
                <asp:Parameter Name="MidPaper" Type="Boolean" />
                <asp:Parameter Name="MidCalculator" Type="Boolean" />
                <asp:Parameter Name="MidGraph" Type="Boolean" />
                <asp:Parameter Name="MidProctorX" Type="Boolean" />
                <asp:Parameter Name="LockdownMid" Type="Boolean" />
                <asp:Parameter Name="Essay" Type="Boolean" />
                <asp:Parameter Name="PM_ANXMTR" Type="String" />
                <asp:Parameter Name="MidVerified" Type="Boolean" />
                <asp:Parameter Name="ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <telerik:RadFormDecorator ID="RadFormDecorator1" Runat="server" DecoratedControls="CheckBoxes" Skin="Material" />
        <asp:TextBox ID="txtParent" runat="server"></asp:TextBox>
    </form>
</body>
</html>
