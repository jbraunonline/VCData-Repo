<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ProctorUSetup.aspx.vb" Inherits="VCdata.ProctorUSetup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            font-size: x-large;
        }
        body {
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

   <asp:Panel ID="Panel1" runat="server" BackColor="#DDF4FF">
            <strong><span class="auto-style1">ProctorU Report</span></strong><br />
            <asp:DropDownList ID="ddlTerm" runat="server">
                <asp:ListItem Selected="True">2213</asp:ListItem>
                <asp:ListItem></asp:ListItem>
            </asp:DropDownList>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Select Term<br />
            <asp:DropDownList ID="ddlSession" runat="server">
                <asp:ListItem>Select Session</asp:ListItem>
                <asp:ListItem Selected="True">1</asp:ListItem>
                <asp:ListItem>8W1</asp:ListItem>
                <asp:ListItem>6W1</asp:ListItem>
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
            <asp:Button ID="Button1" runat="server" Text="Get Data" BackColor="Red" Font-Bold="True" ForeColor="White" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Viewing:&nbsp;&nbsp;Term:
            <asp:Label ID="lblTerm" runat="server" Font-Bold="True"></asp:Label>
            &nbsp;&nbsp;Session: &nbsp;<asp:Label ID="lblSession" runat="server" Font-Bold="True"></asp:Label>
            &nbsp;&nbsp;&nbsp; Exam:
            <asp:Label ID="lblExam" runat="server" Font-Bold="True"></asp:Label>
            <br />
        </asp:Panel>





        </div>
        <asp:Panel ID="Panel2" runat="server">
            <asp:Button ID="btnReturn" runat="server" Text="Return to Report List" />
&nbsp;<telerik:RadGrid ID="RadGrid1" runat="server"  Skin="WebBlue"  OnItemDataBound="RadGrid1_ItemDataBound" >
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
            <MasterTableView AutoGenerateColumns="False" DataKeyNames="ID"   CommandItemDisplay="Top" >
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

   <telerik:GridTemplateColumn  HeaderText="Estimated # of Students" AllowSorting="false" AllowFiltering="false">
                        <ItemTemplate>
                            <asp:Label ID="Studs" runat="server" Text='30'></asp:Label>
                        </ItemTemplate>
  </telerik:GridTemplateColumn>


   <telerik:GridTemplateColumn HeaderText="Exam Name" AllowSorting="false" AllowFiltering="false">
                        <ItemTemplate>
                            <asp:Label ID="ExamName" runat="server" Text='<%#GetmyExam(Eval("Course"), Eval("Reference"), Eval("RExamName"))%>'></asp:Label>
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

   <telerik:GridTemplateColumn  HeaderText="Iteration Exam URL (Not required)" AllowSorting="false" AllowFiltering="false">
                        <ItemTemplate>
                            <asp:Label ID="IterationURL" runat="server" Text=''></asp:Label>
                        </ItemTemplate>
  </telerik:GridTemplateColumn>


   <telerik:GridTemplateColumn HeaderText="Iteration Exam Password" AllowSorting="false" AllowFiltering="false">
                        <ItemTemplate>
                            <asp:Label ID="MyPass" runat="server" Text='<%#GetRemote(Eval("Course"))%>'></asp:Label>
                        </ItemTemplate>
  </telerik:GridTemplateColumn>



   <telerik:GridTemplateColumn HeaderText="Resources" AllowSorting="false" AllowFiltering="false">
                        <ItemTemplate>
                            <asp:Label ID="Instructions" runat="server" Text='<%# getTheInstructions(Eval("MasterProctor_ID"))%>'></asp:Label>
                        </ItemTemplate>
  </telerik:GridTemplateColumn>



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
                            <asp:Label ID="ExamStart" runat="server" Text='<%# GetStart(Eval("ExamStart"))%>'></asp:Label>
                        </ItemTemplate>
  </telerik:GridTemplateColumn>



  <telerik:GridTemplateColumn HeaderText="Scheduling Window End" AllowSorting="false" AllowFiltering="false">
                        <ItemTemplate>
                            <asp:Label ID="ExamStop" runat="server" Text='<%#GetStop(Eval("ExamEnd"))%>'></asp:Label>
                        </ItemTemplate>
  </telerik:GridTemplateColumn>

                </Columns>
            </MasterTableView>
        </telerik:RadGrid>


        </asp:Panel>
    </form>
</body>
</html>
