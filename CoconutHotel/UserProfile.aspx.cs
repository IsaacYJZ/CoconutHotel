using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;


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


            }
            else
            {
                Response.Redirect("LoginPage.aspx");
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
            Response.Redirect("login.aspx");
        }
    }
}