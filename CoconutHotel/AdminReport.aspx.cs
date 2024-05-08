using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CoconutHotel
{
    public partial class AdminReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindReportData();
            }
        }

        private void BindReportData()
        {
            try
            {
                string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

                // Get the search criteria and input from the query string
                string searchCriteria = Request.QueryString["criteria"];
                string searchInput = Request.QueryString["input"];

                // Construct the SQL query dynamically based on the search criteria and input
                string query = ConstructQuery(searchCriteria, searchInput);

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
                            gridViewReport.DataSource = dataTable;
                            gridViewReport.DataBind();
                        }
                        else
                        {
                            // Display a message if no data is found
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle any exceptions
            }
        }

 [WebMethod]
public static string SearchData(string searchCriteria, string searchInput)
{
    try
    {
        // Construct the SQL query dynamically based on the search criteria and input
        string query = @"
            SELECT 
                u.userName AS UserName,
                p.paymentDate AS PaymentDate,
                rt.roomName AS RoomName,
                p.paymentMethod AS PaymentMethod,
                r.roomPrice AS RoomPrice
            FROM 
                Booking b
            INNER JOIN 
                Payment p ON b.paymentID = p.paymentID
            INNER JOIN 
                [User] u ON b.userID = u.userID
            INNER JOIN 
                Room r ON b.roomID = r.roomID
            INNER JOIN 
                RoomType rt ON r.roomType = rt.roomType";

        // Add WHERE clause based on the selected search criteria and input
        switch (searchCriteria)
        {
            case "Name":
                query += " WHERE u.userName LIKE '%" + searchInput + "%'";
                break;
            case "PaymentDate":
                query += " WHERE CONVERT(date, p.paymentDate) = CONVERT(date, '" + searchInput + "')";
                break;
            case "RoomName":
                query += " WHERE rt.roomName LIKE '%" + searchInput + "%'";
                break;
            case "PaymentMethod":
                query += " WHERE p.paymentMethod LIKE '%" + searchInput + "%'";
                break;
            case "RoomPrice":
                query += " WHERE r.roomPrice = '" + searchInput + "'";
                break;
            default:
                break;
        }

        // Execute the query and return the HTML content to update the GridView
        DataTable dataTable = new DataTable();
        using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
        {
            using (SqlCommand command = new SqlCommand(query, connection))
            {
                connection.Open();
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                adapter.Fill(dataTable);
            }
        }

        // Render the DataTable as HTML
        using (StringWriter sw = new StringWriter())
        {
            using (HtmlTextWriter hw = new HtmlTextWriter(sw))
            {
                GridView gridView = new GridView();
                gridView.DataSource = dataTable;
                gridView.DataBind();
                gridView.RenderControl(hw);
                return sw.ToString();
            }
        }
    }
    catch (Exception ex)
    {
        return ex.Message; // Return error message if any
    }
}



        // Method to construct the SQL query dynamically based on the search criteria and input
        private string ConstructQuery(string searchCriteria, string searchInput)
        {
            string query = @"
                SELECT 
                    u.userName AS UserName,
                    p.paymentDate AS PaymentDate,
                    rt.roomName AS RoomName,
                    p.paymentMethod AS PaymentMethod,
                    r.roomPrice AS RoomPrice
                FROM 
                    Booking b
                INNER JOIN 
                    Payment p ON b.paymentID = p.paymentID
                INNER JOIN 
                    [User] u ON b.userID = u.userID
                INNER JOIN 
                    Room r ON b.roomID = r.roomID
                INNER JOIN 
                    RoomType rt ON r.roomType = rt.roomType";

            // Add WHERE clause based on the selected search criteria and input
            switch (searchCriteria)
            {
                case "Name":
                    query += " WHERE u.userName LIKE '%" + searchInput + "%'";
                    break;
                case "PaymentDate":
                    query += " WHERE CONVERT(date, p.paymentDate) = CONVERT(date, '" + searchInput + "')";
                    break;
                case "RoomName":
                    query += " WHERE rt.roomName LIKE '%" + searchInput + "%'";
                    break;
                case "PaymentMethod":
                    query += " WHERE p.paymentMethod LIKE '%" + searchInput + "%'";
                    break;
                case "RoomPrice":
                    query += " WHERE r.roomPrice = '" + searchInput + "'";
                    break;
                default:
                    break;
            }

            return query;
        }
    }
}
