using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QRCoder;
using System.Drawing;
using System.IO;

namespace CoconutHotel
{
    public partial class PaymentPage : System.Web.UI.Page
    {
        private decimal _totalPriceSum = 0;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                
                if (Session["PaymentID"] == null)
                {
                    string paymentID = GenerateUniquePaymentID();
                    Session["PaymentID"] = paymentID;
                }
                // Retrieve PaymentID, BookingID, and today's date
                string paymentIDFromSession = Session["PaymentID"] != null ? Session["PaymentID"].ToString() : "N/A";
                string bookingIDFromSession = Session["BookingID"] != null ? Session["BookingID"].ToString() : "N/A";
                string todayDate = DateTime.Now.ToString("dd/MM/yyyy");

                // Display values in labels
                lblPaymentID.Text = paymentIDFromSession;
                lblBookingID.Text = bookingIDFromSession;
                lblDate.Text = todayDate;

                string accountName = Session["UserName"] != null ? Session["UserName"].ToString() : "Guest";
                string accountID = Session["UserID"] != null ? Session["UserID"].ToString() : "N/A";

                lblAccount.Text = accountName;
                lblAccountID.Text = accountID;
                // Initially hide the Proceed button
                btnProceed.Visible = false;

                // If a bookingID query string parameter is provided, use it
                string bookingID = Request.QueryString["bookingID"];
                if (!string.IsNullOrEmpty(bookingID))
                {
                    SqlDataSource2.SelectParameters["BookingID"].DefaultValue = bookingID;
                }
                else
                {
                    // Set a default value for testing if no query string parameter is provided
                    SqlDataSource2.SelectParameters["BookingID"].DefaultValue = "B0006";
                }
            }
            else
            {
                // Retrieve _totalPriceSum from ViewState on postback
                if (ViewState["TotalPriceSum"] != null)
                {
                    _totalPriceSum = (decimal)ViewState["TotalPriceSum"];
                }
            }

        }

        protected void GridViewPayment_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Sum up the TotalPrice column
                var totalPrice = DataBinder.Eval(e.Row.DataItem, "TotalPrice");
                if (totalPrice != DBNull.Value)
                {
                    _totalPriceSum += Convert.ToDecimal(totalPrice);
                }
            }
            else if (e.Row.RowType == DataControlRowType.Footer)
            {
                // Add a label to the last column and show the sum
                e.Row.Cells[5].Text = _totalPriceSum.ToString("C");
                e.Row.Cells[4].Text = "Total:";
                e.Row.Cells[4].HorizontalAlign = HorizontalAlign.Right;

                // Store _totalPriceSum in ViewState
                ViewState["TotalPriceSum"] = _totalPriceSum;

                // Store _totalPriceSum in Session
                Session["TotalPriceSum"] = _totalPriceSum.ToString("C");
            }
        }

        private void CalculateTotalPriceSum()
        {
            _totalPriceSum = 0; // Reset the sum

            foreach (GridViewRow row in GridViewPayment.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    // Extract the TotalPrice value from the current row
                    var totalPrice = DataBinder.Eval(row.DataItem, "TotalPrice");
                    if (totalPrice != DBNull.Value)
                    {
                        _totalPriceSum += Convert.ToDecimal(totalPrice);
                    }
                }
            }
        }

        protected void ddlMethod_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlMethod.SelectedValue == "Cash")
            {
                // Show the Proceed button
                btnProceed.Visible = true;
                CreditDebitCardTable.Visible = false;
                QRTable.Visible = false;
                
            }
            else if (ddlMethod.SelectedValue == "Credit/Debit Card")
            {
                QRTable.Visible = false;
                btnProceed.Visible = false;
                CreditDebitCardTable.Visible = true;
                
            }
            else if (ddlMethod.SelectedValue == "E wallet")
            {
                QRTable.Visible = true;
                btnProceed.Visible = true;
                CreditDebitCardTable.Visible = false;
                
            }
            else 
            {
                QRTable.Visible = false;
                btnProceed.Visible = false;
                CreditDebitCardTable.Visible = false;
            }

            Session["SelectedValue"] = ddlMethod.SelectedValue;

        }

        protected void btnProceed_Click(object sender, EventArgs e)
        {
            // Retrieve _totalPriceSum from ViewState
            if (ViewState["TotalPriceSum"] != null)
            {
                _totalPriceSum = (decimal)ViewState["TotalPriceSum"];
            }

            // Log the recalculated value of _totalPriceSum
            System.Diagnostics.Debug.WriteLine("Total Payment Sum: " + _totalPriceSum);

            // Get the booking ID from the query string
            string bookingID = Request.QueryString["bookingID"];
            if (string.IsNullOrEmpty(bookingID))
            {
                bookingID = "B0006"; // Default for testing purposes
            }

            // Get the payment method from the dropdown
            string paymentMethod = Session["SelectedValue"] != null ? Session["SelectedValue"].ToString() : "Cash";

            // Generate a unique payment ID
            string paymentID = GenerateUniquePaymentID();

            // Get the current date and time
            DateTime now = DateTime.Now;
            string paymentDate = now.ToString("yyyy-MM-dd");
            string paymentTime = now.ToString("HH:mm:ss");

            // Insert the payment data into the database
            InsertPaymentIntoDatabase(paymentID, bookingID, paymentMethod, paymentDate, paymentTime, _totalPriceSum);

            // Redirect to a thank-you page
            Response.Redirect("ThankYouPage.aspx");

        }

        protected void btnPayNow_Click(object sender, EventArgs e)
        {

            // Retrieve _totalPriceSum from ViewState
            if (ViewState["TotalPriceSum"] != null)
            {
                _totalPriceSum = (decimal)ViewState["TotalPriceSum"];
            }

            // Log the recalculated value of _totalPriceSum
            System.Diagnostics.Debug.WriteLine("Total Payment Sum: " + _totalPriceSum);

            // Get the booking ID from the query string
            string bookingID = Request.QueryString["bookingID"];
            if (string.IsNullOrEmpty(bookingID))
            {
                bookingID = "B0006"; // Default for testing purposes
            }

            // Get the payment method from the dropdown
            string paymentMethod = Session["SelectedValue"] != null ? Session["SelectedValue"].ToString() : "Cash";

            // Generate a unique payment ID
            string paymentID = GenerateUniquePaymentID();

            // Get the current date and time
            DateTime now = DateTime.Now;
            string paymentDate = now.ToString("yyyy-MM-dd");
            string paymentTime = now.ToString("HH:mm:ss");

            // Insert the payment data into the database
            InsertPaymentIntoDatabase(paymentID, bookingID, paymentMethod, paymentDate, paymentTime, _totalPriceSum);

            // Redirect to a thank-you page
            Response.Redirect("ThankYouPage.aspx");
        }

        private string GenerateUniquePaymentID()
        {
            string lastPaymentID = GetLastPaymentIDFromDatabase();
            if (string.IsNullOrEmpty(lastPaymentID))
            {
                return "P0001";
            }

            int lastNumericPart = int.Parse(lastPaymentID.Substring(1));
            int nextNumericPart = lastNumericPart + 1;
            return "P" + nextNumericPart.ToString().PadLeft(4, '0');
        }

        private string GetLastPaymentIDFromDatabase()
        {
            string lastPaymentID = "";
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            string query = "SELECT TOP 1 paymentID FROM Payment ORDER BY paymentID DESC";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();
                    object result = command.ExecuteScalar();
                    if (result != null)
                    {
                        lastPaymentID = result.ToString();
                    }
                }
            }

            return lastPaymentID;
        }

        private void InsertPaymentIntoDatabase(string paymentID, string bookingID, string paymentMethod, string paymentDate, string paymentTime, decimal totalPayment)
        {
            decimal totalPaymentDecimal = Convert.ToDecimal(totalPayment);
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            string insertQuery = @"
            INSERT INTO Payment (paymentID, bookingID, paymentMethod, paymentDate, paymentTime, totalPayment)
            VALUES (@PaymentID, @BookingID, @PaymentMethod, @PaymentDate, @PaymentTime, @TotalPayment)";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(insertQuery, conn))
                {
                    cmd.Parameters.AddWithValue("@PaymentID", paymentID);
                    cmd.Parameters.AddWithValue("@BookingID", bookingID);
                    cmd.Parameters.AddWithValue("@PaymentMethod", paymentMethod);
                    cmd.Parameters.AddWithValue("@PaymentDate", paymentDate);
                    cmd.Parameters.AddWithValue("@PaymentTime", paymentTime);
                    cmd.Parameters.AddWithValue("@TotalPayment", totalPaymentDecimal);

                    conn.Open();
                    int result = cmd.ExecuteNonQuery();
                    System.Diagnostics.Debug.WriteLine("Rows affected: " + result);
                }
            }
        }
    

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtCCName.Text = "";
            txtCCNumber.Text = "";
            txtCCVT.Text = "";
            txtCVV.Text = "";

            
            RadioButtonList1.ClearSelection();
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }
        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {

        }

        protected void TextBox4_TextChanged(object sender, EventArgs e)
        {

        }
        protected void TextBox5_TextChanged(object sender, EventArgs e)
        {

        }

        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Page.Validate();
        }
        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string cardType = RadioButtonList1.SelectedValue;
            string cardNumber = txtCCNumber.Text;

            if (cardType == "VISA" && cardNumber.Length == 10 && IsNumeric(cardNumber))
            {
                args.IsValid = true;
            }
            else if (cardType == "Master" && cardNumber.Length == 12 && IsNumeric(cardNumber))
            {
                args.IsValid = true;
            }
            else
            {
                args.IsValid = false;
            }


        }

        private bool IsNumeric(string input)
        {
            return long.TryParse(input, out _);
        }

    }
}