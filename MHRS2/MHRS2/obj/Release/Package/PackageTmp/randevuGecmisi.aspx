<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="randevuGecmisi.aspx.cs" Inherits="MHRS2.randevuGecmisi" %>

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
		<div class="col-md-12 solSecimAlani">
            <table class="table table-hover">
                <thead>
                    <th>Hastane</th>
                    <th>Doktor</th>
                    <th>Tarih</th>
                    <th>Klinik</th>
                    
                </thead>
               
            
			<asp:Repeater ID="Repeater1" runat="server">
                <ItemTemplate>
                  <tr> 
                      <td><%#Eval("hadi") %></td>
                      <td><%#Eval("hekimAdi") %></td>
                      <td><%# string.Format("{0:dd MMMM yyyy}", Eval("tarih"))  %> / <%#Eval("saat") %>  </td>
                      <td><%#Eval("klinikAdi") %></td>
                 
                </tr>
                </ItemTemplate>
            </asp:Repeater>
          </table>

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