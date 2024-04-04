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
                if (Session["SelectedValue"] != null)
                {
                    string selectedValue = Session["SelectedValue"].ToString();
                    lblMethodSelected.Text = $"{selectedValue}";
                    // Optionally clear the session after use if it's no longer needed
                    Session["SelectedValue"] = null;
                }
            }
        }
    }
}