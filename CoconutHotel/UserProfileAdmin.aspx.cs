using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace CoconutHotel
{
    public partial class UserProfileAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGridView();
            }
        }

        private void BindGridView()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            string query = "SELECT * FROM [User]";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();
                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    DataTable dataTable = new DataTable();
                    adapter.Fill(dataTable);

                    if (dataTable.Rows.Count > 0)
                    {
                        gridViewUsers.DataSource = dataTable;
                        gridViewUsers.DataBind();
                    }
                    else
                    {
                        // Display a message when no users are found
                        // You can add a label or handle this case as needed
                    }
                }
            }
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
