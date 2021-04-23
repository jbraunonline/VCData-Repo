<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="CompareFinals.aspx.vb" Inherits="VCdata.CompareFinals" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 800px;
        }
        .auto-style2 {
            height: 37px;
        }
        .auto-style3 {
            width: 800px;
        }
        .auto-style4 {
            color: #990033;
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
                    <asp:QueryStringParameter DefaultValue="6" Name="ID" QueryStringField="ID" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:TextBox ID="txtFinal" runat="server"></asp:TextBox>
        &nbsp;
            <asp:Button ID="Button1" runat="server" BorderColor="#990033" Text="Verify and Close" />
        </div>
        <p>
            <strong>Final Details<asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [MasterProctor] WHERE [ID] = @ID" InsertCommand="INSERT INTO [MasterProctor] ([Course], [IsFinal], [FinalStart], [FinalEnd], [FinalTime], [FinalPaper], [FinalCalculator], [FinalProctorX], [LockdownFinal], [FinalEssay], [PF_ANXMTR], [FinalVerified]) VALUES (@Course, @IsFinal, @FinalStart, @FinalEnd, @FinalTime, @FinalPaper, @FinalCalculator, @FinalProctorX, @LockdownFinal, @FinalEssay, @PF_ANXMTR, @FinalVerified)" SelectCommand="SELECT [ID], [Course], [IsFinal], [FinalStart], [FinalEnd], [FinalTime], [FinalPaper], [FinalCalculator], [FinalProctorX], [LockdownFinal], [FinalEssay], [PF_ANXMTR], [FinalVerified] FROM [MasterProctor] WHERE ([ID] = @ID)" UpdateCommand="UPDATE [MasterProctor] SET [Course] = @Course, [IsFinal] = @IsFinal, [FinalStart] = @FinalStart, [FinalEnd] = @FinalEnd, [FinalTime] = @FinalTime, [FinalPaper] = @FinalPaper, [FinalCalculator] = @FinalCalculator, [FinalProctorX] = @FinalProctorX, [LockdownFinal] = @LockdownFinal, [FinalEssay] = @FinalEssay, [PF_ANXMTR] = @PF_ANXMTR, [FinalVerified] = @FinalVerified WHERE [ID] = @ID">
                <DeleteParameters>
                    <asp:Parameter Name="ID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Course" Type="String" />
                    <asp:Parameter Name="IsFinal" Type="Boolean" />
                    <asp:Parameter DbType="Date" Name="FinalStart" />
                    <asp:Parameter DbType="Date" Name="FinalEnd" />
                    <asp:Parameter Name="FinalTime" Type="Int32" />
                    <asp:Parameter Name="FinalPaper" Type="Boolean" />
                    <asp:Parameter Name="FinalCalculator" Type="Boolean" />
                    <asp:Parameter Name="FinalProctorX" Type="Boolean" />
                    <asp:Parameter Name="LockdownFinal" Type="Boolean" />
                    <asp:Parameter Name="FinalEssay" Type="Boolean" />
                    <asp:Parameter Name="PF_ANXMTR" Type="String" />
                    <asp:Parameter Name="FinalVerified" Type="Boolean" />
                </InsertParameters>
                <SelectParameters>
                    <asp:QueryStringParameter DefaultValue="6" Name="ID" QueryStringField="ID" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Course" Type="String" />
                    <asp:Parameter Name="IsFinal" Type="Boolean" />
                    <asp:Parameter DbType="Date" Name="FinalStart" />
                    <asp:Parameter DbType="Date" Name="FinalEnd" />
                    <asp:Parameter Name="FinalTime" Type="Int32" />
                    <asp:Parameter Name="FinalPaper" Type="Boolean" />
                    <asp:Parameter Name="FinalCalculator" Type="Boolean" />
                    <asp:Parameter Name="FinalProctorX" Type="Boolean" />
                    <asp:Parameter Name="LockdownFinal" Type="Boolean" />
                    <asp:Parameter Name="FinalEssay" Type="Boolean" />
                    <asp:Parameter Name="PF_ANXMTR" Type="String" />
                    <asp:Parameter Name="FinalVerified" Type="Boolean" />
                    <asp:Parameter Name="ID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <telerik:RadFormDecorator ID="RadFormDecorator1" Runat="server" DecoratedControls="CheckBoxes" Skin="Material" />
            </strong></p>
        <telerik:RadGrid ID="RadGrid1" runat="server" AutoGenerateEditColumn="True" DataSourceID="SqlDataSource6" Skin="WebBlue" AllowAutomaticUpdates="True" AutoGenerateColumns="False" CellSpacing="-1" GridLines="Both">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
            <MasterTableView DataKeyNames="ID" DataSourceID="SqlDataSource6">
                                        <EditFormSettings>
                            <EditColumn ButtonType="PushButton"></EditColumn>
                        </EditFormSettings>
                <Columns>
                    <telerik:GridBoundColumn DataField="ID" DataType="System.Int32" FilterControlAltText="Filter ID column" HeaderText="ID" ReadOnly="True" SortExpression="ID" UniqueName="ID">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Course" FilterControlAltText="Filter Course column" HeaderText="Course" SortExpression="Course" UniqueName="Course">
                    </telerik:GridBoundColumn>
                    <telerik:GridCheckBoxColumn DataField="IsFinal" DataType="System.Boolean" FilterControlAltText="Filter IsFinal column" HeaderText="IsFinal" SortExpression="IsFinal" UniqueName="IsFinal">
                    </telerik:GridCheckBoxColumn>



                    <telerik:GridTemplateColumn HeaderText="FinalStart" ItemStyle-Width="300px" Visible="true">
                      <ItemTemplate>
                        <asp:Label runat="server" ID="FinalStart" Text='<%# Eval("FinalStart", "{0:MM/dd/yyyy}") %>'>           
                        </asp:Label>
                       </ItemTemplate>

                        <EditItemTemplate>
                           <telerik:RadDatePicker ID="RadDatePicker1" runat="server" SelectedDate='<%# Bind("FinalStart")%>'></telerik:RadDatePicker>
                         </EditItemTemplate>

<ItemStyle Width="300px"></ItemStyle>
                       </telerik:GridTemplateColumn>

                     <telerik:GridTemplateColumn HeaderText="FinalEnd" ItemStyle-Width="300px" Visible="true">
                      <ItemTemplate>
                        <asp:Label runat="server" ID="FinalEnd" Text='<%# Eval("FinalEnd", "{0:MM/dd/yyyy}") %>'>           
                        </asp:Label>
                       </ItemTemplate>

                        <EditItemTemplate>
                           <telerik:RadDatePicker ID="RadDatePicker2" runat="server" SelectedDate='<%# Bind("FinalEnd")%>'></telerik:RadDatePicker>
                         </EditItemTemplate>

<ItemStyle Width="300px"></ItemStyle>
                       </telerik:GridTemplateColumn>







                    <telerik:GridBoundColumn DataField="FinalTime" DataType="System.Int32" FilterControlAltText="Filter FinalTime column" HeaderText="FinalTime" SortExpression="FinalTime" UniqueName="FinalTime">
                    </telerik:GridBoundColumn>
                    <telerik:GridCheckBoxColumn DataField="FinalPaper" DataType="System.Boolean" FilterControlAltText="Filter FinalPaper column" HeaderText="FinalPaper" SortExpression="FinalPaper" UniqueName="FinalPaper">
                    </telerik:GridCheckBoxColumn>
                    <telerik:GridCheckBoxColumn DataField="FinalCalculator" DataType="System.Boolean" FilterControlAltText="Filter FinalCalculator column" HeaderText="FinalCalculator" SortExpression="FinalCalculator" UniqueName="FinalCalculator">
                    </telerik:GridCheckBoxColumn>
                    <telerik:GridCheckBoxColumn DataField="FinalProctorX" DataType="System.Boolean" FilterControlAltText="Filter FinalProctorX column" HeaderText="FinalProctorX" SortExpression="FinalProctorX" UniqueName="FinalProctorX">
                    </telerik:GridCheckBoxColumn>
                    <telerik:GridCheckBoxColumn DataField="LockdownFinal" DataType="System.Boolean" FilterControlAltText="Filter LockdownFinal column" HeaderText="LockdownFinal" SortExpression="LockdownFinal" UniqueName="LockdownFinal">
                    </telerik:GridCheckBoxColumn>
                    <telerik:GridCheckBoxColumn DataField="FinalEssay" DataType="System.Boolean" FilterControlAltText="Filter FinalEssay column" HeaderText="FinalEssay" SortExpression="FinalEssay" UniqueName="FinalEssay">
                    </telerik:GridCheckBoxColumn>
                    <telerik:GridBoundColumn DataField="PF_ANXMTR" FilterControlAltText="Filter PF_ANXMTR column" HeaderText="PF_ANXMTR" SortExpression="PF_ANXMTR" UniqueName="PF_ANXMTR">
                    </telerik:GridBoundColumn>
                    <telerik:GridCheckBoxColumn DataField="FinalVerified" DataType="System.Boolean" FilterControlAltText="Filter FinalVerified column" HeaderText="FinalVerified" SortExpression="FinalVerified" UniqueName="FinalVerified">
                    </telerik:GridCheckBoxColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
        <p>
            Final Details</p>
        <table class="auto-style3">
            <tr>
                <td><span class="auto-style4"><strong>User Input</strong></span>
                    <asp:DetailsView ID="DetailsView4" runat="server" AutoGenerateRows="False" CellPadding="4" DataSourceID="SqlDataSource4" ForeColor="#333333" GridLines="None" Height="50px" Width="274px">
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
                <td style="vertical-align:top"><strong>Default Values</strong>
                    <asp:DetailsView ID="DetailsView5" runat="server" Height="50px" Width="274px" AutoGenerateRows="False" CellPadding="4" DataSourceID="SqlDataSource5" ForeColor="#333333" GridLines="None">
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
                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [IsFinal], [FinalStart], [FinalEnd], [FinalNameL], [FinalNameR], [FinalTime], [FinalPaper], [FinalCalculator], [FinalGraph], [FinalNotes], [InstComments], [FinalProctorX], [LockdownFinal], [PF_ANXMTR] FROM [MasterProctor] WHERE ([ID] = @ID)">
                        <SelectParameters>
                            <asp:QueryStringParameter DefaultValue="1" Name="ID" QueryStringField="ID" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
                <td>
                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [IsFinal], [FinalStart], [FinalEnd], [FinalNameL], [FinalNameR], [FinalTime], [FinalPaper], [FinalCalculator], [FinalGraph], [FinalNotes], [InstComments], [FinalProctorX], [LockdownFinal], [PF_ANXMTR] FROM [MasterProctor_BU_1A] WHERE ([Parent] = @Parent)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="txtParent" DefaultValue="2213-3764" Name="Parent" PropertyName="Text" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
        </table>
        <br />
        Mid Term Data<br />
        <table class="auto-style1">
            <tr>
                <td>User Input"
                    </td>
                <td style="vertical-align:top"><strong>Default</strong> Values
                    </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    &nbsp;</td>
                <td class="auto-style2">
                    &nbsp;</td>
            </tr>
        </table>
        <p>
            <asp:TextBox ID="txtParent" runat="server"></asp:TextBox>
        </p>
    </form>
</body>
</html>
