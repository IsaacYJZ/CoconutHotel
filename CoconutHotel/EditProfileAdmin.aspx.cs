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
    public partial class EditProfileAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["UserID"] != null)
                {
                    string userId = Request.QueryString["UserID"];
                    PopulateEditForm(userId);
                }
            }
        }

        private void PopulateEditForm(string userId)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            string query = "SELECT userName, icNum, phoneNum, email, password, userType, userStatus FROM [User] WHERE UserID = @UserID";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@UserID", userId);
                    connection.Open();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            txtUsername.Text = reader["userName"].ToString();
                            txtICNumber.Text = reader["icNum"].ToString();
                            txtPhoneNumber.Text = reader["phoneNum"].ToString();
                            txtEmail.Text = reader["email"].ToString();
                            txtPassword.Text = reader["password"].ToString(); // Assuming password is stored as plain text
                            ddlUserType.SelectedValue = reader["userType"].ToString();
                            ddlUserStatus.SelectedValue = reader["userStatus"].ToString();
                        }
                        else
                        {
                            // Handle case where no user data is found
                        }
                    }
                }
            }
        }


        protected void cvPassword_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string newPassword = args.Value;

            // Validation logic for the new password
            // Example: Check if the password meets the criteria (at least 8 characters, including at least one uppercase letter, one lowercase letter, one number, and one special character)
            if (newPassword.Length >= 8 &&
                newPassword.Any(char.IsUpper) &&
                newPassword.Any(char.IsLower) &&
                newPassword.Any(char.IsDigit) &&
                newPassword.Any(ch => !char.IsLetterOrDigit(ch)))
            {
                args.IsValid = true; // Password is valid
            }
            else
            {
                args.IsValid = false; // Password is invalid
            }
        }

        protected void btnUpdateProfile_Click(object sender, EventArgs e)
        {
            // Manually trigger validation for all input fields
            Page.Validate();

            // Check if all validations pass for each individual input field
            bool allValidationsPass =
                rfvUsername.IsValid &&
                rfvICNumber.IsValid &&
                revICNumber.IsValid &&
                rfvPhoneNumber.IsValid &&
                revPhoneNumber.IsValid &&
                rfvEmail.IsValid &&
                revEmail.IsValid &&
                rfvUserType.IsValid &&
                rfvUserStatus.IsValid;

            // Check if all validations pass
            if (allValidationsPass)
            {
                // Retrieve edited data from form fields
                string userId = Request.QueryString["UserID"];
                string username = txtUsername.Text;
                string icNumber = txtICNumber.Text;
                string phoneNumber = txtPhoneNumber.Text;
                string email = txtEmail.Text;
                string userType = ddlUserType.SelectedValue;
                string userStatus = ddlUserStatus.SelectedValue;
                string newPassword = txtPassword.Text; // New password input field

                // Check if the password is valid and the checkbox is checked
                if (chkChangePassword.Checked)
                {
                    // Validate the password field
                    cvPassword.Validate();

                    // Check if the password is valid
                    if (cvPassword.IsValid)
                    {
                        // Update user profile in the database with the new password
                        UpdateUserProfile(userId, username, icNumber, phoneNumber, email, userType, userStatus, newPassword);

                        // Clear the new password field
                        txtPassword.Text = "";
                    }
                    else
                    {
                        // Password is not valid, do not proceed with the update
                        return;
                    }
                }
                else // If the checkbox is unchecked, proceed with the update without changing the password
                {
                    // Update user profile in the database without changing the password
                    UpdateUserProfile(userId, username, icNumber, phoneNumber, email, userType, userStatus);

                    // Clear the new password field
                    txtPassword.Text = "";
                }

                // Redirect to UserProfileAdmin.aspx after updating the profile
                Response.Redirect("UserProfileAdmin.aspx");
            }
        }




        private void UpdateUserProfile(string userId, string username, string icNumber, string phoneNumber, string email, string userType, string userStatus, string newPassword = null)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            string query;

            // Check if newPassword is provided and not null
            if (!string.IsNullOrEmpty(newPassword))
            {
                // If newPassword is provided, update the password along with other fields
                query = "UPDATE [User] SET userName = @Username, icNum = @ICNumber, phoneNum = @PhoneNumber, email = @Email, userType = @UserType, userStatus = @UserStatus, password = @Password WHERE userID = @UserID";
            }
            else
            {
                // If newPassword is not provided, update other fields except password
                query = "UPDATE [User] SET userName = @Username, icNum = @ICNumber, phoneNum = @PhoneNumber, email = @Email, userType = @UserType, userStatus = @UserStatus WHERE userID = @UserID";
            }

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Username", username);
                    command.Parameters.AddWithValue("@ICNumber", icNumber);
                    command.Parameters.AddWithValue("@PhoneNumber", phoneNumber);
                    command.Parameters.AddWithValue("@Email", email);
                    command.Parameters.AddWithValue("@UserType", userType);
                    command.Parameters.AddWithValue("@UserStatus", userStatus);
                    command.Parameters.AddWithValue("@UserID", userId);

                    // If newPassword is provided, add parameter for password
                    if (!string.IsNullOrEmpty(newPassword))
                    {
                        command.Parameters.AddWithValue("@Password", newPassword);
                    }

                    connection.Open();
                    int rowsAffected = command.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('User profile updated successfully.');", true);
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Failed to update user profile. Please try again.');", true);
                    }
                }
            }
        }




        protected void chkChangePassword_CheckedChanged(object sender, EventArgs e)
        {
            divPasswordFields.Visible = chkChangePassword.Checked;

            // Trigger validation when checkbox is checked
            if (chkChangePassword.Checked)
            {
                Page.Validate();
            }
        }



        protected void txtNewPassword_TextChanged(object sender, EventArgs e)
        {

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserProfileAdmin.aspx");
        }
    }
}