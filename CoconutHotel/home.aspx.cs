﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CoconutHotel
{
    public partial class home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void learnMoreBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx");
        }
        protected void bookBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("CheckAvailability.aspx");
        }
    }
}