<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="randevu.aspx.cs" Inherits="MHRS2.randevu" %>
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

<div id="header">
	<div class="container">
		<ul id="menu">
			<li><a href="#" class="aktif"> <i class="fa fa-home fa-lg"></i> Anasayfa</a></li>
			<li><a href="#">Çıkış</a></li>
			
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
			<table class="table">
				<tbody>
				  <tr>
					<td>İl</td>
					<td>
						<select class="select2" style="width:250px" name="" id="sehirSelect">
						  
						</select>
					</td>
					
				  <tr>
					<td>İlçe</td>
					<td>
						<select class="select2" style="width:250px" name="" id="ilceSelect">
						    
						</select>
					</td>
					
				  </tr>
				  <tr>
					<td>Hastane</td>
					<td>
						<select class="select2" style="width:250px" name="" id="hastaneSelect">
						
						</select>
					</td>
				  </tr>
				  <tr>
					<td>Klinik</td>
					<td>
					<select class="select2" style="width:250px" name="" id="klinikSelect">
						<option value="null">Lütfen Klinik Seçiniz</option>
					</select>
					</td>
				  </tr>
				  <tr>
					<td>Hekim</td>
					<td>
					<select class="select2" style="width:250px" name="" id="hekimSelect">
						<option value="null">Lütfen Hekim Seçiniz</option>
				    </select>
					</td>
				  </tr>
                   <tr>
                       <td>Tarih</td>
                       <td>
                           <input style="border:1.5px solid #ccc;padding:5px 0px;border-radius:5px;background:url('Content/images/calendar_icon.jpg') no-repeat center right" type="text" id="datepicker" name="dataPicker">
                       </td>

                   </tr>
				  <tr>
				  <td></td>
				  <td>
					<button class="btn btn-success" id="randevuAraButon"> <i class="fa fa-search"></i> Randevu Ara</button>
				  </td>
				  </tr>
				  
				  
				</tbody>
			  </table>
              <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
              <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
          
            <div class="well" id="randevuSonuc" style="display:none">
                <table class="table table-hover" style="padding:10px;">
                    <thead>
                        <tr>
                            <th>Hastane</th>
                            <th>Klinik</th>
                            <th>Doktor</th>

                        </tr>

                    </thead>
                    <tbody id="randevuSonucTable">

                    </tbody>

                </table>

            </div>
            <style>
                #randevuSonucTable tr:hover {color: #fff; background-color: #f0ad4e; border:1px solid #eea236;cursor:pointer;transition: ease-in 0.1s;color:#000;}
                #randevuSonucTable tr {margin-top:2px;padding-top:2px;}
            </style>


		</div>
		<div class="col-md-6">
			<div class="well" style="margin-top:0;padding:5px">
				<div class="sonuc">
				<!-- hoşgeldiniz mesajı -->
                
				<div class="center-block"><h4 class="text-center text-bold"><strong>Hoşgeldiniz</strong></h4> </div>
				<hr/>
				<ol class="aciklama-listesi">
				  <li><span>1.</span>adımda sol taraftaki arama araçlarını kullanarak uygun hekimlerin listesini getirebilirsiniz.</li>
				  <li><span>2.</span>adımda hekim listesinden istediğiniz hekimi seçerek hekim çalışma cetvelini görüntüleyebilirsiniz.</li>
				  <li><span>3.</span>adımda hekim çalışma cetvelinden uygun bir slot seçip randevunuzu kaydedebilirsiniz.</li>
				</ol>
				<!-- hoşgeldiniz mesajı bitiş -->
				
				<!-- randevu seçim paneli -->
				<div class="panel-group randevuSecimPaneli" style="display:none" id="accordion" role="tablist" aria-multiselectable="true">
                    
</div>
				<!-- randevu seçim paneli bitiş-->
				
				</div>
				
			</div>
		</div>
	  </div>
		
	</div>	
		

</div>


<!-- Randevu Son Aşama Modal -->
<div id="randevuSonAsama" class="modal fade" >
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">Randevu Al</h4>
            </div>
            <div class="modal-body">
			<table class="table table-bordered" id="tableRandevuKayitSonuc">
                <span id="tdUyeID" style="display:none"><% Response.Write(Session["uyeId"]); %></span>
				<tbody>
					<tr>
						<td><strong>Hastane Adı</strong></td>
						<td><span id="tdHastaneAdi"></span></td>
					</tr>
					<tr>
						<td><strong>Hekim Adı</strong></td>
						<td><span id="tdHekimAdi"></span> </td>
					</tr>
					<tr>
						<td><strong>Klinik</strong></td>
						<td><span id="tdKlinikAdi"></span></td>
					</tr>
					<tr>
						<td><strong>Hasta TC No	</strong></td>
						<td><span id="tdTC"> <% Response.Write(Session["tc"]); %></span></td>
					</tr>
					<tr>
						<td><strong>Hasta Adı</strong></td>
						<td><span id="tdHastaAdi"> <% Response.Write(Session["adi"]); %></span></td>
					</tr>
					<tr>
						<td><strong>HastaSoyadi</strong></td>
						<td><span id="tdHastaSoyadi"> <% Response.Write(Session["soyadi"]); %></span></td>
					</tr>
					<tr>
						<td><strong>Cep Telefon</strong></td>
						<td><span id="tdCep"><% Response.Write(Session["telefon"]); %></span></td>
					</tr>
					<tr>
						<td><strong>Doktorunuza Not</strong></td>
						<td><textarea name="tdDoktorNot" id="tdDoktorNot" cols="50" rows="3"></textarea></td>
					</tr>
					
				</tbody>
			</table>
			<button class="btn btn-primary btn-large btn-block" id="btnRandevuKaydet">Randevuyu Kaydet</button>
            <button type="button" id="btnRandevuKaydetModelKapat" class="btn btn-danger btn-large btn-block" data-dismiss="modal">Kapat</button>

			</div>
		</div>
	</div>
</div>
<!-- Randevu Son Aşama Modal Bitiş-->


<script type="text/javascript">
    $('.select2').select2();
</script>

<script src="Content/js/jquery.cookie.js"></script>
<script src="Content/js/randevu.js?version=2.2"></script>
<script src="Content/js/waitMe.min.js"></script>
<link href="Content/css/waitMe.min.css" rel="stylesheet" />

</div>
</body>
</html>