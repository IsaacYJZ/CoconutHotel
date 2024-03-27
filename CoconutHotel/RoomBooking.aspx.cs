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

        protected void checkInCal_SelectionChanged(object sender, EventArgs e)
        {
            //checkInDate.Text = checkInCal.SelectedDate.ToLongDateString();
        }

        protected void checkOutCal_SelectionChanged(object sender, EventArgs e)
        {
            //checkOutDate.Text = checkOutCal.SelectedDate.ToLongDateString();
        }

        protected void submitBtn_Click(object sender, EventArgs e)
        {
            // Check if arrival date is earlier than departure date
            //DateTime checkInDateTime = DateTime.Parse(checkInDate.Text);
            //DateTime checkOutDateTime = DateTime.Parse(checkOutDate.Text);

            //if (checkInDateTime > checkOutDateTime)
            //{
            //    // Show error message
            //    ScriptManager.RegisterStartupScript(this, this.GetType(), "arrivalEarlierError", "alert('Check out date cannot be earlier than check in date. Please select again.');", true);
            //}
            //else
            //{
            //    string checkInDate = checkInDateTime.ToLongDateString();
            //    string checkOutDate = checkOutDateTime.ToLongDateString();
            //    string adults = adultsDropdown.SelectedValue;
            //    string children = childrenDropdown.SelectedValue;

            //    // Redirect to Room.aspx with query parameters
            //    Response.Redirect("Room.aspx?checkin=" + checkInDate + "&checkout=" + checkOutDate + "&adults=" + adults + "&children=" + children);
            //}
        }
    }
}
