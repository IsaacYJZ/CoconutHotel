using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;
using System.Web.UI;

namespace CoconutHotel
{
    public partial class register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string name = txtuserName.Text;
            string icNum = txtIc.Text;
            string email = txtEmail.Text;
            string phoneNum = txtPhoneNumber.Text;
            string password = txtPassword.Text;
            string confirmPassword = txtConfirmPassword.Text;
            string userType = "Customer";
            string userStatus = "Valid";

            string hashedPassword = HashPassword(password);

            if (password.Length < 6)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "PasswordLengthScript", "alert('Password must be at least six characters long!');", true);
                return;
            }

            if (UsernameTaken(name))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "UsernameTakenScript", "document.getElementById('usernameTakenMessage').innerText = 'The username is already taken. Please choose a different one.'; document.getElementById('usernameTakenMessage').style.display = 'block';", true);
                return;
            }

            if (ICNumberTaken(icNum))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "ICNumberTakenScript", "document.getElementById('icNumberTakenMessage').innerText = 'The IC number is already taken. Please try again.'; document.getElementById('icNumberTakenMessage').style.display = 'block';", true);
                return;
            }

            if (EmailTaken(email))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "EmailTakenScript", "document.getElementById('emailTakenMessage').innerText = 'The email is already taken. Please try again.'; document.getElementById('emailTakenMessage').style.display = 'block';", true);
                return;
            }

            if (PhoneNumberTaken(phoneNum))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "PhoneNumberTakenScript", "document.getElementById('phoneNumberTakenMessage').innerText = 'The phone number is already taken. Please try again.'; document.getElementById('phoneNumberTakenMessage').style.display = 'block';", true);
                return;
            }

            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            string getLastUserIDQuery = "SELECT TOP 1 userID FROM [dbo].[User] ORDER BY userID DESC;";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (SqlCommand command = new SqlCommand(getLastUserIDQuery, connection))
                {
                    string lastUserID = (string)command.ExecuteScalar();

                    int lastNumericID = int.Parse(lastUserID.Substring(1));

                    int nextNumericID = lastNumericID + 1;

                    string newUserID = "C" + nextNumericID.ToString().PadLeft(4, '0');

                    using (SqlCommand insertCommand = new SqlCommand("INSERT INTO [dbo].[User] ([userID], [userName], [icNum], [phoneNum], [email], [password], [userType], [userStatus]) VALUES (@UserID, @UserName, @ICNum, @PhoneNum, @Email, @Password, @UserType, @UserStatus);", connection))
                    {
                        insertCommand.Parameters.AddWithValue("@UserID", newUserID);
                        insertCommand.Parameters.AddWithValue("@UserName", name);
                        insertCommand.Parameters.AddWithValue("@ICNum", icNum);
                        insertCommand.Parameters.AddWithValue("@PhoneNum", phoneNum);
                        insertCommand.Parameters.AddWithValue("@Email", email);
                        insertCommand.Parameters.AddWithValue("@Password", hashedPassword);
                        insertCommand.Parameters.AddWithValue("@UserType", userType);
                        insertCommand.Parameters.AddWithValue("@UserStatus", userStatus);

                        int rowsAffected = insertCommand.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            string successMessage = "Registration Successful!";
                            Response.Redirect("login.aspx?successMessage=" + Server.UrlEncode(successMessage));
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "RegistrationFailedScript", "alert('Registration Failed, Please try again!');", true);
                        }
                    }
                }
            }
        }

        private bool UsernameTaken(string name)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            string checkUsernameQuery = "SELECT COUNT(*) FROM [dbo].[User] WHERE userName = @UserName;";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (SqlCommand command = new SqlCommand(checkUsernameQuery, connection))
                {
                    command.Parameters.AddWithValue("@UserName", name);

                    int count = (int)command.ExecuteScalar();

                    if (count > 0)
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }
            }
        }

        private bool ICNumberTaken(string icNum)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            string checkICNumberQuery = "SELECT COUNT(*) FROM [dbo].[User] WHERE icNum = @ICNum;";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (SqlCommand command = new SqlCommand(checkICNumberQuery, connection))
                {
                    command.Parameters.AddWithValue("@ICNum", icNum);

                    int count = (int)command.ExecuteScalar();

                    if (count > 0)
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }
            }
        }

        private bool EmailTaken(string email)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            string checkEmailQuery = "SELECT COUNT(*) FROM [dbo].[User] WHERE email = @Email;";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (SqlCommand command = new SqlCommand(checkEmailQuery, connection))
                {
                    command.Parameters.AddWithValue("@Email", email);

                    int count = (int)command.ExecuteScalar();

                    if (count > 0)
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }
            }
        }

        private bool PhoneNumberTaken(string phoneNum)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            string checkPhoneNumberQuery = "SELECT COUNT(*) FROM [dbo].[User] WHERE phoneNum = @PhoneNum;";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (SqlCommand command = new SqlCommand(checkPhoneNumberQuery, connection))
                {
                    command.Parameters.AddWithValue("@PhoneNum", phoneNum);

                    int count = (int)command.ExecuteScalar();

                    if (count > 0)
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }
            }
        }
        private string HashPassword(string password)
        {
            using (SHA256 sha256Hash = SHA256.Create())
            {
                // ComputeHash - returns byte array
                byte[] bytes = sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(password));

                // Convert byte array to a string
                StringBuilder builder = new StringBuilder();
                for (int i = 0; i < bytes.Length; i++)
                {
                    builder.Append(bytes[i].ToString("x2"));
                }
                return builder.ToString();
            }
        }
    }

}

