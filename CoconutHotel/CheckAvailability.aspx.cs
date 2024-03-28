using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CoconutHotel
{
    public partial class CheckAvailabililty : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void submitBtn_Click(object sender, EventArgs e)
        {
            // Check if all fields are filled
            if (checkInDate.Text == "" || checkOutDate.Text == "")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "emptyFieldsError", "alert('Please fill in all fields.');", true);
                return; // Exit the method if any field is empty
            }

            // Check if arrival date is earlier than departure date
            DateTime checkInDateTime;
            DateTime checkOutDateTime;
            if (!DateTime.TryParse(checkInDate.Text, out checkInDateTime) || !DateTime.TryParse(checkOutDate.Text, out checkOutDateTime))
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "invalidDateFormatError", "alert('Invalid date format. Please enter valid dates.');", true);
                return; // Exit the method if date format is invalid
            }

            if (checkInDateTime > checkOutDateTime)
            {
                // Show error message
                ScriptManager.RegisterStartupScript(this, this.GetType(), "arrivalEarlierError", "alert('Check-out date cannot be earlier than check-in date. Please select again.');", true);
            }
            else if (checkInDateTime < DateTime.Today || checkOutDateTime < DateTime.Today)
            {
                // Show error message if dates are earlier than current date
                ScriptManager.RegisterStartupScript(this, this.GetType(), "dateInPastError", "alert('Check-in or check-out date cannot be earlier than today. Please select valid dates.');", true);
            }
            else
            {
                string adults = adultsDropdown.SelectedValue;
                string children = childrenDropdown.SelectedValue;

                // Redirect to Room.aspx with query parameters
                Response.Redirect("RoomBooking.aspx?checkin=" + checkInDate.Text + "&checkout=" + checkOutDate.Text + "&adults=" + adults + "&children=" + children);
            }
        }

        protected void checkInCal_SelectionChanged(object sender, EventArgs e)
        {
            checkInDate.Text = checkInCal.SelectedDate.ToLongDateString();

        }

        protected void checkOutCal_SelectionChanged(object sender, EventArgs e)
        {
            checkOutDate.Text = checkOutCal.SelectedDate.ToLongDateString();

        }
    }
}