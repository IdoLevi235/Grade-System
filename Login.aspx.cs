using DatabaseExample;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Final_Project
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Login_Click(object sender, EventArgs e)
        {
            using (var db = new webProjectEntities())
            {
            
                var user = db.tableUsers.Where(i => i.ID == inputID.Text 
                    && i.Password == inputPassword.Text).FirstOrDefault();
                if (user == null)
                {
                    pnlMessage.Visible = true;
                    loginBtn.Visible = true;
                }
                else
                {
                    Session["Email"] = user.Email;
                    Session["type"] = user.type;
                    Session["ID"] = user.ID;
                    Session["Fullname"] = user.Fullname;
                    Response.Redirect("Homepage.aspx");
                }
            }
        }
        protected void Reset_Click(object sender, EventArgs e)
        {
            pnlMessage.Visible = false;
            inputID.Text = "";
            inputPassword.Text = "";
        }

        protected void SignUp_Click(object sender, EventArgs e)
        {
            Response.Redirect("Register.aspx");
        }
    }
}