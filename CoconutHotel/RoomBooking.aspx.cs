using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
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
            //string checkIn = Request.QueryString["checkin"];
            //string checkOut = Request.QueryString["checkout"];
            //string adults = Request.QueryString["adults"];
            //string children = Request.QueryString["children"];

            // Display the retrieved values
            //CheckInDate.InnerText = checkIn; // Previously you had CheckOutDate.InnerText = checkIn;
            //CheckOutDate.InnerText = checkOut; // Corrected
            //Adults.InnerText = adults;
            //Children.InnerText = children;
            if (!IsPostBack)
            {
                BindRooms();
            }


        }
        
        protected void bookBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("PaymentPage.aspx");
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
            //Page.Validate();
            //if (Page.IsValid)
            //{
            //    string adults = adultsDropdown.SelectedValue;
            //    string children = childrenDropdown.SelectedValue;
            //    Response.Redirect("RoomBooking.aspx?checkin=" + checkInDate.Text + "&checkout=" + checkOutDate.Text + "&adults=" + adults + "&children=" + children);
            //}
            //}
        }
        protected void BindRooms()
        {
            string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\Asus\\Source\\Repos\\IsaacYJZ\\CoconutHotel\\CoconutHotel\\App_Data\\CoconutHotel.mdf;Integrated Security=True";
            string query = "SELECT * FROM RoomType";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                RoomRepeater.DataSource = reader;
                RoomRepeater.DataBind();
            }
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

        protected void bookBtn_Command(object sender, System.Web.UI.WebControls.CommandEventArgs e)
        {
            if (e.CommandName == "Book")
            {
                // Retrieve the room type from the CommandArgument
                string roomType = e.CommandArgument.ToString();

                // Here, you might perform some action based on the selected room type, such as
                // redirecting to a booking page with the selected room type, or adding the room
                // to a shopping cart, etc.

                // For demonstration purposes, let's redirect to a booking page with the selected room type
                Response.Redirect($"CheckAvailability.aspx?RoomType={roomType}");
            }
        }
        protected void RoomRepeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DataRowView row = e.Item.DataItem as DataRowView;
                if (row != null)
                {
                    string roomFeatures = "";
                    // Assuming you have a column named "roomFeatures" in your database containing feature icons
                    string[] features = row["roomFeatures"].ToString().Split(',');
                    foreach (string feature in features)
                    {
                        roomFeatures += $"<div class='room-info'><i class='{feature}'></i><span>{feature}</span></div>";
                    }
                    Literal roomFeaturesLiteral = e.Item.FindControl("roomFeaturesLiteral") as Literal;
                    if (roomFeaturesLiteral != null)
                    {
                        roomFeaturesLiteral.Text = roomFeatures;
                    }
                }
            }
        }
        protected string GetImageSizes(string imageUrl)
        {
            // Define your logic to generate different sizes for the image URL
            // For example, you can set the width and height inline styles

            // Let's assume you want to set the width to 100px and height to auto
            string style = "width: 558px; height: 379px;";

            // Return the generated inline CSS styles
            return $"style='{style}'";
        }




    }
}