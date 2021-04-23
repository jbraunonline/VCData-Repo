<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="EditMe2.aspx.vb" Inherits="VCdata.EditMe2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
div.a {
  width: auto;
  border: 1px solid black;
}

div.b {
  width: 150px;
  border: 1px solid black;  
}

div.c {
  width: 30%;
  border: 1px solid black;  
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Admin_Points] WHERE [Admin_Points_ID] = @Admin_Points_ID" InsertCommand="INSERT INTO [Admin_Points] ([CMR_ID], [Points], [PointsInload], [PointsOver], [PointsBanked], [Username], [UserStatus], [Reference], [Points_Source], [Points_Status], [Connect_Status], [Connect_Flag], [Points_Confirmed], [IsOffer], [IsOfferAccept]) VALUES (@CMR_ID, @Points, @PointsInload, @PointsOver, @PointsBanked, @Username, @UserStatus, @Reference, @Points_Source, @Points_Status, @Connect_Status, @Connect_Flag, @Points_Confirmed, @IsOffer, @IsOfferAccept)" SelectCommand="SELECT [Admin_Points_ID], [CMR_ID], [Points], [PointsInload], [PointsOver], [PointsBanked], [Username], [UserStatus], [Reference], [Points_Source], [Points_Status], [Connect_Status], [Connect_Flag], [Points_Confirmed], [IsOffer], [IsOfferAccept] FROM [Admin_Points] WHERE ([CMR_ID] = @CMR_ID)" UpdateCommand="UPDATE [Admin_Points] SET [CMR_ID] = @CMR_ID, [Points] = @Points, [PointsInload] = @PointsInload, [PointsOver] = @PointsOver, [PointsBanked] = @PointsBanked, [Username] = @Username, [UserStatus] = @UserStatus, [Reference] = @Reference, [Points_Source] = @Points_Source, [Points_Status] = @Points_Status, [Connect_Status] = @Connect_Status, [Connect_Flag] = @Connect_Flag, [Points_Confirmed] = @Points_Confirmed, [IsOffer] = @IsOffer, [IsOfferAccept] = @IsOfferAccept WHERE [Admin_Points_ID] = @Admin_Points_ID">
                <DeleteParameters>
                    <asp:Parameter Name="Admin_Points_ID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="CMR_ID" Type="Int32" />
                    <asp:Parameter Name="Points" Type="Decimal" />
                    <asp:Parameter Name="PointsInload" Type="Decimal" />
                    <asp:Parameter Name="PointsOver" Type="Decimal" />
                    <asp:Parameter Name="PointsBanked" Type="Decimal" />
                    <asp:Parameter Name="Username" Type="String" />
                    <asp:Parameter Name="UserStatus" Type="String" />
                    <asp:Parameter Name="Reference" Type="String" />
                    <asp:Parameter Name="Points_Source" Type="String" />
                    <asp:Parameter Name="Points_Status" Type="Int32" />
                    <asp:Parameter Name="Connect_Status" Type="Boolean" />
                    <asp:Parameter Name="Connect_Flag" Type="Boolean" />
                    <asp:Parameter Name="Points_Confirmed" Type="Boolean" />
                    <asp:Parameter Name="IsOffer" Type="Boolean" />
                    <asp:Parameter Name="IsOfferAccept" Type="Boolean" />
                </InsertParameters>
                <SelectParameters>
                    <asp:QueryStringParameter DefaultValue="11917" Name="CMR_ID" QueryStringField="ID" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="CMR_ID" Type="Int32" />
                    <asp:Parameter Name="Points" Type="Decimal" />
                    <asp:Parameter Name="PointsInload" Type="Decimal" />
                    <asp:Parameter Name="PointsOver" Type="Decimal" />
                    <asp:Parameter Name="PointsBanked" Type="Decimal" />
                    <asp:Parameter Name="Username" Type="String" />
                    <asp:Parameter Name="UserStatus" Type="String" />
                    <asp:Parameter Name="Reference" Type="String" />
                    <asp:Parameter Name="Points_Source" Type="String" />
                    <asp:Parameter Name="Points_Status" Type="Int32" />
                    <asp:Parameter Name="Connect_Status" Type="Boolean" />
                    <asp:Parameter Name="Connect_Flag" Type="Boolean" />
                    <asp:Parameter Name="Points_Confirmed" Type="Boolean" />
                    <asp:Parameter Name="IsOffer" Type="Boolean" />
                    <asp:Parameter Name="IsOfferAccept" Type="Boolean" />
                    <asp:Parameter Name="Admin_Points_ID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
        <br />
        <telerik:RadFormDecorator ID="RadFormDecorator1" Runat="server" DecoratedControls="CheckBoxes" Skin="Material" />
        <div class="c">
        <telerik:RadDataForm ID="RadDataForm1" runat="server" CssClass="rdfLeftAligned rdfNoFieldHint" DataKeyNames="Admin_Points_ID" DataSourceID="SqlDataSource1" RenderMode="Lightweight" Skin="Web20" Width="300px">
            <LayoutTemplate>
                <div class="RadDataForm RadDataForm_<%# Container.Skin %> rdfLeftAligned rdfNoFieldHint">
                    <div id="itemPlaceholder" runat="server">
                    </div>
                    <div class="rdfPager">
                        <span>
                        <telerik:RadButton ID="btnFirst" runat="server" CommandArgument="First" CommandName="Page" CssClass="rdfActionButton rdfPageFirst" RenderMode="Lightweight" ToolTip="First">
                            <Icon PrimaryIconCssClass="rdfIcon rdfPageFirstIcon" />
                        </telerik:RadButton>
                        <telerik:RadButton ID="btnPrev" runat="server" CommandArgument="Prev" CommandName="Page" CssClass="rdfActionButton rdfPagePrev" RenderMode="Lightweight" ToolTip="Previous">
                            <Icon PrimaryIconCssClass="rdfIcon rdfPagePrevIcon" />
                        </telerik:RadButton>
                        </span><span>
                        <telerik:RadButton ID="btnNext" runat="server" CommandArgument="Next" CommandName="Page" CssClass="rdfActionButton rdfPageNext" RenderMode="Lightweight" ToolTip="Next">
                            <Icon PrimaryIconCssClass="rdfIcon rdfPageNextIcon" />
                        </telerik:RadButton>
                        <telerik:RadButton ID="btnLast" runat="server" CommandArgument="Last" CommandName="Page" CssClass="rdfActionButton rdfPageLast" RenderMode="Lightweight" ToolTip="Last">
                            <Icon PrimaryIconCssClass="rdfIcon rdfPageLastIcon" />
                        </telerik:RadButton>
                        </span>
                    </div>
                </div>
