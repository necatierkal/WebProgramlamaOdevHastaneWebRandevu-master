using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace MHRS2.admin
{
    public partial class adminAjax : System.Web.UI.Page
    {
        DBConnect Kontrol = new DBConnect();
        protected void Page_Load(object sender, EventArgs e)
        {
            string deger = Request.QueryString["pg"];
            if (deger == "2")
            {
               
                /*şehir Id ile  İlçeleri -- > select box dolduruyoruz*/
                int sehirID = Convert.ToInt32(Request.Form["sehirID"]);
                string sorgu = "select * from ilce WHERE il_id="+sehirID;
                SqlConnection baglanti = Kontrol.baglan();
                SqlCommand cmd = new SqlCommand(sorgu, baglanti);
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    
                        Response.Write("<option value='" + reader["id"].ToString() + "'>" + reader["adi"].ToString() + "</option>");
                    

                }



            }
            else if (deger=="3")
            {
                string hadi = Request.Form["hastaneAdi"];
                int hsehir =  Convert.ToInt32(Request.Form["sehirID"]);
                int hilce = Convert.ToInt32(Request.Form["ilceID"]);
                string sorgu = "insert into Hastaneler VALUES('"+hadi+"',"+hsehir+","+hilce+")";

                int sonuc = Kontrol.cmd(sorgu);
                if (sonuc > 0)
                    Response.Write("Kayıt Başarılı");
                else
                {
                    Response.Write("Bir hata oluştu");
                }
            }
            if (deger == "4")
            {

                /*şehir Id ve ilçe ile hastane -- > select box dolduruyoruz*/
                int hsehir = Convert.ToInt32(Request.Form["sehirID"]);
                int hilce = Convert.ToInt32(Request.Form["ilceID"]);
                string sorgu = "select * from  Hastaneler WHERE hsehir=" + hsehir+" and hilce="+hilce;
                SqlConnection baglanti = Kontrol.baglan();
                SqlCommand cmd = new SqlCommand(sorgu, baglanti);
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {

                    Response.Write("<option value='" + reader["hastaneID"].ToString() + "'>" + reader["hadi"].ToString() + "</option>");


                }



            }
            else if (deger == "5")
            {
                string klinikAdi = Request.Form["klinikAdi"];
                int hastaneID = Convert.ToInt32(Request.Form["hastaneID"]);
                string sorgu = "insert into Klinikler VALUES('" + klinikAdi + "',"+hastaneID+")";

                int sonuc = Kontrol.cmd(sorgu);
                if (sonuc > 0)
                    Response.Write("Klinik Kayıt İşlemi Başarılı");
                else
                {
                    Response.Write("Bir hata oluştu");
                }
            }
            if (deger == "6")
            {

                /*şehir Id ve ilçe ile hastane -- > select box dolduruyoruz*/
                int hastaneID = Convert.ToInt32(Request.Form["hastaneID"]);
              
                string sorgu = "select * from  Klinikler WHERE hastaneID=" + hastaneID;
                SqlConnection baglanti = Kontrol.baglan();
                SqlCommand cmd = new SqlCommand(sorgu, baglanti);
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    Response.Write("<option value='" + reader["klinikID"].ToString() + "'>" + reader["klinikAdi"].ToString() + "</option>");

                }

            }
            else if (deger == "7")
            {
                string hekimAdi = Request.Form["hekimAdi"];
                int hastaneID = Convert.ToInt32(Request.Form["hastaneID"]);
                int klinikID = Convert.ToInt32(Request.Form["klinikID"]);
                string sorgu = "insert into Hekimler VALUES('" + hekimAdi + "'," + klinikID + ","+hastaneID+")";

                int sonuc = Kontrol.cmd(sorgu);
                if (sonuc > 0)
                    Response.Write("Hekim Kayıt İşlemi Başarılı");
                else
                {
                    Response.Write("Bir hata oluştu");
                }
            }
        }
    }
}