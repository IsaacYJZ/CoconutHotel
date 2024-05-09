using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


namespace CoconutHotel
{
    public partial class UserProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["LoggedInUser"] != null)
            {
                UserDetails userDetails = (UserDetails)Session["LoggedInUser"];

                lblID.Text = userDetails.UserID;
                lblName.Text = userDetails.UserName;
                lblEmail.Text = userDetails.Email;
                lblPhoneNumber.Text = userDetails.PhoneNum;
                lblICNum.Text = userDetails.ICNum;
                lblUserType.Text = userDetails.UserType;

                GetBookingDetails(userDetails.UserID);

            }
            else
            {
                Response.Redirect("LoginPage.aspx");
            }
        }
        

        private void GetBookingDetails(string userID)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            string query = "SELECT b.bookingID, u.UserName, u.Email, br.roomType, br.roomID, b.bookingDate, b.checkInDate, b.checkOutDate " +
                           "FROM Booking b " +
                           "INNER JOIN BookingRoom br ON b.bookingID = br.bookingID " +
                           "INNER JOIN [User] u ON b.userID = u.userID " +
                           "WHERE b.userID = @UserID";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@UserID", userID);
                    connection.Open();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.HasRows)
                        {
                            rptBookingHistory.DataSource = reader;
                            rptBookingHistory.DataBind();
                        }
                        else
                        {
                            // If no booking details found, display a message
                            rptBookingHistory.Visible = false;
                            lblNoBookingMessage.Visible = true;
                        }
                    }
                }
            }
        }


        protected void btnEditProfile_Click(object sender, EventArgs e)
        {
            Response.Redirect("EditUserProfile.aspx");
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            // Clear all sessions
            Session.Clear();

            // Redirect the user to the login page or any other desired page
            Response.Redirect("home.aspx");
        }
    }
}