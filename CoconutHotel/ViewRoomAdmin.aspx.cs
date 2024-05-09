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

                // Validate and sanitize input parameters before passing them to BindGridView
                string roomIDValue = string.IsNullOrEmpty(roomID.Text) ? null : roomID.Text;
                string occupancyValue = string.IsNullOrEmpty(occupancy.Text) ? null : occupancy.Text;

                // Bind the grid view with rooms filtered by the selected room name or search criteria
                BindGridView(selectedRoomName, roomIDValue, occupancyValue);
            }
        }

        protected void SearchButton_Click(object sender, EventArgs e)
        {
            // Get the search criteria and bind the grid view accordingly
            BindGridView(Request.QueryString["roomName"], roomID.Text, occupancy.Text);
        }

        private void BindGridView(string selectedRoomName, string roomID, string occupancy)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            string query = @"
            SELECT
                r.roomID, 
                r.occupancy, 
                b.checkInDate,
                b.checkOutDate,
                r.roomPrice, 
                CASE
                    WHEN EXISTS(
                        SELECT 1
                        FROM BookingRoom br
                        INNER JOIN Booking b ON br.bookingID = b.bookingID
                        WHERE br.roomID = r.roomID AND b.bookingStatus = 'Booked'
                    ) THEN 'Booked'
                    ELSE 'Available'
                END AS roomStatus, 
                r.roomImg
            FROM
                Room r
            INNER JOIN
                RoomType rt ON r.roomType = rt.roomType
            LEFT JOIN
                BookingRoom br ON r.roomID = br.roomID
            LEFT JOIN
                Booking b ON br.bookingID = b.bookingID
            WHERE
                1 = 1"; // Start with a condition that is always true

            // Add filters based on the provided search criteria
            if (!string.IsNullOrEmpty(roomID))
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

            // Append the ORDER BY clause
            query += " ORDER BY r.roomID";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    if (!string.IsNullOrEmpty(roomID))
                    {
                        command.Parameters.AddWithValue("@RoomID", roomID);
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
                        lblMessage.Visible = false;// Hide the message label if there are bookings
                    }
                    else
                    {
                        // Display a message when no rooms are found
                        // You can add a label or handle this case as needed
                        lblMessage.Visible = true;
                    }
                }
            }
        }

    }
}
