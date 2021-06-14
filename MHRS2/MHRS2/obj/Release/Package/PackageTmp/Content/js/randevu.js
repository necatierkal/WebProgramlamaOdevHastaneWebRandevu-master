$("#hastaneSelect option[value='" + $.cookie('hastaneID') + "']").prop("selected", true);
$("#s2id_sehirSelect .select2-chosen").html("<i class='fa fa-cog fa-spin'></i> Seçilen Şehir Ayarlanıyor...");
$("#s2id_ilceSelect .select2-chosen").html("<i class='fa fa-cog fa-spin'></i> İlçe Seçiliyor...");
$('[data-toggle="tooltip"]').tooltip();
/* Tarih InputSetting*/
$("#datepicker").datepicker({
    dateFormat: 'yy-mm-dd'
});


$(function () {

    /*
    * Created By Mehmet KIRMIZIKAYA
    * 22.12.2015
    */
    var hastaneID = $.cookie('hastaneID');
    var sehirID = $.cookie('sehirID');

   

    /* Selectbox ları doldur */
    /*Hastane Id ile hastane selectini doldur pg=2 */
    $.ajax({
        type: "POST",
        url: "ajax.aspx?pg=2",
        data:"hastaneID="+hastaneID,
        error: function () { $('#sonuc').html("Bir hata oluştu"); },
        success: function (veri) {
            $('#hastaneSelect').append(veri);
            $('.solSecimAlani').waitMe('hide');

            $('#hastaneSelect option').each(function () {
               
                if ($(this).val() == $.cookie('hastaneID')) {
                    var adi = $(this).html();
                    $("#s2id_hastaneSelect .select2-chosen").html(adi);
                    $("#tdHastaneAdi").html(adi);

                }
            });
        },
        beforeSend: function () {
            $('.solSecimAlani').waitMe({
                effect: 'timer',
                text: '<span style="font-size:22px;font-weight:bold">Lütfen Bekleyin...</span>',
                bg: 'rgba(255,255,255,0.7)',
                color: '#2184BE',
                sizeW: '60px', sizeH: '60px',
            });
        }

    });
    /*Şehir Id ile Şehir selectini doldur pg=3 */
    function pad(d) {
        return (d < 10) ? '0' + d.toString() : d.toString();
    }

    $.ajax({
        type: "POST",
        url: "ajax.aspx?pg=3",
        data: "sehirID=" + sehirID,
        error: function () { $('#sonuc').html("Bir hata oluştu"); },
        success: function (veri) {
            $('#sehirSelect').append(veri);
            $('.solSecimAlani').waitMe('hide');
           
            

            $('#sehirSelect option').each(function () {
                if (pad($(this).val()) == $.cookie('sehirID')) {
                    var adi = $(this).html();
                   
                    $("#s2id_sehirSelect .select2-chosen").html(adi);

                }
            });
            

        },
        beforeSend: function () {
            $('.solSecimAlani').waitMe({
                effect: 'timer',
                text: '<span style="font-size:22px;font-weight:bold">Şehirler Yükleniyor...</span>',
                bg: 'rgba(255,255,255,0.7)',
                color: '#2184BE',
                sizeW: '60px', sizeH: '60px',
            });
        }

    });


    /*ilceSelect doldur */
    $.ajax({
        type: "POST",
        url: "ajax.aspx?pg=4",
        data: "sehirID=" + sehirID + "&ilceID=" + $.cookie('ilceID'),
        error: function () { $('#sonuc').html("Bir hata oluştu"); },
        success: function (veri) {
            $('#ilceSelect').append(veri);
            $('.solSecimAlani').waitMe('hide');
           
            $('#ilceSelect option').each(function () {
                if ($(this).val() == $.cookie('ilceID')) {
                    var adi = $(this).html();
                    $("#s2id_ilceSelect .select2-chosen").html(adi);
                }
            });


        },
        beforeSend: function () {
            $('.solSecimAlani').waitMe({
                effect: 'timer',
                text: '<span style="font-size:22px;font-weight:bold">İlçeler Yükleniyor...</span>',
                bg: 'rgba(255,255,255,0.7)',
                color: '#2184BE',
                sizeW: '60px', sizeH: '60px',
            });
        }

    });

    /*klinikSelect doldur */
    $.ajax({
        type: "POST",
        url: "ajax.aspx?pg=5",
        data: "hastaneID=" + hastaneID,
        error: function () { $('#sonuc').html("Bir hata oluştu"); },
        success: function (veri) {
            $('#klinikSelect').append(veri);
            $('.solSecimAlani').waitMe('hide');
            

        },
        beforeSend: function () {
            $('.solSecimAlani').waitMe({
                effect: 'timer',
                text: '<span style="font-size:22px;font-weight:bold">Klinikler Yükleniyor...</span>',
                bg: 'rgba(255,255,255,0.7)',
                color: '#2184BE',
                sizeW: '60px', sizeH: '60px',
            });
        }

    });


    /*hekimSelect Doldur*/
    var klinikID; 
    $("#klinikSelect").change(function () {
        klinikID = $(this).val();
        
        $.ajax({
            type: "POST",
            url: "ajax.aspx?pg=6",
            data: "klinikID=" + klinikID,
            error: function () { $('#sonuc').html("Bir hata oluştu"); },
            success: function (veri) {
                $('#hekimSelect option').remove();
                $('#hekimSelect').append('<option value="null">Lütfen Hekim Seçiniz</option>');
                $("#s2id_hekimSelect .select2-chosen").html("Lütfen Hekim Seçiniz");
                $('#hekimSelect').append(veri);
                $('.solSecimAlani').waitMe('hide');
                $("#tdKlinikAdi").html($("#klinikSelect option:selected").html());


            },
            beforeSend: function () {
                $('.solSecimAlani').waitMe({
                    effect: 'timer',
                    text: '<span style="font-size:22px;font-weight:bold">Hekimler Yükleniyor...</span>',
                    bg: 'rgba(255,255,255,0.7)',
                    color: '#2184BE',
                    sizeW: '60px', sizeH: '60px',
                });
            }

        });
        

    });


    /*Randevu sonuç Listele*/
    var hekimID=0;
    $("#hekimSelect").change(function () {
        hekimID = $(this).val();
        $("#tdHekimAdi").html($("#hekimSelect option:selected").html());
        /*alert(hekimID); alert("HekimID:" + hekimID + " klinikID:" + klinikID + " HastaneID:" + hastaneID); */
    });
    var $eventSelect = $("#hekimSelect");
    $eventSelect.on("select2:select", function (e) { log("select2:select", e); console.log(e); });
    

    $("#randevuAraButon").click(function () {
        $("#randevuSonuc").show();
        if (hekimID == "null" || hekimID==0) {
            alert("Önce bir hekim seçiniz"); return false;
        }
        $.ajax({
            type: "POST",
            url: "ajax.aspx?pg=7",
            data: "klinikID=" + klinikID + "&hekimID=" + hekimID + "&hastaneID=" + hastaneID,
            error: function () { $('#sonuc').html("Bir hata oluştu"); },
            success: function (veri) {
                
                $('#randevuSonucTable').html(veri);
                $('.solSecimAlani').waitMe('hide');


            },
            beforeSend: function () {
                $('.solSecimAlani').waitMe({
                    effect: 'timer',
                    text: '<span style="font-size:22px;font-weight:bold">Randevu Seçimi Yükleniyor...</span>',
                    bg: 'rgba(255,255,255,0.7)',
                    color: '#2184BE',
                    sizeW: '60px', sizeH: '60px',
                });
            }

        });
        

    });

    /*Tıklanan Randebuya Göre Cetvel Çıkar*/
  

    var secilenKlinikID;
    var secilenTarih;
    var secilenSaat = "";
    $("#randevuSonuc table").on('click', 'tr', function (e) {
        e.preventDefault();
        secilenKlinikID = klinikID;
        secilenTarih = $("#datepicker").val();
        secilenSaat = "";
        $(".randevuSecimPaneli").fadeIn();

        $.ajax({
            type: "POST",
            cache: false,
            url: "ajax.aspx?pg=8",
            data: "secilenKlinikID=" + secilenKlinikID + "&hekimID=" + hekimID + "&hastaneID=" + hastaneID + "&secilenTarih=" + secilenTarih,
            error: function () { $('#sonuc').html("Bir hata oluştu"); },
            success: function (veri) {

                $('.randevuSecimPaneli').html(veri);

                $('.solSecimAlani').waitMe('hide');


                $(".rndvAlBtn").click(function () {
                    var durum = $(this).attr("data-durum");
                    secilenSaat = $(this).html();
                    if (durum != "dolu") {
                        $('#randevuSonAsama').modal('toggle');
                    }

                });


            },
            beforeSend: function () {
                $('.randevuSecimPaneli').waitMe({
                    effect: 'timer',
                    text: '<span style="font-size:22px;font-weight:bold">Cetvelden Uygun Bir Saat Seçiniz</span>',
                    bg: 'rgba(255,255,255,0.7)',
                    color: '#2184BE',
                    sizeW: '60px', sizeH: '60px',
                });
            }

        });


    });

    $("#btnRandevuKaydet").click(function () {
       // alert("klinikID" + secilenKlinikID + " HekimID:" + hekimID + " HastaneID:" + hastaneID + " Seçilen Tarih:" + secilenTarih + " Saat:" + secilenSaat + " UYE-ID:" + $("#tdUyeID").html());

        $.ajax({
            type: "POST",
            url: "ajax.aspx?pg=9",
            data: "klinikID=" + secilenKlinikID + "&HekimID=" + hekimID + "&HastaneID=" + hastaneID + "&secilenTarih=" + secilenTarih + "&secilenSaat=" + secilenSaat + "&uyeID=" + $("#tdUyeID").html() + "&not=" + $("#tdDoktorNot").val(),
            error: function () { $('#tableRandevuKayitSonuc').html("Bir hata oluştu"); },
            success: function (veri) {
                $('#tableRandevuKayitSonuc').html("<center><h2>Randevu Kaydınız başarıyla alınmıştır</h2></center>");
                $('#tableRandevuKayitSonuc').waitMe('hide');
                $('#btnRandevuKaydet').hide();
                $("#btnRandevuKaydetModelKapat").click(function () { window.location="randevuGecmisi.aspx"});


            },
            beforeSend: function () {
                $('#tableRandevuKayitSonuc').waitMe({
                    effect: 'timer',
                    text: '<span style="font-size:22px;font-weight:bold">Lütfen Bekleyin...</span>',
                    bg: 'rgba(255,255,255,0.7)',
                    color: '#2184BE',
                    sizeW: '60px', sizeH: '60px',
                });
            }

        });


    });


});