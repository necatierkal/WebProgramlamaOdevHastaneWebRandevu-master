using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace MHRS2
{
    public partial class randevuGecmisi : System.Web.UI.Page
    {
         
        protected void Page_Load(object sender, EventArgs e)
        {
            var session = Session["uyeKontrol"];
            if (session != "true")
                Response.Redirect("index.aspx");


            DBConnect baglanti = new DBConnect();
            int uyeID = Convert.ToInt32(Session["uyeId"]);
            string sorgu = @"SELECT   randevuId,hadi,hekimAdi,klinikAdi,tarih,saat  
FROM         dbo.Randevular INNER JOIN
					 Users u on u.userId = Randevular.uyeId Inner join
                      dbo.Hekimler ON dbo.Randevular.hekimId = dbo.Hekimler.hekimId INNER JOIN
					  dbo.Klinikler k on k.klinikID = Randevular.klinikId inner join
                      dbo.Hastaneler ON dbo.Randevular.hastaneId = dbo.Hastaneler.hastaneID 
					  Where u.userId=" + uyeID + " order by randevuId desc";



            DataTable dt = baglanti.GetDataTable(sorgu);
            Repeater1.DataSource = dt;
            Repeater1.DataBind();
            
           

        }
    }
}