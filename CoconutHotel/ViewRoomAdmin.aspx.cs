using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

namespace CoconutHotel
{
    public partial class ViewRoomAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Check if the room name query parameter exists
                string selectedRoomName = Request.QueryString["roomName"];

                // Set the session variable for future reference
                if (selectedRoomName != null)
                {
                    Session["SelectedRoomName"] = selectedRoomName;
                }
                // Bind the grid view with rooms filtered by the selected room name or search criteria
                BindGridView(selectedRoomName, roomId.Text, occupancy.Text);
            }
        }

        protected void SearchButton_Click(object sender, EventArgs e)
        {
            // Get the search criteria and bind the grid view accordingly
            BindGridView(Request.QueryString["roomName"], roomId.Text, occupancy.Text);
        }

        private void BindGridView(string selectedRoomName, string roomId, string occupancy)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            string query = @"SELECT r.roomID, r.occupancy, r.roomPrice, r.roomStatus, r.roomImg 
             FROM Room r 
             INNER JOIN RoomType rt ON r.roomType = rt.roomType 
             WHERE 1 = 1"; // Start with a condition that is always true

            // Add filters based on the provided search criteria

            if (!string.IsNullOrEmpty(roomId))
            {
                query += " AND r.roomID = @RoomID";
            }

            if (!string.IsNullOrEmpty(occupancy))
            {
                query += " AND r.occupancy = @Occupancy";
            }

            // If a specific room name is selected, add a WHERE clause to filter by room name
            if (!string.IsNullOrEmpty(selectedRoomName))
            {
                query += " AND rt.roomName = @RoomName"; // Filter by room type
            }

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {

                    if (!string.IsNullOrEmpty(roomId))
                    {
                        command.Parameters.AddWithValue("@RoomID", roomId);
                    }


                    if (!string.IsNullOrEmpty(occupancy))
                    {
                        command.Parameters.AddWithValue("@Occupancy", occupancy);
                    }

                    // If a specific room name is selected, add its value as a parameter
                    if (!string.IsNullOrEmpty(selectedRoomName))
                    {
                        command.Parameters.AddWithValue("@RoomName", selectedRoomName);
                    }

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

    }
}
