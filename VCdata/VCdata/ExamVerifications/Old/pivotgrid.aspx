<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="pivotgrid.aspx.vb" Inherits="VCdata.pivotgrid" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 30%;
        }
        .RadDataForm {
    width:500px;
}
          .rdfLabel {
              font-weight: bold;
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
        <br />
        <br />
        <telerik:RadFormDecorator ID="RadFormDecorator1" Runat="server" DecoratedControls="CheckBoxes" Skin="Material" />
        <br />

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
     FROM [OL_MasterExam] WHERE (([Course] = 'LIT2000' ) )"></asp:SqlDataSource>
        <table class="auto-style1">
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;


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
        <br />
    
        <br />
    </form>
</body>
</html>
