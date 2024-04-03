using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CoconutHotel
{
    public partial class facilities : System.Web.UI.Page
    {
        protected void btnGallery_Click(object sender, EventArgs e)
        {
            // Add your code to handle the button click event
            // For example, you can redirect the user to the gallery page
            Response.Redirect("gallery.aspx");
        }
    }
}