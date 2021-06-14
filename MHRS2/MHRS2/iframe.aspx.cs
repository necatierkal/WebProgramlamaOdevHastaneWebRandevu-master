using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
namespace MHRS2
{
    public partial class iframe : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string deger = Request.QueryString["sehirId"];
            DBConnect baglanti = new DBConnect();

            if (deger != null)
            {
                System.Threading.Thread.Sleep(1000);

                DataTable dt = baglanti.GetDataTable("select * from Hastaneler Where hsehir="+deger+"");
                RepeaterHastaneListele.DataSource = dt;
                RepeaterHastaneListele.DataBind();

            }
        }
    }
}