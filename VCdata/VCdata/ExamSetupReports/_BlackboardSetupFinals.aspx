<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="_BlackboardSetupFinals.aspx.vb" Inherits="VCdata.BlackboardSetupFinals" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            font-size: x-large;
        }
        .auto-style2 {
            color: #CC0000;
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
                  <span class="auto-style1"> <strong>Blackboard SetupTeam <span class="auto-style2">&nbsp;FinalsOnly</span></strong></span><br />
            <asp:DropDownList ID="ddlTerm" runat="server">
                <asp:ListItem Selected="True">2213</asp:ListItem>
            </asp:DropDownList>
            &nbsp;Select Term<br />
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
            <asp:RadioButtonList ID="radioExam" runat="server" RepeatDirection="Horizontal" Visible="False">
                <asp:ListItem Value="Mid" Enabled="False">Mid</asp:ListItem>
                <asp:ListItem Value="True" Selected="True">Final</asp:ListItem>
            </asp:RadioButtonList>
            <br />
            <asp:Button ID="Button1" runat="server" Text="Get Data" BackColor="#CC0000" Font-Bold="True" ForeColor="White" Width="82px" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lblTerm" runat="server"></asp:Label>
            &nbsp;&nbsp;&nbsp;<asp:Label ID="lblSession" runat="server"></asp:Label>
&nbsp;
            <asp:Label ID="lblExam" runat="server"></asp:Label>
                  <br />
        </asp:Panel>
        </div>
        <asp:Panel ID="Panel2" runat="server">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnReturn" runat="server" Text="Return to Report Dashboard" BackColor="#00FF99" Font-Bold="True" />
            <br />
            <telerik:RadGrid ID="RadGrid1" runat="server" DataSourceID="SqlDataSource1" OnItemDataBound="RadGrid1_ItemDataBound" CellSpacing="-1" GridLines="Both" Skin="WebBlue" >
                <GroupingSettings CollapseAllTooltip="Collapse all groups" />
                <MasterTableView AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource1"  CommandItemDisplay="Top" >
                    <CommandItemSettings ShowExportToExcelButton="true" ShowAddNewRecordButton="false" ShowRefreshButton="true" />
                    <Columns>
                        <telerik:GridBoundColumn UniqueName="RowNumber"></telerik:GridBoundColumn> 
                        <telerik:GridBoundColumn DataField="ID" DataType="System.Int32" FilterControlAltText="Filter ID column" HeaderText="ID" ReadOnly="True" SortExpression="ID" UniqueName="ID">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="FamilyString" FilterControlAltText="Filter FamilyString column" HeaderText="FamilyString" SortExpression="FamilyString" UniqueName="FamilyString">
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

                        <telerik:GridBoundColumn DataField="Session" FilterControlAltText="Filter Session column" HeaderText="Session" SortExpression="Session" UniqueName="Session">
                        </telerik:GridBoundColumn>

                        <telerik:GridBoundColumn DataField="IsFinal"  HeaderText="isFinal" >
                        </telerik:GridBoundColumn>


                        <telerik:GridBoundColumn DataField="FInalStart" DataFormatString="{0:MM/dd/yyyy}" DataType="System.DateTime" HeaderText="DateStart"  SortExpression="FInalStart" UniqueName="FInalStart"></telerik:GridBoundColumn>

                        <telerik:GridBoundColumn DataField="FInalEnd" DataFormatString="{0:MM/dd/yyyy}" DataType="System.DateTime" HeaderText="DatelEnd"  SortExpression="FInalEnd" UniqueName="FInalEnd"></telerik:GridBoundColumn>






                        <telerik:GridBoundColumn DataField="FinalTime" DataType="System.Int32" FilterControlAltText="Filter FinalTime column" HeaderText="TimeLimit" SortExpression="FinalTime" UniqueName="FinalTime">
                        </telerik:GridBoundColumn>




                          <telerik:GridTemplateColumn HeaderText="LocalPass" AllowSorting="false" AllowFiltering="false">
                        <ItemTemplate>
                            <asp:Label ID="Outlook" runat="server" Text='<%#LocalPass(Eval("Course"))%>'></asp:Label>
                        </ItemTemplate>
                       </telerik:GridTemplateColumn>
                          <telerik:GridTemplateColumn HeaderText="RemotelPass" AllowSorting="false" AllowFiltering="false">
                        <ItemTemplate>
                            <asp:Label ID="Outlook" runat="server" Text='<%#RemotePass(Eval("Course"))%>'></asp:Label>
                        </ItemTemplate>
                       </telerik:GridTemplateColumn>

  <telerik:GridTemplateColumn HeaderText="LDB" AllowSorting="false" AllowFiltering="false">
                        <ItemTemplate>
                            <asp:Label ID="FinalLockdown" runat="server" Text='<%#getLockDownFin(Eval("PF_ANXMTR"), Eval("FinalEssay"))%>'></asp:Label>
                        </ItemTemplate>
  </telerik:GridTemplateColumn>

  <telerik:GridTemplateColumn HeaderText="Instructions" AllowSorting="false" AllowFiltering="false">
                        <ItemTemplate>
                            <asp:Label ID="ExamName" runat="server" Text='<%#getProctor2(Eval("ID"))%>'></asp:Label>
                        </ItemTemplate>
  </telerik:GridTemplateColumn>


                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
            <br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [ID], [FamilyString], [Parent], [Course], [Instructor], [Outlook], [Session], [IsFinal], [FinalStart], [FinalEnd], [FinalTime], [FinalEssay], [PF_ANXMTR] FROM [MasterProctor] WHERE (([Session] = @Session) AND ([IsFinal] = @IsFinal)) and OptIn = 1 Order By Course" >
                <SelectParameters>
                    <asp:ControlParameter ControlID="lblSession" DefaultValue="1" Name="Session" PropertyName="Text" Type="String" />
                    <asp:Parameter DefaultValue="True" Name="IsFinal" Type="Boolean" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
        </asp:Panel>
    </form>
</body>
</html>
