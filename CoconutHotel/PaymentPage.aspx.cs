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
            txtCCCVV.Text = "";

            
            RadioButtonList1.ClearSelection();
        }
    }
}