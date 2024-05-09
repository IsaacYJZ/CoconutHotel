using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace CoconutHotel
{
    public partial class UserProfileAdmin : System.Web.UI.Page
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

        protected void EditButton_Click(object sender, EventArgs e)
        {
            // Get the selected row from the GridView
            LinkButton btnEdit = (LinkButton)sender;
            GridViewRow row = (GridViewRow)btnEdit.NamingContainer;

            // Get the userID from the DataKeys collection of the GridView
            string userId = gridViewUsers.DataKeys[row.RowIndex].Value.ToString();

            // Redirect to EditProfileAdmin.aspx with the userID as a query parameter
            Response.Redirect("EditProfileAdmin.aspx?UserID=" + userId);
        }


        protected void DeleteButton_Click(object sender, EventArgs e)
        {
            // Find the clicked LinkButton in the GridView row
            LinkButton deleteButton = (LinkButton)sender;
            GridViewRow row = (GridViewRow)deleteButton.NamingContainer;

            // Get the userID from the GridView data keys
            string userID = gridViewUsers.DataKeys[row.RowIndex].Value.ToString();

            // Store the userID in a hidden field to use it in the btnDeleteUser_Click event
            hiddenFieldUserID.Value = userID;

            // Display the delete confirmation form
            deleteForm.Visible = true;
        }


        protected void btnDeleteUser_Click(object sender, EventArgs e)
        {
            // Retrieve the userID from the hidden field
            string userID = hiddenFieldUserID.Value;

            // Perform the deletion of associated bookings first
            DeleteAssociatedBookings(userID);

            // Perform the deletion of the user profile with the retrieved userID from the database
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string query = "DELETE FROM [User] WHERE userID = @UserID";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@UserID", userID);
                    int rowsAffected = command.ExecuteNonQuery();
                    if (rowsAffected > 0)
                    {
                        // Deletion successful
                        // Display success message or redirect to another page
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('User profile deleted successfully.');", true);

                        // Refresh the GridView to reflect the changes
                        BindGridView();
                    }
                    else
                    {
                        // Deletion failed
                        // Handle the failure (display error message, log the error, etc.)
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Failed to delete user profile. Please try again.');", true);
                    }
                }

                // Close the connection
                connection.Close();
            }

            // Hide the delete confirmation form after deletion
            deleteForm.Visible = false;
        }

        private void DeleteAssociatedBookings(string userID)
        {
            // Delete associated bookings from BookingRoom table
            string deleteBookingRoomQuery = "DELETE FROM BookingRoom WHERE bookingID IN (SELECT bookingID FROM Booking WHERE userID = @UserID)";
            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
            {
                using (SqlCommand deleteBookingRoomCommand = new SqlCommand(deleteBookingRoomQuery, connection))
                {
                    connection.Open();
                    deleteBookingRoomCommand.Parameters.AddWithValue("@UserID", userID);
                    deleteBookingRoomCommand.ExecuteNonQuery();
                }
            }

            // Delete associated bookings from Booking table
            string deleteBookingsQuery = "DELETE FROM Booking WHERE userID = @UserID";
            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
            {
                using (SqlCommand deleteBookingsCommand = new SqlCommand(deleteBookingsQuery, connection))
                {
                    connection.Open();
                    deleteBookingsCommand.Parameters.AddWithValue("@UserID", userID);
                    deleteBookingsCommand.ExecuteNonQuery();
                }
            }
        }



        protected void btnCancelDelete_Click(object sender, EventArgs e)
        {
            // Cancel delete action
            deleteForm.Visible = false;
        }

        protected void btnAddProfile_Click(object sender, EventArgs e)
        {
            // Redirect to AddProfileAdmin.aspx
            Response.Redirect("AddProfileAdmin.aspx");
        }

        protected void SearchButton_Click(object sender, EventArgs e)
        {
            // Get the search criteria
            string userName = this.userName.Text.Trim();
            string userType = this.userType.SelectedValue;
            string userStatus = this.userStatus.SelectedValue;

            // Construct the SQL query with parameters
            string query = "SELECT * FROM [User] WHERE 1 = 1";

            if (!string.IsNullOrEmpty(userName))
            {
                query += " AND UserName LIKE @UserName";
            }

            if (!string.IsNullOrEmpty(userType))
            {
                query += " AND UserType = @UserType";
            }

            if (!string.IsNullOrEmpty(userStatus))
            {
                query += " AND UserStatus = @UserStatus";
            }

            // Execute the query
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    if (!string.IsNullOrEmpty(userName))
                    {
                        command.Parameters.AddWithValue("@UserName", "%" + userName + "%");
                    }

                    if (!string.IsNullOrEmpty(userType))
                    {
                        command.Parameters.AddWithValue("@UserType", userType);
                    }

                    if (!string.IsNullOrEmpty(userStatus))
                    {
                        command.Parameters.AddWithValue("@UserStatus", userStatus);
                    }

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
                        // No users found matching the search criteria
                        // You can display a message or handle this case as needed
                    }
                }
            }
        }

    }
}
