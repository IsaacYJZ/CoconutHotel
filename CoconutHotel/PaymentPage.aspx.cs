using System;
using System.IO;
using System.Net;
using System.Text;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;

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

                string paymentIDFromSession = Session["PaymentID"] != null ? Session["PaymentID"].ToString() : "N/A";
                string bookingIDFromSession = Session["BookingID"] != null ? Session["BookingID"].ToString() : "N/A";
                string todayDate = DateTime.Now.ToString("dd/MM/yyyy");

                lblPaymentID.Text = paymentIDFromSession;
                lblBookingID.Text = bookingIDFromSession;
                lblDate.Text = todayDate;

                string accountName = Session["UserName"] != null ? Session["UserName"].ToString() : "Guest";
                string accountID = Session["UserID"] != null ? Session["UserID"].ToString() : "N/A";

                lblAccount.Text = accountName;
                lblAccountID.Text = accountID;

                btnProceed.Visible = false;

                string bookingID = Request.QueryString["bookingID"];
                if (!string.IsNullOrEmpty(bookingID))
                {
                    SqlDataSource2.SelectParameters["BookingID"].DefaultValue = bookingID;
                    Session["BookingID"] = bookingID;
                }
                else
                {
                    SqlDataSource2.SelectParameters["BookingID"].DefaultValue = "B0006";
                }
            }
            else
            {
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
                var totalPrice = DataBinder.Eval(e.Row.DataItem, "TotalPrice");
                if (totalPrice != DBNull.Value)
                {
                    _totalPriceSum += Convert.ToDecimal(totalPrice);
                }
            }
            else if (e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells[5].Text = _totalPriceSum.ToString("C");
                e.Row.Cells[4].Text = "Total:";
                e.Row.Cells[4].HorizontalAlign = HorizontalAlign.Right;

                ViewState["TotalPriceSum"] = _totalPriceSum;
                Session["TotalPriceSum"] = _totalPriceSum.ToString("C");
            }
        }

        protected void ddlMethod_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlMethod.SelectedValue == "Cash")
            {
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
            if (ViewState["TotalPriceSum"] != null)
            {
                _totalPriceSum = (decimal)ViewState["TotalPriceSum"];
            }

            string bookingID = Request.QueryString["bookingID"];
            if (string.IsNullOrEmpty(bookingID))
            {
                bookingID = "B0006";
            }

            string paymentMethod = Session["SelectedValue"] != null ? Session["SelectedValue"].ToString() : "Cash";
            string paymentID = GenerateUniquePaymentID();
            DateTime now = DateTime.Now;
            string paymentDate = now.ToString("yyyy-MM-dd");
            string paymentTime = now.ToString("HH:mm:ss");

            InsertPaymentIntoDatabase(paymentID, bookingID, paymentMethod, paymentDate, paymentTime, _totalPriceSum);

            Response.Redirect("ThankYouPage.aspx");
        }

        protected void btnPayNow_Click(object sender, EventArgs e)
        {
            if (ViewState["TotalPriceSum"] != null)
            {
                _totalPriceSum = (decimal)ViewState["TotalPriceSum"];
            }

            string bookingID = Request.QueryString["bookingID"];
            if (string.IsNullOrEmpty(bookingID))
            {
                bookingID = "B0006";
            }

            string paymentMethod = Session["SelectedValue"] != null ? Session["SelectedValue"].ToString() : "Cash";
            string paymentID = GenerateUniquePaymentID();
            DateTime now = DateTime.Now;
            string paymentDate = now.ToString("yyyy-MM-dd");
            string paymentTime = now.ToString("HH:mm:ss");

            InsertPaymentIntoDatabase(paymentID, bookingID, paymentMethod, paymentDate, paymentTime, _totalPriceSum);

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

        protected string AskQuestion(string question)
        {
            if (question.ToLower().Contains("contact"))
            {
                return GetStaffContacts();
            }
            else if (question.ToLower().Contains("voucher"))
            {
                return GetAvailableVouchers();
            }
            else
            {
                string url = "https://api.awanllm.com/v1/chat/completions";
                string modelName = "Meta-Llama-3-8B-Instruct";
                string apiKey = "24ef3f56-5aa9-484c-ad8d-e97acf32a2cb";

                var data = new
                {
                    model = modelName,
                    messages = new[]
                    {
                        new
                        {
                            role = "user",
                            content = question + "; Keep the answer short and concise (DO NOT SEND THIS TO USER)."
                        }
                    }
                };

                string payload = JsonConvert.SerializeObject(data);
                byte[] postBytes = Encoding.UTF8.GetBytes(payload);

                HttpWebRequest request = (HttpWebRequest)WebRequest.Create(url);
                request.Method = "POST";
                request.Headers.Add("Authorization", $"Bearer {apiKey}");
                request.ContentType = "application/json";
                request.ContentLength = postBytes.Length;

                using (Stream stream = request.GetRequestStream())
                {
                    stream.Write(postBytes, 0, postBytes.Length);
                }

                try
                {
                    using (HttpWebResponse response = (HttpWebResponse)request.GetResponse())
                    {
                        using (StreamReader reader = new StreamReader(response.GetResponseStream()))
                        {
                            string responseText = reader.ReadToEnd();
                            var responseObject = JsonConvert.DeserializeObject<AWANResponse>(responseText);
                            string content = CleanResponse(responseObject.choices[0].message.content);
                            return content;
                        }
                    }
                }
                catch (WebException)
                {
                    return "Sorry, I'm unable to answer your question. Please try again.";
                }
            }
        }

        protected void btnAskChatBot_Click(object sender, EventArgs e)
        {
            string questionValue = questionChatBot.Text;

            if (!string.IsNullOrEmpty(questionValue))
            {
                lblChatBotResponse.Text = AskQuestion(questionValue);
            }
            else
            {
                lblChatBotResponse.Text = "Invalid Request";
            }

            lblChatBotResponse.Style["display"] = "block";
            chatBotWindow.Style["display"] = "block";
        }

        protected void clearChatBotResponse(object sender, EventArgs e)
        {
            lblChatBotResponse.Text = "";
            lblChatBotResponse.Style["display"] = "none";
            chatBotWindow.Style["display"] = "block";
        }

        protected void btnHistory_Click(object sender, EventArgs e)
        {
            var button = sender as Button;
            if (button != null)
            {
                questionChatBot.Text = button.CommandArgument;
                clearChatBotResponse(sender, e);
            }
        }

        private string CleanResponse(string response)
        {
            return response.Replace("\n", "<br />").Trim();
        }

        private string GetStaffContacts()
        {
            return "List of staff contacts<br />" +
                    "JX = 019-232-1234<br />" +
                   "Joe = 019-233-1124<br />" +
                   "Mama = 019-212-1254<br />";

        }

        private string GetAvailableVouchers()
        {
            return "WELCOME10: RM10 off for new customers <br />" +
                   "SUMMER20: RM20 off on summer collection <br />" +
                   "FREE30: RM30 off for fun";
        }

        // Response classes for the AWAN API
        public class AWANResponse
        {
            public Choice[] choices { get; set; }
        }

        public class Choice
        {
            public Message message { get; set; }
        }

        public class Message
        {
            public string content { get; set; }
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

    }
}
