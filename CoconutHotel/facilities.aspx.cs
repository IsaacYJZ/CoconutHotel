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
            Response.Redirect("gallery.aspx");
        }
    }
}