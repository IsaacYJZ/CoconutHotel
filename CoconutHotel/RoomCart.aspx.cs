using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CoconutHotel
{


    public partial class roomCart : System.Web.UI.Page
    {
        protected override void Render(HtmlTextWriter writer)
        {
            // Register the remove button for event validation
            foreach (RepeaterItem item in roomRepeater.Items)
            {
                Button removeBtn = item.FindControl("removeBtn") as Button;
                if (removeBtn != null)
                {
                    string controlId = removeBtn.UniqueID;
                    ClientScript.RegisterForEventValidation(controlId);
                }
            }

            base.Render(writer);
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                BindRoomCart();

            }
        }



        private void BindRoomCart()
        {
            List<dynamic> selectedRoomsFromSession = Session["SelectedRooms"] as List<dynamic>;

            if (selectedRoomsFromSession != null)
            {
                if (selectedRoomsFromSession.Count > 0)
                {
                    roomRepeater.DataSource = selectedRoomsFromSession;
                    roomRepeater.DataBind();
                    noRoomsMessage.Visible = false;
                    decimal totalPrice = 0;
                    // Calculate total price for each room
                    foreach (var room in selectedRoomsFromSession)
                    {
                        // Calculate number of nights
                        DateTime checkInDate = room.CheckInDate;
                        DateTime checkOutDate = room.CheckOutDate;
                        int numberOfNights = (int)(checkOutDate - checkInDate).TotalDays;

                        // Calculate total price for the room
                        decimal totalPriceForRoom = Convert.ToDecimal(room.RoomPrice) * numberOfNights;

                        // Add total price to room object
                        totalPrice += totalPriceForRoom;
                    }

                    // Calculate total price for all rooms
                    Session["totalPrice"] = totalPrice;

                    // Set total price label text
                    TotalPriceLabel.Text = totalPrice.ToString("0.00");
                }
                else
                {
                    noRoomsMessage.Visible = true;
                    // Set total price label text to 0 if no rooms are selected
                    TotalPriceLabel.Text = "0";
                }
            }
            else
            {
                noRoomsMessage.Visible = true;
                // Set total price label text to 0 if no rooms are selected
                TotalPriceLabel.Text = "0";
            }
        }





        protected void removeBtn_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "Remove")
            {
                string roomIDToRemove = e.CommandArgument.ToString();

                // Retrieve the selected rooms from the session
                List<dynamic> selectedRoomsFromSession = Session["SelectedRooms"] as List<dynamic>;

                // Remove the room with the specified ID from the list
                selectedRoomsFromSession.RemoveAll(room => room.RoomID == roomIDToRemove);

                // Update the session with the modified list
                Session["SelectedRooms"] = selectedRoomsFromSession;

                // Rebind the roomRepeater to reflect the changes
                BindRoomCart();
            }
        }


        protected void ProceedToCheckoutBtn_Click(object sender, EventArgs e)
        {
            // Retrieve selected rooms from the session
            List<dynamic> selectedRoomsFromSession = Session["SelectedRooms"] as List<dynamic>;

            if (selectedRoomsFromSession != null && selectedRoomsFromSession.Count > 0)
            {
                // Generate the next booking ID
                string bookingID = GenerateNextBookingID();

                // If you're retrieving the user ID from the session, retrieve it here
                string userID = "C0001"; // Replace "" with the logic to retrieve the user ID

                // Save booking details to the database
                SaveBookingToDatabase(bookingID, userID);

                // Save room details to the database
                foreach (var room in selectedRoomsFromSession)
                {
                    SaveRoomBookingToDatabase(room.RoomID, bookingID, room.RoomType);
                }

                // Redirect to checkout page or perform other actions
                Response.Redirect("checkoutpage.aspx");
            }
            else
            {
                // Handle case when no rooms are selected
                // You can display a message or perform other actions
            }
        }


        private string GenerateNextBookingID()
        {
            // Retrieve the last booking ID from the database
            string lastBookingID = GetLastBookingIDFromDatabase(); // Implement this method to retrieve the last booking ID

            // Parse the numeric part of the last booking ID and increment it by 1
            int lastNumericPart = int.Parse(lastBookingID.Substring(1)); // Assuming the format is "B0001"
            int nextNumericPart = lastNumericPart + 1;

            // Generate the new booking ID by combining the letter "B" with the incremented numeric part
            string nextBookingID = "B" + nextNumericPart.ToString().PadLeft(4, '0'); // PadLeft ensures 4 digits with leading zeros

            return nextBookingID;
        }
        private string GetLastBookingIDFromDatabase()
        {
            string lastBookingID = "";

            // Connection string to your SQL Server database
            string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\Asus\\Source\\Repos\\IsaacYJZ\\CoconutHotel\\CoconutHotel\\App_Data\\CoconutHotel.mdf;Integrated Security=True";

            // SQL query to retrieve the last booking ID
            string query = "SELECT TOP 1 bookingID FROM Booking ORDER BY bookingID DESC";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();

                    // Execute the query and retrieve the last booking ID
                    object result = command.ExecuteScalar();
                    if (result != null)
                    {
                        lastBookingID = result.ToString();
                    }

                    connection.Close();
                }
            }

            return lastBookingID;
        }
        private void SaveBookingToDatabase(string bookingID, string userID)
        {
            // Define your connection string
            string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\Asus\\Source\\Repos\\IsaacYJZ\\CoconutHotel\\CoconutHotel\\App_Data\\CoconutHotel.mdf;Integrated Security=True";
            List<dynamic> selectedRoomsFromSession = Session["SelectedRooms"] as List<dynamic>;

            // Save booking details to the database
            string query = @"INSERT INTO Booking (bookingID, userID, bookingDate, bookingTime, checkInDate, checkOutDate, numOfAdult, numOfChild, bookingStatus) 
                    VALUES (@BookingID, @UserID, @BookingDate, @BookingTime, @CheckInDate, @CheckOutDate, @NumOfAdult, @NumOfChild, @BookingStatus)";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@BookingID", bookingID);
                    command.Parameters.AddWithValue("@UserID", userID);
                    command.Parameters.AddWithValue("@BookingDate", DateTime.Now.Date);
                    command.Parameters.AddWithValue("@BookingTime", DateTime.Now.TimeOfDay);
                    command.Parameters.AddWithValue("@CheckInDate", selectedRoomsFromSession.Min(room => room.CheckInDate));
                    command.Parameters.AddWithValue("@CheckOutDate", selectedRoomsFromSession.Max(room => room.CheckOutDate));
                    command.Parameters.AddWithValue("@NumOfAdult", selectedRoomsFromSession.Sum(room => room.NumOfAdults));
                    command.Parameters.AddWithValue("@NumOfChild", selectedRoomsFromSession.Sum(room => room.NumOfChildren));
                    command.Parameters.AddWithValue("@BookingStatus", "Booked");

                    connection.Open();
                    command.ExecuteNonQuery();
                    connection.Close();
                }
            }
        }

        private void SaveRoomBookingToDatabase(string roomID, string bookingID, string roomType)
        {
            // Define your connection string
            string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\Asus\\Source\\Repos\\IsaacYJZ\\CoconutHotel\\CoconutHotel\\App_Data\\CoconutHotel.mdf;Integrated Security=True";

            // Save room booking details to the database
            string query = @"INSERT INTO BookingRoom (bookingID, roomID, roomType) 
                    VALUES (@BookingID, @RoomID, @RoomType)";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    // Generate a unique room booking ID, you can use GUID or any other method
                    command.Parameters.AddWithValue("@BookingID", bookingID);

                    command.Parameters.AddWithValue("@RoomID", roomID);
                    command.Parameters.AddWithValue("@RoomType", roomType);


                    connection.Open();
                    command.ExecuteNonQuery();
                    connection.Close();
                }
            }
        }

    }
}