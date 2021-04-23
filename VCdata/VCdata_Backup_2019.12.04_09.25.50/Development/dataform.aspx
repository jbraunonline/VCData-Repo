<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="dataform.aspx.vb" Inherits="VCdata.dataform" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 1200px;
            background-color: #FFFFFF;

}
        td {

  vertical-align: top;
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
        <telerik:RadFormDecorator ID="RadFormDecorator1" Runat="server" DecoratedControls="CheckBoxes" Skin="Material" />
       <table class="auto-style1">
            <tr>
                <td><telerik:RadDataForm ID="RadDataForm1" runat="server" CssClass="rdfLeftAligned rdfNoFieldHint" DataKeyNames="ID" DataSourceID="SqlDataSource1" RenderMode="Lightweight" Width="200px">
            <LayoutTemplate>
                <div class="RadDataForm RadDataForm_<%# Container.Skin %> rdfLeftAligned rdfNoFieldHint">
                    <div id="itemPlaceholder" runat="server">
                    </div>
    
</LayoutTemplate>
            <ItemTemplate>
                <fieldset class="rdfFieldset rdfBorders">
                    <legend class="rdfLegend">Section Data</legend>
                    <div class="rdfRow">
                        <asp:Label ID="IDLabel2" runat="server" CssClass="rdfLabel" Text="ID"></asp:Label>
                        <asp:Label ID="IDLabel1" runat="server" CssClass="rdfFieldValue" Text='<%# Eval("ID") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="FamilyStringLabel2" runat="server" CssClass="rdfLabel" Text="FamilyString"></asp:Label>
                        <asp:Label ID="FamilyStringLabel1" runat="server" CssClass="rdfFieldValue" Text='<%# Eval("FamilyString") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="ParentLabel2" runat="server" CssClass="rdfLabel" Text="Parent"></asp:Label>
                        <asp:Label ID="ParentLabel1" runat="server" CssClass="rdfFieldValue" Text='<%# Eval("Parent") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="CourseLabel2" runat="server" CssClass="rdfLabel" Text="Course"></asp:Label>
                        <asp:Label ID="CourseLabel1" runat="server" CssClass="rdfFieldValue" Text='<%# Eval("Course") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="InstructorLabel2" runat="server" CssClass="rdfLabel" Text="Instructor"></asp:Label>
                        <asp:Label ID="InstructorLabel1" runat="server" CssClass="rdfFieldValue" Text='<%# Eval("Instructor") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="OutlookLabel2" runat="server" CssClass="rdfLabel" Text="Outlook"></asp:Label>
                        <asp:Label ID="OutlookLabel1" runat="server" CssClass="rdfFieldValue" Text='<%# Eval("Outlook") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="CanChangeLabel2" runat="server" AssociatedControlID="CanChangeCheckBox" CssClass="rdfLabel" Text="CanChange"></asp:Label>
                        <asp:CheckBox ID="CanChangeCheckBox" runat="server" Checked='<%# Eval("CanChange") %>' Enabled="false" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="SessionLabel2" runat="server" CssClass="rdfLabel" Text="Session"></asp:Label>
                        <asp:Label ID="SessionLabel1" runat="server" CssClass="rdfFieldValue" Text='<%# Eval("Session") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="IsMidtermLabel2" runat="server" AssociatedControlID="IsMidtermCheckBox" CssClass="rdfLabel" Text="IsMidterm"></asp:Label>
                        <asp:CheckBox ID="IsMidtermCheckBox" runat="server" Checked='<%# Eval("IsMidterm") %>' Enabled="false" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="MidStartLabel2" runat="server" CssClass="rdfLabel" Text="MidStart"></asp:Label>
                        <asp:Label ID="MidStartLabel1" runat="server" CssClass="rdfFieldValue" Text='<%# Eval("MidStart") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="MidEndLabel2" runat="server" CssClass="rdfLabel" Text="MidEnd"></asp:Label>
                        <asp:Label ID="MidEndLabel1" runat="server" CssClass="rdfFieldValue" Text='<%# Eval("MidEnd") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="MidNameLLabel2" runat="server" CssClass="rdfLabel" Text="MidNameL"></asp:Label>
                        <asp:Label ID="MidNameLLabel1" runat="server" CssClass="rdfFieldValue" Text='<%# Eval("MidNameL") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="MidFolderLLabel2" runat="server" CssClass="rdfLabel" Text="MidFolderL"></asp:Label>
                        <asp:Label ID="MidFolderLLabel1" runat="server" CssClass="rdfFieldValue" Text='<%# Eval("MidFolderL") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="MidNameRLabel2" runat="server" CssClass="rdfLabel" Text="MidNameR"></asp:Label>
                        <asp:Label ID="MidNameRLabel1" runat="server" CssClass="rdfFieldValue" Text='<%# Eval("MidNameR") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="MidFolderRLabel2" runat="server" CssClass="rdfLabel" Text="MidFolderR"></asp:Label>
                        <asp:Label ID="MidFolderRLabel1" runat="server" CssClass="rdfFieldValue" Text='<%# Eval("MidFolderR") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="MidTimeLabel2" runat="server" CssClass="rdfLabel" Text="MidTime"></asp:Label>
                        <asp:Label ID="MidTimeLabel1" runat="server" CssClass="rdfFieldValue" Text='<%# Eval("MidTime") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="MidPaperLabel2" runat="server" AssociatedControlID="MidPaperCheckBox" CssClass="rdfLabel" Text="MidPaper"></asp:Label>
                        <asp:CheckBox ID="MidPaperCheckBox" runat="server" Checked='<%# Eval("MidPaper") %>' Enabled="false" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="MidCalculatorLabel2" runat="server" AssociatedControlID="MidCalculatorCheckBox" CssClass="rdfLabel" Text="MidCalculator"></asp:Label>
                        <asp:CheckBox ID="MidCalculatorCheckBox" runat="server" Checked='<%# Eval("MidCalculator") %>' Enabled="false" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="MidGraphLabel2" runat="server" AssociatedControlID="MidGraphCheckBox" CssClass="rdfLabel" Text="MidGraph"></asp:Label>
                        <asp:CheckBox ID="MidGraphCheckBox" runat="server" Checked='<%# Eval("MidGraph") %>' Enabled="false" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="MidNotesLabel2" runat="server" CssClass="rdfLabel" Text="MidNotes"></asp:Label>
                        <asp:Label ID="MidNotesLabel1" runat="server" CssClass="rdfFieldValue" Text='<%# Eval("MidNotes") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="IsFinalLabel2" runat="server" AssociatedControlID="IsFinalCheckBox" CssClass="rdfLabel" Text="IsFinal"></asp:Label>
                        <asp:CheckBox ID="IsFinalCheckBox" runat="server" Checked='<%# Eval("IsFinal") %>' Enabled="false" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="FinalStartLabel2" runat="server" CssClass="rdfLabel" Text="FinalStart"></asp:Label>
                        <asp:Label ID="FinalStartLabel1" runat="server" CssClass="rdfFieldValue" Text='<%# Eval("FinalStart") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="FinalEndLabel2" runat="server" CssClass="rdfLabel" Text="FinalEnd"></asp:Label>
                        <asp:Label ID="FinalEndLabel1" runat="server" CssClass="rdfFieldValue" Text='<%# Eval("FinalEnd") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="FinalNameLLabel2" runat="server" CssClass="rdfLabel" Text="FinalNameL"></asp:Label>
                        <asp:Label ID="FinalNameLLabel1" runat="server" CssClass="rdfFieldValue" Text='<%# Eval("FinalNameL") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="FinalFolderLLabel2" runat="server" CssClass="rdfLabel" Text="FinalFolderL"></asp:Label>
                        <asp:Label ID="FinalFolderLLabel1" runat="server" CssClass="rdfFieldValue" Text='<%# Eval("FinalFolderL") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="FinalNameRLabel2" runat="server" CssClass="rdfLabel" Text="FinalNameR"></asp:Label>
                        <asp:Label ID="FinalNameRLabel1" runat="server" CssClass="rdfFieldValue" Text='<%# Eval("FinalNameR") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="FinalFolderRLabel2" runat="server" CssClass="rdfLabel" Text="FinalFolderR"></asp:Label>
                        <asp:Label ID="FinalFolderRLabel1" runat="server" CssClass="rdfFieldValue" Text='<%# Eval("FinalFolderR") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="FinalTimeLabel2" runat="server" CssClass="rdfLabel" Text="FinalTime"></asp:Label>
                        <asp:Label ID="FinalTimeLabel1" runat="server" CssClass="rdfFieldValue" Text='<%# Eval("FinalTime") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="FinalPaperLabel2" runat="server" AssociatedControlID="FinalPaperCheckBox" CssClass="rdfLabel" Text="FinalPaper"></asp:Label>
                        <asp:CheckBox ID="FinalPaperCheckBox" runat="server" Checked='<%# Eval("FinalPaper") %>' Enabled="false" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="FinalCalculatorLabel2" runat="server" AssociatedControlID="FinalCalculatorCheckBox" CssClass="rdfLabel" Text="FinalCalculator"></asp:Label>
                        <asp:CheckBox ID="FinalCalculatorCheckBox" runat="server" Checked='<%# Eval("FinalCalculator") %>' Enabled="false" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="FinalGraphLabel2" runat="server" AssociatedControlID="FinalGraphCheckBox" CssClass="rdfLabel" Text="FinalGraph"></asp:Label>
                        <asp:CheckBox ID="FinalGraphCheckBox" runat="server" Checked='<%# Eval("FinalGraph") %>' Enabled="false" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="FinalNotesLabel2" runat="server" CssClass="rdfLabel" Text="FinalNotes"></asp:Label>
                        <asp:Label ID="FinalNotesLabel1" runat="server" CssClass="rdfFieldValue" Text='<%# Eval("FinalNotes") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="InstCommentsLabel2" runat="server" CssClass="rdfLabel" Text="InstComments"></asp:Label>
                        <asp:Label ID="InstCommentsLabel1" runat="server" CssClass="rdfFieldValue" Text='<%# Eval("InstComments") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="AccessLabel2" runat="server" AssociatedControlID="AccessCheckBox" CssClass="rdfLabel" Text="Access"></asp:Label>
                        <asp:CheckBox ID="AccessCheckBox" runat="server" Checked='<%# Eval("Access") %>' Enabled="false" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="SignoffLabel2" runat="server" AssociatedControlID="SignoffCheckBox" CssClass="rdfLabel" Text="Signoff"></asp:Label>
                        <asp:CheckBox ID="SignoffCheckBox" runat="server" Checked='<%# Eval("Signoff") %>' Enabled="false" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="SignoffDateLabel2" runat="server" CssClass="rdfLabel" Text="SignoffDate"></asp:Label>
                        <asp:Label ID="SignoffDateLabel1" runat="server" CssClass="rdfFieldValue" Text='<%# Eval("SignoffDate") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="VCSignoffLabel2" runat="server" AssociatedControlID="VCSignoffCheckBox" CssClass="rdfLabel" Text="VCSignoff"></asp:Label>
                        <asp:CheckBox ID="VCSignoffCheckBox" runat="server" Checked='<%# Eval("VCSignoff") %>' Enabled="false" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="VCSignoffDateLabel2" runat="server" CssClass="rdfLabel" Text="VCSignoffDate"></asp:Label>
                        <asp:Label ID="VCSignoffDateLabel1" runat="server" CssClass="rdfFieldValue" Text='<%# Eval("VCSignoffDate") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="VCNotesLabel2" runat="server" CssClass="rdfLabel" Text="VCNotes"></asp:Label>
                        <asp:Label ID="VCNotesLabel1" runat="server" CssClass="rdfFieldValue" Text='<%# Eval("VCNotes") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="MidProctorXLabel2" runat="server" AssociatedControlID="MidProctorXCheckBox" CssClass="rdfLabel" Text="MidProctorX"></asp:Label>
                        <asp:CheckBox ID="MidProctorXCheckBox" runat="server" Checked='<%# Eval("MidProctorX") %>' Enabled="false" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="FinalProctorXLabel2" runat="server" AssociatedControlID="FinalProctorXCheckBox" CssClass="rdfLabel" Text="FinalProctorX"></asp:Label>
                        <asp:CheckBox ID="FinalProctorXCheckBox" runat="server" Checked='<%# Eval("FinalProctorX") %>' Enabled="false" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="UseDefaultLabel2" runat="server" AssociatedControlID="UseDefaultCheckBox" CssClass="rdfLabel" Text="UseDefault"></asp:Label>
                        <asp:CheckBox ID="UseDefaultCheckBox" runat="server" Checked='<%# Eval("UseDefault") %>' Enabled="false" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="MidWindowLabel2" runat="server" CssClass="rdfLabel" Text="MidWindow"></asp:Label>
                        <asp:Label ID="MidWindowLabel1" runat="server" CssClass="rdfFieldValue" Text='<%# Eval("MidWindow") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="FinalWindowLabel2" runat="server" CssClass="rdfLabel" Text="FinalWindow"></asp:Label>
                        <asp:Label ID="FinalWindowLabel1" runat="server" CssClass="rdfFieldValue" Text='<%# Eval("FinalWindow") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="LockdownLabel2" runat="server" AssociatedControlID="LockdownCheckBox" CssClass="rdfLabel" Text="Lockdown"></asp:Label>
                        <asp:CheckBox ID="LockdownCheckBox" runat="server" Checked='<%# Eval("Lockdown") %>' Enabled="false" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="LockdownMidLabel2" runat="server" AssociatedControlID="LockdownMidCheckBox" CssClass="rdfLabel" Text="LockdownMid"></asp:Label>
                        <asp:CheckBox ID="LockdownMidCheckBox" runat="server" Checked='<%# Eval("LockdownMid") %>' Enabled="false" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="LockdownFinalLabel2" runat="server" AssociatedControlID="LockdownFinalCheckBox" CssClass="rdfLabel" Text="LockdownFinal"></asp:Label>
                        <asp:CheckBox ID="LockdownFinalCheckBox" runat="server" Checked='<%# Eval("LockdownFinal") %>' Enabled="false" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="Mid_ManualLabel2" runat="server" AssociatedControlID="Mid_ManualCheckBox" CssClass="rdfLabel" Text="Mid_Manual"></asp:Label>
                        <asp:CheckBox ID="Mid_ManualCheckBox" runat="server" Checked='<%# Eval("Mid_Manual") %>' Enabled="false" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="Final_ManualLabel2" runat="server" AssociatedControlID="Final_ManualCheckBox" CssClass="rdfLabel" Text="Final_Manual"></asp:Label>
                        <asp:CheckBox ID="Final_ManualCheckBox" runat="server" Checked='<%# Eval("Final_Manual") %>' Enabled="false" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="HeadphonesLabel2" runat="server" AssociatedControlID="HeadphonesCheckBox" CssClass="rdfLabel" Text="Headphones"></asp:Label>
                        <asp:CheckBox ID="HeadphonesCheckBox" runat="server" Checked='<%# Eval("Headphones") %>' Enabled="false" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="EssayLabel2" runat="server" AssociatedControlID="EssayCheckBox" CssClass="rdfLabel" Text="Essay"></asp:Label>
                        <asp:CheckBox ID="EssayCheckBox" runat="server" Checked='<%# Eval("Essay") %>' Enabled="false" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="FinalEssayLabel2" runat="server" AssociatedControlID="FinalEssayCheckBox" CssClass="rdfLabel" Text="FinalEssay"></asp:Label>
                        <asp:CheckBox ID="FinalEssayCheckBox" runat="server" Checked='<%# Eval("FinalEssay") %>' Enabled="false" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="FinalHeadphonesLabel2" runat="server" AssociatedControlID="FinalHeadphonesCheckBox" CssClass="rdfLabel" Text="FinalHeadphones"></asp:Label>
                        <asp:CheckBox ID="FinalHeadphonesCheckBox" runat="server" Checked='<%# Eval("FinalHeadphones") %>' Enabled="false" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="PM_ANXMTRLabel2" runat="server" CssClass="rdfLabel" Text="PM_ANXMTR"></asp:Label>
                        <asp:Label ID="PM_ANXMTRLabel1" runat="server" CssClass="rdfFieldValue" Text='<%# Eval("PM_ANXMTR") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="PF_ANXMTRLabel2" runat="server" CssClass="rdfLabel" Text="PF_ANXMTR"></asp:Label>
                        <asp:Label ID="PF_ANXMTRLabel1" runat="server" CssClass="rdfFieldValue" Text='<%# Eval("PF_ANXMTR") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="MidVerifiedLabel2" runat="server" AssociatedControlID="MidVerifiedCheckBox" CssClass="rdfLabel" Text="MidVerified"></asp:Label>
                        <asp:CheckBox ID="MidVerifiedCheckBox" runat="server" Checked='<%# Eval("MidVerified") %>' Enabled="false" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="FinalVerifiedLabel2" runat="server" AssociatedControlID="FinalVerifiedCheckBox" CssClass="rdfLabel" Text="FinalVerified"></asp:Label>
                        <asp:CheckBox ID="FinalVerifiedCheckBox" runat="server" Checked='<%# Eval("FinalVerified") %>' Enabled="false" />
                    </div>
                    <div class="rdfCommandButtons">
                        <hr class="rdfHr" />
                        <telerik:RadButton ID="InitInsertButton" runat="server" ButtonType="SkinnedButton" CausesValidation="False" CommandName="InitInsert" RenderMode="Lightweight" Text="Insert" ToolTip="Insert" />
                        <telerik:RadButton ID="EditButton" runat="server" ButtonType="SkinnedButton" CausesValidation="False" CommandName="Edit" RenderMode="Lightweight" Text="Edit" ToolTip="Edit" />
                        <telerik:RadButton ID="DeleteButton" runat="server" ButtonType="SkinnedButton" CausesValidation="False" CommandName="Delete" RenderMode="Lightweight" Text="Delete" ToolTip="Delete" />
                    </div>
                </fieldset>
            </ItemTemplate>
            <EditItemTemplate>
                <fieldset class="rdfFieldset rdfBorders">
                    <legend class="rdfLegend">Designer Data</legend>
                    <div class="rdfRow">
                        <asp:Label ID="IDLabel2" runat="server" CssClass="rdfLabel" Text="ID"></asp:Label>
                        <asp:Label ID="IDLabel1" runat="server" CssClass="rdfFieldValue" Text='<%# Eval("ID") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="FamilyStringLabel2" runat="server" AssociatedControlID="FamilyStringTextBox" CssClass="rdfLabel" Text="FamilyString"></asp:Label>
                        <telerik:RadTextBox ID="FamilyStringTextBox" runat="server" RenderMode="Lightweight" Text='<%# Bind("FamilyString") %>' WrapperCssClass="rdfInput" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="ParentLabel2" runat="server" AssociatedControlID="ParentTextBox" CssClass="rdfLabel" Text="Parent"></asp:Label>
                        <telerik:RadTextBox ID="ParentTextBox" runat="server" RenderMode="Lightweight" Text='<%# Bind("Parent") %>' WrapperCssClass="rdfInput" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="CourseLabel2" runat="server" AssociatedControlID="CourseTextBox" CssClass="rdfLabel" Text="Course"></asp:Label>
                        <telerik:RadTextBox ID="CourseTextBox" runat="server" RenderMode="Lightweight" Text='<%# Bind("Course") %>' WrapperCssClass="rdfInput" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="InstructorLabel2" runat="server" AssociatedControlID="InstructorTextBox" CssClass="rdfLabel" Text="Instructor"></asp:Label>
                        <telerik:RadTextBox ID="InstructorTextBox" runat="server" RenderMode="Lightweight" Text='<%# Bind("Instructor") %>' WrapperCssClass="rdfInput" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="OutlookLabel2" runat="server" AssociatedControlID="OutlookTextBox" CssClass="rdfLabel" Text="Outlook"></asp:Label>
                        <telerik:RadTextBox ID="OutlookTextBox" runat="server" RenderMode="Lightweight" Text='<%# Bind("Outlook") %>' WrapperCssClass="rdfInput" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="CanChangeLabel2" runat="server" AssociatedControlID="CanChangeCheckBox" CssClass="rdfLabel" Text="CanChange"></asp:Label>
                        <asp:CheckBox ID="CanChangeCheckBox" runat="server" Checked='<%# Bind("CanChange") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="SessionLabel2" runat="server" AssociatedControlID="SessionTextBox" CssClass="rdfLabel" Text="Session"></asp:Label>
                        <telerik:RadTextBox ID="SessionTextBox" runat="server" RenderMode="Lightweight" Text='<%# Bind("Session") %>' WrapperCssClass="rdfInput" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="IsMidtermLabel2" runat="server" AssociatedControlID="IsMidtermCheckBox" CssClass="rdfLabel" Text="IsMidterm"></asp:Label>
                        <asp:CheckBox ID="IsMidtermCheckBox" runat="server" Checked='<%# Bind("IsMidterm") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="MidStartLabel2" runat="server" AssociatedControlID="MidStartTextBox" CssClass="rdfLabel" Text="MidStart"></asp:Label>
                        <telerik:RadDateTimePicker ID="MidStartTextBox" runat="server" CssClass="rdfPicker" DbSelectedDate='<%# Bind("MidStart") %>' MinDate="<%#new DateTime(1900, 1, 1) %>" RenderMode="Lightweight" SharedCalendarID='<%# Container.OwnerDataForm.FindControl("rdfSharedCalendar").UniqueID %>' SharedTimeViewID='<%# Container.OwnerDataForm.FindControl("rdfSharedTimeView").UniqueID %>' Skin="<%#Container.OwnerDataForm.Skin %>" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="MidEndLabel2" runat="server" AssociatedControlID="MidEndTextBox" CssClass="rdfLabel" Text="MidEnd"></asp:Label>
                        <telerik:RadDateTimePicker ID="MidEndTextBox" runat="server" CssClass="rdfPicker" DbSelectedDate='<%# Bind("MidEnd") %>' MinDate="<%#new DateTime(1900, 1, 1) %>" RenderMode="Lightweight" SharedCalendarID='<%# Container.OwnerDataForm.FindControl("rdfSharedCalendar").UniqueID %>' SharedTimeViewID='<%# Container.OwnerDataForm.FindControl("rdfSharedTimeView").UniqueID %>' Skin="<%#Container.OwnerDataForm.Skin %>" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="MidNameLLabel2" runat="server" AssociatedControlID="MidNameLTextBox" CssClass="rdfLabel" Text="MidNameL"></asp:Label>
                        <telerik:RadTextBox ID="MidNameLTextBox" runat="server" RenderMode="Lightweight" Text='<%# Bind("MidNameL") %>' WrapperCssClass="rdfInput" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="MidFolderLLabel2" runat="server" AssociatedControlID="MidFolderLTextBox" CssClass="rdfLabel" Text="MidFolderL"></asp:Label>
                        <telerik:RadTextBox ID="MidFolderLTextBox" runat="server" RenderMode="Lightweight" Text='<%# Bind("MidFolderL") %>' WrapperCssClass="rdfInput" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="MidNameRLabel2" runat="server" AssociatedControlID="MidNameRTextBox" CssClass="rdfLabel" Text="MidNameR"></asp:Label>
                        <telerik:RadTextBox ID="MidNameRTextBox" runat="server" RenderMode="Lightweight" Text='<%# Bind("MidNameR") %>' WrapperCssClass="rdfInput" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="MidFolderRLabel2" runat="server" AssociatedControlID="MidFolderRTextBox" CssClass="rdfLabel" Text="MidFolderR"></asp:Label>
                        <telerik:RadTextBox ID="MidFolderRTextBox" runat="server" RenderMode="Lightweight" Text='<%# Bind("MidFolderR") %>' WrapperCssClass="rdfInput" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="MidTimeLabel2" runat="server" AssociatedControlID="MidTimeTextBox" CssClass="rdfLabel" Text="MidTime"></asp:Label>
                        <telerik:RadNumericTextBox ID="MidTimeTextBox" runat="server" DataType="Int32" DbValue='<%# Bind("MidTime") %>' NumberFormat-DecimalDigits="0" RenderMode="Lightweight" Skin="<%#Container.OwnerDataForm.Skin %>" WrapperCssClass="rdfInput" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="MidPaperLabel2" runat="server" AssociatedControlID="MidPaperCheckBox" CssClass="rdfLabel" Text="MidPaper"></asp:Label>
                        <asp:CheckBox ID="MidPaperCheckBox" runat="server" Checked='<%# Bind("MidPaper") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="MidCalculatorLabel2" runat="server" AssociatedControlID="MidCalculatorCheckBox" CssClass="rdfLabel" Text="MidCalculator"></asp:Label>
                        <asp:CheckBox ID="MidCalculatorCheckBox" runat="server" Checked='<%# Bind("MidCalculator") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="MidGraphLabel2" runat="server" AssociatedControlID="MidGraphCheckBox" CssClass="rdfLabel" Text="MidGraph"></asp:Label>
                        <asp:CheckBox ID="MidGraphCheckBox" runat="server" Checked='<%# Bind("MidGraph") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="MidNotesLabel2" runat="server" AssociatedControlID="MidNotesTextBox" CssClass="rdfLabel" Text="MidNotes"></asp:Label>
                        <telerik:RadTextBox ID="MidNotesTextBox" runat="server" RenderMode="Lightweight" Text='<%# Bind("MidNotes") %>' WrapperCssClass="rdfInput" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="IsFinalLabel2" runat="server" AssociatedControlID="IsFinalCheckBox" CssClass="rdfLabel" Text="IsFinal"></asp:Label>
                        <asp:CheckBox ID="IsFinalCheckBox" runat="server" Checked='<%# Bind("IsFinal") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="FinalStartLabel2" runat="server" AssociatedControlID="FinalStartTextBox" CssClass="rdfLabel" Text="FinalStart"></asp:Label>
                        <telerik:RadDateTimePicker ID="FinalStartTextBox" runat="server" CssClass="rdfPicker" DbSelectedDate='<%# Bind("FinalStart") %>' MinDate="<%#new DateTime(1900, 1, 1) %>" RenderMode="Lightweight" SharedCalendarID='<%# Container.OwnerDataForm.FindControl("rdfSharedCalendar").UniqueID %>' SharedTimeViewID='<%# Container.OwnerDataForm.FindControl("rdfSharedTimeView").UniqueID %>' Skin="<%#Container.OwnerDataForm.Skin %>" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="FinalEndLabel2" runat="server" AssociatedControlID="FinalEndTextBox" CssClass="rdfLabel" Text="FinalEnd"></asp:Label>
                        <telerik:RadDateTimePicker ID="FinalEndTextBox" runat="server" CssClass="rdfPicker" DbSelectedDate='<%# Bind("FinalEnd") %>' MinDate="<%#new DateTime(1900, 1, 1) %>" RenderMode="Lightweight" SharedCalendarID='<%# Container.OwnerDataForm.FindControl("rdfSharedCalendar").UniqueID %>' SharedTimeViewID='<%# Container.OwnerDataForm.FindControl("rdfSharedTimeView").UniqueID %>' Skin="<%#Container.OwnerDataForm.Skin %>" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="FinalNameLLabel2" runat="server" AssociatedControlID="FinalNameLTextBox" CssClass="rdfLabel" Text="FinalNameL"></asp:Label>
                        <telerik:RadTextBox ID="FinalNameLTextBox" runat="server" RenderMode="Lightweight" Text='<%# Bind("FinalNameL") %>' WrapperCssClass="rdfInput" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="FinalFolderLLabel2" runat="server" AssociatedControlID="FinalFolderLTextBox" CssClass="rdfLabel" Text="FinalFolderL"></asp:Label>
                        <telerik:RadTextBox ID="FinalFolderLTextBox" runat="server" RenderMode="Lightweight" Text='<%# Bind("FinalFolderL") %>' WrapperCssClass="rdfInput" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="FinalNameRLabel2" runat="server" AssociatedControlID="FinalNameRTextBox" CssClass="rdfLabel" Text="FinalNameR"></asp:Label>
                        <telerik:RadTextBox ID="FinalNameRTextBox" runat="server" RenderMode="Lightweight" Text='<%# Bind("FinalNameR") %>' WrapperCssClass="rdfInput" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="FinalFolderRLabel2" runat="server" AssociatedControlID="FinalFolderRTextBox" CssClass="rdfLabel" Text="FinalFolderR"></asp:Label>
                        <telerik:RadTextBox ID="FinalFolderRTextBox" runat="server" RenderMode="Lightweight" Text='<%# Bind("FinalFolderR") %>' WrapperCssClass="rdfInput" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="FinalTimeLabel2" runat="server" AssociatedControlID="FinalTimeTextBox" CssClass="rdfLabel" Text="FinalTime"></asp:Label>
                        <telerik:RadNumericTextBox ID="FinalTimeTextBox" runat="server" DataType="Int32" DbValue='<%# Bind("FinalTime") %>' NumberFormat-DecimalDigits="0" RenderMode="Lightweight" Skin="<%#Container.OwnerDataForm.Skin %>" WrapperCssClass="rdfInput" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="FinalPaperLabel2" runat="server" AssociatedControlID="FinalPaperCheckBox" CssClass="rdfLabel" Text="FinalPaper"></asp:Label>
                        <asp:CheckBox ID="FinalPaperCheckBox" runat="server" Checked='<%# Bind("FinalPaper") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="FinalCalculatorLabel2" runat="server" AssociatedControlID="FinalCalculatorCheckBox" CssClass="rdfLabel" Text="FinalCalculator"></asp:Label>
                        <asp:CheckBox ID="FinalCalculatorCheckBox" runat="server" Checked='<%# Bind("FinalCalculator") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="FinalGraphLabel2" runat="server" AssociatedControlID="FinalGraphCheckBox" CssClass="rdfLabel" Text="FinalGraph"></asp:Label>
                        <asp:CheckBox ID="FinalGraphCheckBox" runat="server" Checked='<%# Bind("FinalGraph") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="FinalNotesLabel2" runat="server" AssociatedControlID="FinalNotesTextBox" CssClass="rdfLabel" Text="FinalNotes"></asp:Label>
                        <telerik:RadTextBox ID="FinalNotesTextBox" runat="server" RenderMode="Lightweight" Text='<%# Bind("FinalNotes") %>' WrapperCssClass="rdfInput" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="InstCommentsLabel2" runat="server" AssociatedControlID="InstCommentsTextBox" CssClass="rdfLabel" Text="InstComments"></asp:Label>
                        <telerik:RadTextBox ID="InstCommentsTextBox" runat="server" RenderMode="Lightweight" Text='<%# Bind("InstComments") %>' WrapperCssClass="rdfInput" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="AccessLabel2" runat="server" AssociatedControlID="AccessCheckBox" CssClass="rdfLabel" Text="Access"></asp:Label>
                        <asp:CheckBox ID="AccessCheckBox" runat="server" Checked='<%# Bind("Access") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="SignoffLabel2" runat="server" AssociatedControlID="SignoffCheckBox" CssClass="rdfLabel" Text="Signoff"></asp:Label>
                        <asp:CheckBox ID="SignoffCheckBox" runat="server" Checked='<%# Bind("Signoff") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="SignoffDateLabel2" runat="server" AssociatedControlID="SignoffDateTextBox" CssClass="rdfLabel" Text="SignoffDate"></asp:Label>
                        <telerik:RadDateTimePicker ID="SignoffDateTextBox" runat="server" CssClass="rdfPicker" DbSelectedDate='<%# Bind("SignoffDate") %>' MinDate="<%#new DateTime(1900, 1, 1) %>" RenderMode="Lightweight" SharedCalendarID='<%# Container.OwnerDataForm.FindControl("rdfSharedCalendar").UniqueID %>' SharedTimeViewID='<%# Container.OwnerDataForm.FindControl("rdfSharedTimeView").UniqueID %>' Skin="<%#Container.OwnerDataForm.Skin %>" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="VCSignoffLabel2" runat="server" AssociatedControlID="VCSignoffCheckBox" CssClass="rdfLabel" Text="VCSignoff"></asp:Label>
                        <asp:CheckBox ID="VCSignoffCheckBox" runat="server" Checked='<%# Bind("VCSignoff") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="VCSignoffDateLabel2" runat="server" AssociatedControlID="VCSignoffDateTextBox" CssClass="rdfLabel" Text="VCSignoffDate"></asp:Label>
                        <telerik:RadDateTimePicker ID="VCSignoffDateTextBox" runat="server" CssClass="rdfPicker" DbSelectedDate='<%# Bind("VCSignoffDate") %>' MinDate="<%#new DateTime(1900, 1, 1) %>" RenderMode="Lightweight" SharedCalendarID='<%# Container.OwnerDataForm.FindControl("rdfSharedCalendar").UniqueID %>' SharedTimeViewID='<%# Container.OwnerDataForm.FindControl("rdfSharedTimeView").UniqueID %>' Skin="<%#Container.OwnerDataForm.Skin %>" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="VCNotesLabel2" runat="server" AssociatedControlID="VCNotesTextBox" CssClass="rdfLabel" Text="VCNotes"></asp:Label>
                        <telerik:RadTextBox ID="VCNotesTextBox" runat="server" RenderMode="Lightweight" Text='<%# Bind("VCNotes") %>' WrapperCssClass="rdfInput" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="MidProctorXLabel2" runat="server" AssociatedControlID="MidProctorXCheckBox" CssClass="rdfLabel" Text="MidProctorX"></asp:Label>
                        <asp:CheckBox ID="MidProctorXCheckBox" runat="server" Checked='<%# Bind("MidProctorX") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="FinalProctorXLabel2" runat="server" AssociatedControlID="FinalProctorXCheckBox" CssClass="rdfLabel" Text="FinalProctorX"></asp:Label>
                        <asp:CheckBox ID="FinalProctorXCheckBox" runat="server" Checked='<%# Bind("FinalProctorX") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="UseDefaultLabel2" runat="server" AssociatedControlID="UseDefaultCheckBox" CssClass="rdfLabel" Text="UseDefault"></asp:Label>
                        <asp:CheckBox ID="UseDefaultCheckBox" runat="server" Checked='<%# Bind("UseDefault") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="MidWindowLabel2" runat="server" AssociatedControlID="MidWindowTextBox" CssClass="rdfLabel" Text="MidWindow"></asp:Label>
                        <telerik:RadTextBox ID="MidWindowTextBox" runat="server" RenderMode="Lightweight" Text='<%# Bind("MidWindow") %>' WrapperCssClass="rdfInput" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="FinalWindowLabel2" runat="server" AssociatedControlID="FinalWindowTextBox" CssClass="rdfLabel" Text="FinalWindow"></asp:Label>
                        <telerik:RadTextBox ID="FinalWindowTextBox" runat="server" RenderMode="Lightweight" Text='<%# Bind("FinalWindow") %>' WrapperCssClass="rdfInput" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="LockdownLabel2" runat="server" AssociatedControlID="LockdownCheckBox" CssClass="rdfLabel" Text="Lockdown"></asp:Label>
                        <asp:CheckBox ID="LockdownCheckBox" runat="server" Checked='<%# Bind("Lockdown") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="LockdownMidLabel2" runat="server" AssociatedControlID="LockdownMidCheckBox" CssClass="rdfLabel" Text="LockdownMid"></asp:Label>
                        <asp:CheckBox ID="LockdownMidCheckBox" runat="server" Checked='<%# Bind("LockdownMid") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="LockdownFinalLabel2" runat="server" AssociatedControlID="LockdownFinalCheckBox" CssClass="rdfLabel" Text="LockdownFinal"></asp:Label>
                        <asp:CheckBox ID="LockdownFinalCheckBox" runat="server" Checked='<%# Bind("LockdownFinal") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="Mid_ManualLabel2" runat="server" AssociatedControlID="Mid_ManualCheckBox" CssClass="rdfLabel" Text="Mid_Manual"></asp:Label>
                        <asp:CheckBox ID="Mid_ManualCheckBox" runat="server" Checked='<%# Bind("Mid_Manual") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="Final_ManualLabel2" runat="server" AssociatedControlID="Final_ManualCheckBox" CssClass="rdfLabel" Text="Final_Manual"></asp:Label>
                        <asp:CheckBox ID="Final_ManualCheckBox" runat="server" Checked='<%# Bind("Final_Manual") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="HeadphonesLabel2" runat="server" AssociatedControlID="HeadphonesCheckBox" CssClass="rdfLabel" Text="Headphones"></asp:Label>
                        <asp:CheckBox ID="HeadphonesCheckBox" runat="server" Checked='<%# Bind("Headphones") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="EssayLabel2" runat="server" AssociatedControlID="EssayCheckBox" CssClass="rdfLabel" Text="Essay"></asp:Label>
                        <asp:CheckBox ID="EssayCheckBox" runat="server" Checked='<%# Bind("Essay") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="FinalEssayLabel2" runat="server" AssociatedControlID="FinalEssayCheckBox" CssClass="rdfLabel" Text="FinalEssay"></asp:Label>
                        <asp:CheckBox ID="FinalEssayCheckBox" runat="server" Checked='<%# Bind("FinalEssay") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="FinalHeadphonesLabel2" runat="server" AssociatedControlID="FinalHeadphonesCheckBox" CssClass="rdfLabel" Text="FinalHeadphones"></asp:Label>
                        <asp:CheckBox ID="FinalHeadphonesCheckBox" runat="server" Checked='<%# Bind("FinalHeadphones") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="PM_ANXMTRLabel2" runat="server" AssociatedControlID="PM_ANXMTRTextBox" CssClass="rdfLabel" Text="PM_ANXMTR"></asp:Label>
                        <telerik:RadTextBox ID="PM_ANXMTRTextBox" runat="server" RenderMode="Lightweight" Text='<%# Bind("PM_ANXMTR") %>' WrapperCssClass="rdfInput" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="PF_ANXMTRLabel2" runat="server" AssociatedControlID="PF_ANXMTRTextBox" CssClass="rdfLabel" Text="PF_ANXMTR"></asp:Label>
                        <telerik:RadTextBox ID="PF_ANXMTRTextBox" runat="server" RenderMode="Lightweight" Text='<%# Bind("PF_ANXMTR") %>' WrapperCssClass="rdfInput" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="MidVerifiedLabel2" runat="server" AssociatedControlID="MidVerifiedCheckBox" CssClass="rdfLabel" Text="MidVerified"></asp:Label>
                        <asp:CheckBox ID="MidVerifiedCheckBox" runat="server" Checked='<%# Bind("MidVerified") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="FinalVerifiedLabel2" runat="server" AssociatedControlID="FinalVerifiedCheckBox" CssClass="rdfLabel" Text="FinalVerified"></asp:Label>
                        <asp:CheckBox ID="FinalVerifiedCheckBox" runat="server" Checked='<%# Bind("FinalVerified") %>' />
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
                        <asp:Label ID="FamilyStringLabel2" runat="server" AssociatedControlID="FamilyStringTextBox" CssClass="rdfLabel" Text="FamilyString"></asp:Label>
                        <telerik:RadTextBox ID="FamilyStringTextBox" runat="server" RenderMode="Lightweight" Text='<%# Bind("FamilyString") %>' WrapperCssClass="rdfInput" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="ParentLabel2" runat="server" AssociatedControlID="ParentTextBox" CssClass="rdfLabel" Text="Parent"></asp:Label>
                        <telerik:RadTextBox ID="ParentTextBox" runat="server" RenderMode="Lightweight" Text='<%# Bind("Parent") %>' WrapperCssClass="rdfInput" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="CourseLabel2" runat="server" AssociatedControlID="CourseTextBox" CssClass="rdfLabel" Text="Course"></asp:Label>
                        <telerik:RadTextBox ID="CourseTextBox" runat="server" RenderMode="Lightweight" Text='<%# Bind("Course") %>' WrapperCssClass="rdfInput" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="InstructorLabel2" runat="server" AssociatedControlID="InstructorTextBox" CssClass="rdfLabel" Text="Instructor"></asp:Label>
                        <telerik:RadTextBox ID="InstructorTextBox" runat="server" RenderMode="Lightweight" Text='<%# Bind("Instructor") %>' WrapperCssClass="rdfInput" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="OutlookLabel2" runat="server" AssociatedControlID="OutlookTextBox" CssClass="rdfLabel" Text="Outlook"></asp:Label>
                        <telerik:RadTextBox ID="OutlookTextBox" runat="server" RenderMode="Lightweight" Text='<%# Bind("Outlook") %>' WrapperCssClass="rdfInput" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="CanChangeLabel2" runat="server" AssociatedControlID="CanChangeCheckBox" CssClass="rdfLabel" Text="CanChange"></asp:Label>
                        <asp:CheckBox ID="CanChangeCheckBox" runat="server" Checked='<%# Bind("CanChange") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="SessionLabel2" runat="server" AssociatedControlID="SessionTextBox" CssClass="rdfLabel" Text="Session"></asp:Label>
                        <telerik:RadTextBox ID="SessionTextBox" runat="server" RenderMode="Lightweight" Text='<%# Bind("Session") %>' WrapperCssClass="rdfInput" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="IsMidtermLabel2" runat="server" AssociatedControlID="IsMidtermCheckBox" CssClass="rdfLabel" Text="IsMidterm"></asp:Label>
                        <asp:CheckBox ID="IsMidtermCheckBox" runat="server" Checked='<%# Bind("IsMidterm") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="MidStartLabel2" runat="server" AssociatedControlID="MidStartTextBox" CssClass="rdfLabel" Text="MidStart"></asp:Label>
                        <telerik:RadDateTimePicker ID="MidStartTextBox" runat="server" CssClass="rdfPicker" DbSelectedDate='<%# Bind("MidStart") %>' MinDate="<%#new DateTime(1900, 1, 1) %>" RenderMode="Lightweight" SharedCalendarID='<%# Container.OwnerDataForm.FindControl("rdfSharedCalendar").UniqueID %>' SharedTimeViewID='<%# Container.OwnerDataForm.FindControl("rdfSharedTimeView").UniqueID %>' Skin="<%#Container.OwnerDataForm.Skin %>" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="MidEndLabel2" runat="server" AssociatedControlID="MidEndTextBox" CssClass="rdfLabel" Text="MidEnd"></asp:Label>
                        <telerik:RadDateTimePicker ID="MidEndTextBox" runat="server" CssClass="rdfPicker" DbSelectedDate='<%# Bind("MidEnd") %>' MinDate="<%#new DateTime(1900, 1, 1) %>" RenderMode="Lightweight" SharedCalendarID='<%# Container.OwnerDataForm.FindControl("rdfSharedCalendar").UniqueID %>' SharedTimeViewID='<%# Container.OwnerDataForm.FindControl("rdfSharedTimeView").UniqueID %>' Skin="<%#Container.OwnerDataForm.Skin %>" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="MidNameLLabel2" runat="server" AssociatedControlID="MidNameLTextBox" CssClass="rdfLabel" Text="MidNameL"></asp:Label>
                        <telerik:RadTextBox ID="MidNameLTextBox" runat="server" RenderMode="Lightweight" Text='<%# Bind("MidNameL") %>' WrapperCssClass="rdfInput" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="MidFolderLLabel2" runat="server" AssociatedControlID="MidFolderLTextBox" CssClass="rdfLabel" Text="MidFolderL"></asp:Label>
                        <telerik:RadTextBox ID="MidFolderLTextBox" runat="server" RenderMode="Lightweight" Text='<%# Bind("MidFolderL") %>' WrapperCssClass="rdfInput" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="MidNameRLabel2" runat="server" AssociatedControlID="MidNameRTextBox" CssClass="rdfLabel" Text="MidNameR"></asp:Label>
                        <telerik:RadTextBox ID="MidNameRTextBox" runat="server" RenderMode="Lightweight" Text='<%# Bind("MidNameR") %>' WrapperCssClass="rdfInput" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="MidFolderRLabel2" runat="server" AssociatedControlID="MidFolderRTextBox" CssClass="rdfLabel" Text="MidFolderR"></asp:Label>
                        <telerik:RadTextBox ID="MidFolderRTextBox" runat="server" RenderMode="Lightweight" Text='<%# Bind("MidFolderR") %>' WrapperCssClass="rdfInput" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="MidTimeLabel2" runat="server" AssociatedControlID="MidTimeTextBox" CssClass="rdfLabel" Text="MidTime"></asp:Label>
                        <telerik:RadNumericTextBox ID="MidTimeTextBox" runat="server" DataType="Int32" DbValue='<%# Bind("MidTime") %>' NumberFormat-DecimalDigits="0" RenderMode="Lightweight" Skin="<%#Container.OwnerDataForm.Skin %>" WrapperCssClass="rdfInput" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="MidPaperLabel2" runat="server" AssociatedControlID="MidPaperCheckBox" CssClass="rdfLabel" Text="MidPaper"></asp:Label>
                        <asp:CheckBox ID="MidPaperCheckBox" runat="server" Checked='<%# Bind("MidPaper") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="MidCalculatorLabel2" runat="server" AssociatedControlID="MidCalculatorCheckBox" CssClass="rdfLabel" Text="MidCalculator"></asp:Label>
                        <asp:CheckBox ID="MidCalculatorCheckBox" runat="server" Checked='<%# Bind("MidCalculator") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="MidGraphLabel2" runat="server" AssociatedControlID="MidGraphCheckBox" CssClass="rdfLabel" Text="MidGraph"></asp:Label>
                        <asp:CheckBox ID="MidGraphCheckBox" runat="server" Checked='<%# Bind("MidGraph") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="MidNotesLabel2" runat="server" AssociatedControlID="MidNotesTextBox" CssClass="rdfLabel" Text="MidNotes"></asp:Label>
                        <telerik:RadTextBox ID="MidNotesTextBox" runat="server" RenderMode="Lightweight" Text='<%# Bind("MidNotes") %>' WrapperCssClass="rdfInput" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="IsFinalLabel2" runat="server" AssociatedControlID="IsFinalCheckBox" CssClass="rdfLabel" Text="IsFinal"></asp:Label>
                        <asp:CheckBox ID="IsFinalCheckBox" runat="server" Checked='<%# Bind("IsFinal") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="FinalStartLabel2" runat="server" AssociatedControlID="FinalStartTextBox" CssClass="rdfLabel" Text="FinalStart"></asp:Label>
                        <telerik:RadDateTimePicker ID="FinalStartTextBox" runat="server" CssClass="rdfPicker" DbSelectedDate='<%# Bind("FinalStart") %>' MinDate="<%#new DateTime(1900, 1, 1) %>" RenderMode="Lightweight" SharedCalendarID='<%# Container.OwnerDataForm.FindControl("rdfSharedCalendar").UniqueID %>' SharedTimeViewID='<%# Container.OwnerDataForm.FindControl("rdfSharedTimeView").UniqueID %>' Skin="<%#Container.OwnerDataForm.Skin %>" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="FinalEndLabel2" runat="server" AssociatedControlID="FinalEndTextBox" CssClass="rdfLabel" Text="FinalEnd"></asp:Label>
                        <telerik:RadDateTimePicker ID="FinalEndTextBox" runat="server" CssClass="rdfPicker" DbSelectedDate='<%# Bind("FinalEnd") %>' MinDate="<%#new DateTime(1900, 1, 1) %>" RenderMode="Lightweight" SharedCalendarID='<%# Container.OwnerDataForm.FindControl("rdfSharedCalendar").UniqueID %>' SharedTimeViewID='<%# Container.OwnerDataForm.FindControl("rdfSharedTimeView").UniqueID %>' Skin="<%#Container.OwnerDataForm.Skin %>" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="FinalNameLLabel2" runat="server" AssociatedControlID="FinalNameLTextBox" CssClass="rdfLabel" Text="FinalNameL"></asp:Label>
                        <telerik:RadTextBox ID="FinalNameLTextBox" runat="server" RenderMode="Lightweight" Text='<%# Bind("FinalNameL") %>' WrapperCssClass="rdfInput" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="FinalFolderLLabel2" runat="server" AssociatedControlID="FinalFolderLTextBox" CssClass="rdfLabel" Text="FinalFolderL"></asp:Label>
                        <telerik:RadTextBox ID="FinalFolderLTextBox" runat="server" RenderMode="Lightweight" Text='<%# Bind("FinalFolderL") %>' WrapperCssClass="rdfInput" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="FinalNameRLabel2" runat="server" AssociatedControlID="FinalNameRTextBox" CssClass="rdfLabel" Text="FinalNameR"></asp:Label>
                        <telerik:RadTextBox ID="FinalNameRTextBox" runat="server" RenderMode="Lightweight" Text='<%# Bind("FinalNameR") %>' WrapperCssClass="rdfInput" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="FinalFolderRLabel2" runat="server" AssociatedControlID="FinalFolderRTextBox" CssClass="rdfLabel" Text="FinalFolderR"></asp:Label>
                        <telerik:RadTextBox ID="FinalFolderRTextBox" runat="server" RenderMode="Lightweight" Text='<%# Bind("FinalFolderR") %>' WrapperCssClass="rdfInput" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="FinalTimeLabel2" runat="server" AssociatedControlID="FinalTimeTextBox" CssClass="rdfLabel" Text="FinalTime"></asp:Label>
                        <telerik:RadNumericTextBox ID="FinalTimeTextBox" runat="server" DataType="Int32" DbValue='<%# Bind("FinalTime") %>' NumberFormat-DecimalDigits="0" RenderMode="Lightweight" Skin="<%#Container.OwnerDataForm.Skin %>" WrapperCssClass="rdfInput" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="FinalPaperLabel2" runat="server" AssociatedControlID="FinalPaperCheckBox" CssClass="rdfLabel" Text="FinalPaper"></asp:Label>
                        <asp:CheckBox ID="FinalPaperCheckBox" runat="server" Checked='<%# Bind("FinalPaper") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="FinalCalculatorLabel2" runat="server" AssociatedControlID="FinalCalculatorCheckBox" CssClass="rdfLabel" Text="FinalCalculator"></asp:Label>
                        <asp:CheckBox ID="FinalCalculatorCheckBox" runat="server" Checked='<%# Bind("FinalCalculator") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="FinalGraphLabel2" runat="server" AssociatedControlID="FinalGraphCheckBox" CssClass="rdfLabel" Text="FinalGraph"></asp:Label>
                        <asp:CheckBox ID="FinalGraphCheckBox" runat="server" Checked='<%# Bind("FinalGraph") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="FinalNotesLabel2" runat="server" AssociatedControlID="FinalNotesTextBox" CssClass="rdfLabel" Text="FinalNotes"></asp:Label>
                        <telerik:RadTextBox ID="FinalNotesTextBox" runat="server" RenderMode="Lightweight" Text='<%# Bind("FinalNotes") %>' WrapperCssClass="rdfInput" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="InstCommentsLabel2" runat="server" AssociatedControlID="InstCommentsTextBox" CssClass="rdfLabel" Text="InstComments"></asp:Label>
                        <telerik:RadTextBox ID="InstCommentsTextBox" runat="server" RenderMode="Lightweight" Text='<%# Bind("InstComments") %>' WrapperCssClass="rdfInput" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="AccessLabel2" runat="server" AssociatedControlID="AccessCheckBox" CssClass="rdfLabel" Text="Access"></asp:Label>
                        <asp:CheckBox ID="AccessCheckBox" runat="server" Checked='<%# Bind("Access") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="SignoffLabel2" runat="server" AssociatedControlID="SignoffCheckBox" CssClass="rdfLabel" Text="Signoff"></asp:Label>
                        <asp:CheckBox ID="SignoffCheckBox" runat="server" Checked='<%# Bind("Signoff") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="SignoffDateLabel2" runat="server" AssociatedControlID="SignoffDateTextBox" CssClass="rdfLabel" Text="SignoffDate"></asp:Label>
                        <telerik:RadDateTimePicker ID="SignoffDateTextBox" runat="server" CssClass="rdfPicker" DbSelectedDate='<%# Bind("SignoffDate") %>' MinDate="<%#new DateTime(1900, 1, 1) %>" RenderMode="Lightweight" SharedCalendarID='<%# Container.OwnerDataForm.FindControl("rdfSharedCalendar").UniqueID %>' SharedTimeViewID='<%# Container.OwnerDataForm.FindControl("rdfSharedTimeView").UniqueID %>' Skin="<%#Container.OwnerDataForm.Skin %>" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="VCSignoffLabel2" runat="server" AssociatedControlID="VCSignoffCheckBox" CssClass="rdfLabel" Text="VCSignoff"></asp:Label>
                        <asp:CheckBox ID="VCSignoffCheckBox" runat="server" Checked='<%# Bind("VCSignoff") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="VCSignoffDateLabel2" runat="server" AssociatedControlID="VCSignoffDateTextBox" CssClass="rdfLabel" Text="VCSignoffDate"></asp:Label>
                        <telerik:RadDateTimePicker ID="VCSignoffDateTextBox" runat="server" CssClass="rdfPicker" DbSelectedDate='<%# Bind("VCSignoffDate") %>' MinDate="<%#new DateTime(1900, 1, 1) %>" RenderMode="Lightweight" SharedCalendarID='<%# Container.OwnerDataForm.FindControl("rdfSharedCalendar").UniqueID %>' SharedTimeViewID='<%# Container.OwnerDataForm.FindControl("rdfSharedTimeView").UniqueID %>' Skin="<%#Container.OwnerDataForm.Skin %>" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="VCNotesLabel2" runat="server" AssociatedControlID="VCNotesTextBox" CssClass="rdfLabel" Text="VCNotes"></asp:Label>
                        <telerik:RadTextBox ID="VCNotesTextBox" runat="server" RenderMode="Lightweight" Text='<%# Bind("VCNotes") %>' WrapperCssClass="rdfInput" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="MidProctorXLabel2" runat="server" AssociatedControlID="MidProctorXCheckBox" CssClass="rdfLabel" Text="MidProctorX"></asp:Label>
                        <asp:CheckBox ID="MidProctorXCheckBox" runat="server" Checked='<%# Bind("MidProctorX") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="FinalProctorXLabel2" runat="server" AssociatedControlID="FinalProctorXCheckBox" CssClass="rdfLabel" Text="FinalProctorX"></asp:Label>
                        <asp:CheckBox ID="FinalProctorXCheckBox" runat="server" Checked='<%# Bind("FinalProctorX") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="UseDefaultLabel2" runat="server" AssociatedControlID="UseDefaultCheckBox" CssClass="rdfLabel" Text="UseDefault"></asp:Label>
                        <asp:CheckBox ID="UseDefaultCheckBox" runat="server" Checked='<%# Bind("UseDefault") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="MidWindowLabel2" runat="server" AssociatedControlID="MidWindowTextBox" CssClass="rdfLabel" Text="MidWindow"></asp:Label>
                        <telerik:RadTextBox ID="MidWindowTextBox" runat="server" RenderMode="Lightweight" Text='<%# Bind("MidWindow") %>' WrapperCssClass="rdfInput" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="FinalWindowLabel2" runat="server" AssociatedControlID="FinalWindowTextBox" CssClass="rdfLabel" Text="FinalWindow"></asp:Label>
                        <telerik:RadTextBox ID="FinalWindowTextBox" runat="server" RenderMode="Lightweight" Text='<%# Bind("FinalWindow") %>' WrapperCssClass="rdfInput" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="LockdownLabel2" runat="server" AssociatedControlID="LockdownCheckBox" CssClass="rdfLabel" Text="Lockdown"></asp:Label>
                        <asp:CheckBox ID="LockdownCheckBox" runat="server" Checked='<%# Bind("Lockdown") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="LockdownMidLabel2" runat="server" AssociatedControlID="LockdownMidCheckBox" CssClass="rdfLabel" Text="LockdownMid"></asp:Label>
                        <asp:CheckBox ID="LockdownMidCheckBox" runat="server" Checked='<%# Bind("LockdownMid") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="LockdownFinalLabel2" runat="server" AssociatedControlID="LockdownFinalCheckBox" CssClass="rdfLabel" Text="LockdownFinal"></asp:Label>
                        <asp:CheckBox ID="LockdownFinalCheckBox" runat="server" Checked='<%# Bind("LockdownFinal") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="Mid_ManualLabel2" runat="server" AssociatedControlID="Mid_ManualCheckBox" CssClass="rdfLabel" Text="Mid_Manual"></asp:Label>
                        <asp:CheckBox ID="Mid_ManualCheckBox" runat="server" Checked='<%# Bind("Mid_Manual") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="Final_ManualLabel2" runat="server" AssociatedControlID="Final_ManualCheckBox" CssClass="rdfLabel" Text="Final_Manual"></asp:Label>
                        <asp:CheckBox ID="Final_ManualCheckBox" runat="server" Checked='<%# Bind("Final_Manual") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="HeadphonesLabel2" runat="server" AssociatedControlID="HeadphonesCheckBox" CssClass="rdfLabel" Text="Headphones"></asp:Label>
                        <asp:CheckBox ID="HeadphonesCheckBox" runat="server" Checked='<%# Bind("Headphones") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="EssayLabel2" runat="server" AssociatedControlID="EssayCheckBox" CssClass="rdfLabel" Text="Essay"></asp:Label>
                        <asp:CheckBox ID="EssayCheckBox" runat="server" Checked='<%# Bind("Essay") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="FinalEssayLabel2" runat="server" AssociatedControlID="FinalEssayCheckBox" CssClass="rdfLabel" Text="FinalEssay"></asp:Label>
                        <asp:CheckBox ID="FinalEssayCheckBox" runat="server" Checked='<%# Bind("FinalEssay") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="FinalHeadphonesLabel2" runat="server" AssociatedControlID="FinalHeadphonesCheckBox" CssClass="rdfLabel" Text="FinalHeadphones"></asp:Label>
                        <asp:CheckBox ID="FinalHeadphonesCheckBox" runat="server" Checked='<%# Bind("FinalHeadphones") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="PM_ANXMTRLabel2" runat="server" AssociatedControlID="PM_ANXMTRTextBox" CssClass="rdfLabel" Text="PM_ANXMTR"></asp:Label>
                        <telerik:RadTextBox ID="PM_ANXMTRTextBox" runat="server" RenderMode="Lightweight" Text='<%# Bind("PM_ANXMTR") %>' WrapperCssClass="rdfInput" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="PF_ANXMTRLabel2" runat="server" AssociatedControlID="PF_ANXMTRTextBox" CssClass="rdfLabel" Text="PF_ANXMTR"></asp:Label>
                        <telerik:RadTextBox ID="PF_ANXMTRTextBox" runat="server" RenderMode="Lightweight" Text='<%# Bind("PF_ANXMTR") %>' WrapperCssClass="rdfInput" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="MidVerifiedLabel2" runat="server" AssociatedControlID="MidVerifiedCheckBox" CssClass="rdfLabel" Text="MidVerified"></asp:Label>
                        <asp:CheckBox ID="MidVerifiedCheckBox" runat="server" Checked='<%# Bind("MidVerified") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="FinalVerifiedLabel2" runat="server" AssociatedControlID="FinalVerifiedCheckBox" CssClass="rdfLabel" Text="FinalVerified"></asp:Label>
                        <asp:CheckBox ID="FinalVerifiedCheckBox" runat="server" Checked='<%# Bind("FinalVerified") %>' />
                    </div>
                    <div class="rdfCommandButtons">
                        <hr class="rdfHr" />
                        <telerik:RadButton ID="PerformInsertButton" runat="server" ButtonType="SkinnedButton" CommandName="PerformInsert" RenderMode="Lightweight" Text="Insert" ToolTip="Insert" />
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
                    </td>
                <td>
                    <telerik:RadDataForm ID="RadDataForm2" runat="server" CssClass="rdfLeftAligned rdfNoFieldHint" DataKeyNames="Exam_ID" DataSourceID="SqlDataSource2" RenderMode="Lightweight">
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
                                <legend class="rdfLegend">Designer Data</legend>
                                <div class="rdfRow">
                                    <asp:Label ID="Exam_IDLabel2" runat="server" CssClass="rdfLabel" Text="Exam_ID"></asp:Label>
                                    <asp:Label ID="Exam_IDLabel1" runat="server" CssClass="rdfFieldValue" Text='<%# Eval("Exam_ID") %>' />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="MasterNameLabel2" runat="server" CssClass="rdfLabel" Text="MasterName"></asp:Label>
                                    <asp:Label ID="MasterNameLabel1" runat="server" CssClass="rdfFieldValue" Text='<%# Eval("MasterName") %>' />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="CourseLabel2" runat="server" CssClass="rdfLabel" Text="Course"></asp:Label>
                                    <asp:Label ID="CourseLabel1" runat="server" CssClass="rdfFieldValue" Text='<%# Eval("Course") %>' />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="TermLabel2" runat="server" CssClass="rdfLabel" Text="Term"></asp:Label>
                                    <asp:Label ID="TermLabel1" runat="server" CssClass="rdfFieldValue" Text='<%# Eval("Term") %>' />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="PM_EXISTSLabel2" runat="server" AssociatedControlID="PM_EXISTSCheckBox" CssClass="rdfLabel" Text="PM_EXISTS"></asp:Label>
                                    <asp:CheckBox ID="PM_EXISTSCheckBox" runat="server" Checked='<%# Eval("PM_EXISTS") %>' Enabled="false" />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="PM_DURATIONLabel2" runat="server" CssClass="rdfLabel" Text="PM_DURATION"></asp:Label>
                                    <asp:Label ID="PM_DURATIONLabel1" runat="server" CssClass="rdfFieldValue" Text='<%# Eval("PM_DURATION") %>' />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="PM_MGLabel2" runat="server" AssociatedControlID="PM_MGCheckBox" CssClass="rdfLabel" Text="PM_MG"></asp:Label>
                                    <asp:CheckBox ID="PM_MGCheckBox" runat="server" Checked='<%# Eval("PM_MG") %>' Enabled="false" />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="PM_MG_FBLabel2" runat="server" AssociatedControlID="PM_MG_FBCheckBox" CssClass="rdfLabel" Text="PM_MG_FB"></asp:Label>
                                    <asp:CheckBox ID="PM_MG_FBCheckBox" runat="server" Checked='<%# Eval("PM_MG_FB") %>' Enabled="false" />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="PM_MG_ESLabel2" runat="server" AssociatedControlID="PM_MG_ESCheckBox" CssClass="rdfLabel" Text="PM_MG_ES"></asp:Label>
                                    <asp:CheckBox ID="PM_MG_ESCheckBox" runat="server" Checked='<%# Eval("PM_MG_ES") %>' Enabled="false" />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="PM_MG_SALabel2" runat="server" AssociatedControlID="PM_MG_SACheckBox" CssClass="rdfLabel" Text="PM_MG_SA"></asp:Label>
                                    <asp:CheckBox ID="PM_MG_SACheckBox" runat="server" Checked='<%# Eval("PM_MG_SA") %>' Enabled="false" />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="PM_MG_OTHERLabel2" runat="server" CssClass="rdfLabel" Text="PM_MG_OTHER"></asp:Label>
                                    <asp:Label ID="PM_MG_OTHERLabel1" runat="server" CssClass="rdfFieldValue" Text='<%# Eval("PM_MG_OTHER") %>' />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="PM_REQ_ANXLabel2" runat="server" AssociatedControlID="PM_REQ_ANXCheckBox" CssClass="rdfLabel" Text="PM_REQ_ANX"></asp:Label>
                                    <asp:CheckBox ID="PM_REQ_ANXCheckBox" runat="server" Checked='<%# Eval("PM_REQ_ANX") %>' Enabled="false" />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="PM_LIST_MTRLS_OPT1Label2" runat="server" AssociatedControlID="PM_LIST_MTRLS_OPT1CheckBox" CssClass="rdfLabel" Text="PM_LIST_MTRLS_OPT1"></asp:Label>
                                    <asp:CheckBox ID="PM_LIST_MTRLS_OPT1CheckBox" runat="server" Checked='<%# Eval("PM_LIST_MTRLS_OPT1") %>' Enabled="false" />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="PM_LIST_MTRLS_OPT2Label2" runat="server" AssociatedControlID="PM_LIST_MTRLS_OPT2CheckBox" CssClass="rdfLabel" Text="PM_LIST_MTRLS_OPT2"></asp:Label>
                                    <asp:CheckBox ID="PM_LIST_MTRLS_OPT2CheckBox" runat="server" Checked='<%# Eval("PM_LIST_MTRLS_OPT2") %>' Enabled="false" />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="PM_LIST_MTRLS_OPT3Label2" runat="server" AssociatedControlID="PM_LIST_MTRLS_OPT3CheckBox" CssClass="rdfLabel" Text="PM_LIST_MTRLS_OPT3"></asp:Label>
                                    <asp:CheckBox ID="PM_LIST_MTRLS_OPT3CheckBox" runat="server" Checked='<%# Eval("PM_LIST_MTRLS_OPT3") %>' Enabled="false" />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="PM_LIST_ANXMTRLSLabel2" runat="server" CssClass="rdfLabel" Text="PM_LIST_ANXMTRLS"></asp:Label>
                                    <asp:Label ID="PM_LIST_ANXMTRLSLabel1" runat="server" CssClass="rdfFieldValue" Text='<%# Eval("PM_LIST_ANXMTRLS") %>' />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="PM_LCL_NAMELabel2" runat="server" CssClass="rdfLabel" Text="PM_LCL_NAME"></asp:Label>
                                    <asp:Label ID="PM_LCL_NAMELabel1" runat="server" CssClass="rdfFieldValue" Text='<%# Eval("PM_LCL_NAME") %>' />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="PM_RMT_NAMELabel2" runat="server" CssClass="rdfLabel" Text="PM_RMT_NAME"></asp:Label>
                                    <asp:Label ID="PM_RMT_NAMELabel1" runat="server" CssClass="rdfFieldValue" Text='<%# Eval("PM_RMT_NAME") %>' />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="PM_WEIGHTLabel2" runat="server" CssClass="rdfLabel" Text="PM_WEIGHT"></asp:Label>
                                    <asp:Label ID="PM_WEIGHTLabel1" runat="server" CssClass="rdfFieldValue" Text='<%# Eval("PM_WEIGHT") %>' />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="PF_EXISTSLabel2" runat="server" AssociatedControlID="PF_EXISTSCheckBox" CssClass="rdfLabel" Text="PF_EXISTS"></asp:Label>
                                    <asp:CheckBox ID="PF_EXISTSCheckBox" runat="server" Checked='<%# Eval("PF_EXISTS") %>' Enabled="false" />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="PF_DURATIONLabel2" runat="server" CssClass="rdfLabel" Text="PF_DURATION"></asp:Label>
                                    <asp:Label ID="PF_DURATIONLabel1" runat="server" CssClass="rdfFieldValue" Text='<%# Eval("PF_DURATION") %>' />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="PF_MGLabel2" runat="server" AssociatedControlID="PF_MGCheckBox" CssClass="rdfLabel" Text="PF_MG"></asp:Label>
                                    <asp:CheckBox ID="PF_MGCheckBox" runat="server" Checked='<%# Eval("PF_MG") %>' Enabled="false" />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="PF_MG_FBLabel2" runat="server" AssociatedControlID="PF_MG_FBCheckBox" CssClass="rdfLabel" Text="PF_MG_FB"></asp:Label>
                                    <asp:CheckBox ID="PF_MG_FBCheckBox" runat="server" Checked='<%# Eval("PF_MG_FB") %>' Enabled="false" />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="PF_MG_ESLabel2" runat="server" AssociatedControlID="PF_MG_ESCheckBox" CssClass="rdfLabel" Text="PF_MG_ES"></asp:Label>
                                    <asp:CheckBox ID="PF_MG_ESCheckBox" runat="server" Checked='<%# Eval("PF_MG_ES") %>' Enabled="false" />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="PF_MG_SALabel2" runat="server" AssociatedControlID="PF_MG_SACheckBox" CssClass="rdfLabel" Text="PF_MG_SA"></asp:Label>
                                    <asp:CheckBox ID="PF_MG_SACheckBox" runat="server" Checked='<%# Eval("PF_MG_SA") %>' Enabled="false" />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="PF_MG_OTHERLabel2" runat="server" CssClass="rdfLabel" Text="PF_MG_OTHER"></asp:Label>
                                    <asp:Label ID="PF_MG_OTHERLabel1" runat="server" CssClass="rdfFieldValue" Text='<%# Eval("PF_MG_OTHER") %>' />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="PF_REQ_ANXLabel2" runat="server" AssociatedControlID="PF_REQ_ANXCheckBox" CssClass="rdfLabel" Text="PF_REQ_ANX"></asp:Label>
                                    <asp:CheckBox ID="PF_REQ_ANXCheckBox" runat="server" Checked='<%# Eval("PF_REQ_ANX") %>' Enabled="false" />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="PF_LIST_MTRLS_OPT1Label2" runat="server" AssociatedControlID="PF_LIST_MTRLS_OPT1CheckBox" CssClass="rdfLabel" Text="PF_LIST_MTRLS_OPT1"></asp:Label>
                                    <asp:CheckBox ID="PF_LIST_MTRLS_OPT1CheckBox" runat="server" Checked='<%# Eval("PF_LIST_MTRLS_OPT1") %>' Enabled="false" />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="PF_LIST_MTRLS_OPT2Label2" runat="server" AssociatedControlID="PF_LIST_MTRLS_OPT2CheckBox" CssClass="rdfLabel" Text="PF_LIST_MTRLS_OPT2"></asp:Label>
                                    <asp:CheckBox ID="PF_LIST_MTRLS_OPT2CheckBox" runat="server" Checked='<%# Eval("PF_LIST_MTRLS_OPT2") %>' Enabled="false" />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="PF_LIST_MTRLS_OPT3Label2" runat="server" AssociatedControlID="PF_LIST_MTRLS_OPT3CheckBox" CssClass="rdfLabel" Text="PF_LIST_MTRLS_OPT3"></asp:Label>
                                    <asp:CheckBox ID="PF_LIST_MTRLS_OPT3CheckBox" runat="server" Checked='<%# Eval("PF_LIST_MTRLS_OPT3") %>' Enabled="false" />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="PF_LIST_ANXMTRLSLabel2" runat="server" CssClass="rdfLabel" Text="PF_LIST_ANXMTRLS"></asp:Label>
                                    <asp:Label ID="PF_LIST_ANXMTRLSLabel1" runat="server" CssClass="rdfFieldValue" Text='<%# Eval("PF_LIST_ANXMTRLS") %>' />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="PF_LCL_NAMELabel2" runat="server" CssClass="rdfLabel" Text="PF_LCL_NAME"></asp:Label>
                                    <asp:Label ID="PF_LCL_NAMELabel1" runat="server" CssClass="rdfFieldValue" Text='<%# Eval("PF_LCL_NAME") %>' />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="PF_RMT_NAMELabel2" runat="server" CssClass="rdfLabel" Text="PF_RMT_NAME"></asp:Label>
                                    <asp:Label ID="PF_RMT_NAMELabel1" runat="server" CssClass="rdfFieldValue" Text='<%# Eval("PF_RMT_NAME") %>' />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="PF_WEIGHTLabel2" runat="server" CssClass="rdfLabel" Text="PF_WEIGHT"></asp:Label>
                                    <asp:Label ID="PF_WEIGHTLabel1" runat="server" CssClass="rdfFieldValue" Text='<%# Eval("PF_WEIGHT") %>' />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="MLD_VerifiedLabel2" runat="server" AssociatedControlID="MLD_VerifiedCheckBox" CssClass="rdfLabel" Text="MLD_Verified"></asp:Label>
                                    <asp:CheckBox ID="MLD_VerifiedCheckBox" runat="server" Checked='<%# Eval("MLD_Verified") %>' Enabled="false" />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="FIN_VerifiedLabel2" runat="server" AssociatedControlID="FIN_VerifiedCheckBox" CssClass="rdfLabel" Text="FIN_Verified"></asp:Label>
                                    <asp:CheckBox ID="FIN_VerifiedCheckBox" runat="server" Checked='<%# Eval("FIN_Verified") %>' Enabled="false" />
                                </div>
                                <div class="rdfCommandButtons">
                                    <hr class="rdfHr" />
                                    <telerik:RadButton ID="InitInsertButton" runat="server" ButtonType="SkinnedButton" CausesValidation="False" CommandName="InitInsert" RenderMode="Lightweight" Text="Insert" ToolTip="Insert" />
                                    <telerik:RadButton ID="EditButton" runat="server" ButtonType="SkinnedButton" CausesValidation="False" CommandName="Edit" RenderMode="Lightweight" Text="Edit" ToolTip="Edit" />
                                    <telerik:RadButton ID="DeleteButton" runat="server" ButtonType="SkinnedButton" CausesValidation="False" CommandName="Delete" RenderMode="Lightweight" Text="Delete" ToolTip="Delete" />
                                </div>
                            </fieldset>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <fieldset class="rdfFieldset rdfBorders">
                                <legend class="rdfLegend">Edit</legend>
                                <div class="rdfRow">
                                    <asp:Label ID="Exam_IDLabel2" runat="server" CssClass="rdfLabel" Text="Exam_ID"></asp:Label>
                                    <asp:Label ID="Exam_IDLabel1" runat="server" CssClass="rdfFieldValue" Text='<%# Eval("Exam_ID") %>' />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="MasterNameLabel2" runat="server" AssociatedControlID="MasterNameTextBox" CssClass="rdfLabel" Text="MasterName"></asp:Label>
                                    <telerik:RadTextBox ID="MasterNameTextBox" runat="server" RenderMode="Lightweight" Text='<%# Bind("MasterName") %>' WrapperCssClass="rdfInput" />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="CourseLabel2" runat="server" AssociatedControlID="CourseTextBox" CssClass="rdfLabel" Text="Course"></asp:Label>
                                    <telerik:RadTextBox ID="CourseTextBox" runat="server" RenderMode="Lightweight" Text='<%# Bind("Course") %>' WrapperCssClass="rdfInput" />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="TermLabel2" runat="server" AssociatedControlID="TermTextBox" CssClass="rdfLabel" Text="Term"></asp:Label>
                                    <telerik:RadNumericTextBox ID="TermTextBox" runat="server" DataType="Int32" DbValue='<%# Bind("Term") %>' NumberFormat-DecimalDigits="0" RenderMode="Lightweight" Skin="<%#Container.OwnerDataForm.Skin %>" WrapperCssClass="rdfInput" />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="PM_EXISTSLabel2" runat="server" AssociatedControlID="PM_EXISTSCheckBox" CssClass="rdfLabel" Text="PM_EXISTS"></asp:Label>
                                    <asp:CheckBox ID="PM_EXISTSCheckBox" runat="server" Checked='<%# Bind("PM_EXISTS") %>' />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="PM_DURATIONLabel2" runat="server" AssociatedControlID="PM_DURATIONTextBox" CssClass="rdfLabel" Text="PM_DURATION"></asp:Label>
                                    <telerik:RadNumericTextBox ID="PM_DURATIONTextBox" runat="server" DataType="Int32" DbValue='<%# Bind("PM_DURATION") %>' NumberFormat-DecimalDigits="0" RenderMode="Lightweight" Skin="<%#Container.OwnerDataForm.Skin %>" WrapperCssClass="rdfInput" />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="PM_MGLabel2" runat="server" AssociatedControlID="PM_MGCheckBox" CssClass="rdfLabel" Text="PM_MG"></asp:Label>
                                    <asp:CheckBox ID="PM_MGCheckBox" runat="server" Checked='<%# Bind("PM_MG") %>' />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="PM_MG_FBLabel2" runat="server" AssociatedControlID="PM_MG_FBCheckBox" CssClass="rdfLabel" Text="PM_MG_FB"></asp:Label>
                                    <asp:CheckBox ID="PM_MG_FBCheckBox" runat="server" Checked='<%# Bind("PM_MG_FB") %>' />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="PM_MG_ESLabel2" runat="server" AssociatedControlID="PM_MG_ESCheckBox" CssClass="rdfLabel" Text="PM_MG_ES"></asp:Label>
                                    <asp:CheckBox ID="PM_MG_ESCheckBox" runat="server" Checked='<%# Bind("PM_MG_ES") %>' />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="PM_MG_SALabel2" runat="server" AssociatedControlID="PM_MG_SACheckBox" CssClass="rdfLabel" Text="PM_MG_SA"></asp:Label>
                                    <asp:CheckBox ID="PM_MG_SACheckBox" runat="server" Checked='<%# Bind("PM_MG_SA") %>' />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="PM_MG_OTHERLabel2" runat="server" AssociatedControlID="PM_MG_OTHERTextBox" CssClass="rdfLabel" Text="PM_MG_OTHER"></asp:Label>
                                    <telerik:RadTextBox ID="PM_MG_OTHERTextBox" runat="server" RenderMode="Lightweight" Text='<%# Bind("PM_MG_OTHER") %>' WrapperCssClass="rdfInput" />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="PM_REQ_ANXLabel2" runat="server" AssociatedControlID="PM_REQ_ANXCheckBox" CssClass="rdfLabel" Text="PM_REQ_ANX"></asp:Label>
                                    <asp:CheckBox ID="PM_REQ_ANXCheckBox" runat="server" Checked='<%# Bind("PM_REQ_ANX") %>' />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="PM_LIST_MTRLS_OPT1Label2" runat="server" AssociatedControlID="PM_LIST_MTRLS_OPT1CheckBox" CssClass="rdfLabel" Text="PM_LIST_MTRLS_OPT1"></asp:Label>
                                    <asp:CheckBox ID="PM_LIST_MTRLS_OPT1CheckBox" runat="server" Checked='<%# Bind("PM_LIST_MTRLS_OPT1") %>' />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="PM_LIST_MTRLS_OPT2Label2" runat="server" AssociatedControlID="PM_LIST_MTRLS_OPT2CheckBox" CssClass="rdfLabel" Text="PM_LIST_MTRLS_OPT2"></asp:Label>
                                    <asp:CheckBox ID="PM_LIST_MTRLS_OPT2CheckBox" runat="server" Checked='<%# Bind("PM_LIST_MTRLS_OPT2") %>' />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="PM_LIST_MTRLS_OPT3Label2" runat="server" AssociatedControlID="PM_LIST_MTRLS_OPT3CheckBox" CssClass="rdfLabel" Text="PM_LIST_MTRLS_OPT3"></asp:Label>
                                    <asp:CheckBox ID="PM_LIST_MTRLS_OPT3CheckBox" runat="server" Checked='<%# Bind("PM_LIST_MTRLS_OPT3") %>' />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="PM_LIST_ANXMTRLSLabel2" runat="server" AssociatedControlID="PM_LIST_ANXMTRLSTextBox" CssClass="rdfLabel" Text="PM_LIST_ANXMTRLS"></asp:Label>
                                    <telerik:RadTextBox ID="PM_LIST_ANXMTRLSTextBox" runat="server" RenderMode="Lightweight" Text='<%# Bind("PM_LIST_ANXMTRLS") %>' WrapperCssClass="rdfInput" />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="PM_LCL_NAMELabel2" runat="server" AssociatedControlID="PM_LCL_NAMETextBox" CssClass="rdfLabel" Text="PM_LCL_NAME"></asp:Label>
                                    <telerik:RadTextBox ID="PM_LCL_NAMETextBox" runat="server" RenderMode="Lightweight" Text='<%# Bind("PM_LCL_NAME") %>' WrapperCssClass="rdfInput" />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="PM_RMT_NAMELabel2" runat="server" AssociatedControlID="PM_RMT_NAMETextBox" CssClass="rdfLabel" Text="PM_RMT_NAME"></asp:Label>
                                    <telerik:RadTextBox ID="PM_RMT_NAMETextBox" runat="server" RenderMode="Lightweight" Text='<%# Bind("PM_RMT_NAME") %>' WrapperCssClass="rdfInput" />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="PM_WEIGHTLabel2" runat="server" AssociatedControlID="PM_WEIGHTTextBox" CssClass="rdfLabel" Text="PM_WEIGHT"></asp:Label>
                                    <telerik:RadTextBox ID="PM_WEIGHTTextBox" runat="server" RenderMode="Lightweight" Text='<%# Bind("PM_WEIGHT") %>' WrapperCssClass="rdfInput" />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="PF_EXISTSLabel2" runat="server" AssociatedControlID="PF_EXISTSCheckBox" CssClass="rdfLabel" Text="PF_EXISTS"></asp:Label>
                                    <asp:CheckBox ID="PF_EXISTSCheckBox" runat="server" Checked='<%# Bind("PF_EXISTS") %>' />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="PF_DURATIONLabel2" runat="server" AssociatedControlID="PF_DURATIONTextBox" CssClass="rdfLabel" Text="PF_DURATION"></asp:Label>
                                    <telerik:RadNumericTextBox ID="PF_DURATIONTextBox" runat="server" DataType="Int32" DbValue='<%# Bind("PF_DURATION") %>' NumberFormat-DecimalDigits="0" RenderMode="Lightweight" Skin="<%#Container.OwnerDataForm.Skin %>" WrapperCssClass="rdfInput" />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="PF_MGLabel2" runat="server" AssociatedControlID="PF_MGCheckBox" CssClass="rdfLabel" Text="PF_MG"></asp:Label>
                                    <asp:CheckBox ID="PF_MGCheckBox" runat="server" Checked='<%# Bind("PF_MG") %>' />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="PF_MG_FBLabel2" runat="server" AssociatedControlID="PF_MG_FBCheckBox" CssClass="rdfLabel" Text="PF_MG_FB"></asp:Label>
                                    <asp:CheckBox ID="PF_MG_FBCheckBox" runat="server" Checked='<%# Bind("PF_MG_FB") %>' />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="PF_MG_ESLabel2" runat="server" AssociatedControlID="PF_MG_ESCheckBox" CssClass="rdfLabel" Text="PF_MG_ES"></asp:Label>
                                    <asp:CheckBox ID="PF_MG_ESCheckBox" runat="server" Checked='<%# Bind("PF_MG_ES") %>' />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="PF_MG_SALabel2" runat="server" AssociatedControlID="PF_MG_SACheckBox" CssClass="rdfLabel" Text="PF_MG_SA"></asp:Label>
                                    <asp:CheckBox ID="PF_MG_SACheckBox" runat="server" Checked='<%# Bind("PF_MG_SA") %>' />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="PF_MG_OTHERLabel2" runat="server" AssociatedControlID="PF_MG_OTHERTextBox" CssClass="rdfLabel" Text="PF_MG_OTHER"></asp:Label>
                                    <telerik:RadTextBox ID="PF_MG_OTHERTextBox" runat="server" RenderMode="Lightweight" Text='<%# Bind("PF_MG_OTHER") %>' WrapperCssClass="rdfInput" />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="PF_REQ_ANXLabel2" runat="server" AssociatedControlID="PF_REQ_ANXCheckBox" CssClass="rdfLabel" Text="PF_REQ_ANX"></asp:Label>
                                    <asp:CheckBox ID="PF_REQ_ANXCheckBox" runat="server" Checked='<%# Bind("PF_REQ_ANX") %>' />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="PF_LIST_MTRLS_OPT1Label2" runat="server" AssociatedControlID="PF_LIST_MTRLS_OPT1CheckBox" CssClass="rdfLabel" Text="PF_LIST_MTRLS_OPT1"></asp:Label>
                                    <asp:CheckBox ID="PF_LIST_MTRLS_OPT1CheckBox" runat="server" Checked='<%# Bind("PF_LIST_MTRLS_OPT1") %>' />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="PF_LIST_MTRLS_OPT2Label2" runat="server" AssociatedControlID="PF_LIST_MTRLS_OPT2CheckBox" CssClass="rdfLabel" Text="PF_LIST_MTRLS_OPT2"></asp:Label>
                                    <asp:CheckBox ID="PF_LIST_MTRLS_OPT2CheckBox" runat="server" Checked='<%# Bind("PF_LIST_MTRLS_OPT2") %>' />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="PF_LIST_MTRLS_OPT3Label2" runat="server" AssociatedControlID="PF_LIST_MTRLS_OPT3CheckBox" CssClass="rdfLabel" Text="PF_LIST_MTRLS_OPT3"></asp:Label>
                                    <asp:CheckBox ID="PF_LIST_MTRLS_OPT3CheckBox" runat="server" Checked='<%# Bind("PF_LIST_MTRLS_OPT3") %>' />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="PF_LIST_ANXMTRLSLabel2" runat="server" AssociatedControlID="PF_LIST_ANXMTRLSTextBox" CssClass="rdfLabel" Text="PF_LIST_ANXMTRLS"></asp:Label>
                                    <telerik:RadTextBox ID="PF_LIST_ANXMTRLSTextBox" runat="server" RenderMode="Lightweight" Text='<%# Bind("PF_LIST_ANXMTRLS") %>' WrapperCssClass="rdfInput" />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="PF_LCL_NAMELabel2" runat="server" AssociatedControlID="PF_LCL_NAMETextBox" CssClass="rdfLabel" Text="PF_LCL_NAME"></asp:Label>
                                    <telerik:RadTextBox ID="PF_LCL_NAMETextBox" runat="server" RenderMode="Lightweight" Text='<%# Bind("PF_LCL_NAME") %>' WrapperCssClass="rdfInput" />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="PF_RMT_NAMELabel2" runat="server" AssociatedControlID="PF_RMT_NAMETextBox" CssClass="rdfLabel" Text="PF_RMT_NAME"></asp:Label>
                                    <telerik:RadTextBox ID="PF_RMT_NAMETextBox" runat="server" RenderMode="Lightweight" Text='<%# Bind("PF_RMT_NAME") %>' WrapperCssClass="rdfInput" />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="PF_WEIGHTLabel2" runat="server" AssociatedControlID="PF_WEIGHTTextBox" CssClass="rdfLabel" Text="PF_WEIGHT"></asp:Label>
                                    <telerik:RadTextBox ID="PF_WEIGHTTextBox" runat="server" RenderMode="Lightweight" Text='<%# Bind("PF_WEIGHT") %>' WrapperCssClass="rdfInput" />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="MLD_VerifiedLabel2" runat="server" AssociatedControlID="MLD_VerifiedCheckBox" CssClass="rdfLabel" Text="MLD_Verified"></asp:Label>
                                    <asp:CheckBox ID="MLD_VerifiedCheckBox" runat="server" Checked='<%# Bind("MLD_Verified") %>' />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="FIN_VerifiedLabel2" runat="server" AssociatedControlID="FIN_VerifiedCheckBox" CssClass="rdfLabel" Text="FIN_Verified"></asp:Label>
                                    <asp:CheckBox ID="FIN_VerifiedCheckBox" runat="server" Checked='<%# Bind("FIN_Verified") %>' />
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
                                    <asp:Label ID="MasterNameLabel2" runat="server" AssociatedControlID="MasterNameTextBox" CssClass="rdfLabel" Text="MasterName"></asp:Label>
                                    <telerik:RadTextBox ID="MasterNameTextBox" runat="server" RenderMode="Lightweight" Text='<%# Bind("MasterName") %>' WrapperCssClass="rdfInput" />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="CourseLabel2" runat="server" AssociatedControlID="CourseTextBox" CssClass="rdfLabel" Text="Course"></asp:Label>
                                    <telerik:RadTextBox ID="CourseTextBox" runat="server" RenderMode="Lightweight" Text='<%# Bind("Course") %>' WrapperCssClass="rdfInput" />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="TermLabel2" runat="server" AssociatedControlID="TermTextBox" CssClass="rdfLabel" Text="Term"></asp:Label>
                                    <telerik:RadNumericTextBox ID="TermTextBox" runat="server" DataType="Int32" DbValue='<%# Bind("Term") %>' NumberFormat-DecimalDigits="0" RenderMode="Lightweight" Skin="<%#Container.OwnerDataForm.Skin %>" WrapperCssClass="rdfInput" />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="PM_EXISTSLabel2" runat="server" AssociatedControlID="PM_EXISTSCheckBox" CssClass="rdfLabel" Text="PM_EXISTS"></asp:Label>
                                    <asp:CheckBox ID="PM_EXISTSCheckBox" runat="server" Checked='<%# Bind("PM_EXISTS") %>' />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="PM_DURATIONLabel2" runat="server" AssociatedControlID="PM_DURATIONTextBox" CssClass="rdfLabel" Text="PM_DURATION"></asp:Label>
                                    <telerik:RadNumericTextBox ID="PM_DURATIONTextBox" runat="server" DataType="Int32" DbValue='<%# Bind("PM_DURATION") %>' NumberFormat-DecimalDigits="0" RenderMode="Lightweight" Skin="<%#Container.OwnerDataForm.Skin %>" WrapperCssClass="rdfInput" />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="PM_MGLabel2" runat="server" AssociatedControlID="PM_MGCheckBox" CssClass="rdfLabel" Text="PM_MG"></asp:Label>
                                    <asp:CheckBox ID="PM_MGCheckBox" runat="server" Checked='<%# Bind("PM_MG") %>' />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="PM_MG_FBLabel2" runat="server" AssociatedControlID="PM_MG_FBCheckBox" CssClass="rdfLabel" Text="PM_MG_FB"></asp:Label>
                                    <asp:CheckBox ID="PM_MG_FBCheckBox" runat="server" Checked='<%# Bind("PM_MG_FB") %>' />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="PM_MG_ESLabel2" runat="server" AssociatedControlID="PM_MG_ESCheckBox" CssClass="rdfLabel" Text="PM_MG_ES"></asp:Label>
                                    <asp:CheckBox ID="PM_MG_ESCheckBox" runat="server" Checked='<%# Bind("PM_MG_ES") %>' />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="PM_MG_SALabel2" runat="server" AssociatedControlID="PM_MG_SACheckBox" CssClass="rdfLabel" Text="PM_MG_SA"></asp:Label>
                                    <asp:CheckBox ID="PM_MG_SACheckBox" runat="server" Checked='<%# Bind("PM_MG_SA") %>' />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="PM_MG_OTHERLabel2" runat="server" AssociatedControlID="PM_MG_OTHERTextBox" CssClass="rdfLabel" Text="PM_MG_OTHER"></asp:Label>
                                    <telerik:RadTextBox ID="PM_MG_OTHERTextBox" runat="server" RenderMode="Lightweight" Text='<%# Bind("PM_MG_OTHER") %>' WrapperCssClass="rdfInput" />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="PM_REQ_ANXLabel2" runat="server" AssociatedControlID="PM_REQ_ANXCheckBox" CssClass="rdfLabel" Text="PM_REQ_ANX"></asp:Label>
                                    <asp:CheckBox ID="PM_REQ_ANXCheckBox" runat="server" Checked='<%# Bind("PM_REQ_ANX") %>' />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="PM_LIST_MTRLS_OPT1Label2" runat="server" AssociatedControlID="PM_LIST_MTRLS_OPT1CheckBox" CssClass="rdfLabel" Text="PM_LIST_MTRLS_OPT1"></asp:Label>
                                    <asp:CheckBox ID="PM_LIST_MTRLS_OPT1CheckBox" runat="server" Checked='<%# Bind("PM_LIST_MTRLS_OPT1") %>' />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="PM_LIST_MTRLS_OPT2Label2" runat="server" AssociatedControlID="PM_LIST_MTRLS_OPT2CheckBox" CssClass="rdfLabel" Text="PM_LIST_MTRLS_OPT2"></asp:Label>
                                    <asp:CheckBox ID="PM_LIST_MTRLS_OPT2CheckBox" runat="server" Checked='<%# Bind("PM_LIST_MTRLS_OPT2") %>' />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="PM_LIST_MTRLS_OPT3Label2" runat="server" AssociatedControlID="PM_LIST_MTRLS_OPT3CheckBox" CssClass="rdfLabel" Text="PM_LIST_MTRLS_OPT3"></asp:Label>
                                    <asp:CheckBox ID="PM_LIST_MTRLS_OPT3CheckBox" runat="server" Checked='<%# Bind("PM_LIST_MTRLS_OPT3") %>' />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="PM_LIST_ANXMTRLSLabel2" runat="server" AssociatedControlID="PM_LIST_ANXMTRLSTextBox" CssClass="rdfLabel" Text="PM_LIST_ANXMTRLS"></asp:Label>
                                    <telerik:RadTextBox ID="PM_LIST_ANXMTRLSTextBox" runat="server" RenderMode="Lightweight" Text='<%# Bind("PM_LIST_ANXMTRLS") %>' WrapperCssClass="rdfInput" />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="PM_LCL_NAMELabel2" runat="server" AssociatedControlID="PM_LCL_NAMETextBox" CssClass="rdfLabel" Text="PM_LCL_NAME"></asp:Label>
                                    <telerik:RadTextBox ID="PM_LCL_NAMETextBox" runat="server" RenderMode="Lightweight" Text='<%# Bind("PM_LCL_NAME") %>' WrapperCssClass="rdfInput" />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="PM_RMT_NAMELabel2" runat="server" AssociatedControlID="PM_RMT_NAMETextBox" CssClass="rdfLabel" Text="PM_RMT_NAME"></asp:Label>
                                    <telerik:RadTextBox ID="PM_RMT_NAMETextBox" runat="server" RenderMode="Lightweight" Text='<%# Bind("PM_RMT_NAME") %>' WrapperCssClass="rdfInput" />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="PM_WEIGHTLabel2" runat="server" AssociatedControlID="PM_WEIGHTTextBox" CssClass="rdfLabel" Text="PM_WEIGHT"></asp:Label>
                                    <telerik:RadTextBox ID="PM_WEIGHTTextBox" runat="server" RenderMode="Lightweight" Text='<%# Bind("PM_WEIGHT") %>' WrapperCssClass="rdfInput" />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="PF_EXISTSLabel2" runat="server" AssociatedControlID="PF_EXISTSCheckBox" CssClass="rdfLabel" Text="PF_EXISTS"></asp:Label>
                                    <asp:CheckBox ID="PF_EXISTSCheckBox" runat="server" Checked='<%# Bind("PF_EXISTS") %>' />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="PF_DURATIONLabel2" runat="server" AssociatedControlID="PF_DURATIONTextBox" CssClass="rdfLabel" Text="PF_DURATION"></asp:Label>
                                    <telerik:RadNumericTextBox ID="PF_DURATIONTextBox" runat="server" DataType="Int32" DbValue='<%# Bind("PF_DURATION") %>' NumberFormat-DecimalDigits="0" RenderMode="Lightweight" Skin="<%#Container.OwnerDataForm.Skin %>" WrapperCssClass="rdfInput" />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="PF_MGLabel2" runat="server" AssociatedControlID="PF_MGCheckBox" CssClass="rdfLabel" Text="PF_MG"></asp:Label>
                                    <asp:CheckBox ID="PF_MGCheckBox" runat="server" Checked='<%# Bind("PF_MG") %>' />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="PF_MG_FBLabel2" runat="server" AssociatedControlID="PF_MG_FBCheckBox" CssClass="rdfLabel" Text="PF_MG_FB"></asp:Label>
                                    <asp:CheckBox ID="PF_MG_FBCheckBox" runat="server" Checked='<%# Bind("PF_MG_FB") %>' />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="PF_MG_ESLabel2" runat="server" AssociatedControlID="PF_MG_ESCheckBox" CssClass="rdfLabel" Text="PF_MG_ES"></asp:Label>
                                    <asp:CheckBox ID="PF_MG_ESCheckBox" runat="server" Checked='<%# Bind("PF_MG_ES") %>' />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="PF_MG_SALabel2" runat="server" AssociatedControlID="PF_MG_SACheckBox" CssClass="rdfLabel" Text="PF_MG_SA"></asp:Label>
                                    <asp:CheckBox ID="PF_MG_SACheckBox" runat="server" Checked='<%# Bind("PF_MG_SA") %>' />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="PF_MG_OTHERLabel2" runat="server" AssociatedControlID="PF_MG_OTHERTextBox" CssClass="rdfLabel" Text="PF_MG_OTHER"></asp:Label>
                                    <telerik:RadTextBox ID="PF_MG_OTHERTextBox" runat="server" RenderMode="Lightweight" Text='<%# Bind("PF_MG_OTHER") %>' WrapperCssClass="rdfInput" />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="PF_REQ_ANXLabel2" runat="server" AssociatedControlID="PF_REQ_ANXCheckBox" CssClass="rdfLabel" Text="PF_REQ_ANX"></asp:Label>
                                    <asp:CheckBox ID="PF_REQ_ANXCheckBox" runat="server" Checked='<%# Bind("PF_REQ_ANX") %>' />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="PF_LIST_MTRLS_OPT1Label2" runat="server" AssociatedControlID="PF_LIST_MTRLS_OPT1CheckBox" CssClass="rdfLabel" Text="PF_LIST_MTRLS_OPT1"></asp:Label>
                                    <asp:CheckBox ID="PF_LIST_MTRLS_OPT1CheckBox" runat="server" Checked='<%# Bind("PF_LIST_MTRLS_OPT1") %>' />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="PF_LIST_MTRLS_OPT2Label2" runat="server" AssociatedControlID="PF_LIST_MTRLS_OPT2CheckBox" CssClass="rdfLabel" Text="PF_LIST_MTRLS_OPT2"></asp:Label>
                                    <asp:CheckBox ID="PF_LIST_MTRLS_OPT2CheckBox" runat="server" Checked='<%# Bind("PF_LIST_MTRLS_OPT2") %>' />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="PF_LIST_MTRLS_OPT3Label2" runat="server" AssociatedControlID="PF_LIST_MTRLS_OPT3CheckBox" CssClass="rdfLabel" Text="PF_LIST_MTRLS_OPT3"></asp:Label>
                                    <asp:CheckBox ID="PF_LIST_MTRLS_OPT3CheckBox" runat="server" Checked='<%# Bind("PF_LIST_MTRLS_OPT3") %>' />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="PF_LIST_ANXMTRLSLabel2" runat="server" AssociatedControlID="PF_LIST_ANXMTRLSTextBox" CssClass="rdfLabel" Text="PF_LIST_ANXMTRLS"></asp:Label>
                                    <telerik:RadTextBox ID="PF_LIST_ANXMTRLSTextBox" runat="server" RenderMode="Lightweight" Text='<%# Bind("PF_LIST_ANXMTRLS") %>' WrapperCssClass="rdfInput" />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="PF_LCL_NAMELabel2" runat="server" AssociatedControlID="PF_LCL_NAMETextBox" CssClass="rdfLabel" Text="PF_LCL_NAME"></asp:Label>
                                    <telerik:RadTextBox ID="PF_LCL_NAMETextBox" runat="server" RenderMode="Lightweight" Text='<%# Bind("PF_LCL_NAME") %>' WrapperCssClass="rdfInput" />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="PF_RMT_NAMELabel2" runat="server" AssociatedControlID="PF_RMT_NAMETextBox" CssClass="rdfLabel" Text="PF_RMT_NAME"></asp:Label>
                                    <telerik:RadTextBox ID="PF_RMT_NAMETextBox" runat="server" RenderMode="Lightweight" Text='<%# Bind("PF_RMT_NAME") %>' WrapperCssClass="rdfInput" />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="PF_WEIGHTLabel2" runat="server" AssociatedControlID="PF_WEIGHTTextBox" CssClass="rdfLabel" Text="PF_WEIGHT"></asp:Label>
                                    <telerik:RadTextBox ID="PF_WEIGHTTextBox" runat="server" RenderMode="Lightweight" Text='<%# Bind("PF_WEIGHT") %>' WrapperCssClass="rdfInput" />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="MLD_VerifiedLabel2" runat="server" AssociatedControlID="MLD_VerifiedCheckBox" CssClass="rdfLabel" Text="MLD_Verified"></asp:Label>
                                    <asp:CheckBox ID="MLD_VerifiedCheckBox" runat="server" Checked='<%# Bind("MLD_Verified") %>' />
                                </div>
                                <div class="rdfRow">
                                    <asp:Label ID="FIN_VerifiedLabel2" runat="server" AssociatedControlID="FIN_VerifiedCheckBox" CssClass="rdfLabel" Text="FIN_Verified"></asp:Label>
                                    <asp:CheckBox ID="FIN_VerifiedCheckBox" runat="server" Checked='<%# Bind("FIN_Verified") %>' />
                                </div>
                                <div class="rdfCommandButtons">
                                    <hr class="rdfHr" />
                                    <telerik:RadButton ID="PerformInsertButton" runat="server" ButtonType="SkinnedButton" CommandName="PerformInsert" RenderMode="Lightweight" Text="Insert" ToolTip="Insert" />
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
                </td>
            </tr>
        </table>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [MasterProctor] WHERE ([ID] = @ID)" DeleteCommand="DELETE FROM [MasterProctor] WHERE [ID] = @ID" InsertCommand="INSERT INTO [MasterProctor] ([FamilyString], [Parent], [Course], [Instructor], [Outlook], [CanChange], [Session], [IsMidterm], [MidStart], [MidEnd], [MidNameL], [MidFolderL], [MidNameR], [MidFolderR], [MidTime], [MidPaper], [MidCalculator], [MidGraph], [MidNotes], [IsFinal], [FinalStart], [FinalEnd], [FinalNameL], [FinalFolderL], [FinalNameR], [FinalFolderR], [FinalTime], [FinalPaper], [FinalCalculator], [FinalGraph], [FinalNotes], [InstComments], [Access], [Signoff], [SignoffDate], [VCSignoff], [VCSignoffDate], [VCNotes], [MidProctorX], [FinalProctorX], [UseDefault], [MidWindow], [FinalWindow], [Lockdown], [LockdownMid], [LockdownFinal], [Mid_Manual], [Final_Manual], [Headphones], [Essay], [FinalEssay], [FinalHeadphones], [PM_ANXMTR], [PF_ANXMTR], [MidVerified], [FinalVerified]) VALUES (@FamilyString, @Parent, @Course, @Instructor, @Outlook, @CanChange, @Session, @IsMidterm, @MidStart, @MidEnd, @MidNameL, @MidFolderL, @MidNameR, @MidFolderR, @MidTime, @MidPaper, @MidCalculator, @MidGraph, @MidNotes, @IsFinal, @FinalStart, @FinalEnd, @FinalNameL, @FinalFolderL, @FinalNameR, @FinalFolderR, @FinalTime, @FinalPaper, @FinalCalculator, @FinalGraph, @FinalNotes, @InstComments, @Access, @Signoff, @SignoffDate, @VCSignoff, @VCSignoffDate, @VCNotes, @MidProctorX, @FinalProctorX, @UseDefault, @MidWindow, @FinalWindow, @Lockdown, @LockdownMid, @LockdownFinal, @Mid_Manual, @Final_Manual, @Headphones, @Essay, @FinalEssay, @FinalHeadphones, @PM_ANXMTR, @PF_ANXMTR, @MidVerified, @FinalVerified)" UpdateCommand="UPDATE [MasterProctor] SET [FamilyString] = @FamilyString, [Parent] = @Parent, [Course] = @Course, [Instructor] = @Instructor, [Outlook] = @Outlook, [CanChange] = @CanChange, [Session] = @Session, [IsMidterm] = @IsMidterm, [MidStart] = @MidStart, [MidEnd] = @MidEnd, [MidNameL] = @MidNameL, [MidFolderL] = @MidFolderL, [MidNameR] = @MidNameR, [MidFolderR] = @MidFolderR, [MidTime] = @MidTime, [MidPaper] = @MidPaper, [MidCalculator] = @MidCalculator, [MidGraph] = @MidGraph, [MidNotes] = @MidNotes, [IsFinal] = @IsFinal, [FinalStart] = @FinalStart, [FinalEnd] = @FinalEnd, [FinalNameL] = @FinalNameL, [FinalFolderL] = @FinalFolderL, [FinalNameR] = @FinalNameR, [FinalFolderR] = @FinalFolderR, [FinalTime] = @FinalTime, [FinalPaper] = @FinalPaper, [FinalCalculator] = @FinalCalculator, [FinalGraph] = @FinalGraph, [FinalNotes] = @FinalNotes, [InstComments] = @InstComments, [Access] = @Access, [Signoff] = @Signoff, [SignoffDate] = @SignoffDate, [VCSignoff] = @VCSignoff, [VCSignoffDate] = @VCSignoffDate, [VCNotes] = @VCNotes, [MidProctorX] = @MidProctorX, [FinalProctorX] = @FinalProctorX, [UseDefault] = @UseDefault, [MidWindow] = @MidWindow, [FinalWindow] = @FinalWindow, [Lockdown] = @Lockdown, [LockdownMid] = @LockdownMid, [LockdownFinal] = @LockdownFinal, [Mid_Manual] = @Mid_Manual, [Final_Manual] = @Final_Manual, [Headphones] = @Headphones, [Essay] = @Essay, [FinalEssay] = @FinalEssay, [FinalHeadphones] = @FinalHeadphones, [PM_ANXMTR] = @PM_ANXMTR, [PF_ANXMTR] = @PF_ANXMTR, [MidVerified] = @MidVerified, [FinalVerified] = @FinalVerified WHERE [ID] = @ID">
            <DeleteParameters>
                <asp:Parameter Name="ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="FamilyString" Type="String" />
                <asp:Parameter Name="Parent" Type="String" />
                <asp:Parameter Name="Course" Type="String" />
                <asp:Parameter Name="Instructor" Type="String" />
                <asp:Parameter Name="Outlook" Type="String" />
                <asp:Parameter Name="CanChange" Type="Boolean" />
                <asp:Parameter Name="Session" Type="String" />
                <asp:Parameter Name="IsMidterm" Type="Boolean" />
                <asp:Parameter DbType="Date" Name="MidStart" />
                <asp:Parameter DbType="Date" Name="MidEnd" />
                <asp:Parameter Name="MidNameL" Type="String" />
                <asp:Parameter Name="MidFolderL" Type="String" />
                <asp:Parameter Name="MidNameR" Type="String" />
                <asp:Parameter Name="MidFolderR" Type="String" />
                <asp:Parameter Name="MidTime" Type="Int32" />
                <asp:Parameter Name="MidPaper" Type="Boolean" />
                <asp:Parameter Name="MidCalculator" Type="Boolean" />
                <asp:Parameter Name="MidGraph" Type="Boolean" />
                <asp:Parameter Name="MidNotes" Type="String" />
                <asp:Parameter Name="IsFinal" Type="Boolean" />
                <asp:Parameter DbType="Date" Name="FinalStart" />
                <asp:Parameter DbType="Date" Name="FinalEnd" />
                <asp:Parameter Name="FinalNameL" Type="String" />
                <asp:Parameter Name="FinalFolderL" Type="String" />
                <asp:Parameter Name="FinalNameR" Type="String" />
                <asp:Parameter Name="FinalFolderR" Type="String" />
                <asp:Parameter Name="FinalTime" Type="Int32" />
                <asp:Parameter Name="FinalPaper" Type="Boolean" />
                <asp:Parameter Name="FinalCalculator" Type="Boolean" />
                <asp:Parameter Name="FinalGraph" Type="Boolean" />
                <asp:Parameter Name="FinalNotes" Type="String" />
                <asp:Parameter Name="InstComments" Type="String" />
                <asp:Parameter Name="Access" Type="Boolean" />
                <asp:Parameter Name="Signoff" Type="Boolean" />
                <asp:Parameter DbType="Date" Name="SignoffDate" />
                <asp:Parameter Name="VCSignoff" Type="Boolean" />
                <asp:Parameter DbType="Date" Name="VCSignoffDate" />
                <asp:Parameter Name="VCNotes" Type="String" />
                <asp:Parameter Name="MidProctorX" Type="Boolean" />
                <asp:Parameter Name="FinalProctorX" Type="Boolean" />
                <asp:Parameter Name="UseDefault" Type="Boolean" />
                <asp:Parameter Name="MidWindow" Type="String" />
                <asp:Parameter Name="FinalWindow" Type="String" />
                <asp:Parameter Name="Lockdown" Type="Boolean" />
                <asp:Parameter Name="LockdownMid" Type="Boolean" />
                <asp:Parameter Name="LockdownFinal" Type="Boolean" />
                <asp:Parameter Name="Mid_Manual" Type="Boolean" />
                <asp:Parameter Name="Final_Manual" Type="Boolean" />
                <asp:Parameter Name="Headphones" Type="Boolean" />
                <asp:Parameter Name="Essay" Type="Boolean" />
                <asp:Parameter Name="FinalEssay" Type="Boolean" />
                <asp:Parameter Name="FinalHeadphones" Type="Boolean" />
                <asp:Parameter Name="PM_ANXMTR" Type="String" />
                <asp:Parameter Name="PF_ANXMTR" Type="String" />
                <asp:Parameter Name="MidVerified" Type="Boolean" />
                <asp:Parameter Name="FinalVerified" Type="Boolean" />
            </InsertParameters>
            <SelectParameters>
                <asp:Parameter DefaultValue="678" Name="ID" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="FamilyString" Type="String" />
                <asp:Parameter Name="Parent" Type="String" />
                <asp:Parameter Name="Course" Type="String" />
                <asp:Parameter Name="Instructor" Type="String" />
                <asp:Parameter Name="Outlook" Type="String" />
                <asp:Parameter Name="CanChange" Type="Boolean" />
                <asp:Parameter Name="Session" Type="String" />
                <asp:Parameter Name="IsMidterm" Type="Boolean" />
                <asp:Parameter DbType="Date" Name="MidStart" />
                <asp:Parameter DbType="Date" Name="MidEnd" />
                <asp:Parameter Name="MidNameL" Type="String" />
                <asp:Parameter Name="MidFolderL" Type="String" />
                <asp:Parameter Name="MidNameR" Type="String" />
                <asp:Parameter Name="MidFolderR" Type="String" />
                <asp:Parameter Name="MidTime" Type="Int32" />
                <asp:Parameter Name="MidPaper" Type="Boolean" />
                <asp:Parameter Name="MidCalculator" Type="Boolean" />
                <asp:Parameter Name="MidGraph" Type="Boolean" />
                <asp:Parameter Name="MidNotes" Type="String" />
                <asp:Parameter Name="IsFinal" Type="Boolean" />
                <asp:Parameter DbType="Date" Name="FinalStart" />
                <asp:Parameter DbType="Date" Name="FinalEnd" />
                <asp:Parameter Name="FinalNameL" Type="String" />
                <asp:Parameter Name="FinalFolderL" Type="String" />
                <asp:Parameter Name="FinalNameR" Type="String" />
                <asp:Parameter Name="FinalFolderR" Type="String" />
                <asp:Parameter Name="FinalTime" Type="Int32" />
                <asp:Parameter Name="FinalPaper" Type="Boolean" />
                <asp:Parameter Name="FinalCalculator" Type="Boolean" />
                <asp:Parameter Name="FinalGraph" Type="Boolean" />
                <asp:Parameter Name="FinalNotes" Type="String" />
                <asp:Parameter Name="InstComments" Type="String" />
                <asp:Parameter Name="Access" Type="Boolean" />
                <asp:Parameter Name="Signoff" Type="Boolean" />
                <asp:Parameter DbType="Date" Name="SignoffDate" />
                <asp:Parameter Name="VCSignoff" Type="Boolean" />
                <asp:Parameter DbType="Date" Name="VCSignoffDate" />
                <asp:Parameter Name="VCNotes" Type="String" />
                <asp:Parameter Name="MidProctorX" Type="Boolean" />
                <asp:Parameter Name="FinalProctorX" Type="Boolean" />
                <asp:Parameter Name="UseDefault" Type="Boolean" />
                <asp:Parameter Name="MidWindow" Type="String" />
                <asp:Parameter Name="FinalWindow" Type="String" />
                <asp:Parameter Name="Lockdown" Type="Boolean" />
                <asp:Parameter Name="LockdownMid" Type="Boolean" />
                <asp:Parameter Name="LockdownFinal" Type="Boolean" />
                <asp:Parameter Name="Mid_Manual" Type="Boolean" />
                <asp:Parameter Name="Final_Manual" Type="Boolean" />
                <asp:Parameter Name="Headphones" Type="Boolean" />
                <asp:Parameter Name="Essay" Type="Boolean" />
                <asp:Parameter Name="FinalEssay" Type="Boolean" />
                <asp:Parameter Name="FinalHeadphones" Type="Boolean" />
                <asp:Parameter Name="PM_ANXMTR" Type="String" />
                <asp:Parameter Name="PF_ANXMTR" Type="String" />
                <asp:Parameter Name="MidVerified" Type="Boolean" />
                <asp:Parameter Name="FinalVerified" Type="Boolean" />
                <asp:Parameter Name="ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DesignConnectionString %>" SelectCommand="SELECT * FROM [OL_MasterExam] WHERE (([Course] = @Course) AND ([Term] = @Term))" DeleteCommand="DELETE FROM [OL_MasterExam] WHERE [Exam_ID] = @Exam_ID" InsertCommand="INSERT INTO [OL_MasterExam] ([MasterName], [Course], [Term], [PM_EXISTS], [PM_DURATION], [PM_MG], [PM_MG_FB], [PM_MG_ES], [PM_MG_SA], [PM_MG_OTHER], [PM_REQ_ANX], [PM_LIST_MTRLS_OPT1], [PM_LIST_MTRLS_OPT2], [PM_LIST_MTRLS_OPT3], [PM_LIST_ANXMTRLS], [PM_LCL_NAME], [PM_RMT_NAME], [PM_WEIGHT], [PF_EXISTS], [PF_DURATION], [PF_MG], [PF_MG_FB], [PF_MG_ES], [PF_MG_SA], [PF_MG_OTHER], [PF_REQ_ANX], [PF_LIST_MTRLS_OPT1], [PF_LIST_MTRLS_OPT2], [PF_LIST_MTRLS_OPT3], [PF_LIST_ANXMTRLS], [PF_LCL_NAME], [PF_RMT_NAME], [PF_WEIGHT], [MLD_Verified], [FIN_Verified]) VALUES (@MasterName, @Course, @Term, @PM_EXISTS, @PM_DURATION, @PM_MG, @PM_MG_FB, @PM_MG_ES, @PM_MG_SA, @PM_MG_OTHER, @PM_REQ_ANX, @PM_LIST_MTRLS_OPT1, @PM_LIST_MTRLS_OPT2, @PM_LIST_MTRLS_OPT3, @PM_LIST_ANXMTRLS, @PM_LCL_NAME, @PM_RMT_NAME, @PM_WEIGHT, @PF_EXISTS, @PF_DURATION, @PF_MG, @PF_MG_FB, @PF_MG_ES, @PF_MG_SA, @PF_MG_OTHER, @PF_REQ_ANX, @PF_LIST_MTRLS_OPT1, @PF_LIST_MTRLS_OPT2, @PF_LIST_MTRLS_OPT3, @PF_LIST_ANXMTRLS, @PF_LCL_NAME, @PF_RMT_NAME, @PF_WEIGHT, @MLD_Verified, @FIN_Verified)" UpdateCommand="UPDATE [OL_MasterExam] SET [MasterName] = @MasterName, [Course] = @Course, [Term] = @Term, [PM_EXISTS] = @PM_EXISTS, [PM_DURATION] = @PM_DURATION, [PM_MG] = @PM_MG, [PM_MG_FB] = @PM_MG_FB, [PM_MG_ES] = @PM_MG_ES, [PM_MG_SA] = @PM_MG_SA, [PM_MG_OTHER] = @PM_MG_OTHER, [PM_REQ_ANX] = @PM_REQ_ANX, [PM_LIST_MTRLS_OPT1] = @PM_LIST_MTRLS_OPT1, [PM_LIST_MTRLS_OPT2] = @PM_LIST_MTRLS_OPT2, [PM_LIST_MTRLS_OPT3] = @PM_LIST_MTRLS_OPT3, [PM_LIST_ANXMTRLS] = @PM_LIST_ANXMTRLS, [PM_LCL_NAME] = @PM_LCL_NAME, [PM_RMT_NAME] = @PM_RMT_NAME, [PM_WEIGHT] = @PM_WEIGHT, [PF_EXISTS] = @PF_EXISTS, [PF_DURATION] = @PF_DURATION, [PF_MG] = @PF_MG, [PF_MG_FB] = @PF_MG_FB, [PF_MG_ES] = @PF_MG_ES, [PF_MG_SA] = @PF_MG_SA, [PF_MG_OTHER] = @PF_MG_OTHER, [PF_REQ_ANX] = @PF_REQ_ANX, [PF_LIST_MTRLS_OPT1] = @PF_LIST_MTRLS_OPT1, [PF_LIST_MTRLS_OPT2] = @PF_LIST_MTRLS_OPT2, [PF_LIST_MTRLS_OPT3] = @PF_LIST_MTRLS_OPT3, [PF_LIST_ANXMTRLS] = @PF_LIST_ANXMTRLS, [PF_LCL_NAME] = @PF_LCL_NAME, [PF_RMT_NAME] = @PF_RMT_NAME, [PF_WEIGHT] = @PF_WEIGHT, [MLD_Verified] = @MLD_Verified, [FIN_Verified] = @FIN_Verified WHERE [Exam_ID] = @Exam_ID">
            <DeleteParameters>
                <asp:Parameter Name="Exam_ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="MasterName" Type="String" />
                <asp:Parameter Name="Course" Type="String" />
                <asp:Parameter Name="Term" Type="Int32" />
                <asp:Parameter Name="PM_EXISTS" Type="Boolean" />
                <asp:Parameter Name="PM_DURATION" Type="Int32" />
                <asp:Parameter Name="PM_MG" Type="Boolean" />
                <asp:Parameter Name="PM_MG_FB" Type="Boolean" />
                <asp:Parameter Name="PM_MG_ES" Type="Boolean" />
                <asp:Parameter Name="PM_MG_SA" Type="Boolean" />
                <asp:Parameter Name="PM_MG_OTHER" Type="String" />
                <asp:Parameter Name="PM_REQ_ANX" Type="Boolean" />
                <asp:Parameter Name="PM_LIST_MTRLS_OPT1" Type="Boolean" />
                <asp:Parameter Name="PM_LIST_MTRLS_OPT2" Type="Boolean" />
                <asp:Parameter Name="PM_LIST_MTRLS_OPT3" Type="Boolean" />
                <asp:Parameter Name="PM_LIST_ANXMTRLS" Type="String" />
                <asp:Parameter Name="PM_LCL_NAME" Type="String" />
                <asp:Parameter Name="PM_RMT_NAME" Type="String" />
                <asp:Parameter Name="PM_WEIGHT" Type="String" />
                <asp:Parameter Name="PF_EXISTS" Type="Boolean" />
                <asp:Parameter Name="PF_DURATION" Type="Int32" />
                <asp:Parameter Name="PF_MG" Type="Boolean" />
                <asp:Parameter Name="PF_MG_FB" Type="Boolean" />
                <asp:Parameter Name="PF_MG_ES" Type="Boolean" />
                <asp:Parameter Name="PF_MG_SA" Type="Boolean" />
                <asp:Parameter Name="PF_MG_OTHER" Type="String" />
                <asp:Parameter Name="PF_REQ_ANX" Type="Boolean" />
                <asp:Parameter Name="PF_LIST_MTRLS_OPT1" Type="Boolean" />
                <asp:Parameter Name="PF_LIST_MTRLS_OPT2" Type="Boolean" />
                <asp:Parameter Name="PF_LIST_MTRLS_OPT3" Type="Boolean" />
                <asp:Parameter Name="PF_LIST_ANXMTRLS" Type="String" />
                <asp:Parameter Name="PF_LCL_NAME" Type="String" />
                <asp:Parameter Name="PF_RMT_NAME" Type="String" />
                <asp:Parameter Name="PF_WEIGHT" Type="String" />
                <asp:Parameter Name="MLD_Verified" Type="Boolean" />
                <asp:Parameter Name="FIN_Verified" Type="Boolean" />
            </InsertParameters>
            <SelectParameters>
                <asp:Parameter DefaultValue="STA2023" Name="Course" Type="String" />
                <asp:Parameter DefaultValue="2197" Name="Term" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="MasterName" Type="String" />
                <asp:Parameter Name="Course" Type="String" />
                <asp:Parameter Name="Term" Type="Int32" />
                <asp:Parameter Name="PM_EXISTS" Type="Boolean" />
                <asp:Parameter Name="PM_DURATION" Type="Int32" />
                <asp:Parameter Name="PM_MG" Type="Boolean" />
                <asp:Parameter Name="PM_MG_FB" Type="Boolean" />
                <asp:Parameter Name="PM_MG_ES" Type="Boolean" />
                <asp:Parameter Name="PM_MG_SA" Type="Boolean" />
                <asp:Parameter Name="PM_MG_OTHER" Type="String" />
                <asp:Parameter Name="PM_REQ_ANX" Type="Boolean" />
                <asp:Parameter Name="PM_LIST_MTRLS_OPT1" Type="Boolean" />
                <asp:Parameter Name="PM_LIST_MTRLS_OPT2" Type="Boolean" />
                <asp:Parameter Name="PM_LIST_MTRLS_OPT3" Type="Boolean" />
                <asp:Parameter Name="PM_LIST_ANXMTRLS" Type="String" />
                <asp:Parameter Name="PM_LCL_NAME" Type="String" />
                <asp:Parameter Name="PM_RMT_NAME" Type="String" />
                <asp:Parameter Name="PM_WEIGHT" Type="String" />
                <asp:Parameter Name="PF_EXISTS" Type="Boolean" />
                <asp:Parameter Name="PF_DURATION" Type="Int32" />
                <asp:Parameter Name="PF_MG" Type="Boolean" />
                <asp:Parameter Name="PF_MG_FB" Type="Boolean" />
                <asp:Parameter Name="PF_MG_ES" Type="Boolean" />
                <asp:Parameter Name="PF_MG_SA" Type="Boolean" />
                <asp:Parameter Name="PF_MG_OTHER" Type="String" />
                <asp:Parameter Name="PF_REQ_ANX" Type="Boolean" />
                <asp:Parameter Name="PF_LIST_MTRLS_OPT1" Type="Boolean" />
                <asp:Parameter Name="PF_LIST_MTRLS_OPT2" Type="Boolean" />
                <asp:Parameter Name="PF_LIST_MTRLS_OPT3" Type="Boolean" />
                <asp:Parameter Name="PF_LIST_ANXMTRLS" Type="String" />
                <asp:Parameter Name="PF_LCL_NAME" Type="String" />
                <asp:Parameter Name="PF_RMT_NAME" Type="String" />
                <asp:Parameter Name="PF_WEIGHT" Type="String" />
                <asp:Parameter Name="MLD_Verified" Type="Boolean" />
                <asp:Parameter Name="FIN_Verified" Type="Boolean" />
                <asp:Parameter Name="Exam_ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
