using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;

namespace MHRS2
{
    public partial class ajax : System.Web.UI.Page
    {

     
        DBConnect Kontrol = new DBConnect();string butonTip,dolu;
        public static string sqlKontrol(string metin)
        {
            
            metin = metin.Replace('"', '/');// cift tırnaklar slaca cevriliyor       
            return metin;
        }
      
        protected void Page_Load(object sender, EventArgs e)
        {
            /*Sistemi Belirli bir saniye beklet*/
            

            string deger = Request.QueryString["pg"];
            if (deger == "1")
            {
                string sorgu = "Select * from Users where userTc='" + Request.Form["tc"] + "' and userPassword='" + Request.Form["sifre"] + "'";
                if (Kontrol.varmiKayit(sorgu)) {
                    
                    Session["uyeKontrol"] = "true";
                    SqlConnection baglanti = Kontrol.baglan();
                    SqlCommand cmd = new SqlCommand(sorgu, baglanti);
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        Session["uyeId"] =  reader["userId"];
                        Session["adi"] = reader["userName"];
                        Session["soyadi"] = reader["userSurname"];
                        Session["telefon"] = reader["telefon"];
                        Session["tc"] = reader["userTc"];
                    }

                    Response.Write("<script>window.location.href = 'randevu.aspx';</script>");
                    
                }
                else
                {
                    Response.Write("<div class='alert alert-warning' style='margin-top:15px;'>Hata! kullancı adı veya şifre hatalı</div>");
                }


            }
            else if (deger=="2")
            {
                
                /*Hastane Id ile select box dolduruyoruz*/
                int hastaneID = Convert.ToInt32(Request.Form["hastaneID"]);
                string sorgu = "select * from Hastaneler WHERE hastaneID="+hastaneID;
                SqlConnection baglanti = Kontrol.baglan();
                SqlCommand cmd = new SqlCommand(sorgu, baglanti);
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    if (hastaneID == (int)reader["hastaneID"])
                    {
                        Response.Write("<option placeholder='"+reader["hadi"]+"' value='" + reader["hastaneID"].ToString() + "'>" + reader["hadi"].ToString() + "</option>");
                    }
                    else
                    {
                        Response.Write("<option value='" + reader["hastaneID"].ToString() + "'>" + reader["hadi"].ToString() + "</option>");
                    }
                    
                }


                
            }

