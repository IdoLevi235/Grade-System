using DatabaseExample;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Final_Project
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Reset_Click(object sender, EventArgs e)
        {
            pnlMessage.Visible = false;
            inputEmail.Text = "";
            inputPassword.Text = "";
            inputid.Text = "";
            inputFullname.Text = "";
        }

        protected void Register_Click(object sender, EventArgs e)
        {
            if (!isValidEmail(inputEmail.Text))

                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Invalid Email Address!')", true);

            // invalid email

            else
            {
                String t;
                if (radio_student.Checked) t = "student";
                else t = "teacher";


                using (var db = new webProjectEntities())
                {

                    var newUser = new tableUsers()
                    {
                        ID = inputid.Text,
                        Email = inputEmail.Text,
                        Password = inputPassword.Text,
                        Fullname = inputFullname.Text,
                        Algebra = "",
                        Algorithms = "",
                        Datamining = "",
                        WebDev = "",
                        Calculus = "",
                        OperatinsSystems = "",
                        type = t
                    };

                    try
                    {
                        db.tableUsers.Add(newUser);
                        db.SaveChanges();
                        RegisteredSuccess.Visible = true;
                        RequiredFieldValidator.Visible = false;
                        RequiredFieldValidator1.Visible = false;
                        RequiredFieldValidator2.Visible = false;
                        gotoLogin.Visible = true;
                        backToLogin.Visible = false;
                    }
                    catch (Exception ex)
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('ID already exists')", true);
                    }
                }

            }
        }

        bool isValidEmail(string input)
        {
            try
            {
                var email = new System.Net.Mail.MailAddress(input);
                return true;
            }
            catch
            {
                return false;
            }
        }

        protected void gotoLogin_click (object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }



    }
}