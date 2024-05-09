using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Linq;
using System.Web.UI;

namespace CoconutHotel
{
    public partial class BookingAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGridView();
            }
        }

        private void BindGridView()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            string query = "SELECT b.bookingID, u.userName AS UserName, rt.roomName AS RoomName, b.bookingDate, b.checkInDate, b.checkOutDate, b.numOfAdult, b.numOfChild, p.paymentMethod, b.bookingStatus " +
                           "FROM Booking b " +
                           "INNER JOIN [User] u ON b.userID = u.userID " +
                           "INNER JOIN BookingRoom br ON b.bookingID = br.bookingID " +
                           "INNER JOIN RoomType rt ON br.roomType = rt.roomType " +
                           "INNER JOIN Payment p ON b.bookingID = p.bookingID";

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
                        gridViewBookings.DataSource = dataTable;
                        gridViewBookings.DataBind();
                        lblMessage.Visible = false; // Hide the message label if there are bookings
                    }
                    else
                    {
                        lblMessage.Visible = true; // Show the message label if no bookings are found
                    }
                }
            }
        }

        protected string GetOccupancy(object numOfAdult, object numOfChild)
        {
            int adult = Convert.ToInt32(numOfAdult);
            int child = Convert.ToInt32(numOfChild);
            int occupancy = adult + child;
            return occupancy.ToString();
        }

        protected void SearchButton_Click(object sender, EventArgs e)
        {
            // Construct the SQL query dynamically based on the search criteria
            string query = "SELECT b.bookingID, u.userName AS UserName, rt.roomName AS RoomName, b.bookingDate, b.checkInDate, b.checkOutDate, b.numOfAdult, b.numOfChild, p.paymentMethod, b.bookingStatus " +
                           "FROM Booking b " +
                           "INNER JOIN [User] u ON b.userID = u.userID " +
                           "INNER JOIN BookingRoom br ON b.bookingID = br.bookingID " +
                           "INNER JOIN RoomType rt ON br.roomType = rt.roomType " +
                           "INNER JOIN Payment p ON b.bookingID = p.bookingID " +
                           "WHERE 1 = 1"; // Start with a condition that is always true

            // Add conditions based on the provided search criteria
            if (!string.IsNullOrEmpty(userName.Text))
            {
                query += " AND u.userName LIKE @UserName";
            }

            if (roomType.SelectedValue != "")
            {
                query += " AND rt.roomName = @RoomName";
            }

            if (!string.IsNullOrEmpty(paymentType.SelectedValue))
            {
                query += " AND p.paymentMethod = @PaymentMethod";
            }

            // Execute the query and bind the results to the GridView
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    // Set parameter values based on the provided search criteria
                    if (!string.IsNullOrEmpty(userName.Text))
                    {
                        command.Parameters.AddWithValue("@UserName", "%" + userName.Text + "%");
                    }

                    if (roomType.SelectedValue != "")
                    {
                        command.Parameters.AddWithValue("@RoomName", roomType.SelectedValue);
                    }

                    if (!string.IsNullOrEmpty(paymentType.SelectedValue))
                    {
                        command.Parameters.AddWithValue("@PaymentMethod", paymentType.SelectedValue);
                    }

                    connection.Open();
                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    DataTable dataTable = new DataTable();
                    adapter.Fill(dataTable);

                    if (dataTable.Rows.Count > 0)
                    {
                        gridViewBookings.DataSource = dataTable;
                        gridViewBookings.DataBind();
                        lblMessage.Visible = false;// Hide the message label if there are bookings
                    }
                    else
                    {
                        lblMessage.Visible = true; // Show the message label if no bookings are found
                    }
                }
            }
        }

    }
}
