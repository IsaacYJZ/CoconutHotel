using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CoconutHotel
{
    public partial class RoomBooking : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Retrieve values from query parameters
            string checkIn = Request.QueryString["checkin"];
            string checkOut = Request.QueryString["checkout"];
            string adults = Request.QueryString["adults"];
            string children = Request.QueryString["children"];

            // Display the retrieved values
            CheckInDate.InnerText = checkIn; // Previously you had CheckOutDate.InnerText = checkIn;
            CheckOutDate.InnerText = checkOut; // Corrected
            Adults.InnerText = adults;
            Children.InnerText = children;
        }

        protected void bookBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("PaymentPage.aspx");
        }
    }
}