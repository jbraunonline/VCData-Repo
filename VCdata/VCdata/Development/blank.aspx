<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="blank.aspx.vb" Inherits="VCdata.blank" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    </head>
<body>
    <form id="form1" runat="server">
<EditFormSettings EditFormType="Template">
                    <FormTemplate>
       <table id="Table2" cellspacing="2" cellpadding="1" width="100%" border="0" rules="none"
           style="border-collapse: collapse;">
        <tr >
            <td >
                <b>Employee Details</b>
            </td>
        </tr>
        <tr>
            <td >
                Country:
                <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Country") %>' BackColor="#CCFFFF"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                City:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     
                <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("City") %>' BackColor="#CCFFFF" ></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="left" >
                <asp:Button ID="btnUpdate" Text='<%# IIf((TypeOf (Container) Is GridEditFormInsertItem), "Insert", "Update") %>'
                            runat="server" CommandName='<%# IIf((TypeOf (Container) Is GridEditFormInsertItem), "PerformInsert", "Update")%>'></asp:Button>&nbsp;
                <asp:Button ID="btnCancel" Text="Cancel" runat="server" CausesValidation="False"
                            CommandName="Cancel"></asp:Button>
            </td>
        </tr>
    </table>
                    </FormTemplate>
                </EditFormSettings>
    </form>
</body>
</html>
