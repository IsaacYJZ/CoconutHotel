using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CoconutHotel
{
    public partial class AddProfileAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void cvPassword_ServerValidate(object source, ServerValidateEventArgs args)
        {
            // Define the regular expression pattern for the password validation
            string passwordPattern = @"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[^\da-zA-Z]).{8,}$";

            // Check if the password matches the pattern
            if (System.Text.RegularExpressions.Regex.IsMatch(args.Value, passwordPattern))
            {
                args.IsValid = true; // Password is valid
            }
            else
            {
                args.IsValid = false; // Password is invalid
            }
        }
    }
}