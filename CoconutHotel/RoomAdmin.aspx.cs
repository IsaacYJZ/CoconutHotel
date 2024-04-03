using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CoconutHotel
{
    public partial class AdminDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void EditButton_Click(object sender, EventArgs e)
        {
            // Show the edit form
            editForm.Visible = true;
        }

        protected void DeleteButton_Click(object sender, EventArgs e)
        {
            // Show the delete form
            deleteForm.Visible = true;
        }

        protected void btnSaveChanges_Click(object sender, EventArgs e)
        {
            // Perform form submission handling (e.g., save changes)
            // For demonstration purposes, let's just hide the edit form
            editForm.Visible = false;
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
    }
}