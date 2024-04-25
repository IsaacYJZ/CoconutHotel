using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace CoconutHotel
{
    public partial class AdminDashboard : System.Web.UI.Page
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
            string query = "SELECT * FROM [RoomType]";

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
                        gridViewRooms.DataSource = dataTable;
                        gridViewRooms.DataBind();
                    }
                    else
                    {
                        // Display a message when no rooms are found
                        // You can add a label or handle this case as needed
                    }
                }
            }
        }

        protected void EditButton_Click(object sender, EventArgs e)
        {
            LinkButton editButton = (LinkButton)sender;
            string roomId = editButton.CommandArgument;
            Response.Redirect($"EditRoomAdmin.aspx?RoomID={roomId}");
        }

        protected void DeleteButton_Click(object sender, EventArgs e)
        {
            // Show the delete form
            deleteForm.Visible = true;
        }

        protected void btnDeleteRoom_Click(object sender, EventArgs e)
        {
            // Perform room deletion here
            // For demonstration purposes, let's just hide the delete form
            deleteForm.Visible = false;
        }

        protected void btnCancelDelete_Click(object sender, EventArgs e)
        {
            // Cancel delete action
            deleteForm.Visible = false;
        }

        protected void btnAddRoom_Click(object sender, EventArgs e)
        {
            // Redirect to AddProfileAdmin.aspx
            Response.Redirect("AddRoomAdmin.aspx");
        }

        protected void btnCancelRoom_Click(object sender, EventArgs e)
        {
            deleteForm.Visible = false;
        }
    }
}