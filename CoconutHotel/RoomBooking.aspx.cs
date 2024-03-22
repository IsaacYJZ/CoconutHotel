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

        }

        protected void departureCal_SelectionChanged(object sender, EventArgs e)
        {
            departureDate.Text = departureCal.SelectedDate.ToShortDateString();
        }

        protected void arrivalCal_SelectionChanged(object sender, EventArgs e)
        {
            arrivalDate.Text = arrivalCal.SelectedDate.ToShortDateString();
        }
    }
}