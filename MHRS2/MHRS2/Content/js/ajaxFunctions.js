function MhrsGiris() {
    
    
    $.ajax({
        type: "POST",
        url: "ajax.aspx?pg=1",
        data: $('#form1').serialize(),
        error: function () { $('#sonuc').html("Bir hata oluştu"); },
        success: function (veri) {
            $('#sonuc').html(veri); 
            $('#wizard').waitMe('hide');
        },
        beforeSend: function () {
            $('#wizard').waitMe({
                effect: 'timer',
                text: '<span style="font-size:22px;font-weight:bold">Giriş Yapılıyor</span>',
                bg: 'rgba(255,255,255,0.7)',
                color: '#2184BE',
                sizeW: '60px', sizeH: '60px',
            });
        }

    });
}


$("#btnUyeOl").click(function () {
    $.ajax({
        type: "POST",
        url: "ajax.aspx?pg=10",
        data: $('#form2').serialize(),
        error: function () { $('#sonuc').html("Bir hata oluştu"); },
        success: function (veri) {
            $('#uyeOlsonuc').html(veri).addClass("alert alert-info");
            if (veri == "Üyelik Kaydınız Başarıyla Tamamlanmıştır") {
                $("form[id=form2]").fadeOut(500);
            }
            $('.uyeOlModal').waitMe('hide');
        },
        beforeSend: function () {
            $('.uyeOlModal').waitMe({
                effect: 'timer',
                text: '<span style="font-size:22px;font-weight:bold">Lütfen Bekleyin</span>',
                bg: 'rgba(255,255,255,0.7)',
                color: '#2184BE',
                sizeW: '60px', sizeH: '60px',
            });
        }

    });
  
});
