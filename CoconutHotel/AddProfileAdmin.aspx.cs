using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CoconutHotel
{
    public partial class AddProfileAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void cvPassword_ServerValidate(object source, ServerValidateEventArgs args)
        {
            // Define the regular expression pattern for the password validation
            string passwordPattern = @"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[^\da-zA-Z]).{8,}$";

            // Check if the password matches the pattern
            if (System.Text.RegularExpressions.Regex.IsMatch(args.Value, passwordPattern))
            {
                args.IsValid = true; // Password is valid
            }
            else
            {
                args.IsValid = false; // Password is invalid
            }
        }

        protected void btnSaveProfile_Click(object sender, EventArgs e)
        {
            // Retrieve values from form fields
            string username = txtUsername.Text.Trim();
            string icNumber = txtICNumber.Text.Trim();
            string phoneNumber = txtPhoneNumber.Text.Trim();
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();
            string userType = ddlUserType.SelectedValue;
            string userStatus = ddlUserStatus.SelectedValue;
            string hashedPassword = HashPassword(password);

            // Validate form data (add more validation as needed)

            // Insert data into database
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                // Generate a unique userID
                string userID = GenerateUniqueUserID(connection, userType);

                // If userID is null, it means there was an error generating a unique userID
                if (userID == null)
                {
                    // Handle the error
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Failed to generate a unique userID. Please try again.');", true);
                    return;
                }

                // Insert data with the generated userID
                string query = "INSERT INTO [User] (userID, userName, icNum, phoneNum, email, [password], userType, userStatus) " +
                               "VALUES (@UserID, @UserName, @ICNumber, @PhoneNumber, @Email, @Password, @UserType, @UserStatus)";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@UserID", userID);
                    command.Parameters.AddWithValue("@UserName", username);
                    command.Parameters.AddWithValue("@ICNumber", icNumber);
                    command.Parameters.AddWithValue("@PhoneNumber", phoneNumber);
                    command.Parameters.AddWithValue("@Email", email);
                    command.Parameters.AddWithValue("@Password", hashedPassword);
                    command.Parameters.AddWithValue("@UserType", userType);
                    command.Parameters.AddWithValue("@UserStatus", userStatus);

                    try
                    {
                        int rowsAffected = command.ExecuteNonQuery();
                        if (rowsAffected > 0)
                        {
                            // Insert successful
                            // Display success message or redirect to another page
                            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('User profile saved successfully.');", true);

                            // Redirect to AdminHomepage.aspx after a short delay
                            ClientScript.RegisterStartupScript(this.GetType(), "redirect", "setTimeout(function(){ window.location.href = 'AdminHomepage.aspx'; }, 2000);", true);
                        }
                        else
                        {
                            // Insert failed
                            // Handle the failure (display error message, log the error, etc.)
                            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Failed to insert user profile. Please try again.');", true);
                        }
                    }
                    catch (Exception ex)
                    {
                        // Handle the exception (display error message, log the error, etc.)
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('An error occurred: {ex.Message}');", true);
                    }
                }
            }
        }

        private string HashPassword(string password)
        {
            using (var sha256 = System.Security.Cryptography.SHA256.Create())
            {
                // ComputeHash - returns byte array
                byte[] bytes = sha256.ComputeHash(System.Text.Encoding.UTF8.GetBytes(password));

                // Convert byte array to a string
                return Convert.ToBase64String(bytes);
            }
        }
        // Method to generate a unique userID
        private string GenerateUniqueUserID(SqlConnection connection, string userType)
        {
            // Generate the initial userID
            string initialUserID = userType.Substring(0, 1) + "0001"; // Assuming userType is either "Admin" or "Customer"

            // Check if the initial userID already exists
            string query = "SELECT COUNT(*) FROM [User] WHERE userID = @UserID";
            using (SqlCommand command = new SqlCommand(query, connection))
            {
                command.Parameters.AddWithValue("@UserID", initialUserID);
                int count = (int)command.ExecuteScalar();
                if (count == 0)
                {
                    // The initial userID is unique, return it
                    return initialUserID;
                }
            }

            // If the initial userID already exists, generate a new one by incrementing the number part
            for (int i = 2; i <= 9999; i++)
            {
                string newUserID = userType.Substring(0, 1) + i.ToString("D4");
                string checkQuery = "SELECT COUNT(*) FROM [User] WHERE userID = @UserID";
                using (SqlCommand command = new SqlCommand(checkQuery, connection))
                {
                    command.Parameters.AddWithValue("@UserID", newUserID);
                    int count = (int)command.ExecuteScalar();
                    if (count == 0)
                    {
                        // The new userID is unique, return it
                        return newUserID;
                    }
                }
            }

            // If all attempts fail, return null to indicate failure
            return null;
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserProfileAdmin.aspx");
        }
    }
}