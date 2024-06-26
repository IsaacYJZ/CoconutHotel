﻿using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace CoconutHotel
{
    public partial class AdminLogin : System.Web.UI.Page
    {
        // Connection string for your database
        string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if it's a postback or not
            if (!IsPostBack)
            {
                // Check if a success message is passed in the query parameters
                if (!string.IsNullOrEmpty(Request.QueryString["successMessage"]))
                {
                    string successMessage = Request.QueryString["successMessage"];
                    lblMessage.Text = successMessage;
                }
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();

            emailFormatErrorMessage.Text = "";
            emailNotFoundErrorMessage.Text = "";
            passwordErrorMessage.Text = "";

            try
            {
                // Check if the provided email and password are valid
                if (!ValidateEmail(email))
                {
                    return; // Exit the method if the email address is invalid
                }

                // Validate the user with the provided email and password
                bool isValidUser = ValidateAdmin(email, password);

                if (!isValidUser)
                {
                    emailNotFoundErrorMessage.Text = ""; // Clear the email not found error message
                    passwordErrorMessage.Text = "Incorrect password. Please try again.";
                }
                else
                {
                    // Redirect to admin dashboard if credentials are valid
                    Response.Redirect("AdminHomePage.aspx");
                }

            }
            catch (Exception ex)
            {
                // Handle exception
            }
        }

        private bool ValidateEmail(string email)
        {
            // You can implement email validation logic here if needed
            return true;
        }

        private bool ValidateAdmin(string email, string password)
        {
            // Hash the provided password
            string hashedPassword = HashPassword(password);

            // Validate if the user is an admin (user ID starts with "A") with the provided credentials
            string query = "SELECT COUNT(*) FROM [User] WHERE email = @Email AND password = @Password AND userID LIKE 'A%'";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Email", email);
                    command.Parameters.AddWithValue("@Password", hashedPassword); // Compare with hashed password

                    connection.Open();
                    int count = (int)command.ExecuteScalar();

                    // If count > 0, admin exists with the provided credentials
                    return count > 0;
                }
            }
        }

        // Method to hash the password using SHA-256 algorithm
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

    }
}
