<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="CustomButton2.aspx.vb" Inherits="VCdata.CustomButton2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">


        .auto-style1 {
            color: #FFFFFF;
        }
        body {
    font-family: Arial, Helvetica, sans-serif;
}
    </style>
</head>
<body>
    <form id="form1" runat="server">
                <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
              <script type="text/javascript">

    var popUp;
    function PopUpShowing(sender, eventArgs) {
      popUp = eventArgs.get_popUp();
      var gridWidth = sender.get_element().offsetWidth;
      var gridHeight = sender.get_element().offsetHeight;
      var popUpWidth = popUp.style.width.substr(0, popUp.style.width.indexOf("px"));
      var popUpHeight = popUp.style.height.substr(0, popUp.style.height.indexOf("px"));
      popUp.style.left = ((gridWidth - popUpWidth) / 2 + sender.get_element().offsetLeft).toString() + "px";
      popUp.style.top = ((gridHeight - popUpHeight) / 2 + sender.get_element().offsetTop).toString() + "px";
    }

  </script>
        </telerik:RadCodeBlock>
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
            <telerik:RadGrid ID="RadGrid1" runat="server" AutoGenerateColumns="False" AutoGenerateEditColumn="True" DataSourceID="SqlDataSource1" Skin="WebBlue" AllowAutomaticDeletes="True" AllowAutomaticUpdates="True" Height="555px">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                <ClientSettings>
                    <Scrolling AllowScroll="True" UseStaticHeaders="True" />
                    <ClientEvents OnPopUpShowing="PopUpShowing" />
                </ClientSettings>
                <MasterTableView DataKeyNames="Master_ID" DataSourceID="SqlDataSource1"  EditMode="PopUp" >
                    <Columns>
                        <telerik:GridBoundColumn DataField="Master_ID" DataType="System.Int32" FilterControlAltText="Filter Master_ID column" HeaderText="Master_ID" ReadOnly="True" SortExpression="Master_ID" UniqueName="Master_ID">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Firstname" FilterControlAltText="Filter Firstname column" HeaderText="Firstname" SortExpression="Firstname" UniqueName="Firstname">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Lastname" FilterControlAltText="Filter Lastname column" HeaderText="Lastname" SortExpression="Lastname" UniqueName="Lastname">
                        </telerik:GridBoundColumn>
                    </Columns>
                    <EditFormSettings EditFormType="Template">
                    <FormTemplate>

                        <table  style="background-color: red;"  width='100%'>
                            <tr><td class="auto-style1"><b>&nbsp;Edit This Data </b></td></tr>
                        </table>
                        <br />
                Country:
                <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Firstname") %>' BackColor="#CCFFFF"></asp:TextBox>
                <br />
                City:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     
                <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("Lastname") %>' BackColor="#CCFFFF" ></asp:TextBox>
           <br /> <br />&nbsp;
                <asp:Button ID="btnUpdate" Text='<%# IIf((TypeOf (Container) Is GridEditFormInsertItem), "Insert", "Update") %>'
                            runat="server" CommandName='<%# IIf((TypeOf (Container) Is GridEditFormInsertItem), "PerformInsert", "Update")%>' BorderColor="#00CC00" BorderWidth="3"></asp:Button>&nbsp;
                &nbsp;<asp:Button ID="btnCancel" Text="Cancel" runat="server" CausesValidation="False"
                            CommandName="Cancel"></asp:Button>
                 &nbsp;<asp:Button ID="Button1" Text="Delete" runat="server" CausesValidation="False"
                            CommandName="Delete" BorderColor="#CC0000" BorderWidth="3"></asp:Button><br /><br />
                    </FormTemplate>
                </EditFormSettings>
                </MasterTableView>
            </telerik:RadGrid>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Chairs] WHERE [Master_ID] = @Master_ID" InsertCommand="INSERT INTO [Chairs] ([Firstname], [Lastname]) VALUES (@Firstname, @Lastname)" SelectCommand="SELECT [Master_ID], [Firstname], [Lastname] FROM [Chairs]" UpdateCommand="UPDATE [Chairs] SET [Firstname] = @Firstname, [Lastname] = @Lastname WHERE [Master_ID] = @Master_ID">
            <DeleteParameters>
                <asp:Parameter Name="Master_ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Firstname" Type="String" />
                <asp:Parameter Name="Lastname" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Firstname" Type="String" />
                <asp:Parameter Name="Lastname" Type="String" />
                <asp:Parameter Name="Master_ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
    <p class="auto-style1">
        <strong>Hello</strong></p>
</body>
</html>
