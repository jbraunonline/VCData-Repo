<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="BlackboardSetup.aspx.vb" Inherits="VCdata.BlackboardSetup" %>

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
</head>
<body>
    <form id="form1" runat="server">
        <br />
        <span class="auto-style1"><strong>Blackboard Setup Team</strong></span><telerik:RadStyleSheetManager ID="RadStyleSheetManager1" runat="server">
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
            <asp:Panel ID="Panel1" runat="server" Font-Bold="True" Font-Size="Large">
                            <asp:DropDownList ID="ddlTerm" runat="server">
                <asp:ListItem Selected="True">2197</asp:ListItem>
                <asp:ListItem>2213</asp:ListItem>
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
                <asp:ListItem>12W</asp:ListItem>
            </asp:DropDownList>
            &nbsp;Select Session<br />
            <asp:RadioButtonList ID="radioExam" runat="server" RepeatDirection="Horizontal">
                <asp:ListItem Value="Mid" Selected="True">Mid</asp:ListItem>
                <asp:ListItem Value="Final">Final</asp:ListItem>
            </asp:RadioButtonList>
            <br />
            <asp:Button ID="Button1" runat="server" Text="Get Data" BackColor="#CC0000" Font-Bold="True" ForeColor="White" />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Term:&nbsp;
            <asp:Label ID="lblTerm" runat="server"></asp:Label>
                            &nbsp;&nbsp;&nbsp;&nbsp; Session: &nbsp;<asp:Label ID="lblSession" runat="server" ForeColor="#CC0000"></asp:Label>
                            &nbsp;&nbsp;&nbsp;&nbsp; Exam:&nbsp;
            <asp:Label ID="lblExam" runat="server" ForeColor="#CC0000"></asp:Label>
            </asp:Panel>
            <asp:Panel ID="Panel2" runat="server">

            <br />
            BB Setup Mid Term&nbsp; Hard Code Session 1<strong>MidTerm session 1 only </strong>
            <asp:Button ID="btnReturn" runat="server" Text="Return to Report List" />
            <telerik:RadGrid ID="RadGrid1" runat="server" Skin="WebBlue" AutoGenerateColumns="False"  OnItemDataBound="RadGrid1_ItemDataBound" >
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                <MasterTableView DataKeyNames="ID"  CommandItemDisplay="Top" >
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
                        <telerik:GridBoundColumn DataField="ExamTime" FilterControlAltText="Filter Examtime column" HeaderText="Examtime" SortExpression="Examtime" UniqueName="Examtime">
                        </telerik:GridBoundColumn>

                        <telerik:GridBoundColumn DataField="ExamStart" DataFormatString="{0:MM/dd/yyyy}" DataType="System.DateTime" HeaderText="ExamStart"  SortExpression="MidStart" UniqueName="MidStart"></telerik:GridBoundColumn>

                        <telerik:GridBoundColumn DataField="ExamEnd" DataFormatString="{0:MM/dd/yyyy}" DataType="System.DateTime" HeaderText="ExamEnd"  SortExpression="MidEnd" UniqueName="MidEnd"></telerik:GridBoundColumn>

  <telerik:GridTemplateColumn HeaderText="Remote Pwd" AllowSorting="false" AllowFiltering="false">
                        <ItemTemplate>
                            <asp:Label ID="MyRPass" runat="server" Text='<%#GetRemotePass(Eval("Course"))%>'></asp:Label>
                        </ItemTemplate>
  </telerik:GridTemplateColumn>

  <telerik:GridTemplateColumn HeaderText="Local Pwd" AllowSorting="false" AllowFiltering="false">
                        <ItemTemplate>
                            <asp:Label ID="MyLPass" runat="server" Text='<%#GetLocalPass(Eval("Course"))%>'></asp:Label>
                        </ItemTemplate>
  </telerik:GridTemplateColumn>

  <telerik:GridTemplateColumn HeaderText="LockDown" AllowSorting="false" AllowFiltering="false">
                        <ItemTemplate>
                            <asp:Label ID="MyLock" runat="server" Text='<%#GetLockDown(Eval("ID"))%>'></asp:Label>
                        </ItemTemplate>
  </telerik:GridTemplateColumn>


  <telerik:GridTemplateColumn HeaderText="Instructions" AllowSorting="false" AllowFiltering="false">
                        <ItemTemplate>
                            <asp:Label ID="Instructons" runat="server" Text='<%# getTheInstructions(Eval("ID"))%>'></asp:Label>
                        </ItemTemplate>
  </telerik:GridTemplateColumn>



                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
                            </asp:Panel>
        </div>
        <telerik:RadFormDecorator ID="RadFormDecorator1" Runat="server" DecoratedControls="CheckBoxes" Skin="Material" />
    </form>
</body>
</html>
