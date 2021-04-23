<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="GetOL_MasterExamFromVCData1.aspx.vb" Inherits="VCdata.GetOL_MasterExamFromVCData1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        Each term, must copy vcdata1 OL_MasterExam to vcData to get correct Exam data<br />
        1. Drop vcData.OL_MasterExam<br />
        2. Copy correct VCVCdata1.OL_MasterExam for the correct term into vcvcdata<br />
        <br />
        <br />
        Select * into [VC_VCData].[dbo].[OL_MasterExam] from <br />
        [VC_VCData1].[dbo].[OL_MasterExam]
        <br />
        Where [VC_VCData1].[dbo].[OL_MasterExam].[Term]= &#39;2203&#39;<br />
        <br />
        Clean&nbsp; Up NULLS<br />
        <br />
        Ditto for OL_Catalog<br />
        <br />
        Drop vcVCdata.OL_Catalog<br />
        <br />
        Select * into [VC_VCData].[dbo].[OL_Catalog] from <br />
        [VC_VCData1].[dbo].[OL_Catalog]</form>
</body>
</html>
