<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="alert.aspx.vb" Inherits="VCdata.alert" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            height: 26px;
        }
        .style4
        {
            height: 33px;
        }
        .style5
        {
            font-family: Arial, Helvetica, sans-serif;
            font-size: x-large;
        }
        .style6
        {
            font-family: Arial, Helvetica, sans-serif;
            width: 162px;
        }
        .style7
        {
            height: 26px;
            width: 162px;
        }
        .style8
        {
            height: 33px;
            width: 162px;
        }
        .auto-style1 {
            font-family: Arial, Helvetica, sans-serif;
            font-size: x-large;
            text-align: center;
        }
        .auto-style2 {
            height: 23px;
            font-size: small;
        }
        .auto-style3 {
            height: 33px;
            text-align: center;
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
    <div class="auto-style1">
    
        <strong>
        <asp:Button ID="Button1" runat="server" Text="Close Window" BackColor="#FFFF66" BorderColor="#CC0000" BorderWidth="2px" />
        <br />
        Change Alert Log</strong></div>
&nbsp;<table class="style1">
        <tr>
            <td align="right" class="style6">
                Reference</td>
            <td>
                <asp:TextBox ID="txtReference" runat="server" ReadOnly="True"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" class="style6">
                Course</td>
            <td>
                <asp:TextBox ID="txtCourse" runat="server" ReadOnly="True"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" class="style6">
                Instructor</td>
            <td>
                <asp:TextBox ID="txtInstructor" runat="server" ReadOnly="True"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" class="style6">
                Start Date</td>
            <td>
                <asp:TextBox ID="txtStart" runat="server" ReadOnly="True"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style7">
            </td>
            <td class="style2">
            </td>
        </tr>
        <tr>
            <td class="auto-style3" colspan="2">&nbsp;
                <asp:Button ID="btnClear" runat="server" Text="Clear Flag" BackColor="#CC0000" 
                    Font-Bold="True" ForeColor="White" Visible="False" />
                <br />
                This will clear the flag, but the underlying grid will not change until it is refreshed.</td>
        </tr>
   
        <tr>
            <td ">
                &nbsp;</td>
            <td>
               </td>
        </tr>
    </table>


    <table class="style3" class="auto-style2" width="750">
                Newest record is at top.<tr>
            <td colspan="2">
                <telerik:RadGrid ID="RadGrid1" runat="server" DataSourceID="SqlDataSource1" Skin="WebBlue" Width="850px">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                    <MasterTableView AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                        <Columns>
                              <telerik:GridBoundColumn DataField="Course" FilterControlAltText="Filter Course column" HeaderText="Course" SortExpression="Course" UniqueName="Course">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Session" FilterControlAltText="Filter Session column" HeaderText="Session" SortExpression="Session" UniqueName="Session">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="StartDate" DataType="System.DateTime" FilterControlAltText="Filter StartDate column"  DataFormatString="{0:MM/dd/yyyy}" HeaderText="StartDate" SortExpression="StartDate" UniqueName="StartDate">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="EndDate" DataType="System.DateTime" FilterControlAltText="Filter EndDate column" DataFormatString="{0:MM/dd/yyyy}"  HeaderText="EndDate" SortExpression="EndDate" UniqueName="EndDate">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="username" FilterControlAltText="Filter username column" HeaderText="username" SortExpression="username" UniqueName="username">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="InstAssign" FilterControlAltText="Filter InstAssign column" HeaderText="InstAssign" SortExpression="InstAssign" UniqueName="InstAssign">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Status" FilterControlAltText="Filter Status column" HeaderText="Status" SortExpression="Status" UniqueName="Status">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="ChangeDate" DataType="System.DateTime" FilterControlAltText="Filter ChangeDate column"  DataFormatString="{0:MM/dd/yyyy}" HeaderText="ChangeDate" SortExpression="ChangeDate" UniqueName="ChangeDate">
                            </telerik:GridBoundColumn>

                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
                <br />
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Session], [StartDate], [EndDate], [username], [InstAssign], [Status], [ChangeDate], [Course] FROM [CMRchange] WHERE ([BBReference] = @BBReference) ORDER BY [ChangeDate] DESC">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="BBReference" QueryStringField="ID" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                Donns&#39;s Schedule Notes:<br />
                <br />
                <asp:TextBox ID="txtNotes" runat="server" BackColor="#E8F3FF" Height="110px" ReadOnly="True" TextMode="MultiLine" Width="865px"></asp:TextBox>
                <br />
                <br />
            </td>
        </tr>
        </table>
        
    </form>
</body>
</html>

