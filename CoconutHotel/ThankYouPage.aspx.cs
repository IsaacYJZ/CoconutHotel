using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CoconutHotel
{
    public partial class ChangePayment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblPurchaseDate.Text = DateTime.Now.ToString("dd/MM/yyyy");
                lblPurchaseTime.Text = DateTime.Now.ToString("HH:mm:ss");

                // Retrieve the TotalPriceSum from the session
                string totalPriceSum = Session["TotalPriceSum"] != null ? Session["TotalPriceSum"].ToString() : "N/A";

                // Display it on the label
                lblPurchaseTotal.Text = totalPriceSum;

                if (Session["SelectedValue"] != null)
                {
                    string selectedValue = Session["SelectedValue"].ToString();
                    lblMethodSelected.Text = $"{selectedValue}";
                    // Optionally clear the session after use if it's no longer needed
                    Session["SelectedValue"] = null;
                }
            }
        }

        protected void btnComfirm_Click(object sender, EventArgs e)
        {
            Response.Redirect("homeLogin.aspx");
        }
    }
}