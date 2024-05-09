using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace CoconutHotel
{
    public partial class AdminHomePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindBookingReceived();
                BindRoomsAvailability();
                BindPaymentReceived();
                BindUserGridView();
                BindRoomGridView();
                BindTopSellingRooms();
            }
        }

        private void BindBookingReceived()
        {
            try
            {
                // Fetch the count of completed bookings from the database
                string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                string query = "SELECT COUNT(*) FROM Booking WHERE bookingStatus = 'Booked'";

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        connection.Open();
                        int completedBookingsCount = (int)command.ExecuteScalar();
                        // Update the label or element displaying the completed bookings count
                        bookingReceivedCount.InnerText = completedBookingsCount.ToString();
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle exceptions
            }
        }

        private void BindRoomsAvailability()
        {
            try
            {
                // Fetch the count of available rooms from the database
                string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                string query = "SELECT COUNT(*) FROM Room WHERE roomStatus = 'Available'";

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        connection.Open();
                        int availableRoomsCount = (int)command.ExecuteScalar();
                        // Update the label or element displaying the available rooms count
                        roomsAvailabilityCount.InnerText = availableRoomsCount.ToString();
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle exceptions
            }
        }

        private void BindPaymentReceived()
        {
            try
            {
                // Fetch the count of completed payments from the database
                string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                string query = "SELECT COUNT(*) FROM Payment";

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        connection.Open();
                        int completedPaymentsCount = (int)command.ExecuteScalar();
                        // Update the label or element displaying the completed payments count
                        paymentReceivedCount.InnerText = completedPaymentsCount.ToString();
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle exceptions
            }
        }


        private void BindUserGridView()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            string query = "SELECT * FROM [User]";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();
                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    DataTable dataTable = new DataTable();
                    adapter.Fill(dataTable);

                    if (dataTable.Rows.Count > 0)
                    {
                        gridViewUsers.DataSource = dataTable;
                        gridViewUsers.DataBind();
                    }
                    else
                    {
                        // Display a message when no users are found
                        // You can add a label or handle this case as needed
                    }
                }
            }
        }

        private void BindTopSellingRooms()
        {
            try
            {
                string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                string query = @"
            SELECT TOP 3 
                rt.roomName, 
                rt.roomDesc, 
                rt.roomImage, 
                COUNT(br.roomID) AS RoomBookings
            FROM 
                BookingRoom br
            INNER JOIN 
                Room r ON br.roomID = r.roomID
            INNER JOIN 
                RoomType rt ON r.roomType = rt.roomType
            GROUP BY 
                rt.roomName, rt.roomDesc, rt.roomImage
            ORDER BY 
                RoomBookings DESC";

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        connection.Open();
                        SqlDataReader reader = command.ExecuteReader();

                        while (reader.Read())
                        {
                            string roomName = reader["roomName"].ToString();
                            string roomDesc = reader["roomDesc"].ToString();
                            string roomImage = reader["roomImage"].ToString();
                            int roomBookings = Convert.ToInt32(reader["RoomBookings"]);

                            // Create HTML for displaying top-selling room
                            string roomHtml = $@"
                        <div class='top-sales box'>
                            <div class='title'>{roomName}</div>
                            <div class='image'>
                                <img width='100' height='100' src='{roomImage}' alt='{roomName}' />
                            </div>
                            <div class='details'>
                                <p class='price'>{roomBookings} Bookings</p>
                                <p class='product-description'>{roomDesc}</p>
                            </div>
                        </div>";

                            // Add the HTML to the existing container
                            topSellingRoomsContainer.InnerHtml += roomHtml;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle exceptions
            }
        }


        private void BindRoomGridView()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            string query = @"
        SELECT 
        rt.roomName, 
        rt.roomDesc,  
        rt.roomImage, 
        COUNT(r.roomID) - COUNT(b.bookingID) AS AvailableRooms
        FROM 
            RoomType rt 
        INNER JOIN 
            Room r ON rt.roomType = r.roomType 
        LEFT JOIN 
            BookingRoom br ON r.roomID = br.roomID 
        LEFT JOIN 
            Booking b ON br.bookingID = b.bookingID 
                      AND b.bookingStatus = 'Booked'
        GROUP BY 
            rt.roomName, rt.roomDesc, rt.roomImage 
        ORDER BY 
            rt.roomImage";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {

                    connection.Open();
                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    DataTable dataTable = new DataTable();
                    adapter.Fill(dataTable);

                    if (dataTable.Rows.Count > 0)
                    {
                        gridViewRooms.DataSource = dataTable;
                        gridViewRooms.DataBind();
                    }
                    else
                    {
                        // Display a message when no rooms are found
                        // You can add a label or handle this case as needed
                    }
                }
            }
        }

        protected void ViewUserProfileButton_Click(object sender, EventArgs e)
        {
            // Redirect to UserProfileAdmin.aspx page
            Response.Redirect("UserProfileAdmin.aspx");
        }

        protected void ViewRoomButton_Click(object sender, EventArgs e)
        {
            // Redirect to UserProfileAdmin.aspx page
            Response.Redirect("RoomAdmin.aspx");
        }
    }
}