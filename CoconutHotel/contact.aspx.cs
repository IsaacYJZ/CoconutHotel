using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CoconutHotel
{
    public partial class contact : System.Web.UI.Page
    {
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            //    // Retrieve user input from the form
            //    string firstName = contactName.Text;
            //    string email = contactEmail.Text;
            //    string message = contactMessage.Text;

            //    // Connection string to your database
            //    string connectionString = "Your_Connection_String_Here";

            //    // SQL query to insert user input into the database table
            //    string query = "INSERT INTO ContactMessages (FirstName, Email, Message) VALUES (@FirstName, @Email, @Message)";

            //    try
            //    {
            //        // Create a SqlConnection object
            //        using (SqlConnection connection = new SqlConnection(connectionString))
            //        {
            //            // Open the database connection
            //            connection.Open();

            //            // Create a SqlCommand object with the SQL query and connection
            //            using (SqlCommand command = new SqlCommand(query, connection))
            //            {
            //                // Add parameters to the SQL query to prevent SQL injection
            //                command.Parameters.AddWithValue("@FirstName", firstName);
            //                command.Parameters.AddWithValue("@Email", email);
            //                command.Parameters.AddWithValue("@Message", message);

            //                // Execute the SQL command
            //                int rowsAffected = command.ExecuteNonQuery();

            //                // Check if the insert operation was successful
            //                if (rowsAffected > 0)
            //                {
            //                    // Display a success message
            //                    Response.Write("<script>alert('Your message has been sent. We will get back to you soon.');</script>");
            //                }
            //                else
            //                {
            //                    // Display an error message
            //                    Response.Write("<script>alert('Failed to send message. Please try again later.');</script>");
            //                }
            //            }
            //        }
            //    }
            //    catch (Exception ex)
            //    {
            //        // Display any exceptions that occur during database operations
            //        Response.Write("<script>alert('An error occurred: " + ex.Message + "');</script>");
            //    }
        }
    }
}