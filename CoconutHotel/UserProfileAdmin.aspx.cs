using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CoconutHotel
{
    public partial class UserProfileAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void EditButton_Click(object sender, EventArgs e)
        {
            LinkButton editButton = (LinkButton)sender;
            string userId = editButton.CommandArgument;
            Response.Redirect($"EditProfileAdmin.aspx?UserID={userId}");
        }

        protected void DeleteButton_Click(object sender, EventArgs e)
        {
            // Show the delete form
            deleteForm.Visible = true;
        }

        protected void btnDeleteUser_Click(object sender, EventArgs e)
        {
            // Perform user deletion here
            // For demonstration purposes, let's just hide the delete form
            deleteForm.Visible = false;
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
    }
}
