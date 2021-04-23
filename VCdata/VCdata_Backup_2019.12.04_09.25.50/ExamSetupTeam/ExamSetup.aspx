<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ExamSetup.aspx.vb" Inherits="VCdata.ExamSetup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            font-size: large;
            font-family: Arial, Helvetica, sans-serif;
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
        </div>
        <asp:Panel ID="Panel1" runat="server" BackColor="#DDF4FF">
            <strong><span class="auto-style1">MDC Testing Center Report</span></strong><br />
            <asp:DropDownList ID="ddlTerm" runat="server">
                <asp:ListItem Selected="True">2197</asp:ListItem>
                <asp:ListItem>2203</asp:ListItem>
                <asp:ListItem></asp:ListItem>
            </asp:DropDownList>
            &nbsp;Select Term<br />
            <asp:DropDownList ID="ddlSession" runat="server">
                <asp:ListItem>Select Session</asp:ListItem>
                <asp:ListItem>1</asp:ListItem>
                <asp:ListItem>8W1</asp:ListItem>
                <asp:ListItem>6w1</asp:ListItem>
                <asp:ListItem>8W2</asp:ListItem>
                <asp:ListItem>6W2</asp:ListItem>
            </asp:DropDownList>
            &nbsp;Select Session<br />
            <asp:RadioButtonList ID="radioExam" runat="server" RepeatDirection="Horizontal">
                <asp:ListItem Value="Mid">Mid</asp:ListItem>
                <asp:ListItem Value="Final">Final</asp:ListItem>
            </asp:RadioButtonList>
            <br />
            <asp:Button ID="Button1" runat="server" Text="Get Data" BackColor="Red" Font-Bold="True" ForeColor="White" />
            &nbsp;<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lblTerm" runat="server"></asp:Label>
            &nbsp;&nbsp;&nbsp;<asp:Label ID="lblSession" runat="server"></asp:Label>
&nbsp;
            <asp:Label ID="lblExam" runat="server"></asp:Label>
            <br />
        </asp:Panel>
        <asp:Panel ID="Panel2" runat="server">
            <asp:Button ID="btnReset" runat="server" BackColor="#99FF99" Font-Bold="True" Text="Reset" Visible="False" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnReturn" runat="server" Text="Return To Report List" BorderColor="#0066FF" BorderWidth="2px" />
            &nbsp;<telerik:RadGrid ID="RadGrid1" runat="server" DataSourceID="SqlDataSource1" Skin="WebBlue" CellSpacing="-1" GridLines="Both"  OnItemDataBound="RadGrid1_ItemDataBound" >
                <GroupingSettings CollapseAllTooltip="Collapse all groups" />
                <MasterTableView AutoGenerateColumns="False" DataSourceID="SqlDataSource1"  CommandItemDisplay="Top" >
                    <CommandItemSettings ShowExportToExcelButton="true" ShowAddNewRecordButton="false" ShowRefreshButton="true" />
                    <Columns>
                          <telerik:GridTemplateColumn UniqueName="TemplateColumn" HeaderText="#">
                <ItemTemplate>
                    <asp:Label ID="numberLabel" runat="server" Width="40px" />
                </ItemTemplate>
                <HeaderStyle Width="50px" />
            </telerik:GridTemplateColumn>
                        <telerik:GridBoundColumn DataField="FamilyString" FilterControlAltText="Filter FamilyString column" HeaderText="FamilyString" SortExpression="FamilyString" UniqueName="FamilyString" Visible ="false" >
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Reference" FilterControlAltText="Filter Reference column" HeaderText="Reference" SortExpression="Reference" UniqueName="Reference">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Course" FilterControlAltText="Filter Course column" HeaderText="Course" SortExpression="Course" UniqueName="Course">
                        </telerik:GridBoundColumn>
<telerik:GridTemplateColumn HeaderText="Session / Exam" AllowSorting="false" AllowFiltering="false">
                        <ItemTemplate>
                            <asp:Label ID="Exam" runat="server" Text='<%#GetExam(Eval("Session"), Eval("ExamType"))%>'></asp:Label>
                        </ItemTemplate>
  </telerik:GridTemplateColumn>
                        <telerik:GridBoundColumn DataField="Instructor" FilterControlAltText="Filter Instructor column" HeaderText="Instructor" SortExpression="Instructor" UniqueName="Instructor"  >
                        </telerik:GridBoundColumn>

                          <telerik:GridTemplateColumn HeaderText="Outlook" AllowSorting="false" AllowFiltering="false">
                        <ItemTemplate>
                            <asp:Label ID="Outlook" runat="server" Text='<%#GetOutlook(Eval("Instructor"))%>'></asp:Label>
                        </ItemTemplate>
  </telerik:GridTemplateColumn>

                        <telerik:GridBoundColumn DataField="ExamStart" DataFormatString="{0:MM/dd/yyyy}" DataType="System.DateTime" HeaderText="ExamStart"  SortExpression="ExamStart" UniqueName="ExamStart"></telerik:GridBoundColumn>

                        <telerik:GridBoundColumn DataField="ExamEnd" DataFormatString="{0:MM/dd/yyyy}" DataType="System.DateTime" HeaderText="ExamEnd"  SortExpression="ExamEnd" UniqueName="ExamEnd"></telerik:GridBoundColumn>



                        <telerik:GridBoundColumn DataField="ExamTime" DataType="System.Int32" FilterControlAltText="Filter ExamTime column" HeaderText="ExamTime" SortExpression="ExamTime" UniqueName="ExamTime">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="LPassword" FilterControlAltText="Filter LPassword column" HeaderText="LPassword" SortExpression="LPassword" UniqueName="LPassword">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="RPassword" HeaderText="RPassword" >
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn DataField="Lockdown" FilterControlAltText="Filter Lockdown column" HeaderText="Lockdown" SortExpression="Lockdown" UniqueName="Lockdown">
                        </telerik:GridBoundColumn>
                        
           


                          <telerik:GridTemplateColumn HeaderText="Instructions" AllowSorting="false" AllowFiltering="false">
                        <ItemTemplate>
                            <asp:Label ID="Testing" runat="server" Text='<%#getTestingInstructions(Eval("MasterProctor_ID"))%>'></asp:Label>
                        </ItemTemplate>
  </telerik:GridTemplateColumn>



                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [MasterProctor_ID], [Course], [FamilyString],[Session],[ExamType], [Reference], [Instructor], [ExamEnd], [ExamStart], [ExamTime], [LPassword], [RPassword], [Lockdown], [Instructions] FROM [MasterProctorTesting] WHERE (([Term] = @Term) AND ([Session] = @Session) AND ([ExamType] = @ExamType)) Order By Course">
                <SelectParameters>
                    <asp:ControlParameter ControlID="lblTerm" DefaultValue="2197" Name="Term" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="lblSession" DefaultValue="1" Name="Session" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="lblExam" DefaultValue="Test" Name="ExamType" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <br />
        </asp:Panel>
    </form>
</body>
</html>
