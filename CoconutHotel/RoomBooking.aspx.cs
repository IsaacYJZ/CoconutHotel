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
            // Retrieve user input
            DateTime checkIn = DateTime.Parse(checkInDate.Text);
            DateTime checkOut = DateTime.Parse(checkOutDate.Text);
            int numOfAdults = int.Parse(adultsDropdown.SelectedValue);
            int numOfChildren = int.Parse(childrenDropdown.SelectedValue);

            // Check if there are any existing bookings that clash with the entered dates
            if (CheckBookingClash(checkIn, checkOut))
            {
                // Display error message to the user
                //errorMessageLabel.Text = "Error: The selected dates clash with existing bookings. Please choose different dates.";
                return; // Exit the method without executing the query
            }

            // If no clash, proceed to fetch available rooms
            FetchAvailableRooms(checkIn, checkOut, numOfAdults, numOfChildren);
        }

        private bool CheckBookingClash(DateTime checkIn, DateTime checkOut)
        {
            string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\Asus\\Source\\Repos\\IsaacYJZ\\CoconutHotel\\CoconutHotel\\App_Data\\CoconutHotel.mdf;Integrated Security=True";

            // Construct SQL query to check for clash with existing bookings
            string query = "SELECT COUNT(*) FROM Booking WHERE @checkIn < checkOutDate AND @checkOut > checkInDate";

            // Execute the query to check for clashes
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@checkIn", checkIn);
                command.Parameters.AddWithValue("@checkOut", checkOut);

                connection.Open();
                int clashCount = (int)command.ExecuteScalar();

                // If clashCount is greater than 0, there's a clash
                return clashCount > 0;
            }
        }

        private void FetchAvailableRooms(DateTime checkIn, DateTime checkOut, int numOfAdults, int numOfChildren)
        {
            string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\Asus\\Source\\Repos\\IsaacYJZ\\CoconutHotel\\CoconutHotel\\App_Data\\CoconutHotel.mdf;Integrated Security=True";

            // Construct SQL query to fetch available rooms
            string query = @"SELECT RoomType.roomType, roomName, roomPrice, roomDesc, roomImage 
                    FROM RoomType 
                    INNER JOIN Room ON RoomType.roomType = Room.roomType 
                    LEFT JOIN (
                        SELECT roomID, SUM(CONVERT(INT, numOfAdult)) AS totalAdults, SUM(CONVERT(INT, numOfChild)) AS totalChildren
                        FROM Booking
                        WHERE (checkOutDate IS NULL OR checkOutDate <= @checkIn OR checkInDate >= @checkOut)
                        GROUP BY roomID
                    ) AS Occupancy ON Room.roomID = Occupancy.roomID
                    WHERE (Room.occupancy >= @totalGuests OR (Room.occupancy - ISNULL(Occupancy.totalAdults, 0) - ISNULL(Occupancy.totalChildren, 0)) >= @totalGuests)";

            // Execute the query to fetch available rooms
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@totalGuests", numOfAdults + numOfChildren);
                command.Parameters.AddWithValue("@checkIn", checkIn);
                command.Parameters.AddWithValue("@checkOut", checkOut);

                connection.Open();
                SqlDataReader reader = command.ExecuteReader();

                // Bind the results to the repeater control
                RoomRepeater.DataSource = reader;
                RoomRepeater.DataBind();
            }
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