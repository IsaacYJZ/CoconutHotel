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
            departureDate.Text = departureCal.SelectedDate.ToLongDateString();
        }

        protected void arrivalCal_SelectionChanged(object sender, EventArgs e)
        {
            arrivalDate.Text = arrivalCal.SelectedDate.ToLongDateString();
        }

        protected void submitBtn_Click(object sender, EventArgs e)
        {
            // Check if arrival date is earlier than departure date
            DateTime arrivalDateTime = DateTime.Parse(arrivalDate.Text);
            DateTime departureDateTime = DateTime.Parse(departureDate.Text);

            if (arrivalDateTime < departureDateTime)
            {
                // Show error message
                ScriptManager.RegisterStartupScript(this, this.GetType(), "arrivalEarlierError", "alert('Arrival date cannot be earlier than departure date. Please select again.');", true);
            }
            else
            {
                // Proceed with booking
                // Add your booking logic here
            }
        }
    }
}
