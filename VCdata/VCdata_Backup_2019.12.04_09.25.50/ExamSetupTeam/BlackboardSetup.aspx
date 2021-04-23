<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="BlackboardSetup.aspx.vb" Inherits="VCdata.BlackboardSetup" %>

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
            <asp:Panel ID="Panel1" runat="server">
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
            <br />
            <asp:Button ID="Button1" runat="server" Text="Get Data" BackColor="#CC0000" Font-Bold="True" ForeColor="White" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lblTerm" runat="server"></asp:Label>
            &nbsp;&nbsp;&nbsp;<asp:Label ID="lblSession" runat="server"></asp:Label>
&nbsp;
            <asp:Label ID="lblExam" runat="server"></asp:Label>
            </asp:Panel>
            <asp:Panel ID="Panel2" runat="server">

            <br />
            BB Setup Mid Term&nbsp; Hard Code Session 1<strong>MidTerm session 1 only </strong>
            <asp:Button ID="btnReturn" runat="server" Text="Return to Report List" />
            <telerik:RadGrid ID="RadGrid1" runat="server" DataSourceID="SqlDataSource1" Skin="WebBlue" AutoGenerateColumns="False"  OnItemDataBound="RadGrid1_ItemDataBound" >
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                <MasterTableView DataKeyNames="ID" DataSourceID="SqlDataSource1"  CommandItemDisplay="Top" >
                     <CommandItemSettings ShowExportToExcelButton="true" ShowAddNewRecordButton="false" ShowRefreshButton="true" />
                    <Columns>
                                    <telerik:GridTemplateColumn UniqueName="TemplateColumn" HeaderText="#">
                <ItemTemplate>
                    <asp:Label ID="numberLabel" runat="server" Width="40px" />
                </ItemTemplate>
                <HeaderStyle Width="50px" />
            </telerik:GridTemplateColumn>
                        <telerik:GridBoundColumn DataField="ID" DataType="System.Int32" FilterControlAltText="Filter ID column" HeaderText="ID" ReadOnly="True" SortExpression="ID" UniqueName="ID" Visible="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="FamilyString" FilterControlAltText="Filter FamilyString column" HeaderText="Sync FamilyString" SortExpression="FamilyString" UniqueName="FamilyString">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Parent" FilterControlAltText="Filter Parent column" HeaderText="Parent" SortExpression="Parent" UniqueName="Parent">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Course" FilterControlAltText="Filter Course column" HeaderText="Course" SortExpression="Course" UniqueName="Course">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Instructor" FilterControlAltText="Filter Instructor column" HeaderText="Instructor" SortExpression="Instructor" UniqueName="Instructor">
                        </telerik:GridBoundColumn>

                          <telerik:GridTemplateColumn HeaderText="Outlook" AllowSorting="false" AllowFiltering="false">
                        <ItemTemplate>
                            <asp:Label ID="Outlook" runat="server" Text='<%#GetOutlook2(Eval("Outlook"))%>'></asp:Label>
                        </ItemTemplate>
  </telerik:GridTemplateColumn>

 
                        <telerik:GridBoundColumn DataField="Session" FilterControlAltText="Filter Session column" HeaderText="Session" SortExpression="Session" UniqueName="Session" AllowSorting ="false" visible="false">
                        </telerik:GridBoundColumn>

                        <telerik:GridBoundColumn DataField="IsMidterm" FilterControlAltText="Filter IsMidterm column" HeaderText="IsMidterm" SortExpression="IsMidterm" UniqueName="IsMidterm1" Visible="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="MidStart" DataFormatString="{0:MM/dd/yyyy}" DataType="System.DateTime" HeaderText="ExamStart"  SortExpression="MidStart" UniqueName="MidStart"></telerik:GridBoundColumn>

                        <telerik:GridBoundColumn DataField="MidEnd" DataFormatString="{0:MM/dd/yyyy}" DataType="System.DateTime" HeaderText="ExamEnd"  SortExpression="MidEnd" UniqueName="MidEnd"></telerik:GridBoundColumn>



                        <telerik:GridBoundColumn DataField="Mid1_LPass" FilterControlAltText="Filter Mid1_LPass column" HeaderText="Mid1_LPass" SortExpression="Mid1_LPass" UniqueName="Mid1_LPass">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Mid1_RPass" FilterControlAltText="Filter Mid1_RPass column" HeaderText="Mid1_RPass" SortExpression="Mid1_RPass" UniqueName="Mid1_RPass">
                        </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn DataField="LockdownMid" FilterControlAltText="Filter LockdownMid column" HeaderText="LockdownMid" SortExpression="LockdownMid" UniqueName="LockdownMid1">
                        </telerik:GridBoundColumn>

  <telerik:GridTemplateColumn HeaderText="Instructions" AllowSorting="false" AllowFiltering="false">
                        <ItemTemplate>
                            <asp:Label ID="ExamName" runat="server" Text='<%#getProctor2(Eval("ID"))%>'></asp:Label>
                        </ItemTemplate>
  </telerik:GridTemplateColumn>



                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
                            </asp:Panel>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT     dbo.MasterProctor.ID, dbo.MasterProctor.FamilyString, dbo.MasterProctor.Parent, dbo.MasterProctor.Course, dbo.MasterProctor.Instructor, dbo.MasterProctor.Outlook, dbo.MasterProctor.Session, 
                      dbo.MasterProctor.IsMidterm, dbo.MasterProctor.MidStart, dbo.MasterProctor.MidEnd, dbo.MasterExamDates.Mid1_LPass, dbo.MasterExamDates.Mid1_RPass, 
                      dbo.MasterProctor.LockdownMid
FROM         dbo.MasterProctor LEFT OUTER JOIN
                      dbo.MasterExamDates ON dbo.MasterProctor.Course = dbo.MasterExamDates.Course
WHERE     (dbo.MasterProctor.IsMidterm = 1) AND (dbo.MasterProctor.Session = '1')
ORDER BY dbo.MasterProctor.Parent"></asp:SqlDataSource>
        <telerik:RadFormDecorator ID="RadFormDecorator1" Runat="server" DecoratedControls="CheckBoxes" Skin="Material" />
    </form>
</body>
</html>
