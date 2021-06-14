<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="uyeProfil.aspx.cs" Inherits="MHRS2.uyeProfil" %>
<!DOCTYPE html>
<html lang="en">
<head runat="server">
	<meta charset="UTF-8">
	<title>Mhrs Giriş</title>
	<link rel="stylesheet" href="Content/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="Content/css/custom.css">
<link rel="stylesheet" type="text/css" href="Content/css/font-awesome.min.css">

<script type="text/javascript" src="Content/js/jquery-1.11.3.min.js"></script>
<script src="Content/js/bootstrap.min.js"></script>
<script src="Content/js/select2.js"></script>
<link rel="stylesheet" type="text/css" href="Content/css/select2-bootstrap.css"/>
</head>
<body>

    <form id="form1" runat="server">

<div id="header">
	<div class="container">
		<ul id="menu">
			<li><a href="randevu.aspx" class="aktif"> <i class="fa fa-home fa-lg"></i> Anasayfa</a></li>
			<li><a href="cikis.aspx">Çıkış</a></li>
			
		</ul>
	</div>
</div>
<div id="modal">

</div>
<div class="container">
<div class="well">
<!-- menu-->
	<div id="menu">
		<div class="kutu">
			<a href="randevuGecmisi.aspx"><i class="fa fa-calendar-check-o"></i>
			Randevu Geçmişi</a>
		</div>
		<div class="kutu mavi">
			<a href="uyeProfil.aspx"><i class="fa fa-user"></i>
			Hesap Bilgileri</a>
		</div>
		<div class="kutu kirmizi">
			<a href="cikis.aspx"><i class="fa fa-power-off"></i>
			Çıkış</a>
		</div>
	<div class="clear"></div>
	</div>
<!-- menu bitiş-->
<div class="clear"></div>
	<div class="panel panel-primary">
	 <div class="panel-heading">
		<h3 class="panel-title">Sayın <% Response.Write(Session["adi"]); %> <% Response.Write(Session["soyadi"]); %></h3>
	  </div>
	  <div class="panel-body">
		<div class="col-md-6 solSecimAlani">
			<table class="table table-hover">
                <tr>
                    <td>Adı</td>
                    <td>  
                        <asp:TextBox ID="txtAdi" runat="server" CssClass="form-control" MaxLength="30"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>Soyad</td>
                    <td>  
                        <asp:TextBox ID="txtSoyadi" runat="server" CssClass="form-control" MaxLength="30"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>Şifre</td>
                    <td>  
                        <asp:TextBox ID="txtSifre" runat="server" CssClass="form-control" MaxLength="10"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>Cinsiyet</td>
                    <td>  
                        <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control">
                            <asp:ListItem Value="1">Erkek</asp:ListItem>
                            <asp:ListItem Value="0">Kadın</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>

                <tr>
                    <td>E-posta</td>
                    <td>  
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="Geçerli email adresi giriniz." ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </td>
                </tr>

                <tr>
                    <td>Telefon</td>
                    <td>  
                        <asp:TextBox ID="txtTelefon" runat="server" CssClass="form-control" MaxLength="11"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>&nbsp;</td>
                    <td>  
                        <asp:Button ID="btnGuncelle" runat="server" CssClass="btn btn-success" OnClick="btnGuncelle_Click" Text="Button" />
                        <br /><br /><br />
                        <asp:Label ID="Label1" runat="server" CssClass="alert alert-info"></asp:Label>
                    </td>
                </tr>

			</table>
          

		</div>
		<div class="col-md-6">
			
				
			</div>
		</div>
	  </div>
		
	</div>	
		

</div>





<script src="Content/js/jquery.cookie.js"></script>
<script src="Content/js/waitMe.min.js"></script>
<link href="Content/css/waitMe.min.css" rel="stylesheet" />

</div>
    </form>
</body>
</html>