using System;
using System.Data.SqlClient;
using System.EnterpriseServices;
using System.Web.UI;

namespace CoconutHotel
{
    public partial class EditUserProfile : System.Web.UI.Page
    {
        string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\Asus\\Source\\Repos\\IsaacYJZ\\CoconutHotel\\CoconutHotel\\App_Data\\CoconutHotel.mdf;Integrated Security=True;";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["LoggedInUser"] != null)
                {
                    // Retrieve user information from the session
                    var user = (UserDetails)Session["LoggedInUser"]; // Assuming "User" is your custom user class
                    lblID.Text = user.UserID;

                    // Set the value of each input field with the user's data
                    txtName.Text = user.UserName;
                    txtICNum.Text = user.ICNum;
                    txtEmail.Text = user.Email;
                    txtPhone.Text = user.PhoneNum;
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            var user = (UserDetails)Session["LoggedInUser"];
            string userID = user.UserID;
            string userName = txtName.Text.Trim();
            string icNum = txtICNum.Text.Trim();
            string email = txtEmail.Text.Trim();
            string phoneNum = txtPhone.Text.Trim();

            UpdateUserProfile(userID, userName, icNum, email, phoneNum);

            Response.Redirect("UserProfile.aspx");
        }

       

        private void UpdateUserProfile(string userID, string userName, string icNum, string email, string phoneNum)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = @"UPDATE [User] 
                                 SET userName = @UserName, icNum = @ICNum, email = @Email, phoneNum = @PhoneNum
                                 WHERE userID = @UserID";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@UserID", userID);
                    command.Parameters.AddWithValue("@UserName", userName);
                    command.Parameters.AddWithValue("@ICNum", icNum);
                    command.Parameters.AddWithValue("@Email", email);
                    command.Parameters.AddWithValue("@PhoneNum", phoneNum);

                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }
        }
    }
}
