<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="PopUpData.aspx.vb" Inherits="VCdata.PopUpData" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 1000px;
        }
                td {

  vertical-align: top;
  width= 600px;
}
                        .RadDataForm {
    width:500px;
}
          .rdfLabel {
              font-weight: bold;
          }
            .rdfLegend {
                font-weight: bold;
                color: red;
            }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <telerik:RadStyleSheetManager ID="RadStyleSheetManager1" runat="server">
        </telerik:RadStyleSheetManager>
                        <telerik:RadFormDecorator ID="RadFormDecorator1" Runat="server" DecoratedControls="CheckBoxes" Skin="Material" />
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
            <table align="left" class="auto-style1" border="1">
                <tr>
                    <td>        
                        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [MasterProctor] WHERE [ID] = @ID" InsertCommand="INSERT INTO [MasterProctor] ([FamilyString], [Course], [Instructor], [CanChange], [Session], [IsMidterm], [Parent], [MidEnd], [MidNameL], [MidTime], [MidPaper], [MidCalculator], [MidGraph], [IsFinal], [FinalStart], [FinalEnd], [FinalNameL], [FinalNameR], [FinalTime], [FinalPaper], [FinalGraph], [InstComments], [Signoff], [MidProctorX], [FinalProctorX], [UseDefault], [Lockdown], [LockdownMid], [LockdownFinal], [Essay], [FinalEssay], [PM_ANXMTR], [PF_ANXMTR]) VALUES (@FamilyString, @Course, @Instructor, @CanChange, @Session, @IsMidterm, @Parent, @MidEnd, @MidNameL, @MidTime, @MidPaper, @MidCalculator, @MidGraph, @IsFinal, @FinalStart, @FinalEnd, @FinalNameL, @FinalNameR, @FinalTime, @FinalPaper, @FinalGraph, @InstComments, @Signoff, @MidProctorX, @FinalProctorX, @UseDefault, @Lockdown, @LockdownMid, @LockdownFinal, @Essay, @FinalEssay, @PM_ANXMTR, @PF_ANXMTR)" SelectCommand="SELECT [ID], [FamilyString], [Course], [Instructor], [CanChange], [Session], [IsMidterm], [Parent], [MidEnd], [MidNameL], [MidTime], [MidPaper], [MidCalculator], [MidGraph], [IsFinal], [FinalStart], [FinalEnd], [FinalNameL], [FinalNameR], [FinalTime], [FinalPaper], [FinalGraph], [InstComments], [Signoff], [MidProctorX], [FinalProctorX], [UseDefault], [Lockdown], [LockdownMid], [LockdownFinal], [Essay], [FinalEssay], [PM_ANXMTR], [PF_ANXMTR] FROM [MasterProctor] WHERE ([ID] = @ID)" UpdateCommand="UPDATE [MasterProctor] SET [FamilyString] = @FamilyString, [Course] = @Course, [Instructor] = @Instructor, [CanChange] = @CanChange, [Session] = @Session, [IsMidterm] = @IsMidterm, [Parent] = @Parent, [MidEnd] = @MidEnd, [MidNameL] = @MidNameL, [MidTime] = @MidTime, [MidPaper] = @MidPaper, [MidCalculator] = @MidCalculator, [MidGraph] = @MidGraph, [IsFinal] = @IsFinal, [FinalStart] = @FinalStart, [FinalEnd] = @FinalEnd, [FinalNameL] = @FinalNameL, [FinalNameR] = @FinalNameR, [FinalTime] = @FinalTime, [FinalPaper] = @FinalPaper, [FinalGraph] = @FinalGraph, [InstComments] = @InstComments, [Signoff] = @Signoff, [MidProctorX] = @MidProctorX, [FinalProctorX] = @FinalProctorX, [UseDefault] = @UseDefault, [Lockdown] = @Lockdown, [LockdownMid] = @LockdownMid, [LockdownFinal] = @LockdownFinal, [Essay] = @Essay, [FinalEssay] = @FinalEssay, [PM_ANXMTR] = @PM_ANXMTR, [PF_ANXMTR] = @PF_ANXMTR WHERE [ID] = @ID">
                            <DeleteParameters>
                                <asp:Parameter Name="ID" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="FamilyString" Type="String" />
                                <asp:Parameter Name="Course" Type="String" />
                                <asp:Parameter Name="Instructor" Type="String" />
                                <asp:Parameter Name="CanChange" Type="Boolean" />
                                <asp:Parameter Name="Session" Type="String" />
                                <asp:Parameter Name="IsMidterm" Type="Boolean" />
                                <asp:Parameter Name="Parent" Type="String" />
                                <asp:Parameter DbType="Date" Name="MidEnd" />
                                <asp:Parameter Name="MidNameL" Type="String" />
                                <asp:Parameter Name="MidTime" Type="Int32" />
                                <asp:Parameter Name="MidPaper" Type="Boolean" />
                                <asp:Parameter Name="MidCalculator" Type="Boolean" />
                                <asp:Parameter Name="MidGraph" Type="Boolean" />
                                <asp:Parameter Name="IsFinal" Type="Boolean" />
                                <asp:Parameter DbType="Date" Name="FinalStart" />
                                <asp:Parameter DbType="Date" Name="FinalEnd" />
                                <asp:Parameter Name="FinalNameL" Type="String" />
                                <asp:Parameter Name="FinalNameR" Type="String" />
                                <asp:Parameter Name="FinalTime" Type="Int32" />
                                <asp:Parameter Name="FinalPaper" Type="Boolean" />
                                <asp:Parameter Name="FinalGraph" Type="Boolean" />
                                <asp:Parameter Name="InstComments" Type="String" />
                                <asp:Parameter Name="Signoff" Type="Boolean" />
                                <asp:Parameter Name="MidProctorX" Type="Boolean" />
                                <asp:Parameter Name="FinalProctorX" Type="Boolean" />
                                <asp:Parameter Name="UseDefault" Type="Boolean" />
                                <asp:Parameter Name="Lockdown" Type="Boolean" />
                                <asp:Parameter Name="LockdownMid" Type="Boolean" />
                                <asp:Parameter Name="LockdownFinal" Type="Boolean" />
                                <asp:Parameter Name="Essay" Type="Boolean" />
                                <asp:Parameter Name="FinalEssay" Type="Boolean" />
                                <asp:Parameter Name="PM_ANXMTR" Type="String" />
                                <asp:Parameter Name="PF_ANXMTR" Type="String" />
                            </InsertParameters>
                            <SelectParameters>
                                <asp:QueryStringParameter DefaultValue="678" Name="ID" QueryStringField="ID" Type="Int32" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="FamilyString" Type="String" />
                                <asp:Parameter Name="Course" Type="String" />
                                <asp:Parameter Name="Instructor" Type="String" />
                                <asp:Parameter Name="CanChange" Type="Boolean" />
                                <asp:Parameter Name="Session" Type="String" />
                                <asp:Parameter Name="IsMidterm" Type="Boolean" />
                                <asp:Parameter Name="Parent" Type="String" />
                                <asp:Parameter DbType="Date" Name="MidEnd" />
                                <asp:Parameter Name="MidNameL" Type="String" />
                                <asp:Parameter Name="MidTime" Type="Int32" />
                                <asp:Parameter Name="MidPaper" Type="Boolean" />
                                <asp:Parameter Name="MidCalculator" Type="Boolean" />
                                <asp:Parameter Name="MidGraph" Type="Boolean" />
                                <asp:Parameter Name="IsFinal" Type="Boolean" />
                                <asp:Parameter DbType="Date" Name="FinalStart" />
                                <asp:Parameter DbType="Date" Name="FinalEnd" />
                                <asp:Parameter Name="FinalNameL" Type="String" />
                                <asp:Parameter Name="FinalNameR" Type="String" />
                                <asp:Parameter Name="FinalTime" Type="Int32" />
                                <asp:Parameter Name="FinalPaper" Type="Boolean" />
                                <asp:Parameter Name="FinalGraph" Type="Boolean" />
                                <asp:Parameter Name="InstComments" Type="String" />
                                <asp:Parameter Name="Signoff" Type="Boolean" />
                                <asp:Parameter Name="MidProctorX" Type="Boolean" />
                                <asp:Parameter Name="FinalProctorX" Type="Boolean" />
                                <asp:Parameter Name="UseDefault" Type="Boolean" />
                                <asp:Parameter Name="Lockdown" Type="Boolean" />
                                <asp:Parameter Name="LockdownMid" Type="Boolean" />
                                <asp:Parameter Name="LockdownFinal" Type="Boolean" />
                                <asp:Parameter Name="Essay" Type="Boolean" />
                                <asp:Parameter Name="FinalEssay" Type="Boolean" />
                                <asp:Parameter Name="PM_ANXMTR" Type="String" />
                                <asp:Parameter Name="PF_ANXMTR" Type="String" />
                                <asp:Parameter Name="ID" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                        <telerik:RadDataForm ID="RadDataForm3" runat="server" CssClass="rdfLeftAligned rdfNoFieldHint" DataKeyNames="ID" DataSourceID="SqlDataSource5" RenderMode="Lightweight" Width="600px">
                            <LayoutTemplate>
                                <div class="RadDataForm RadDataForm_<%# Container.Skin %> rdfLeftAligned rdfNoFieldHint">
                                    <div id="itemPlaceholder" runat="server">
                                    </div>
                                    <div class="rdfPager">
                                        <span>
                                        <telerik:RadButton ID="btnFirst" runat="server" CommandArgument="First" Visible="false" CommandName="Page" CssClass="rdfActionButton rdfPageFirst" RenderMode="Lightweight" ToolTip="First">
                                            <Icon PrimaryIconCssClass="rdfIcon rdfPageFirstIcon" />
                                        </telerik:RadButton>
                                        <telerik:RadButton ID="btnPrev" runat="server" CommandArgument="Prev" CommandName="Page" Visible="false"  CssClass="rdfActionButton rdfPagePrev" RenderMode="Lightweight" ToolTip="Previous">
                                            <Icon PrimaryIconCssClass="rdfIcon rdfPagePrevIcon" />
                                        </telerik:RadButton>
                                        </span><span>
                                        <telerik:RadButton ID="btnNext" runat="server" CommandArgument="Next" CommandName="Page" Visible="false"  CssClass="rdfActionButton rdfPageNext" RenderMode="Lightweight" ToolTip="Next">
                                            <Icon PrimaryIconCssClass="rdfIcon rdfPageNextIcon" />
                                        </telerik:RadButton>
                                        <telerik:RadButton ID="btnLast" runat="server" CommandArgument="Last" CommandName="Page" Visible="false"  CssClass="rdfActionButton rdfPageLast" RenderMode="Lightweight" ToolTip="Last">
                                            <Icon PrimaryIconCssClass="rdfIcon rdfPageLastIcon" />
                                        </telerik:RadButton>
                                        </span>
                                    </div>
                                    <div style="display:none">
                                        <telerik:RadCalendar ID="rdfSharedCalendar" runat="server" RangeMinDate="<%#new DateTime(1900, 1, 1) %>" RenderMode="Lightweight" Skin="<%#Container.Skin %>" />
                                    </div>
                                    <div style="display:none">
                                        <telerik:RadTimeView ID="rdfSharedTimeView" runat="server" RenderMode="Lightweight" Skin="<%# Container.Skin %>" />
                                    </div>
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
                                        <asp:Label ID="CourseLabel2" runat="server" CssClass="rdfLabel" Text="Course"></asp:Label>
                                        <asp:Label ID="CourseLabel1" runat="server" CssClass="rdfFieldValue" Text='<%# Eval("Course") %>' />
                                    </div>
                                    <div class="rdfRow">
                                        <asp:Label ID="InstructorLabel2" runat="server" CssClass="rdfLabel" Text="Instructor"></asp:Label>
                                        <asp:Label ID="InstructorLabel1" runat="server" CssClass="rdfFieldValue" Text='<%# Eval("Instructor") %>' />
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
                                        <asp:Label ID="ParentLabel2" runat="server" CssClass="rdfLabel" Text="Parent"></asp:Label>
                                        <asp:Label ID="ParentLabel1" runat="server" CssClass="rdfFieldValue" Text='<%# Eval("Parent") %>' />
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
                                        <asp:Label ID="FinalNameRLabel2" runat="server" CssClass="rdfLabel" Text="FinalNameR"></asp:Label>
                                        <asp:Label ID="FinalNameRLabel1" runat="server" CssClass="rdfFieldValue" Text='<%# Eval("FinalNameR") %>' />
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
                                        <asp:Label ID="FinalGraphLabel2" runat="server" AssociatedControlID="FinalGraphCheckBox" CssClass="rdfLabel" Text="FinalGraph"></asp:Label>
                                        <asp:CheckBox ID="FinalGraphCheckBox" runat="server" Checked='<%# Eval("FinalGraph") %>' Enabled="false" />
                                    </div>
                                    <div class="rdfRow">
                                        <asp:Label ID="InstCommentsLabel2" runat="server" CssClass="rdfLabel" Text="InstComments"></asp:Label>
                                        <asp:Label ID="InstCommentsLabel1" runat="server" CssClass="rdfFieldValue" Text='<%# Eval("InstComments") %>' />
                                    </div>
                                    <div class="rdfRow">
                                        <asp:Label ID="SignoffLabel2" runat="server" AssociatedControlID="SignoffCheckBox" CssClass="rdfLabel" Text="Signoff"></asp:Label>
                                        <asp:CheckBox ID="SignoffCheckBox" runat="server" Checked='<%# Eval("Signoff") %>' Enabled="false" />
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
                                        <asp:Label ID="EssayLabel2" runat="server" AssociatedControlID="EssayCheckBox" CssClass="rdfLabel" Text="Essay"></asp:Label>
                                        <asp:CheckBox ID="EssayCheckBox" runat="server" Checked='<%# Eval("Essay") %>' Enabled="false" />
                                    </div>
                                    <div class="rdfRow">
                                        <asp:Label ID="FinalEssayLabel2" runat="server" AssociatedControlID="FinalEssayCheckBox" CssClass="rdfLabel" Text="FinalEssay"></asp:Label>
                                        <asp:CheckBox ID="FinalEssayCheckBox" runat="server" Checked='<%# Eval("FinalEssay") %>' Enabled="false" />
                                    </div>
                                    <div class="rdfRow">
                                        <asp:Label ID="PM_ANXMTRLabel2" runat="server" CssClass="rdfLabel" Text="PM_ANXMTR"></asp:Label>
                                        <asp:Label ID="PM_ANXMTRLabel1" runat="server" CssClass="rdfFieldValue" Text='<%# Eval("PM_ANXMTR") %>' />
                                    </div>
                                    <div class="rdfRow">
                                        <asp:Label ID="PF_ANXMTRLabel2" runat="server" CssClass="rdfLabel" Text="PF_ANXMTR"></asp:Label>
                                        <asp:Label ID="PF_ANXMTRLabel1" runat="server" CssClass="rdfFieldValue" Text='<%# Eval("PF_ANXMTR") %>' />
                                    </div>
                                    <div class="rdfCommandButtons">
                                        <hr class="rdfHr" />
                                        <telerik:RadButton ID="InitInsertButton" runat="server" ButtonType="SkinnedButton"  Visible="false" CausesValidation="False" CommandName="InitInsert" RenderMode="Lightweight" Text="Insert" ToolTip="Insert" />
                                        <telerik:RadButton ID="EditButton" runat="server" ButtonType="SkinnedButton" CausesValidation="False" CommandName="Edit" RenderMode="Lightweight" Text="Edit" ToolTip="Edit" />
                                        <telerik:RadButton ID="DeleteButton" runat="server" ButtonType="SkinnedButton"  Visible="false" CausesValidation="False" CommandName="Delete" RenderMode="Lightweight" Text="Delete" ToolTip="Delete" />
                                    </div>
                                </fieldset>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <fieldset class="rdfFieldset rdfBorders">
                                    <legend class="rdfLegend">Edit</legend>
                                    <div class="rdfRow">
                                        <asp:Label ID="IDLabel2" runat="server" CssClass="rdfLabel" Text="ID"></asp:Label>
                                        <asp:Label ID="IDLabel1" runat="server" CssClass="rdfFieldValue" Text='<%# Eval("ID") %>' />
                                    </div>
                                    <div class="rdfRow">
                                        <asp:Label ID="FamilyStringLabel2" runat="server" AssociatedControlID="FamilyStringTextBox" CssClass="rdfLabel" Text="FamilyString"></asp:Label>
                                        <telerik:RadTextBox ID="FamilyStringTextBox" runat="server" RenderMode="Lightweight" Text='<%# Bind("FamilyString") %>' WrapperCssClass="rdfInput" />
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
                                        <asp:Label ID="ParentLabel2" runat="server" AssociatedControlID="ParentTextBox" CssClass="rdfLabel" Text="Parent"></asp:Label>
                                        <telerik:RadTextBox ID="ParentTextBox" runat="server" RenderMode="Lightweight" Text='<%# Bind("Parent") %>' WrapperCssClass="rdfInput" />
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
                                        <asp:Label ID="FinalNameRLabel2" runat="server" AssociatedControlID="FinalNameRTextBox" CssClass="rdfLabel" Text="FinalNameR"></asp:Label>
                                        <telerik:RadTextBox ID="FinalNameRTextBox" runat="server" RenderMode="Lightweight" Text='<%# Bind("FinalNameR") %>' WrapperCssClass="rdfInput" />
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
                                        <asp:Label ID="FinalGraphLabel2" runat="server" AssociatedControlID="FinalGraphCheckBox" CssClass="rdfLabel" Text="FinalGraph"></asp:Label>
                                        <asp:CheckBox ID="FinalGraphCheckBox" runat="server" Checked='<%# Bind("FinalGraph") %>' />
                                    </div>
                                    <div class="rdfRow">
                                        <asp:Label ID="InstCommentsLabel2" runat="server" AssociatedControlID="InstCommentsTextBox" CssClass="rdfLabel" Text="InstComments"></asp:Label>
                                        <telerik:RadTextBox ID="InstCommentsTextBox" runat="server" RenderMode="Lightweight" Text='<%# Bind("InstComments") %>' WrapperCssClass="rdfInput" />
                                    </div>
                                    <div class="rdfRow">
                                        <asp:Label ID="SignoffLabel2" runat="server" AssociatedControlID="SignoffCheckBox" CssClass="rdfLabel" Text="Signoff"></asp:Label>
                                        <asp:CheckBox ID="SignoffCheckBox" runat="server" Checked='<%# Bind("Signoff") %>' />
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
                                        <asp:Label ID="EssayLabel2" runat="server" AssociatedControlID="EssayCheckBox" CssClass="rdfLabel" Text="Essay"></asp:Label>
                                        <asp:CheckBox ID="EssayCheckBox" runat="server" Checked='<%# Bind("Essay") %>' />
                                    </div>
                                    <div class="rdfRow">
                                        <asp:Label ID="FinalEssayLabel2" runat="server" AssociatedControlID="FinalEssayCheckBox" CssClass="rdfLabel" Text="FinalEssay"></asp:Label>
                                        <asp:CheckBox ID="FinalEssayCheckBox" runat="server" Checked='<%# Bind("FinalEssay") %>' />
                                    </div>
                                    <div class="rdfRow">
                                        <asp:Label ID="PM_ANXMTRLabel2" runat="server" AssociatedControlID="PM_ANXMTRTextBox" CssClass="rdfLabel" Text="PM_ANXMTR"></asp:Label>
                                        <telerik:RadTextBox ID="PM_ANXMTRTextBox" runat="server" RenderMode="Lightweight" Text='<%# Bind("PM_ANXMTR") %>' WrapperCssClass="rdfInput" />
                                    </div>
                                    <div class="rdfRow">
                                        <asp:Label ID="PF_ANXMTRLabel2" runat="server" AssociatedControlID="PF_ANXMTRTextBox" CssClass="rdfLabel" Text="PF_ANXMTR"></asp:Label>
                                        <telerik:RadTextBox ID="PF_ANXMTRTextBox" runat="server" RenderMode="Lightweight" Text='<%# Bind("PF_ANXMTR") %>' WrapperCssClass="rdfInput" />
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
                                        <asp:Label ID="CourseLabel2" runat="server" AssociatedControlID="CourseTextBox" CssClass="rdfLabel" Text="Course"></asp:Label>
                                        <telerik:RadTextBox ID="CourseTextBox" runat="server" RenderMode="Lightweight" Text='<%# Bind("Course") %>' WrapperCssClass="rdfInput" />
                                    </div>
                                    <div class="rdfRow">
                                        <asp:Label ID="InstructorLabel2" runat="server" AssociatedControlID="InstructorTextBox" CssClass="rdfLabel" Text="Instructor"></asp:Label>
                                        <telerik:RadTextBox ID="InstructorTextBox" runat="server" RenderMode="Lightweight" Text='<%# Bind("Instructor") %>' WrapperCssClass="rdfInput" />
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
                                        <asp:Label ID="ParentLabel2" runat="server" AssociatedControlID="ParentTextBox" CssClass="rdfLabel" Text="Parent"></asp:Label>
                                        <telerik:RadTextBox ID="ParentTextBox" runat="server" RenderMode="Lightweight" Text='<%# Bind("Parent") %>' WrapperCssClass="rdfInput" />
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
                                        <asp:Label ID="FinalNameRLabel2" runat="server" AssociatedControlID="FinalNameRTextBox" CssClass="rdfLabel" Text="FinalNameR"></asp:Label>
                                        <telerik:RadTextBox ID="FinalNameRTextBox" runat="server" RenderMode="Lightweight" Text='<%# Bind("FinalNameR") %>' WrapperCssClass="rdfInput" />
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
                                        <asp:Label ID="FinalGraphLabel2" runat="server" AssociatedControlID="FinalGraphCheckBox" CssClass="rdfLabel" Text="FinalGraph"></asp:Label>
                                        <asp:CheckBox ID="FinalGraphCheckBox" runat="server" Checked='<%# Bind("FinalGraph") %>' />
                                    </div>
                                    <div class="rdfRow">
                                        <asp:Label ID="InstCommentsLabel2" runat="server" AssociatedControlID="InstCommentsTextBox" CssClass="rdfLabel" Text="InstComments"></asp:Label>
                                        <telerik:RadTextBox ID="InstCommentsTextBox" runat="server" RenderMode="Lightweight" Text='<%# Bind("InstComments") %>' WrapperCssClass="rdfInput" />
                                    </div>
                                    <div class="rdfRow">
                                        <asp:Label ID="SignoffLabel2" runat="server" AssociatedControlID="SignoffCheckBox" CssClass="rdfLabel" Text="Signoff"></asp:Label>
                                        <asp:CheckBox ID="SignoffCheckBox" runat="server" Checked='<%# Bind("Signoff") %>' />
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
                                        <asp:Label ID="EssayLabel2" runat="server" AssociatedControlID="EssayCheckBox" CssClass="rdfLabel" Text="Essay"></asp:Label>
                                        <asp:CheckBox ID="EssayCheckBox" runat="server" Checked='<%# Bind("Essay") %>' />
                                    </div>
                                    <div class="rdfRow">
                                        <asp:Label ID="FinalEssayLabel2" runat="server" AssociatedControlID="FinalEssayCheckBox" CssClass="rdfLabel" Text="FinalEssay"></asp:Label>
                                        <asp:CheckBox ID="FinalEssayCheckBox" runat="server" Checked='<%# Bind("FinalEssay") %>' />
                                    </div>
                                    <div class="rdfRow">
                                        <asp:Label ID="PM_ANXMTRLabel2" runat="server" AssociatedControlID="PM_ANXMTRTextBox" CssClass="rdfLabel" Text="PM_ANXMTR"></asp:Label>
                                        <telerik:RadTextBox ID="PM_ANXMTRTextBox" runat="server" RenderMode="Lightweight" Text='<%# Bind("PM_ANXMTR") %>' WrapperCssClass="rdfInput" />
                                    </div>
                                    <div class="rdfRow">
                                        <asp:Label ID="PF_ANXMTRLabel2" runat="server" AssociatedControlID="PF_ANXMTRTextBox" CssClass="rdfLabel" Text="PF_ANXMTR"></asp:Label>
                                        <telerik:RadTextBox ID="PF_ANXMTRTextBox" runat="server" RenderMode="Lightweight" Text='<%# Bind("PF_ANXMTR") %>' WrapperCssClass="rdfInput" />
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








                    <td  bgcolor="AliceBlue">

        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="  Select [MasterName]
      ,[Course]
      ,[Term]
      ,[PM_EXISTS] as MidExists
      ,[PM_DURATION] as MidTime
      ,[PM_MG]
      ,[PM_MG_FB]
      ,[PM_MG_ES] as midEssay
      ,[PM_MG_SA]
      ,[PM_MG_OTHER]
      ,[PM_REQ_ANX] as MidReqAnx
      ,[PM_LIST_MTRLS_OPT1] as Paper_pen
      ,[PM_LIST_MTRLS_OPT2] as simpleCalc
      ,[PM_LIST_MTRLS_OPT3] as Graphing
      ,[PM_LIST_ANXMTRLS] as MidAnx
      ,[PM_LCL_NAME] as MidLcl
      ,[PM_RMT_NAME] as MidRmt
      ,[PM_WEIGHT] as MidWeight
      ,[PF_EXISTS] As FInalExists
      ,[PF_DURATION] AS FinalTime
      ,[PF_MG]
      ,[PF_MG_FB]
      ,[PF_MG_ES] as Essay
      ,[PF_MG_SA]
      ,[PF_MG_OTHER]
      ,[PF_REQ_ANX]
      ,[PF_LIST_MTRLS_OPT1] as Paper
      ,[PF_LIST_MTRLS_OPT2] as Calculator
      ,[PF_LIST_MTRLS_OPT3] as Graph
      ,[PF_LIST_ANXMTRLS] as Final_Anx
      ,[PF_LCL_NAME] as LclName
      ,[PF_RMT_NAME] as RmtName
      ,[PF_WEIGHT] as FinalWeight
     FROM [OL_MasterExam] WHERE (([Course] = @Course) )">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="ENC1101" Name="Course" QueryStringField="Course" />
            </SelectParameters>
                        </asp:SqlDataSource>

                        <telerik:RadDataForm ID="RadDataForm2" runat="server"  CssClass="rdfLeftAligned rdfNoFieldHint" DataSourceID="SqlDataSource2" RenderMode="Lightweight" Skin="WebBlue" Width="50px">
            <LayoutTemplate>
                <div class="RadDataForm RadDataForm_<%# Container.Skin %> rdfLeftAligned rdfNoFieldHint">
                    <div id="itemPlaceholder" runat="server">
                    </div>
   
                    </div>
                </div>
