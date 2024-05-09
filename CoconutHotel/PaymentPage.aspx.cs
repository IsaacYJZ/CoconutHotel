using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CoconutHotel
{
    public partial class PaymentPage : System.Web.UI.Page
    {
        private decimal _totalPriceSum = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
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

        }

        protected void GridViewPayment_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Sum up the TotalPrice column
                var totalPrice = DataBinder.Eval(e.Row.DataItem, "TotalPrice");
                _totalPriceSum += Convert.ToDecimal(totalPrice);
            }
            else if (e.Row.RowType == DataControlRowType.Footer)
            {
                // Add a label to the last column and show the sum
                e.Row.Cells[5].Text = _totalPriceSum.ToString("C");
                e.Row.Cells[4].Text = "Total:";
                e.Row.Cells[4].HorizontalAlign = HorizontalAlign.Right;
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
            // Redirect to another page

            Response.Redirect("ThankYouPage.aspx");

            //// Generate a unique payment ID
            //string paymentID = GenerateUniquePaymentID();

            //// Get the current date and time
            //DateTime now = DateTime.Now;
            //string paymentDate = now.ToString("yyyy-MM-dd");
            //string paymentTime = now.ToString("HH:mm:ss");

            //// Insert the payment data into the database
            //InsertPaymentIntoDatabase(paymentID, paymentDate, paymentTime, 100.00m, "Pending");

        }

        protected void btnPayNow_Click(object sender, EventArgs e)
        {
            // Redirect to another page
            Response.Redirect("ThankYouPage.aspx");

            //// Generate a unique payment ID
            //string paymentID = GenerateUniquePaymentID();

            //// Get the current date and time
            //DateTime now = DateTime.Now;
            //string paymentDate = now.ToString("yyyy-MM-dd");
            //string paymentTime = now.ToString("HH:mm:ss");

            //// Insert the payment data into the database
            //InsertPaymentIntoDatabase(paymentID, paymentDate, paymentTime, 100.00m, "Pending");
        }

        //private string GenerateUniquePaymentID()
        //{
        //    // Generate a unique payment ID, e.g., using a GUID
        //    return "P" + Guid.NewGuid().ToString("N").Substring(0, 8).ToUpper();
        //}

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
            // Get the selected card type
            string cardType = RadioButtonList1.SelectedValue;

            // Get the card number entered by the user
            string cardNumber = txtCCNumber.Text.Trim();

            // Validation logic based on card type
            if (cardType == "VISA")
            {
                // Visa should have 12 characters
                args.IsValid = cardNumber.Length == 12;
            }
            else if (cardType == "Master")
            {
                // Master should have 14 characters
                args.IsValid = cardNumber.Length == 14;
            }
            else
            {
                // If no card type is selected, mark as invalid
                args.IsValid = false;
            }

            
        }
    }
}