</LayoutTemplate>
            <ItemTemplate>
                <fieldset class="rdfFieldset rdfBorders">
                    <legend class="rdfLegend">Data</legend>
                    <div class="rdfRow">
                        <asp:Label ID="Admin_Points_IDLabel2" runat="server" CssClass="rdfLabel" Text="Admin_Points_ID"></asp:Label>
                        <asp:Label ID="Admin_Points_IDLabel1" runat="server" CssClass="rdfFieldValue" Text='<%# Eval("Admin_Points_ID") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="CMR_IDLabel2" runat="server" CssClass="rdfLabel" Text="CMR_ID"></asp:Label>
                        <asp:Label ID="CMR_IDLabel1" runat="server" CssClass="rdfFieldValue" Text='<%# Eval("CMR_ID") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="PointsLabel2" runat="server" CssClass="rdfLabel" Text="Points"></asp:Label>
                        <asp:Label ID="PointsLabel1" runat="server" CssClass="rdfFieldValue" Text='<%# Eval("Points") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="PointsInloadLabel2" runat="server" CssClass="rdfLabel" Text="PointsInload"></asp:Label>
                        <asp:Label ID="PointsInloadLabel1" runat="server" CssClass="rdfFieldValue" Text='<%# Eval("PointsInload") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="PointsOverLabel2" runat="server" CssClass="rdfLabel" Text="PointsOver"></asp:Label>
                        <asp:Label ID="PointsOverLabel1" runat="server" CssClass="rdfFieldValue" Text='<%# Eval("PointsOver") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="PointsBankedLabel2" runat="server" CssClass="rdfLabel" Text="PointsBanked"></asp:Label>
                        <asp:Label ID="PointsBankedLabel1" runat="server" CssClass="rdfFieldValue" Text='<%# Eval("PointsBanked") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="UsernameLabel2" runat="server" CssClass="rdfLabel" Text="Username"></asp:Label>
                        <asp:Label ID="UsernameLabel1" runat="server" CssClass="rdfFieldValue" Text='<%# Eval("Username") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="UserStatusLabel2" runat="server" CssClass="rdfLabel" Text="UserStatus"></asp:Label>
                        <asp:Label ID="UserStatusLabel1" runat="server" CssClass="rdfFieldValue" Text='<%# Eval("UserStatus") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="ReferenceLabel2" runat="server" CssClass="rdfLabel" Text="Reference"></asp:Label>
                        <asp:Label ID="ReferenceLabel1" runat="server" CssClass="rdfFieldValue" Text='<%# Eval("Reference") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="Points_SourceLabel2" runat="server" CssClass="rdfLabel" Text="Points_Source"></asp:Label>
                        <asp:Label ID="Points_SourceLabel1" runat="server" CssClass="rdfFieldValue" Text='<%# Eval("Points_Source") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="Points_StatusLabel2" runat="server" CssClass="rdfLabel" Text="Points_Status"></asp:Label>
                        <asp:Label ID="Points_StatusLabel1" runat="server" CssClass="rdfFieldValue" Text='<%# Eval("Points_Status") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="Connect_StatusLabel2" runat="server" AssociatedControlID="Connect_StatusCheckBox" CssClass="rdfLabel" Text="Connect_Status"></asp:Label>
                        <asp:CheckBox ID="Connect_StatusCheckBox" runat="server" Checked='<%# Eval("Connect_Status") %>' Enabled="false" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="Connect_FlagLabel2" runat="server" AssociatedControlID="Connect_FlagCheckBox" CssClass="rdfLabel" Text="Connect_Flag"></asp:Label>
                        <asp:CheckBox ID="Connect_FlagCheckBox" runat="server" Checked='<%# Eval("Connect_Flag") %>' Enabled="false" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="Points_ConfirmedLabel2" runat="server" AssociatedControlID="Points_ConfirmedCheckBox" CssClass="rdfLabel" Text="Points_Confirmed"></asp:Label>
                        <asp:CheckBox ID="Points_ConfirmedCheckBox" runat="server" Checked='<%# Eval("Points_Confirmed") %>' Enabled="false" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="IsOfferLabel2" runat="server" AssociatedControlID="IsOfferCheckBox" CssClass="rdfLabel" Text="IsOffer"></asp:Label>
                        <asp:CheckBox ID="IsOfferCheckBox" runat="server" Checked='<%# Eval("IsOffer") %>' Enabled="false" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="IsOfferAcceptLabel2" runat="server" AssociatedControlID="IsOfferAcceptCheckBox" CssClass="rdfLabel" Text="IsOfferAccept"></asp:Label>
                        <asp:CheckBox ID="IsOfferAcceptCheckBox" runat="server" Checked='<%# Eval("IsOfferAccept") %>' Enabled="false" />
                    </div>
                    <div class="rdfCommandButtons">
                        <hr class="rdfHr" />
                        <telerik:RadButton ID="InitInsertButton" runat="server" Visible="false" ButtonType="SkinnedButton" CausesValidation="False" CommandName="InitInsert" RenderMode="Lightweight" Text="Insert" ToolTip="Insert" />
                        <telerik:RadButton ID="EditButton" runat="server" ButtonType="SkinnedButton" CausesValidation="False" CommandName="Edit" RenderMode="Lightweight" Text="Edit" ToolTip="Edit" />
                        <telerik:RadButton ID="DeleteButton" runat="server" ButtonType="SkinnedButton" CausesValidation="False" CommandName="Delete" RenderMode="Lightweight" Text="Delete" ToolTip="Delete" />
                    </div>
                </fieldset>
            </ItemTemplate>
            <EditItemTemplate>
                <fieldset class="rdfFieldset rdfBorders">
                    <legend class="rdfLegend">Edit</legend>
                    <div class="rdfRow">
                        <asp:Label ID="Admin_Points_IDLabel2" runat="server" CssClass="rdfLabel" Text="Admin_Points_ID"></asp:Label>
                        <asp:Label ID="Admin_Points_IDLabel1" runat="server" CssClass="rdfFieldValue" Text='<%# Eval("Admin_Points_ID") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="CMR_IDLabel2" runat="server" AssociatedControlID="CMR_IDTextBox" CssClass="rdfLabel" Text="CMR_ID"></asp:Label>
                        <telerik:RadNumericTextBox ID="CMR_IDTextBox" runat="server" DataType="Int32" DbValue='<%# Bind("CMR_ID") %>' NumberFormat-DecimalDigits="0" RenderMode="Lightweight" Skin="<%#Container.OwnerDataForm.Skin %>" WrapperCssClass="rdfInput" Width="100" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="PointsLabel2" runat="server" AssociatedControlID="PointsTextBox" CssClass="rdfLabel" Text="Points"></asp:Label>
                        <telerik:RadNumericTextBox ID="PointsTextBox" runat="server" DataType="Decimal" DbValue='<%# Bind("Points") %>' RenderMode="Lightweight" Skin="<%#Container.OwnerDataForm.Skin %>" WrapperCssClass="rdfInput" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="PointsInloadLabel2" runat="server" AssociatedControlID="PointsInloadTextBox" CssClass="rdfLabel" Text="PointsInload"></asp:Label>
                        <telerik:RadNumericTextBox ID="PointsInloadTextBox" runat="server" DataType="Decimal" DbValue='<%# Bind("PointsInload") %>' RenderMode="Lightweight" Skin="<%#Container.OwnerDataForm.Skin %>" WrapperCssClass="rdfInput" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="PointsOverLabel2" runat="server" AssociatedControlID="PointsOverTextBox" CssClass="rdfLabel" Text="PointsOver"></asp:Label>
                        <telerik:RadNumericTextBox ID="PointsOverTextBox" runat="server" DataType="Decimal" DbValue='<%# Bind("PointsOver") %>' RenderMode="Lightweight" Skin="<%#Container.OwnerDataForm.Skin %>" WrapperCssClass="rdfInput" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="PointsBankedLabel2" runat="server" AssociatedControlID="PointsBankedTextBox" CssClass="rdfLabel" Text="PointsBanked"></asp:Label>
                        <telerik:RadNumericTextBox ID="PointsBankedTextBox" runat="server" DataType="Decimal" DbValue='<%# Bind("PointsBanked") %>' RenderMode="Lightweight" Skin="<%#Container.OwnerDataForm.Skin %>" WrapperCssClass="rdfInput" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="UsernameLabel2" runat="server" AssociatedControlID="UsernameTextBox" CssClass="rdfLabel" Text="Username"></asp:Label>
                        <telerik:RadTextBox ID="UsernameTextBox" runat="server" RenderMode="Lightweight" Text='<%# Bind("Username") %>' WrapperCssClass="rdfInput" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="UserStatusLabel2" runat="server" AssociatedControlID="UserStatusTextBox" CssClass="rdfLabel" Text="UserStatus"></asp:Label>
                        <telerik:RadTextBox ID="UserStatusTextBox" runat="server" RenderMode="Lightweight" Text='<%# Bind("UserStatus") %>' WrapperCssClass="rdfInput" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="ReferenceLabel2" runat="server" AssociatedControlID="ReferenceTextBox" CssClass="rdfLabel" Text="Reference"></asp:Label>
                        <telerik:RadTextBox ID="ReferenceTextBox" runat="server" RenderMode="Lightweight" Text='<%# Bind("Reference") %>' WrapperCssClass="rdfInput" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="Points_SourceLabel2" runat="server" AssociatedControlID="Points_SourceTextBox" CssClass="rdfLabel" Text="Points_Source"></asp:Label>
                        <telerik:RadTextBox ID="Points_SourceTextBox" runat="server" RenderMode="Lightweight" Text='<%# Bind("Points_Source") %>' WrapperCssClass="rdfInput" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="Points_StatusLabel2" runat="server" AssociatedControlID="Points_StatusTextBox" CssClass="rdfLabel" Text="Points_Status"></asp:Label>
                        <telerik:RadNumericTextBox ID="Points_StatusTextBox" runat="server" DataType="Int32" DbValue='<%# Bind("Points_Status") %>' NumberFormat-DecimalDigits="0" RenderMode="Lightweight" Skin="<%#Container.OwnerDataForm.Skin %>" WrapperCssClass="rdfInput" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="Connect_StatusLabel2" runat="server" AssociatedControlID="Connect_StatusCheckBox" CssClass="rdfLabel" Text="Connect_Status"></asp:Label>
                        <asp:CheckBox ID="Connect_StatusCheckBox" runat="server" Checked='<%# Bind("Connect_Status") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="Connect_FlagLabel2" runat="server" AssociatedControlID="Connect_FlagCheckBox" CssClass="rdfLabel" Text="Connect_Flag"></asp:Label>
                        <asp:CheckBox ID="Connect_FlagCheckBox" runat="server" Checked='<%# Bind("Connect_Flag") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="Points_ConfirmedLabel2" runat="server" AssociatedControlID="Points_ConfirmedCheckBox" CssClass="rdfLabel" Text="Points_Confirmed"></asp:Label>
                        <asp:CheckBox ID="Points_ConfirmedCheckBox" runat="server" Checked='<%# Bind("Points_Confirmed") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="IsOfferLabel2" runat="server" AssociatedControlID="IsOfferCheckBox" CssClass="rdfLabel" Text="IsOffer"></asp:Label>
                        <asp:CheckBox ID="IsOfferCheckBox" runat="server" Checked='<%# Bind("IsOffer") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="IsOfferAcceptLabel2" runat="server" AssociatedControlID="IsOfferAcceptCheckBox" CssClass="rdfLabel" Text="IsOfferAccept"></asp:Label>
                        <asp:CheckBox ID="IsOfferAcceptCheckBox" runat="server" Checked='<%# Bind("IsOfferAccept") %>' />
                    </div>
                    <div class="rdfCommandButtons">
                        <hr class="rdfHr" />
                        <telerik:RadButton ID="UpdateButton" runat="server" ButtonType="SkinnedButton" CommandName="Update" RenderMode="Lightweight" Text="Update" ToolTip="Update" />
                        <telerik:RadButton ID="CancelButton" runat="server" ButtonType="SkinnedButton" CausesValidation="False" CommandName="Cancel" RenderMode="Lightweight" Text="Cancel" ToolTip="Cancel" />
                    </div>
                </fieldset>
            </EditItemTemplate>
            <InsertItemTemplate>
                <fieldset class="rdfFieldset rdfBorders">
                    <legend class="rdfLegend">Insert</legend>
                    <div class="rdfRow">
                        <asp:Label ID="CMR_IDLabel2" runat="server" AssociatedControlID="CMR_IDTextBox" CssClass="rdfLabel" Text="CMR_ID"></asp:Label>
                        <telerik:RadNumericTextBox ID="CMR_IDTextBox" runat="server" DataType="Int32" DbValue='<%# Bind("CMR_ID") %>' NumberFormat-DecimalDigits="0" RenderMode="Lightweight" Skin="<%#Container.OwnerDataForm.Skin %>" WrapperCssClass="rdfInput" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="PointsLabel2" runat="server" AssociatedControlID="PointsTextBox" CssClass="rdfLabel" Text="Points"></asp:Label>
                        <telerik:RadNumericTextBox ID="PointsTextBox" runat="server" DataType="Decimal" DbValue='<%# Bind("Points") %>' RenderMode="Lightweight" Skin="<%#Container.OwnerDataForm.Skin %>" WrapperCssClass="rdfInput" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="PointsInloadLabel2" runat="server" AssociatedControlID="PointsInloadTextBox" CssClass="rdfLabel" Text="PointsInload"></asp:Label>
                        <telerik:RadNumericTextBox ID="PointsInloadTextBox" runat="server" DataType="Decimal" DbValue='<%# Bind("PointsInload") %>' RenderMode="Lightweight" Skin="<%#Container.OwnerDataForm.Skin %>" WrapperCssClass="rdfInput" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="PointsOverLabel2" runat="server" AssociatedControlID="PointsOverTextBox" CssClass="rdfLabel" Text="PointsOver"></asp:Label>
                        <telerik:RadNumericTextBox ID="PointsOverTextBox" runat="server" DataType="Decimal" DbValue='<%# Bind("PointsOver") %>' RenderMode="Lightweight" Skin="<%#Container.OwnerDataForm.Skin %>" WrapperCssClass="rdfInput" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="PointsBankedLabel2" runat="server" AssociatedControlID="PointsBankedTextBox" CssClass="rdfLabel" Text="PointsBanked"></asp:Label>
                        <telerik:RadNumericTextBox ID="PointsBankedTextBox" runat="server" DataType="Decimal" DbValue='<%# Bind("PointsBanked") %>' RenderMode="Lightweight" Skin="<%#Container.OwnerDataForm.Skin %>" WrapperCssClass="rdfInput" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="UsernameLabel2" runat="server" AssociatedControlID="UsernameTextBox" CssClass="rdfLabel" Text="Username"></asp:Label>
                        <telerik:RadTextBox ID="UsernameTextBox" runat="server" RenderMode="Lightweight" Text='<%# Bind("Username") %>' WrapperCssClass="rdfInput" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="UserStatusLabel2" runat="server" AssociatedControlID="UserStatusTextBox" CssClass="rdfLabel" Text="UserStatus"></asp:Label>
                        <telerik:RadTextBox ID="UserStatusTextBox" runat="server" RenderMode="Lightweight" Text='<%# Bind("UserStatus") %>' WrapperCssClass="rdfInput" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="ReferenceLabel2" runat="server" AssociatedControlID="ReferenceTextBox" CssClass="rdfLabel" Text="Reference"></asp:Label>
                        <telerik:RadTextBox ID="ReferenceTextBox" runat="server" RenderMode="Lightweight" Text='<%# Bind("Reference") %>' WrapperCssClass="rdfInput" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="Points_SourceLabel2" runat="server" AssociatedControlID="Points_SourceTextBox" CssClass="rdfLabel" Text="Points_Source"></asp:Label>
                        <telerik:RadTextBox ID="Points_SourceTextBox" runat="server" RenderMode="Lightweight" Text='<%# Bind("Points_Source") %>' WrapperCssClass="rdfInput" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="Points_StatusLabel2" runat="server" AssociatedControlID="Points_StatusTextBox" CssClass="rdfLabel" Text="Points_Status"></asp:Label>
                        <telerik:RadNumericTextBox ID="Points_StatusTextBox" runat="server" DataType="Int32" DbValue='<%# Bind("Points_Status") %>' NumberFormat-DecimalDigits="0" RenderMode="Lightweight" Skin="<%#Container.OwnerDataForm.Skin %>" WrapperCssClass="rdfInput" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="Connect_StatusLabel2" runat="server" AssociatedControlID="Connect_StatusCheckBox" CssClass="rdfLabel" Text="Connect_Status"></asp:Label>
                        <asp:CheckBox ID="Connect_StatusCheckBox" runat="server" Checked='<%# Bind("Connect_Status") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="Connect_FlagLabel2" runat="server" AssociatedControlID="Connect_FlagCheckBox" CssClass="rdfLabel" Text="Connect_Flag"></asp:Label>
                        <asp:CheckBox ID="Connect_FlagCheckBox" runat="server" Checked='<%# Bind("Connect_Flag") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="Points_ConfirmedLabel2" runat="server" AssociatedControlID="Points_ConfirmedCheckBox" CssClass="rdfLabel" Text="Points_Confirmed"></asp:Label>
                        <asp:CheckBox ID="Points_ConfirmedCheckBox" runat="server" Checked='<%# Bind("Points_Confirmed") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="IsOfferLabel2" runat="server" AssociatedControlID="IsOfferCheckBox" CssClass="rdfLabel" Text="IsOffer"></asp:Label>
                        <asp:CheckBox ID="IsOfferCheckBox" runat="server" Checked='<%# Bind("IsOffer") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="IsOfferAcceptLabel2" runat="server" AssociatedControlID="IsOfferAcceptCheckBox" CssClass="rdfLabel" Text="IsOfferAccept"></asp:Label>
                        <asp:CheckBox ID="IsOfferAcceptCheckBox" runat="server" Checked='<%# Bind("IsOfferAccept") %>' />
                    </div>
                    <div class="rdfCommandButtons">
                        <hr class="rdfHr" />
                        <telerik:RadButton ID="PerformInsertButton" runat="server" Visible="false" ButtonType="SkinnedButton" CommandName="PerformInsert" RenderMode="Lightweight" Text="Insert" ToolTip="Insert" />
                        <telerik:RadButton ID="CancelButton" runat="server" ButtonType="SkinnedButton" CausesValidation="False" CommandName="Cancel" RenderMode="Lightweight" Text="Cancel" ToolTip="Cancel" />
                    </div>
                </fieldset>
            </InsertItemTemplate>
            <EmptyDataTemplate>
                <div class="RadDataForm RadDataForm_<%# Container.Skin %>">
                    <div class="rdfEmpty">
                        There are no items to be displayed.</div>
                </div>
            </EmptyDataTemplate>
        </telerik:RadDataForm>
        </div>
    </form>
</body>
</html>