            else if (deger == "3")
            {
                
                /*şehir Id ile select box dolduruyoruz*/
                int sehirID = Convert.ToInt32(Request.Form["sehirID"]);
                string sorgu = "select * from il";
                SqlConnection baglanti = Kontrol.baglan();
                SqlCommand cmd = new SqlCommand(sorgu, baglanti);
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    if (sehirID == (int)reader["id"])
                    {
                        Response.Write("<option placeholder='" + reader["adi"] + "' value='" + reader["id"].ToString() + "'>" + reader["adi"].ToString() + "</option>");
                    }
                    else
                    {
                        Response.Write("<option value='" + reader["id"].ToString() + "'>" + reader["adi"].ToString() + "</option>");
                    }

                }



            }

            else if (deger == "4")
            {
               
                /*şehir Id ile  İlçeleri -- > select box dolduruyoruz*/
                int sehirID = Convert.ToInt32(Request.Form["sehirID"]);
                int ilceID = Convert.ToInt32(Request.Form["ilceID"]);
                string sorgu = "select * from ilce WHERE il_id="+sehirID;
                SqlConnection baglanti = Kontrol.baglan();
                SqlCommand cmd = new SqlCommand(sorgu, baglanti);
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    if (ilceID == (int)reader["id"])
                    {
                        Response.Write("<option placeholder='" + reader["adi"] + "' value='" + reader["id"].ToString() + "'>" + reader["adi"].ToString() + "</option>");
                    }
                    else
                    {
                        Response.Write("<option value='" + reader["id"].ToString() + "'>" + reader["adi"].ToString() + "</option>");
                    }

                }



            }

            else if (deger == "5")
            {
                
                /*şehir Id ile  İlçeleri -- > select box dolduruyoruz*/
                int hastaneID = Convert.ToInt32(Request.Form["hastaneID"]);
                string sorgu = "select * from Klinikler WHERE hastaneID="+hastaneID;
                SqlConnection baglanti = Kontrol.baglan();
                SqlCommand cmd = new SqlCommand(sorgu, baglanti);
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    
                  Response.Write("<option value='" + reader["klinikID"].ToString() + "'>" + reader["klinikAdi"].ToString() + "</option>");
                    
                  

                }



            }

            else if (deger == "6")
            {
                
                /*Klinik Id ile  Hekim Listeliyoruz*/
                int klinikID = Convert.ToInt32(Request.Form["klinikID"]);
                string sorgu = "select * from Hekimler WHERE klinikId=" + klinikID;
                SqlConnection baglanti = Kontrol.baglan();
                SqlCommand cmd = new SqlCommand(sorgu, baglanti);
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {

                    Response.Write("<option value='" + reader["hekimId"].ToString() + "'>" + reader["hekimAdi"].ToString() + "</option>");



                }



            }


            else if (deger == "7")
            {
                System.Threading.Thread.Sleep(1000);
                try
                {
                    /*Klinik Id ile  Hekim Listeliyoruz*/
                int klinikID = Convert.ToInt32(Request.Form["klinikID"]);
                int hekimID = Convert.ToInt32(Request.Form["hekimID"]);
                int hastaneID = Convert.ToInt32(Request.Form["hastaneID"]);

                string sorgu = @"select * from Hastaneler h,Klinikler k,Hekimler he"+
                               " Where  h.hastaneID=" + hastaneID + " and he.hekimId="+hekimID+" and k.klinikID="+klinikID;

                SqlConnection baglanti = Kontrol.baglan();
                SqlCommand cmd = new SqlCommand(sorgu, baglanti);
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {

                    Response.Write("<tr id='"+reader["hekimId"]+"'><td>"+reader["hadi"].ToString() + "</td><td>" + reader["klinikAdi"].ToString() + "</td><td>" + reader["hekimAdi"].ToString()+"</td></tr>");



                }
                }
                catch (Exception ex)
                {

                    Response.Write("Bir Hata Oluştu");
                }



            }
                
            else if (deger=="8")
            {

                System.Threading.Thread.Sleep(1000);
                int secilenKlinikID = Convert.ToInt32(Request.Form["secilenKlinikID"]);
                string secilenTarih = Request.Form["secilenTarih"];
                string tarih = Convert.ToString(DateTime.Now);
                string sorgu = "select * from Randevular WHERE klinikID=" + secilenKlinikID + " and tarih ='"+secilenTarih+"'";
                SqlConnection baglanti = Kontrol.baglan();
                SqlCommand cmd = new SqlCommand(sorgu, baglanti);
                SqlDataReader reader = cmd.ExecuteReader();
                string[] saatler = new string[18]; int sayac = 0; DateTime tarihKutu = DateTime.Parse(secilenTarih);
                while (reader.Read())
                {
                    saatler[sayac] = reader["saat"].ToString();
                   
                    sayac++;
                }


                string yaz = @"  <div class='panel panel-info'>
    <div class='panel-heading' role='tab' id='headingOne'>
      <h4 class='panel-title'>
        <a role='button' data-toggle='collapse' data-parent='#accordion' href='#collapseOne' aria-expanded='true' aria-controls='collapseOne'>
         " + tarihKutu.ToString("D") + @"
        </a>
      </h4>
    </div>
    <div id='collapseOne' class='panel-collapse collapse in' role='tabpanel' aria-labelledby='headingOne'>
      <div class='panel-body'>
       <table class='table table-bordered'>
		<tbody>";
                Response.Write(yaz);
                string yaz2 = ""; int i = 8; string[] time= new string[18];
                DateTime timeloop = new DateTime(0);
                timeloop = timeloop.Add(new TimeSpan(8, 00, 0)); //start at 08:00 AM
                for (int j = 0; j < 18; j++)
                {
                    time[j] = timeloop.ToString("HH:mm");           //print it as 1:30 PM
                    
                    
                    timeloop = timeloop.Add(new TimeSpan(0, 30, 0));
                   

                }

                
                for (int m = 0; m < time.Length; m++)
                {
                    if (time[m] == "12:00" || time[m] == "12:30") continue; // Birazda tatil yapalım :)
                    
                    for (int n = 0; n < saatler.Length; n++)
                    {
                        if (time[m]==saatler[n])
                        {
                            this.butonTip = "btn-danger"; this.dolu = "dolu"; break;
                        }
                        else { this.butonTip = "btn-warning"; this.dolu = "null"; }
                    }

                    yaz2 = @"
				
					<button style='margin:6px;' class='rndvAlBtn btn "+this.butonTip+" btn-lg' data-toggle='tooltip' data-placement='left' data-durum='" + dolu + "' title='Dolu'>" + time[m] + @"</button>
				";
            Response.Write(yaz2);
            yaz2 = "";
                    
                   
                }

                string yaz3 = @"</tbody>
	   </table>
			
		
      </div>
    </div>
  </div>";

                Response.Write(yaz3);

            }

            else if (deger=="9")
            {
                System.Threading.Thread.Sleep(2000);

                int klinikID = Convert.ToInt32(Request.Form["klinikID"]);
                int hekimID = Convert.ToInt32(Request.Form["hekimID"]);
                int HastaneID = Convert.ToInt32(Request.Form["HastaneID"]);
                string secilenTarih = Request.Form["secilenTarih"];
                string secilenSaat = Request.Form["secilenSaat"];
                int uyeID = Convert.ToInt32(Request.Form["uyeID"]);
                string doktoraNot = Request.Form["not"];

                string sorgu = @"INSERT INTO Randevular(uyeId,hekimId,klinikId,hastaneId,tarih,saat,doktorNot)";
                sorgu += "VALUES("+uyeID+","+hekimID+","+klinikID+","+HastaneID+",'"+secilenTarih+"','"+secilenSaat+"','"+doktoraNot+"')";

                int randevuAl = Kontrol.cmd(sorgu);
                if (randevuAl>0)
                {
                    Response.Write("Randevunuz Başarıyla Alınmıştır");
                }
                else
                {
                    Response.Write("Hata! Randevu Alınırken Bir sorun ile karşılaşıldı....");
                }

            }

            else if (deger=="10")
            {
                 string tc = sqlKontrol(Request.Form["tc"]);
                 string sifre =sqlKontrol(Request.Form["sifre"]);
                 string ad = sqlKontrol(Request.Form["ad"]);
                 string soyad = sqlKontrol(Request.Form["soyad"]);
                 int cinsiyet = Convert.ToInt32(Request.Form["cinsiyet"]);
                 string email = sqlKontrol(Request.Form["email"]);
                 string telefon = sqlKontrol(Request.Form["telefon"]);

                 string sorgu = @"INSERT INTO Users VALUES";
                 sorgu += "('"+tc+"','"+sifre+"','"+ad+"','"+soyad+"','"+cinsiyet+"','"+email+"','"+telefon+"')";
                 try
                 {
                     int uyeOl = Kontrol.cmd(sorgu);
                     if (uyeOl > 0)
                     {
                         Response.Write("Üyelik Kaydınız Başarıyla Tamamlanmıştır");
                     }
                     else
                     {
                         Response.Write("Hata! bir hata oluştu...");
                     }
                 }
                 catch (Exception ex)
                 {
                     
                          Response.Write("Bir hata oluştu.Lütfen Bilgilerinizi Tekrar Kontol Ediniz.");
                     
                  
                 }

                
            }

       }

       
    }
}