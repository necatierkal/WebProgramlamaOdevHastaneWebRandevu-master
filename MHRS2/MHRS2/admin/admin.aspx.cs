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
    public partial class admin1 : System.Web.UI.Page
    {
        DBConnect oku = new DBConnect();
        protected void Page_Load(object sender, EventArgs e)
        {
            var session = Session["adminKontrol"];
            if (session != "true")
                Response.Redirect("index.aspx");
           


           

        }

       
    }
}