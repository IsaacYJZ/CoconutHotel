using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CoconutHotel
{
    public partial class AdminReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindReportData();
            }
        }

        private void BindReportData()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            string query = @"
            SELECT
                u.userName,
                p.paymentDate,
                DATEDIFF(day, b.checkInDate, b.checkOutDate) AS day,
                rt.roomName AS roomName,
                r.roomImg AS roomImg,
                p.paymentMethod,
                p.totalPayment
            FROM
                Booking b
            INNER JOIN
                [User] u ON b.userID = u.userID
            INNER JOIN
                Payment p ON b.bookingID = p.bookingID
            INNER JOIN
                BookingRoom br ON b.bookingID = br.bookingID
            INNER JOIN
                Room r ON br.roomID = r.roomID
            INNER JOIN
                RoomType rt ON br.roomType = rt.roomType";

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
                        gridViewReport.DataSource = dataTable;
                        gridViewReport.DataBind();
                        lblMessage.Visible = false;// Hide the message label if there are bookings
                    }
                    else
                    {
                        // Display a message when no rooms are found
                        lblMessage.Visible = true;
                    }
                }
            }
        }
        protected void SearchButton_Click(object sender, EventArgs e)
        {
            // Construct the SQL query dynamically based on the search criteria
            string query = @"
            SELECT
                u.userName,
                p.paymentDate,
                DATEDIFF(day, b.checkInDate, b.checkOutDate) AS day,
                rt.roomName AS roomName,
                r.roomImg AS roomImg,
                p.paymentMethod,
                p.totalPayment
            FROM
                Booking b
            INNER JOIN
                [User] u ON b.userID = u.userID
            INNER JOIN
                Payment p ON b.bookingID = p.bookingID
            INNER JOIN
                BookingRoom br ON b.bookingID = br.bookingID
            INNER JOIN
                Room r ON br.roomID = r.roomID
            INNER JOIN
                RoomType rt ON br.roomType = rt.roomType
            WHERE 1 = 1"; // Start with a condition that is always true

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
                        gridViewReport.DataSource = dataTable;
                        gridViewReport.DataBind();
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
        
