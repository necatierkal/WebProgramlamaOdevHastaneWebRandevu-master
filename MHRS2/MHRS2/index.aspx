<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="MHRS2.index" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
	<meta charset="UTF-8">
	<title>Mhrs Giriş</title>
	<link rel="stylesheet" href="Content/css/bootstrap.min.css">
	

<link rel="stylesheet" type="text/css" href="Content/css/jquery.qtip.min.css">
<link rel="stylesheet" type="text/css" href="Content/css/custom.css">
<link rel="stylesheet" type="text/css" href="Content/css/font-awesome.min.css">
<link href="Content/css/waitMe.min.css" rel="stylesheet" />

<script type="text/javascript" src="Content/js/jquery-1.11.3.min.js"></script>
<script src="Content/js/bootstrap.min.js"></script>
<script type="text/javascript" src="Content/js/raphael-min.js"></script>
<script type="text/javascript" src="Content/js/paths.js"></script>
<script type="text/javascript" src="Content/js/turkiye.js?v=123"></script>
<script type="text/javascript" src="Content/js/jquery.qtip.min.js"></script>
<script type="text/javascript" src="Content/js/jquery.steps.js"></script>
<script src="Content/js/waitMe.min.js"></script>
<script type="text/javascript">
    $(function () {
        $("#kayitOlMenu").click(function () { $('#uyeOlModal').modal('toggle'); });
        
        $("#map svg path").click(
		  function () {
		      var id = $(this).attr("id");
		     var sehirID= $("#sehir").text(paths[id].county);
		     $.cookie('sehirID', paths[id].county);
		      /*şehir id gönder*/
		      $.ajax({
		          type: "POST",
		          url: "iframe.aspx?sehirId=" + paths[id].county,
		          error: function () { $('#hastaneListele').html("Bir hata algılandı"); },
		          success: function (veri) {
		             
		              $("#hastaneListele").html(veri);
		              $('#wizard').waitMe('hide');
		          },
		          beforeSend: function () {    
		            
		              $('#wizard').waitMe({
		                  effect: 'timer',
		                  text: '<span style="font-size:22px;font-weight:bold">Hastane Listesi Yükleniyor</span>',
		                  bg: 'rgba(255,255,255,0.7)',
		                  color: '#2184BE',
		                  sizeW: '60px', sizeH: '60px',
		              });

		      }
		      });




		      $('#myModal').modal('toggle');
		      

		      
		  });
        $("#wizard").steps({
            transitionEffect: "slideLeft",
            enableFinishButton: false,
            labels: {
                cancel: "İptal",
                current: "current step:",
                pagination: "Pagination",
                finish: "Giriş Yap",
                next: "İleri",
                previous: "Önceki",
                loading: "Yükleniyor ..."
            }
        });
    })
</script>	
</head>
<body>

<div id="header">
	<div class="container">
		<ul id="menu">
			<li><a href="#" class="aktif"> <i class="fa fa-home fa-lg"></i> Anasayfa</a></li>
			<li id="kayitOlMenu"><a href="#">Kayıt Ol</a></li>
		</ul>
	</div>
</div>
<div id="modal">

</div>
<div class="container">
	<div class="well">
		<center>Randevu almak istediğiniz şehiri seçiniz</center>
		<div id="sehir">
           
        </div>

		<div id="map"></div>  
	</div>
	<!-- Button HTML (to Trigger Modal) -->

<!-- Modal HTML -->
<div id="myModal" class="modal fade" >
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">Mhrs Online Randevu Kayıt Sistemi</h4>
            </div>
            <div class="modal-body">
                
				<div id="wizard">
					<h1>Hastane Seçimi</h1>
					<div>
                      <div id="hastaneListele">
						  
					    </div>
					</div>
					
				 
					<h1>Giriş</h1>
					<div>
                    <form class="form-horizontal" id="form1" onsubmit="return false">
						<div style="background:url(Content/images/loginBg.png) no-repeat;padding:10px;">
						<h3 style="display:block;margin-top:39px;margin-left:130px">Vatandaş Giriş Ekranı</h3>
						  <div class="form-group" style="margin-top:50px">
							<label for="inputEmail3" class="col-sm-2 control-label">TC No:</label>
							<div class="col-sm-5">
							
                               <input type="text" name="tc" class="form-control" placeholder="Tc kimlik">
							</div>
						  </div>
						  <div class="form-group">
							<label for="inputPassword3" class="col-sm-2 control-label">Şifre</label>
							<div class="col-sm-5">
                              <input name="sifre"  type="password" class="form-control" placeholder="Password">
							  
							</div>
						  </div>
						 
						  <div class="form-group">
							<div class="col-sm-offset-2 col-sm-5">
							  
                                <button ID="girisBtn" onclick="MhrsGiris();"  class="btn btn-success btn-lg btn-block active">Giriş</button>
                               <div id="sonuc"></div>

							</div>
						  </div>
						  
						  <div class="form-group" style="margin-top:20px">
							<div class="col-sm-offset-2 col-sm-10">
								<a class="btn btn-default btn-sm" href="#" id="uyeOlButton">Üye Ol</a>
								<script type="text/javascript">
								    $("#uyeOlButton").click(function () {
								        $('#myModal').modal('hide');
								        $('#uyeOlModal').modal('toggle');

								    });
								</script>
								
							</div>
						  </div>
						  
						</form>
						</div>
						<div style="background:url(Content/images/loginBgFooter.png);width:516px;height:35px;"></div>
					</div>

				</div>	


            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Kapat</button>
                
            </div>
        </div>
    </div>
</div>

<!--my modal bitiş-->
<!-- üye kayıt modal-->
<div id="uyeOlModal" class="modal fade" >
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
		<div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">MHRS Kayıt Sayfası</h4>
            </div>
            <div class="modal-body uyeOlModal">
                <div id="uyeOlsonuc"></div>
          <form id="form2" onsubmit="return false">
			 <table class="table table-striped">
				<tr>
					<td>TC:</td>
					<td><input type="text" name="tc"/></td>
				</tr>
                 <tr>
					<td>Şifre:</td>
					<td><input type="text" name="sifre"/></td>
				</tr>
				<tr>
					<td>Ad:</td>
					<td><input type="text" name="ad"/></td>
				</tr>
				<tr>
					<td>Soyad:</td>
					<td><input type="text" name="soyad"/></td>
				</tr>
				<tr>
					<td>Cinsiyet:</td>
					<td>
						<select name="cinsiyet" id="">
							<option value="1">Erkek</option>
							<option value="0">Kadın</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>E-mail:</td>
					<td><input type="text" name="email"/></td>
				</tr>
				<tr>
					<td>Telefon:</td>
					<td><input type="text" name="telefon"/></td>
				</tr>
				<tr>
					<td></td>
					<td><button class="btn btn-success" id="btnUyeOl">Üye Ol</button>
                         <button type="button" class="btn btn-danger" data-dismiss="modal">Kapat</button>

					</td>
				</tr>
				
			 </table>
            </form>
			</div>   
		</div>
		
		</div>
	</div>
</div>
<!-- üye kayıt modal bitiş-->
 <script src="Content/js/ajaxFunctions.js"></script>
 <script src="Content/js/jquery.cookie.js"></script>
</div>
</body>
</html>