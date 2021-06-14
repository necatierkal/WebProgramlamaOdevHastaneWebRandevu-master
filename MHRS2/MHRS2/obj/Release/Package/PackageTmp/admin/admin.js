$(function () {
    var sehirID;
    $.ajax({
        type: "POST",
        url: "../ajax.aspx?pg=3",
        error: function () { $('#sonuc').html("Bir hata oluştu"); },
        success: function (veri) {
            $('select[name=sehir]').append(veri);
            
        },
        beforeSend: function () {
           
        }

    });
    /*ilçeleri getir...*/
    $("select[name=sehir]").change(function () {
        $("#sonuc").html("Şehir seçildi.")
        sehirID = $(this).val();
        $.ajax({
            type: "POST",
            url: "adminAjax.aspx?pg=2",
            data: "sehirID=" + sehirID,
            error: function () { $('body').html("Bir hata oluştu"); },
            success: function (veri) {
                $('select[name=ilce] option').not(":first").remove();
                $('select[name=ilce]').append(veri);

            },
            beforeSend: function () {

            }

        });
        return false;
    });
    var ilceID = 0;
    $("select[name=ilce]").change(function () { ilceID = $(this).val(); $("#sonuc").append(" İlçe de seçildi."); });
    var HastaneAdi;
    $("#btnHastaneEkle").click(function () {
       
        HastaneAdi = $("input[name=hastaneAdi]").val();
        if (ilceID !=0) {
            $.ajax({
                type: "POST",
                url: "adminAjax.aspx?pg=3",
                data: "hastaneAdi=" + HastaneAdi + "&sehirID=" + sehirID + "&ilceID=" + ilceID,
                error: function () { $('#sonuc').html("Bir hata oluştu"); },
                success: function (veri) {
                    $('#sonuc').html(veri);

                },
                beforeSend: function () {
                    $('#sonuc').html("Please Wait...");
                }

            });
        } else { alert("İlçe Seçiniz");}
        return false;
    });

    /*klinikEkle*/
    //önce hastane listele
    $("#hastaneDoldur").click(function () {
        $.ajax({
            type: "POST",
            url: "adminAjax.aspx?pg=4",
            data: "sehirID=" + sehirID + "&ilceID=" + ilceID,
            error: function () { $('#sonuc').html("Bir hata oluştu"); },
            success: function (veri) {
                $('select[name=hastaneList] option').not(":first").remove();
                $('select[name=hastaneList]').append(veri);
                $('#sonuc').html("");
            },
            beforeSend: function () {
                $('#sonuc').html("Please Wait...");
            }

        });
        return false;
    });
    var hastaneID=0;
    $("select[name=hastaneList]").change(function () { hastaneID = $(this).val(); });
    ///şimdi klinik Ekle
    $("#btnKlinikEkle").click(function () {
       
        
        $.ajax({
            type: "POST",
            url: "adminAjax.aspx?pg=5",
            data: "hastaneID=" + hastaneID + "&klinikAdi=" + $("input[name=klinikAdi]").val(),
            error: function () { $('#sonuc').html("Bir hata oluştu"); },
            success: function (veri) {
                $('#sonuc').html(veri);

            },
            beforeSend: function () {
                $('#sonuc').html("Please Wait...");
            }

        });
        return false;
    });
   
    /*hekim Ekle*/
    //önce klinik listele
    $("#klinikDoldur").click(function () {
        
        $.ajax({
            type: "POST",
            url: "adminAjax.aspx?pg=6",
            data: "hastaneID=" +hastaneID,
            error: function () { $('#sonuc').html("Bir hata oluştu"); },
            success: function (veri) {
                $('select[name=klinikList] option').not(":first").remove();
                $('select[name=klinikList]').append(veri);
                $('#sonuc').html("");
            },
            beforeSend: function () {
                $('#sonuc').html("Please Wait...");
            }

        });
        return false;
    });
    ///şimdi hekim Ekle
    var klinikID = 0;
    $("select[name=klinikList]").change(function () { klinikID = $(this).val(); alert(klinikID); });
    $("#btnHekimEkle").click(function () {


        $.ajax({
            type: "POST",
            url: "adminAjax.aspx?pg=7",
            data: "hekimAdi=" + $("#hekimAdi").val() + "&klinikID=" + klinikID+"&hastaneID="+hastaneID,
            error: function () { $('#sonuc').html("Bir hata oluştu"); },
            success: function (veri) {
                $('#sonuc').html(veri);

            },
            beforeSend: function () {
                $('#sonuc').html("Please Wait...");
            }

        });
        return false;
    })

});
