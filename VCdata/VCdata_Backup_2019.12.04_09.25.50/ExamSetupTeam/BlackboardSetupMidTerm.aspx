<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="BlackboardSetupMidTerm.aspx.vb" Inherits="VCdata.BlackboardSetupMidTerm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            font-size: x-large;
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
                     <asp:Panel ID="Panel1" runat="server" BackColor="#DDF4FF">
                  <span class="auto-style1"><strong>Blackboard Setup MidTerm Only</strong></span><br />
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
            <asp:RadioButtonList ID="radioExam" runat="server" RepeatDirection="Horizontal" Visible="False">
                <asp:ListItem Value="Mid" Selected="True">Mid</asp:ListItem>
                <asp:ListItem Value="True">Final</asp:ListItem>
            </asp:RadioButtonList>
            <asp:Button ID="Button1" runat="server" Text="Get Data" BackColor="#CC0000" Font-Bold="True" ForeColor="White" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lblTerm" runat="server"></asp:Label>
            &nbsp;&nbsp;&nbsp;<asp:Label ID="lblSession" runat="server"></asp:Label>
&nbsp;
            <asp:Label ID="lblExam" runat="server"></asp:Label>
                         <br />
                         <br />
        </asp:Panel>
        </div>
        <asp:Panel ID="Panel2" runat="server">
            <asp:Button ID="btnReturn" runat="server" Text="Return to Report List" />

              
            <br />
            <telerik:RadGrid ID="RadGrid1" runat="server" DataSourceID="SqlDataSource1" Skin="WebBlue" OnItemDataBound="RadGrid1_ItemDataBound" >
                <GroupingSettings CollapseAllTooltip="Collapse all groups" />
                <MasterTableView AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource1"   CommandItemDisplay="Top" >
                     <CommandItemSettings ShowExportToExcelButton="true" ShowAddNewRecordButton="false" ShowRefreshButton="true" />
                    <Columns>
                        <telerik:GridBoundColumn UniqueName="RowNumber"></telerik:GridBoundColumn> 
                        <telerik:GridBoundColumn DataField="ID" DataType="System.Int32" FilterControlAltText="Filter ID column" HeaderText="ID" ReadOnly="True" SortExpression="ID" UniqueName="ID" Visible="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="FamilyString" FilterControlAltText="Filter FamilyString column" HeaderText="FamilyString" SortExpression="FamilyString" UniqueName="FamilyString">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Parent" FilterControlAltText="Filter Parent column" HeaderText="Sectopm" SortExpression="Parent" UniqueName="Parent">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Course" FilterControlAltText="Filter Course column" HeaderText="Course" SortExpression="Course" UniqueName="Course">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Instructor" FilterControlAltText="Filter Instructor column" HeaderText="Instructor" SortExpression="Instructor" UniqueName="Instructor">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Outlook" FilterControlAltText="Filter Outlook column" HeaderText="Outlook" SortExpression="Outlook" UniqueName="Outlook">
                        </telerik:GridBoundColumn>
                         <telerik:GridTemplateColumn HeaderText="Outlook" AllowSorting="false" AllowFiltering="false">
                        <ItemTemplate>
                            <asp:Label ID="Outlook" runat="server" Text='<%#GetmyOutlook(Eval("Outlook"))%>'></asp:Label>
                        </ItemTemplate>
                       </telerik:GridTemplateColumn>
                        <telerik:GridBoundColumn DataField="Session" FilterControlAltText="Filter Session column" HeaderText="Session" SortExpression="Session" UniqueName="Session">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="IsMidTerm" HeaderText="IsMidTerm" SortExpression="IsMidterm" UniqueName="IsMidterm1">
                        </telerik:GridBoundColumn>


                        <telerik:GridBoundColumn DataField="MidStart" DataFormatString="{0:MM/dd/yyyy}" DataType="System.DateTime" HeaderText="DateStart"  SortExpression="MidStart" UniqueName="MidStart"></telerik:GridBoundColumn>

                        <telerik:GridBoundColumn DataField="MidEnd" DataFormatString="{0:MM/dd/yyyy}" DataType="System.DateTime" HeaderText="DateEnd"  SortExpression="MidEnd" UniqueName="MidEnd"></telerik:GridBoundColumn>

                        <telerik:GridBoundColumn DataField="MidTime" DataType="System.Int32" FilterControlAltText="Filter MidTime column" HeaderText="TimeLimit" SortExpression="MidTime" UniqueName="MidTime">
                        </telerik:GridBoundColumn>
                         
                        <telerik:GridTemplateColumn HeaderText="LocalPass" AllowSorting="false" AllowFiltering="false">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%#LocalMidPass(Eval("Course"))%>'></asp:Label>
                        </ItemTemplate>
                       </telerik:GridTemplateColumn>
                         <telerik:GridTemplateColumn HeaderText="RemotePass" AllowSorting="false" AllowFiltering="false">
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%#RemoteMidPass(Eval("Course"))%>'></asp:Label>
                        </ItemTemplate>
                       </telerik:GridTemplateColumn>

                         <telerik:GridBoundColumn DataField="LockdownMid" HeaderText="LDB" SortExpression="LockdownMid" UniqueName="LockdownMid">
                        </telerik:GridBoundColumn>



  <telerik:GridTemplateColumn HeaderText="Instructions" AllowSorting="false" AllowFiltering="false">
                        <ItemTemplate>
                            <asp:Label ID="ExamName" runat="server" Text='<%#getProctorMid(Eval("ID"))%>'></asp:Label>
                        </ItemTemplate>
  </telerik:GridTemplateColumn>

                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>

              
        </asp:Panel>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [ID], [FamilyString], [Parent], [Course], [Instructor], [Outlook], [Session], [IsMidTerm], [MidStart], [MidEnd], [MidTime], [LockdownMid] FROM [MasterProctor] WHERE (([Session] = @Session) AND ([IsMidTerm] = @IsMidTerm)) Order By Course">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlSession" DefaultValue="1" Name="Session" PropertyName="SelectedValue" />
                <asp:Parameter DefaultValue="1" Name="IsMidTerm" />
            </SelectParameters>
        </asp:SqlDataSource>
        <telerik:RadFormDecorator ID="RadFormDecorator1" Runat="server" DecoratedControls="CheckBoxes" Skin="Material" />
    </form>
</body>
</html>
