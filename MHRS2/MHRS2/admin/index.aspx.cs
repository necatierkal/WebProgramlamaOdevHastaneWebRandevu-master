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
    public partial class index : System.Web.UI.Page
    {
        DBConnect oku = new DBConnect();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
       
            
            
            string sorgu = "Select * from admin where username='" + TextBox1.Text + "' and password='" + TextBox2.Text + "'";
            if (oku.varmiKayit(sorgu))
            {

                Session["adminKontrol"] = "true";
                SqlConnection baglanti = oku.baglan();
                SqlCommand cmd = new SqlCommand(sorgu, baglanti);
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                   //
                }

                Response.Write("<script>window.location.href = 'admin.aspx';</script>");

            }
            else
            {
                Response.Write("<div class='alert alert-warning' style='margin-top:15px;'>Hata! kullancı adı veya şifre hatalı</div>");
            }
        }
    }
}