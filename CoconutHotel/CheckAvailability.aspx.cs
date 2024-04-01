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
            //// Check if all fields are filled
            //if (checkInDate.Text == "" || checkOutDate.Text == "")
            //{
            //    ScriptManager.RegisterStartupScript(this, this.GetType(), "emptyFieldsError", "alert('Please fill in all fields.');", true);
            //    return; // Exit the method if any field is empty
            //}

            //// Check if arrival date is earlier than departure date
            //DateTime checkInDateTime;
            //DateTime checkOutDateTime;
            //if (!DateTime.TryParse(checkInDate.Text, out checkInDateTime) || !DateTime.TryParse(checkOutDate.Text, out checkOutDateTime))
            //{
            //    ScriptManager.RegisterStartupScript(this, this.GetType(), "invalidDateFormatError", "alert('Invalid date format. Please enter valid dates.');", true);
            //    return; // Exit the method if date format is invalid
            //}

            //if (checkInDateTime > checkOutDateTime)
            //{
            //    // Show error message
            //    ScriptManager.RegisterStartupScript(this, this.GetType(), "arrivalEarlierError", "alert('Check-out date cannot be earlier than check-in date. Please select again.');", true);
            //}
            //else if (checkInDateTime < DateTime.Today || checkOutDateTime < DateTime.Today)
            //{
            //    // Show error message if dates are earlier than current date
            //    ScriptManager.RegisterStartupScript(this, this.GetType(), "dateInPastError", "alert('Check-in or check-out date cannot be earlier than today. Please select valid dates.');", true);
            //}
            //else
            //{


            // Redirect to Room.aspx with query parameters
            Page.Validate();
            if (Page.IsValid)
            {
                string adults = adultsDropdown.SelectedValue;
                string children = childrenDropdown.SelectedValue;
                Response.Redirect("RoomBooking.aspx?checkin=" + checkInDate.Text + "&checkout=" + checkOutDate.Text + "&adults=" + adults + "&children=" + children);
            }
            //}
        }
        protected void cvDate_ServerValidate(object source, ServerValidateEventArgs args)
        {
            // Parse the date from the TextBox
            DateTime selectedDate;
            if (!DateTime.TryParse(checkInDate.Text, out selectedDate))
            {
                // If the date is not in a valid format, consider it invalid
                args.IsValid = false;
                return;
            }

            // Compare the selected date with today's date
            args.IsValid = (selectedDate >= DateTime.Today);
        }


        protected void checkInCal_SelectionChanged(object sender, EventArgs e)
        {
            checkInDate.Text = checkInCal.SelectedDate.ToLongDateString();
            Page.Validate(); // Re-evaluate validation rules
        }

        protected void checkOutCal_SelectionChanged(object sender, EventArgs e)
        {
            checkOutDate.Text = checkOutCal.SelectedDate.ToLongDateString();
            Page.Validate("checkOutGroup"); // Re-evaluate validation rules for a specific validation group
        }

    }
}