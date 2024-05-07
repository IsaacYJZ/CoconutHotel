using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace CoconutHotel
{
    public partial class AdminHomePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindUserGridView();
                BindRoomGridView(); 
            }
        }

        private void BindUserGridView()
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

        private void BindRoomGridView()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            string query = @"SELECT 
                        rt.roomName, 
                        rt.roomDesc, 
                        rt.roomPrice, 
                        rt.roomImage, 
                        SUM(CASE WHEN r.roomStatus = 'Available' THEN 1 ELSE 0 END) AS AvailableRooms
                    FROM RoomType rt 
                    INNER JOIN Room r ON rt.roomType = r.roomType 
                    GROUP BY rt.roomName, rt.roomDesc, rt.roomPrice, rt.roomImage 
                    ORDER BY rt.roomPrice";

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

        protected void ViewUserProfileButton_Click(object sender, EventArgs e)
        {
            // Redirect to UserProfileAdmin.aspx page
            Response.Redirect("UserProfileAdmin.aspx");
        }

        protected void ViewRoomButton_Click(object sender, EventArgs e)
        {
            // Redirect to UserProfileAdmin.aspx page
            Response.Redirect("RoomAdmin.aspx");
        }
    }
}