using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace MHRS2
{
    public partial class uyeProfil : System.Web.UI.Page
    {
        DBConnect Kontrol = new DBConnect(); int uyeID;
        protected void Page_Load(object sender, EventArgs e)
        {
            var session = Session["uyeKontrol"];
            if (session != "true")
              Response.Redirect("index.aspx");

            this.uyeID = Convert.ToInt32(Session["uyeId"]);
            string sorgu = "select * from Users WHERE userId="+uyeID+"";
            SqlConnection baglanti = Kontrol.baglan();
            SqlCommand cmd = new SqlCommand(sorgu, baglanti);
            SqlDataReader reader = cmd.ExecuteReader();
            Label1.Visible = false;
            if (!IsPostBack)
            {
                while (reader.Read())
                {

                    txtAdi.Text = reader["userName"].ToString();
                    txtSoyadi.Text = reader["userSurname"].ToString();
                    txtTelefon.Text = reader["telefon"].ToString();
                    txtSifre.Text = reader["userPassword"].ToString();
                    txtEmail.Text = reader["email"].ToString();

                }
  
            }
           


        }

        protected void btnGuncelle_Click(object sender, EventArgs e)
        {
            Label1.Visible = true;
            string sorgu = "Update Users set userPassword='"+txtSifre.Text+"',userName='"+txtAdi.Text+"',userSex="+DropDownList1.SelectedValue+",";
            sorgu += "userSurname='" + txtSoyadi.Text + "',telefon='" + txtTelefon.Text + "',email='" + txtEmail.Text + "' WHERE userId=" + uyeID;
            int sonuc = Kontrol.cmd(sorgu);
            
            if (sonuc>0)
            {
                Label1.Text = "Bilgileriniz Güncellenmiştir";
            }
            else
            {
                Label1.Text = "Hata! bilgiler Güncellenemedi...";
            }

        }
    }
}