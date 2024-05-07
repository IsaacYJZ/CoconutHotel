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


        protected void ViewRoomButton_Click(object sender, EventArgs e)
        {
            // Get the reference to the clicked link button
            LinkButton btn = (LinkButton)sender;

            // Get the GridViewRow where the button is located
            GridViewRow row = (GridViewRow)btn.NamingContainer;

            // Get the value of the roomName from the GridView's selected row
            string selectedRoomName = row.Cells[1].Text; // Assuming roomName is in the second column (index 1)

            // Redirect to ViewRoomAdmin.aspx with the selected room name as a query parameter
            Response.Redirect("ViewRoomAdmin.aspx?roomName=" + selectedRoomName);
        }

    }


}