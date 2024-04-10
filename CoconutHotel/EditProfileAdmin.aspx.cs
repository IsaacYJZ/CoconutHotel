using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CoconutHotel
{
    public partial class EditProfileAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void cvPassword_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string password = args.Value;

            // Validation logic for password
            // Example: Check if the password meets the criteria (at least 8 characters, including at least one uppercase letter, one lowercase letter, one number, and one special character)
            if (password.Length >= 8 &&
                password.Any(char.IsUpper) &&
                password.Any(char.IsLower) &&
                password.Any(char.IsDigit) &&
                password.Any(ch => !char.IsLetterOrDigit(ch)))
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