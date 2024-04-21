using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Configuration;

namespace CoconutHotel
{
    public partial class BookingAdmin : System.Web.UI.Page
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
            string query = "SELECT b.bookingID, u.userName AS UserName, rt.roomName AS RoomName, b.bookingDate, b.checkInDate, b.checkOutDate, b.numOfAdult, b.numOfChild, p.paymentMethod " +
                           "FROM Booking b " +
                           "INNER JOIN [User] u ON b.userID = u.userID " +
                           "INNER JOIN Room r ON b.roomID = r.roomID " +
                           "INNER JOIN RoomType rt ON r.roomType = rt.roomType " +
                           "INNER JOIN Payment p ON b.paymentID = p.paymentID";


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
                        gridViewBookings.DataSource = dataTable;
                        gridViewBookings.DataBind();
                    }
                    else
                    {
                        // Display a message when no bookings are found
                        // You can add a label or handle this case as needed
                    }
                }
            }
        }

    }
}
