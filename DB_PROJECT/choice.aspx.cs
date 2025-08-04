using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DB_PROJECT
{
    public partial class choice : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            // Redirect to dashboard1.aspx
            Response.Redirect("Dashboard1.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            // Redirect to dashboard2.aspx
            Response.Redirect("Dashboard2.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            // Redirect to dashboard3.aspx
            Response.Redirect("Dashboard3.aspx");
        }
    }
}