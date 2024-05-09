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
        // Declare the selectedRooms list outside of the Page class
        List<dynamic> selectedRooms = new List<dynamic>();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindRooms();

                // Initialize selectedRooms list if not already initialized
                if (Session["SelectedRooms"] == null)
                {
                    selectedRooms = new List<dynamic>();
                    Session["SelectedRooms"] = selectedRooms;
                }
                else
                {
                    selectedRooms = (List<dynamic>)Session["SelectedRooms"];
                }
            }
            else
            {
                selectedRooms = (List<dynamic>)Session["SelectedRooms"];
            }
        }


        protected void bookBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("PaymentPage.aspx");
        }





        protected void BindRooms()
        {
            string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\Asus\\Source\\Repos\\IsaacYJZ\\CoconutHotel\\CoconutHotel\\App_Data\\CoconutHotel.mdf;Integrated Security=True";
            string query = "SELECT Room.roomID, RoomType.roomType, RoomType.roomName, RoomType.roomDesc, Room.occupancy, Room.roomImg, Room.roomPrice, Room.roomStatus FROM Room JOIN RoomType ON Room.roomType = RoomType.roomType";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                RoomRepeater.DataSource = reader;
                RoomRepeater.DataBind();
            }
        }

        protected void submitBtn_Click(object sender, EventArgs e)
        {
            // Get the selected check-in and check-out dates
            DateTime checkIn = DateTime.Parse(checkInDate.Text);
            DateTime checkOut = DateTime.Parse(checkOutDate.Text);

            // Get the number of adults and children
            int numOfAdults = int.Parse(adultsDropdown.SelectedValue);
            int numOfChildren = int.Parse(childrenDropdown.SelectedValue);

            // Calculate the total number of guests
            int totalGuests = numOfAdults + numOfChildren;
            string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\Asus\\Source\\Repos\\IsaacYJZ\\CoconutHotel\\CoconutHotel\\App_Data\\CoconutHotel.mdf;Integrated Security=True";

            // Query to fetch available rooms based on the selected date and occupancy
            string query = @"SELECT Room.roomID, RoomType.roomType, RoomType.roomName, RoomType.roomDesc, 
             Room.occupancy, Room.roomImg, Room.roomPrice, Room.roomStatus 
             FROM Room 
             JOIN RoomType ON Room.roomType = RoomType.roomType 
             WHERE Room.roomStatus = 'Available' 
             AND Room.roomID NOT IN 
             (SELECT BookingRoom.roomID FROM BookingRoom 
             JOIN Booking ON BookingRoom.bookingID = Booking.bookingID
             WHERE ((@checkInDate BETWEEN Booking.checkInDate AND Booking.checkOutDate) 
             OR (@checkOutDate BETWEEN Booking.checkInDate AND Booking.checkOutDate))
             AND Booking.bookingStatus <> 'Cancelled')";



            // Establish connection and execute the query
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@totalGuests", totalGuests);
                command.Parameters.AddWithValue("@checkInDate", checkIn);
                command.Parameters.AddWithValue("@checkOutDate", checkOut);

                connection.Open();
                SqlDataReader reader = command.ExecuteReader();

                // Bind the filtered rooms to the RoomRepeater
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
                // Retrieve the selected check-in and check-out dates
                DateTime checkIn = DateTime.Parse(checkInDate.Text);
                DateTime checkOut = DateTime.Parse(checkOutDate.Text);
                // Get the number of adults and children
                int numOfAdults = int.Parse(adultsDropdown.SelectedValue);
                int numOfChildren = int.Parse(childrenDropdown.SelectedValue);
                List<dynamic> selectedRoomsFromSession = Session["SelectedRooms"] as List<dynamic>;

                // Check if there are already rooms in the cart
                if (selectedRooms.Count > 0)
                {
                    // Iterate through each room in the cart
                    foreach (var room in selectedRooms)
                    {
                        // Check if the check-in and check-out dates of the current room match the selected dates
                        if (room.CheckInDate != checkIn || room.CheckOutDate != checkOut)
                        {
                            // If dates don't match, prompt an error and return
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('All rooms in the cart must have the same check-in and check-out dates.');", true);
                            return;
                        }
                    }
                }

                // Retrieve the room details from the Repeater
                RepeaterItem item = (sender as Button).NamingContainer as RepeaterItem;
                if (item != null)
                {
                    // Retrieve other details from the RepeaterItem
                    string roomID = e.CommandArgument.ToString();
                    string roomType = (item.FindControl("roomTypeLabel") as Label)?.Text;
                    string roomName = (item.FindControl("roomNameLabel") as Label)?.Text;
                    string roomPrice = (item.FindControl("roomPriceLabel") as Label)?.Text;
                    string roomImage = (item.FindControl("RoomImageLabel") as Label)?.Text;

                    // Create a new object to store the room details
                    dynamic room = new
                    {
                        RoomID = roomID,
                        RoomType = roomType,
                        RoomName = roomName,
                        RoomPrice = roomPrice,
                        RoomImage = roomImage,
                        CheckInDate = checkIn, // Add check-in date to the room object
                        CheckOutDate = checkOut,// Add check-out date to the room object
                        NumOfAdults = numOfAdults, // Add number of adults to the room object
                        NumOfChildren = numOfChildren,
                    };

                    // Add the room details to the selectedRooms list
                    selectedRooms.Add(room);

                    // Store the updated selectedRooms list in the session
                    Session["SelectedRooms"] = selectedRooms;
                    Session["CheckInDate"] = DateTime.Parse(checkInDate.Text);
                    Session["CheckOutDate"] = DateTime.Parse(checkOutDate.Text);
                    // Redirect to the payment page
                    Response.Redirect("RoomCart.aspx");
                }
            }
        }

        // Store the selectedRooms list in the session


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