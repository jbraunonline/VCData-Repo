<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="CMRtest.aspx.vb" Inherits="VCdata.CMRtest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
        <telerik:RadGrid ID="RadGrid1" runat="server" AllowAutomaticUpdates="True" AllowFilteringByColumn="True" AllowSorting="True" AutoGenerateEditColumn="True" DataSourceID="SqlDataSource1" ShowGroupPanel="True" Skin="WebBlue" CellSpacing="-1" GridLines="Both">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
            <ClientSettings AllowColumnsReorder="True" AllowDragToGroup="True" ReorderColumnsOnClient="True">
                <Selecting AllowRowSelect="True" />
            </ClientSettings>
            <MasterTableView AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource1">
                <Columns>
                    <telerik:GridBoundColumn DataField="ID" DataType="System.Int32" FilterControlAltText="Filter ID column" HeaderText="ID" ReadOnly="True" SortExpression="ID" UniqueName="ID">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="EMPLID" FilterControlAltText="Filter EMPLID column" HeaderText="EMPLID" SortExpression="EMPLID" UniqueName="EMPLID">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="MDID" FilterControlAltText="Filter MDID column" HeaderText="MDID" SortExpression="MDID" UniqueName="MDID">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Instructor" FilterControlAltText="Filter Instructor column" HeaderText="Instructor" SortExpression="Instructor" UniqueName="Instructor">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="LastName" FilterControlAltText="Filter LastName column" HeaderText="LastName" SortExpression="LastName" UniqueName="LastName">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="FirstName" FilterControlAltText="Filter FirstName column" HeaderText="FirstName" SortExpression="FirstName" UniqueName="FirstName">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Calendar" FilterControlAltText="Filter Calendar column" HeaderText="Calendar" SortExpression="Calendar" UniqueName="Calendar">
                    </telerik:GridBoundColumn>
                    <telerik:GridCheckBoxColumn DataField="NewVC" DataType="System.Boolean" FilterControlAltText="Filter NewVC column" HeaderText="NewVC" SortExpression="NewVC" UniqueName="NewVC">
                    </telerik:GridCheckBoxColumn>
                    <telerik:GridBoundColumn DataField="Outlook" FilterControlAltText="Filter Outlook column" HeaderText="Outlook" SortExpression="Outlook" UniqueName="Outlook">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="FTorPT" FilterControlAltText="Filter FTorPT column" HeaderText="FTorPT" SortExpression="FTorPT" UniqueName="FTorPT">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Chair" FilterControlAltText="Filter Chair column" HeaderText="Chair" SortExpression="Chair" UniqueName="Chair">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ChairOutlook" FilterControlAltText="Filter ChairOutlook column" HeaderText="ChairOutlook" SortExpression="ChairOutlook" UniqueName="ChairOutlook">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Location" FilterControlAltText="Filter Location column" HeaderText="Location" SortExpression="Location" UniqueName="Location">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Campus" FilterControlAltText="Filter Campus column" HeaderText="Campus" SortExpression="Campus" UniqueName="Campus">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ReportingSchool" FilterControlAltText="Filter ReportingSchool column" HeaderText="ReportingSchool" SortExpression="ReportingSchool" UniqueName="ReportingSchool">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="ReportingCampus" FilterControlAltText="Filter ReportingCampus column" HeaderText="ReportingCampus" SortExpression="ReportingCampus" UniqueName="ReportingCampus">
                    </telerik:GridBoundColumn>
                    <telerik:GridCheckBoxColumn DataField="CanChange" DataType="System.Boolean" FilterControlAltText="Filter CanChange column" HeaderText="CanChange" SortExpression="CanChange" UniqueName="CanChange">
                    </telerik:GridCheckBoxColumn>
                    <telerik:GridCheckBoxColumn DataField="BBTrain" DataType="System.Boolean" FilterControlAltText="Filter BBTrain column" HeaderText="BBTrain" SortExpression="BBTrain" UniqueName="BBTrain">
                    </telerik:GridCheckBoxColumn>
                    <telerik:GridCheckBoxColumn DataField="VCCertComp" DataType="System.Boolean" FilterControlAltText="Filter VCCertComp column" HeaderText="VCCertComp" SortExpression="VCCertComp" UniqueName="VCCertComp">
                    </telerik:GridCheckBoxColumn>
                    <telerik:GridCheckBoxColumn DataField="VCDevComp" DataType="System.Boolean" FilterControlAltText="Filter VCDevComp column" HeaderText="VCDevComp" SortExpression="VCDevComp" UniqueName="VCDevComp">
                    </telerik:GridCheckBoxColumn>
                    <telerik:GridBoundColumn DataField="Developer" FilterControlAltText="Filter Developer column" HeaderText="Developer" SortExpression="Developer" UniqueName="Developer">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="CredentialsApproved" FilterControlAltText="Filter CredentialsApproved column" HeaderText="CredentialsApproved" SortExpression="CredentialsApproved" UniqueName="CredentialsApproved">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="CredentialsPending" FilterControlAltText="Filter CredentialsPending column" HeaderText="CredentialsPending" SortExpression="CredentialsPending" UniqueName="CredentialsPending">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Notes" FilterControlAltText="Filter Notes column" HeaderText="Notes" SortExpression="Notes" UniqueName="Notes">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [VC_InstructorTab] WHERE [ID] = @ID" InsertCommand="INSERT INTO [VC_InstructorTab] ([EMPLID], [MDID], [Instructor], [LastName], [FirstName], [Calendar], [NewVC], [Outlook], [FTorPT], [Chair], [ChairOutlook], [Location], [Campus], [ReportingSchool], [ReportingCampus], [CanChange], [BBTrain], [VCCertComp], [VCDevComp], [Developer], [CredentialsApproved], [CredentialsPending], [Notes]) VALUES (@EMPLID, @MDID, @Instructor, @LastName, @FirstName, @Calendar, @NewVC, @Outlook, @FTorPT, @Chair, @ChairOutlook, @Location, @Campus, @ReportingSchool, @ReportingCampus, @CanChange, @BBTrain, @VCCertComp, @VCDevComp, @Developer, @CredentialsApproved, @CredentialsPending, @Notes)" SelectCommand="SELECT * FROM [VC_InstructorTab]" UpdateCommand="UPDATE [VC_InstructorTab] SET [EMPLID] = @EMPLID, [MDID] = @MDID, [Instructor] = @Instructor, [LastName] = @LastName, [FirstName] = @FirstName, [Calendar] = @Calendar, [NewVC] = @NewVC, [Outlook] = @Outlook, [FTorPT] = @FTorPT, [Chair] = @Chair, [ChairOutlook] = @ChairOutlook, [Location] = @Location, [Campus] = @Campus, [ReportingSchool] = @ReportingSchool, [ReportingCampus] = @ReportingCampus, [CanChange] = @CanChange, [BBTrain] = @BBTrain, [VCCertComp] = @VCCertComp, [VCDevComp] = @VCDevComp, [Developer] = @Developer, [CredentialsApproved] = @CredentialsApproved, [CredentialsPending] = @CredentialsPending, [Notes] = @Notes WHERE [ID] = @ID">
            <DeleteParameters>
                <asp:Parameter Name="ID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="EMPLID" Type="String" />
                <asp:Parameter Name="MDID" Type="String" />
                <asp:Parameter Name="Instructor" Type="String" />
                <asp:Parameter Name="LastName" Type="String" />
                <asp:Parameter Name="FirstName" Type="String" />
                <asp:Parameter Name="Calendar" Type="String" />
                <asp:Parameter Name="NewVC" Type="Boolean" />
                <asp:Parameter Name="Outlook" Type="String" />
                <asp:Parameter Name="FTorPT" Type="String" />
                <asp:Parameter Name="Chair" Type="String" />
                <asp:Parameter Name="ChairOutlook" Type="String" />
                <asp:Parameter Name="Location" Type="String" />
                <asp:Parameter Name="Campus" Type="String" />
                <asp:Parameter Name="ReportingSchool" Type="String" />
                <asp:Parameter Name="ReportingCampus" Type="String" />
                <asp:Parameter Name="CanChange" Type="Boolean" />
                <asp:Parameter Name="BBTrain" Type="Boolean" />
                <asp:Parameter Name="VCCertComp" Type="Boolean" />
                <asp:Parameter Name="VCDevComp" Type="Boolean" />
                <asp:Parameter Name="Developer" Type="String" />
                <asp:Parameter Name="CredentialsApproved" Type="String" />
                <asp:Parameter Name="CredentialsPending" Type="String" />
                <asp:Parameter Name="Notes" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="EMPLID" Type="String" />
                <asp:Parameter Name="MDID" Type="String" />
                <asp:Parameter Name="Instructor" Type="String" />
                <asp:Parameter Name="LastName" Type="String" />
                <asp:Parameter Name="FirstName" Type="String" />
                <asp:Parameter Name="Calendar" Type="String" />
                <asp:Parameter Name="NewVC" Type="Boolean" />
                <asp:Parameter Name="Outlook" Type="String" />
                <asp:Parameter Name="FTorPT" Type="String" />
                <asp:Parameter Name="Chair" Type="String" />
                <asp:Parameter Name="ChairOutlook" Type="String" />
                <asp:Parameter Name="Location" Type="String" />
                <asp:Parameter Name="Campus" Type="String" />
                <asp:Parameter Name="ReportingSchool" Type="String" />
                <asp:Parameter Name="ReportingCampus" Type="String" />
                <asp:Parameter Name="CanChange" Type="Boolean" />
                <asp:Parameter Name="BBTrain" Type="Boolean" />
                <asp:Parameter Name="VCCertComp" Type="Boolean" />
                <asp:Parameter Name="VCDevComp" Type="Boolean" />
                <asp:Parameter Name="Developer" Type="String" />
                <asp:Parameter Name="CredentialsApproved" Type="String" />
                <asp:Parameter Name="CredentialsPending" Type="String" />
                <asp:Parameter Name="Notes" Type="String" />
                <asp:Parameter Name="ID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