</LayoutTemplate>
            <ItemTemplate>
                <fieldset class="rdfFieldset rdfBorders">
                    <legend class="rdfLegend">Master Course Data</legend>
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
                        <asp:Label ID="MidExistsLabel2" runat="server" AssociatedControlID="MidExistsCheckBox" CssClass="rdfLabel" Text="MidExists"></asp:Label>
                        <asp:CheckBox ID="MidExistsCheckBox" runat="server" Checked='<%# Eval("MidExists") %>' Enabled="false" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="MidTimeLabel2" runat="server" CssClass="rdfLabel" Text="MidTime"></asp:Label>
                        <asp:Label ID="MidTimeLabel1" runat="server" CssClass="rdfFieldValue" Text='<%# Eval("MidTime") %>' />
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
                        <asp:Label ID="midEssayLabel2" runat="server" AssociatedControlID="midEssayCheckBox" CssClass="rdfLabel" Text="midEssay"></asp:Label>
                        <asp:CheckBox ID="midEssayCheckBox" runat="server" Checked='<%# Eval("midEssay") %>' Enabled="false" />
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
                        <asp:Label ID="MidReqAnxLabel2" runat="server" AssociatedControlID="MidReqAnxCheckBox" CssClass="rdfLabel" Text="MidReqAnx"></asp:Label>
                        <asp:CheckBox ID="MidReqAnxCheckBox" runat="server" Checked='<%# Eval("MidReqAnx") %>' Enabled="false" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="Paper_penLabel2" runat="server" AssociatedControlID="Paper_penCheckBox" CssClass="rdfLabel" Text="Paper_pen"></asp:Label>
                        <asp:CheckBox ID="Paper_penCheckBox" runat="server" Checked='<%# Eval("Paper_pen") %>' Enabled="false" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="simpleCalcLabel2" runat="server" AssociatedControlID="simpleCalcCheckBox" CssClass="rdfLabel" Text="simpleCalc"></asp:Label>
                        <asp:CheckBox ID="simpleCalcCheckBox" runat="server" Checked='<%# Eval("simpleCalc") %>' Enabled="false" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="GraphingLabel2" runat="server" AssociatedControlID="GraphingCheckBox" CssClass="rdfLabel" Text="Graphing"></asp:Label>
                        <asp:CheckBox ID="GraphingCheckBox" runat="server" Checked='<%# Eval("Graphing") %>' Enabled="false" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="MidAnxLabel2" runat="server" CssClass="rdfLabel" Text="MidAnx"></asp:Label>
                        <asp:Label ID="MidAnxLabel1" runat="server" CssClass="rdfFieldValue" Text='<%# Eval("MidAnx") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="MidLclLabel2" runat="server" CssClass="rdfLabel" Text="MidLcl"></asp:Label>
                        <asp:Label ID="MidLclLabel1" runat="server" CssClass="rdfFieldValue" Text='<%# Eval("MidLcl") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="MidRmtLabel2" runat="server" CssClass="rdfLabel" Text="MidRmt"></asp:Label>
                        <asp:Label ID="MidRmtLabel1" runat="server" CssClass="rdfFieldValue" Text='<%# Eval("MidRmt") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="MidWeightLabel2" runat="server" CssClass="rdfLabel" Text="MidWeight"></asp:Label>
                        <asp:Label ID="MidWeightLabel1" runat="server" CssClass="rdfFieldValue" Text='<%# Eval("MidWeight") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="FInalExistsLabel2" runat="server" AssociatedControlID="FInalExistsCheckBox" CssClass="rdfLabel" Text="FInalExists"></asp:Label>
                        <asp:CheckBox ID="FInalExistsCheckBox" runat="server" Checked='<%# Eval("FInalExists") %>' Enabled="false" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="FinalTimeLabel2" runat="server" CssClass="rdfLabel" Text="FinalTime"></asp:Label>
                        <asp:Label ID="FinalTimeLabel1" runat="server" CssClass="rdfFieldValue" Text='<%# Eval("FinalTime") %>' />
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
                        <asp:Label ID="EssayLabel2" runat="server" AssociatedControlID="EssayCheckBox" CssClass="rdfLabel" Text="Essay"></asp:Label>
                        <asp:CheckBox ID="EssayCheckBox" runat="server" Checked='<%# Eval("Essay") %>' Enabled="false" />
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
                        <asp:Label ID="PaperLabel2" runat="server" AssociatedControlID="PaperCheckBox" CssClass="rdfLabel" Text="Paper"></asp:Label>
                        <asp:CheckBox ID="PaperCheckBox" runat="server" Checked='<%# Eval("Paper") %>' Enabled="false" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="CalculatorLabel2" runat="server" AssociatedControlID="CalculatorCheckBox" CssClass="rdfLabel" Text="Calculator"></asp:Label>
                        <asp:CheckBox ID="CalculatorCheckBox" runat="server" Checked='<%# Eval("Calculator") %>' Enabled="false" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="GraphLabel2" runat="server" AssociatedControlID="GraphCheckBox" CssClass="rdfLabel" Text="Graph"></asp:Label>
                        <asp:CheckBox ID="GraphCheckBox" runat="server" Checked='<%# Eval("Graph") %>' Enabled="false" />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="Final_AnxLabel2" runat="server" CssClass="rdfLabel" Text="Final_Anx"></asp:Label>
                        <asp:Label ID="Final_AnxLabel1" runat="server" CssClass="rdfFieldValue" Text='<%# Eval("Final_Anx") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="LclNameLabel2" runat="server" CssClass="rdfLabel" Text="LclName"></asp:Label>
                        <asp:Label ID="LclNameLabel1" runat="server" CssClass="rdfFieldValue" Text='<%# Eval("LclName") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="RmtNameLabel2" runat="server" CssClass="rdfLabel" Text="RmtName"></asp:Label>
                        <asp:Label ID="RmtNameLabel1" runat="server" CssClass="rdfFieldValue" Text='<%# Eval("RmtName") %>' />
                    </div>
                    <div class="rdfRow">
                        <asp:Label ID="FinalWeightLabel2" runat="server" CssClass="rdfLabel" Text="FinalWeight"></asp:Label>
                        <asp:Label ID="FinalWeightLabel1" runat="server" CssClass="rdfFieldValue" Text='<%# Eval("FinalWeight") %>' />
                    </div>


                </fieldset>
            </ItemTemplate>
 
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
        </div>

        <asp:SqlDataSource ID="SqlDataSource3" runat="server"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server"></asp:SqlDataSource>

    </form>
</body>
</html>
