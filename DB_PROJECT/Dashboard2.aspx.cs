using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DB_PROJECT
{
    public partial class Dashboard2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("CriminalRecordInfo.aspx"); // Redirect to the Criminal Record form.
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("CriminalRecord.aspx"); // Redirect to the Criminal Info form.
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("VictimInfo.aspx"); // Redirect to the Victim Info form.
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("WitnessInfo.aspx"); // Redirect to the Witness Info form.
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            Response.Redirect("ArrestInfo.aspx"); // Redirect to the Arrest Info form.
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            Response.Redirect("OfficerInfo.aspx"); // Redirect to the Officer Info form.
        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            Response.Redirect("CaseFile.aspx"); // Redirect to the Case File form.
        }

        protected void Button8_Click(object sender, EventArgs e)
        {
            Response.Redirect("CrimeInfo.aspx"); // Redirect to the Crime Info form.
        }

        protected void Button9_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddressInfo.aspx"); // Redirect to the Crime Info form.
        }
    }
}