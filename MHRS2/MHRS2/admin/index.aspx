<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="MHRS2.admin.index" MasterPageFile="~/admin/admin.Master" %>

<asp:Content ID="conten1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <table>
        <tr>
            <td>Kullanıcı Adı</td>
              <td style="width: 567px">
                  <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>
            </td>
        </tr> <tr>
            <td>Şifre</td>
              <td style="width: 567px">
                  <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
              <td style="width: 567px">
                  <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary btn-large" OnClick="Button1_Click" Text="Button" />
            </td>
        </tr>
    </table>
   


</asp:Content>
