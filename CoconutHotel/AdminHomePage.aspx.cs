using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CoconutHotel
{
    public partial class AdminHomePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ViewUserProfileButton_Click(object sender, EventArgs e)
        {
            // Redirect to UserProfileAdmin.aspx page
            Response.Redirect("UserProfileAdmin.aspx");
        }
    }
}