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
            string query = "SELECT b.bookingID, u.userName AS UserName, rt.roomName AS RoomName, b.bookingDate, b.checkInDate, b.checkOutDate, b.numOfAdult, b.numOfChild, p.paymentMethod " +
                           "FROM Booking b " +
                           "INNER JOIN [User] u ON b.userID = u.userID " +
                           "INNER JOIN Room r ON b.roomID = r.roomID " +
                           "INNER JOIN RoomType rt ON r.roomType = rt.roomType " +
                           "INNER JOIN Payment p ON b.paymentID = p.paymentID";


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
                    }
                    else
                    {
                        // Display a message when no bookings are found
                        // You can add a label or handle this case as needed
                    }
                }
            }
        }
        protected void gridViewBookings_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = gridViewBookings.SelectedRow;
            if (row != null)
            {
                DropDownList ddlBookingStatus = (DropDownList)row.FindControl("bookingStatus");
                DataRowView dataRow = (DataRowView)row.DataItem;

                // Set the selected value of the dropdown list
                if (ddlBookingStatus != null)
                {
                    ddlBookingStatus.SelectedValue = dataRow["bookingStatus"].ToString();
                }
            }
        }


        protected void bookingStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Get the selected booking status
            DropDownList ddlBookingStatus = (DropDownList)sender;
            string newStatus = ddlBookingStatus.SelectedValue;

            // Get the row index of the selected DropDownList
            GridViewRow row = (GridViewRow)ddlBookingStatus.NamingContainer;

            // Check if the row is not null and its RowType is DataRow
            if (row != null && row.RowType == DataControlRowType.DataRow)
            {
                // Get the row index of the selected row
                int rowIndex = row.RowIndex;

                // Get the booking ID from the GridView using the correct index
                string bookingID = gridViewBookings.DataKeys[rowIndex]["bookingID"].ToString();

                // Update the database with the new booking status
                UpdateBookingStatus(bookingID, newStatus);
            }
        }


        private void UpdateBookingStatus(string bookingID, string newStatus)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            string query = "UPDATE Booking SET bookingStatus = @NewStatus WHERE bookingID = @BookingID";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@NewStatus", newStatus);
                    command.Parameters.AddWithValue("@BookingID", bookingID);

                    connection.Open();
                    int rowsAffected = command.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        // Update the GridView row directly
                        GridViewRow row = gridViewBookings.Rows.Cast<GridViewRow>()
                                             .FirstOrDefault(r => ((string)gridViewBookings.DataKeys[r.RowIndex]["bookingID"]) == bookingID);

                        if (row != null)
                        {
                            DropDownList ddlBookingStatus = (DropDownList)row.FindControl("bookingStatus");
                            ddlBookingStatus.SelectedValue = newStatus;
                        }
                    }
                }
            }
        }
        protected void SearchButton_Click(object sender, EventArgs e)
        {
            // Construct the SQL query dynamically based on the search criteria
            string query = "SELECT b.bookingID, u.userName AS UserName, rt.roomName AS RoomName, b.bookingDate, b.bookingTime, b.checkInDate, b.checkOutDate, b.numOfAdult, b.numOfChild, p.paymentMethod " +
                           "FROM Booking b " +
                           "INNER JOIN [User] u ON b.userID = u.userID " +
                           "INNER JOIN Room r ON b.roomID = r.roomID " +
                           "INNER JOIN RoomType rt ON r.roomType = rt.roomType " +
                           "INNER JOIN Payment p ON b.paymentID = p.paymentID " +
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

                    }
                    else
                    {
                        // Display a message when no bookings are found
                        // You can add a label or handle this case as needed
                    }
                }
            }
        }

    }
}
