using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace CoconutHotel
{
    public class UserDetails
    {
        public string UserID { get; set; }
        public string UserName { get; set; }
        public string ICNum { get; set; }
        public string PhoneNum { get; set; }
        public string Email { get; set; }
        public string UserType { get; set; }
        public string UserStatus { get; set; }
    }
    public partial class login : System.Web.UI.Page
    {
        private UserDetails GetUserDetails(string email)
        {
            string query = "SELECT * FROM [User] WHERE email = @Email";
            UserDetails userDetails = new UserDetails();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Email", email);

                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    if (reader.Read())
                    {
                        userDetails.UserID = reader["userID"].ToString();
                        userDetails.UserName = reader["userName"].ToString();
                        userDetails.ICNum = reader["icNum"].ToString();
                        userDetails.PhoneNum = reader["phoneNum"].ToString();
                        userDetails.Email = reader["email"].ToString();
                        userDetails.UserType = reader["userType"].ToString();
                        userDetails.UserStatus = reader["userStatus"].ToString();
                    }
                    reader.Close();
                }
            }

            return userDetails;
        }
       
        string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\User\\source\\repos\\CoconutHotel\\CoconutHotel\\App_Data\\CoconutHotel.mdf;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               
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
              
                if (!ValidateEmail(email))
                {
                    return; 
                }

                
                bool isValidUser = ValidateUser(email, password);

                if (!isValidUser)
                {
                    emailNotFoundErrorMessage.Text = "";
                    passwordErrorMessage.Text = "Incorrect password. Please try again.";
                }
                else
                {
                    UserDetails userDetails = GetUserDetails(email);

                   
                    Session["LoggedInUser"] = userDetails;

                    
                    Response.Redirect("homeLogin.aspx");
                }

            }
            catch (Exception ex)
            {

            }
        }


        private bool ValidateEmail(string email)
        {
            return true;
        }


        private bool ValidateUser(string email, string password)
        {
            string query = "SELECT COUNT(*) FROM [User] WHERE email = @Email AND password = @Password";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Email", email);
                    command.Parameters.AddWithValue("@Password", password);

                    connection.Open();
                    int count = (int)command.ExecuteScalar();

                    // If count > 0, user exists with the provided credentials
                    return count > 0;
                }
            }
        }
    }
}