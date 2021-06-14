using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MHRS2
{
    public partial class randevu : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            var session =Session["uyeKontrol"];
            if (session != "true")
                Response.Redirect("index.aspx");

           
           

        }
    }
}