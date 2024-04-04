using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


namespace CoconutHotel
{
    public partial class UserProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            //{
            //    // Populate GridView with fake data
            //    DataTable dt = GetFakeUserData();
            //    GridView1.DataSource = dt;
            //    GridView1.DataBind();
            //}
        }
        //private DataTable GetFakeUserData()
        //{
        //    DataTable dt = new DataTable();
        //    dt.Columns.Add("Name", typeof(string));
        //    dt.Columns.Add("Email", typeof(string));
        //    dt.Columns.Add("Password", typeof(string));
        //    dt.Columns.Add("Phone", typeof(string));

        //    // Add some fake data
        //    dt.Rows.Add("John Doe", "john@example.com", "password123", "123-456-7890");
        //    dt.Rows.Add("Jane Smith", "jane@example.com", "secret456", "987-654-3210");
        //    // Add more fake data as needed

        //    return dt;
        //}

        protected void btnEditProfile_Click(object sender, EventArgs e)
        {
            Response.Redirect("EditUserProfile.aspx");
        }
    }
}