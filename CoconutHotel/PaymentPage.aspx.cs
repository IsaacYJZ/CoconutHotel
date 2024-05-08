using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CoconutHotel
{
    public partial class PaymentPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Initially hide the Proceed button
                btnProceed.Visible = false;
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
            
        }

        protected void btnPayNow_Click(object sender, EventArgs e)
        {
            // Redirect to another page
            Response.Redirect("ThankYouPage.aspx");
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