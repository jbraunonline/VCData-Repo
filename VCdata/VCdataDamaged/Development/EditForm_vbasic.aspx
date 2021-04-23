<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="EditForm_vbasic.aspx.vb" Inherits="VCdata.EditForm_vbasic" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Editing Record</title>
    <style>
        body {
            font: 14px/1.4 Helvetica, Arial, sans-serif;
        }
 
        button.RadButton span.rbIcon {
            vertical-align: sub;
        }
 
        .rdfLabel.rdfBlock {
            margin-top: 6px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
 
            <script type="text/javascript">
                function CloseAndRebind(args) {
                    GetRadWindow().BrowserWindow.refreshGrid(args);
                    GetRadWindow().close();
                }
 
                function GetRadWindow() {
                    var oWindow = null;
                    if (window.radWindow) oWindow = window.radWindow; //Will work in Moz in all cases, including clasic dialog
                    else if (window.frameElement.radWindow) oWindow = window.frameElement.radWindow; //IE (and Moz as well)
 
                    return oWindow;
                }
 
                function CancelEdit() {
                    GetRadWindow().close();
                }
            </script>
            <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
                <Scripts>
                    <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.Core.js" />
                    <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQuery.js" />
                    <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQueryInclude.js" />
                </Scripts>
            </telerik:RadScriptManager>
            <br />
            <br />
            <telerik:RadDataForm RenderMode="Lightweight" runat="server" ID="RadDataForm1" DataSourceID="SqlDataSource1"
                DataKeyNames="EmployeeID" OnItemCommand="RadDataForm1_ItemCommand" OnPreRender="RadDataForm1_PreRender">
                <LayoutTemplate>
                    <div class="RadDataForm RadDataForm_<%# Container.Skin %> rdfLeftAligned rdfInlineBlock" style="width: 362px;">
                        <div id="itemPlaceholder" runat="server" class="rdfLeftAligned"></div>
                    </div>
                </LayoutTemplate>
                <ItemTemplate></ItemTemplate>
                <EditItemTemplate>
                    <fieldset class="rdfFieldset rdfBorders">
                        <div class="rdfRow">
                            <asp:Label runat="server" ID="FirstNameLabel" CssClass="rdfLabel rdfBlock" Text="First Name:"></asp:Label>
                            <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="FirstNameTextBox" WrapperCssClass="rdfFieldValue"
                                Text='<%# Bind("FirstName") %>' MaxLength="10" Width="214px" />
                            <asp:RequiredFieldValidator ForeColor="Red" runat="server" ID="RequiredFieldValidator1" ControlToValidate="FirstNameTextBox"
                                ErrorMessage="*"></asp:RequiredFieldValidator>
                        </div>
                        <div class="rdfRow">
                            <asp:Label runat="server" ID="LastNameLabel" CssClass="rdfLabel rdfBlock" Text="Last Name:"></asp:Label>
                            <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="LastNameTextBox" WrapperCssClass="rdfFieldValue"
                                Text='<%# Bind("LastName") %>' MaxLength="20" Width="214px" />
                            <asp:RequiredFieldValidator ForeColor="Red" runat="server" ID="RequiredFieldValidator2" ControlToValidate="LastNameTextBox"
                                ErrorMessage="*"></asp:RequiredFieldValidator>
                        </div>
                        <div class="rdfRow">
                            <asp:Label runat="server" ID="TitleLabel" CssClass="rdfLabel rdfBlock" Text="Title:"></asp:Label>
                            <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="TitleTextBox" WrapperCssClass="rdfFieldValue"
                                Text='<%# Bind("Title") %>' MaxLength="20" Width="214px" />
                            <asp:RequiredFieldValidator ForeColor="Red" runat="server" ID="RequiredFieldValidator3" ControlToValidate="TitleTextBox"
                                ErrorMessage="*"></asp:RequiredFieldValidator>
                        </div>
                        <div class="rdfRow" style="float: right; padding-right: 10px;">
                            <telerik:RadButton RenderMode="Lightweight" runat="server" ID="ButtonUpdate" Text="Update" CommandName="Update"
                                Skin="<%# Container.OwnerDataForm.Skin %>">
                                <Icon PrimaryIconCssClass="rbOk"></Icon>
                            </telerik:RadButton>
                            <telerik:RadButton RenderMode="Lightweight" runat="server" ID="ButtonCancel" Text="Cancel" CommandName="Cancel"
                                CausesValidation="false" Skin="<%# Container.OwnerDataForm.Skin %>">
                                <Icon PrimaryIconCssClass="rbCancel"></Icon>
                            </telerik:RadButton>
                        </div>
                    </fieldset>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <fieldset class="rdfFieldset rdfBorders">
                        <div class="rdfRow">
                            <asp:Label runat="server" ID="FirstNameLabel" CssClass="rdfLabel rdfBlock" Text="First Name:"></asp:Label>
                            <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="FirstNameTextBox" WrapperCssClass="rdfFieldValue"
                                Text='<%# Bind("FirstName") %>' MaxLength="10" Width="214px" />
                            <asp:RequiredFieldValidator ForeColor="Red" runat="server" ID="RequiredFieldValidator1" ControlToValidate="FirstNameTextBox"
                                ErrorMessage="*"></asp:RequiredFieldValidator>
                        </div>
                        <div class="rdfRow">
                            <asp:Label runat="server" ID="LastNameLabel" CssClass="rdfLabel rdfBlock" Text="Last Name:"></asp:Label>
                            <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="LastNameTextBox" WrapperCssClass="rdfFieldValue"
                                Text='<%# Bind("LastName") %>' MaxLength="20" Width="214px" />
                            <asp:RequiredFieldValidator ForeColor="Red" runat="server" ID="RequiredFieldValidator2" ControlToValidate="LastNameTextBox"
                                ErrorMessage="*"></asp:RequiredFieldValidator>
                        </div>
                        <div class="rdfRow">
                            <asp:Label runat="server" ID="TitleLabel" CssClass="rdfLabel rdfBlock" Text="Title:"></asp:Label>
                            <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="TitleTextBox" WrapperCssClass="rdfFieldValue"
                                Text='<%# Bind("Title") %>' MaxLength="20" Width="214px" />
                            <asp:RequiredFieldValidator ForeColor="Red" runat="server" ID="RequiredFieldValidator3" ControlToValidate="TitleTextBox"
                                ErrorMessage="*"></asp:RequiredFieldValidator>
                        </div>
                        <div class="rdfRow" style="float: right; padding-right: 10px;">
                            <telerik:RadButton RenderMode="Lightweight" runat="server" ID="ButtonPerformInsert" Text="Insert"
                                CommandName="PerformInsert" Skin="<%# Container.OwnerDataForm.Skin %>">
                                <Icon PrimaryIconCssClass="rbOk"></Icon>
                            </telerik:RadButton>
                            <telerik:RadButton RenderMode="Lightweight" runat="server" ID="ButtonCancel" Text="Cancel"
                                CommandName="Cancel" CausesValidation="false" Skin="<%# Container.OwnerDataForm.Skin %>">
                                <Icon PrimaryIconCssClass="rbCancel"></Icon>
                            </telerik:RadButton>
                        </div>
                    </fieldset>
                </InsertItemTemplate>
            </telerik:RadDataForm>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString35 %>"
                InsertCommand="INSERT INTO [Employees] ([LastName], [FirstName], [Title]) VALUES (@LastName, @FirstName, @Title)"
                SelectCommand="SELECT [EmployeeID], [FirstName], [LastName], [Title] FROM [Employees] WHERE ([EmployeeID] = @EmployeeID)"
                UpdateCommand="UPDATE [Employees] SET [LastName] = @LastName, [FirstName] = @FirstName, [Title] = @Title WHERE [EmployeeID] = @EmployeeID">
                <InsertParameters>
                    <asp:Parameter Name="LastName" Type="String" DefaultValue="" ConvertEmptyStringToNull="false" />
                    <asp:Parameter Name="FirstName" Type="String" DefaultValue="" ConvertEmptyStringToNull="false" />
                    <asp:Parameter Name="Title" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="LastName" Type="String" DefaultValue="" ConvertEmptyStringToNull="false" />
                    <asp:Parameter Name="FirstName" Type="String" DefaultValue="" ConvertEmptyStringToNull="false" />
                    <asp:Parameter Name="Title" Type="String" />
                    <asp:Parameter Name="EmployeeID" Type="Int32" />
                </UpdateParameters>
                <SelectParameters>
                    <asp:QueryStringParameter Name="EmployeeID" QueryStringField="EmployeeID" Type="Int32" DefaultValue="0" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>