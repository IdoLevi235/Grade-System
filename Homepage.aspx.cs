using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Http.Results;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.WebPages;
using System.Net;
using System.Net.Mail;

namespace Final_Project
{
    public partial class Homepage : System.Web.UI.Page
    {
        private webProjectEntities wpe = new webProjectEntities();
        private string idToEdit;
        protected void Page_Load(object sender, EventArgs e)
        {
            FillDataContactTeachers(sender,e);
            //this.teacherGrid.HeaderRow.TableSection = TableRowSection.TableHeader;
            if (!Page.IsPostBack)
            {
                if (Session["type"].ToString().Equals("teacher"))
                    FillDataTeacher();
                else if (Session["type"].ToString().Equals("student"))
                    FillDataStudent();

            }

        }

        private void FillDataStudent()
        {
            string id = Session["ID"].ToString();
            this.studentGrid.DataSource = wpe.tableUsers.Where(us => us.ID.Equals(id)).ToList();
            this.studentGrid.DataBind();
        }

        private void FillDataTeacher()
        {

            this.teacherGrid.DataSource = wpe.tableUsers.Where(us => us.type != "teacher").ToList();
            this.teacherGrid.DataBind();
            if (teacherGrid.Rows.Count == 0) noStudents.Visible = true;
        }

        protected void FillDataContactTeachers(object sender, EventArgs e)
        {
            this.contactTeachersGrid.DataSource = wpe.tableUsers.Where(us => us.type == "teacher").ToList();
            this.contactTeachersGrid.DataBind();
        }

        protected void Logout_Click (object sender, EventArgs e)
        {
            Session.Clear();
            Session.RemoveAll();
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }



        protected void teacherGrid_RowDelete(object sender, GridViewDeleteEventArgs e)
        {
            Session["returnToPage"] = "4";
            Label idl = teacherGrid.Rows[e.RowIndex].FindControl("lbl_ID") as Label;
            var id = idl.Text;
            
                var user = wpe.tableUsers.FirstOrDefault(u => u.ID.Equals(id));
                wpe.tableUsers.Remove(user);
                wpe.SaveChanges();
            teacherGrid.EditIndex = -1;
                 FillDataTeacher();
            
        }


        protected void teacherGrid_RowEditing(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
        {
            Session["returnToPage"] = "4";
            teacherGrid.EditIndex = e.NewEditIndex;
            FillDataTeacher();
        }

        protected void teacherGrid_RowCancelingEdit(object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e)
        {
            //Setting the EditIndex property to -1 to cancel the Edit mode in Gridview  
            teacherGrid.EditIndex = -1;
            FillDataTeacher();
        }

        protected void teacherGrid_RowUpdating(object sender, System.Web.UI.WebControls.GridViewUpdateEventArgs e)
        {
            //Finding the controls from Gridview for the row which is going to update  
            Label idl = teacherGrid.Rows[e.RowIndex].FindControl("lbl_ID") as Label;
            var id = idl.Text;
            TextBox userAlgo = teacherGrid.Rows[e.RowIndex].FindControl("txt_algo") as TextBox;
            TextBox userAlgeb = teacherGrid.Rows[e.RowIndex].FindControl("txt_algeb") as TextBox;
            TextBox userDatamine = teacherGrid.Rows[e.RowIndex].FindControl("txt_datam") as TextBox;
            TextBox userWeb = teacherGrid.Rows[e.RowIndex].FindControl("txt_web") as TextBox;
            TextBox userCalc = teacherGrid.Rows[e.RowIndex].FindControl("txt_calculus") as TextBox;
            TextBox userOp = teacherGrid.Rows[e.RowIndex].FindControl("txt_os") as TextBox;

            var user = wpe.tableUsers.FirstOrDefault(u => u.ID.Equals(id));

                user.Algebra = userAlgeb.Text;
                user.Algorithms = userAlgo.Text;
                user.Datamining =userDatamine.Text;
                user.WebDev = userWeb.Text;
                user.Calculus =userCalc.Text;
                user.OperatinsSystems = userOp.Text;
            if (!checkGrades(user)) return;
            wpe.SaveChanges();
            teacherGrid.EditIndex = -1;
            FillDataTeacher();
            
        }

        private bool checkGrades(tableUsers user)
        {
            int grade;
            if (user.Algebra.Length>0 &&  (!Int32.TryParse(user.Algebra,out grade) || grade<0 || grade>100))
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Algebra grade must be a number in range 0-100')", true);
                return false;
            }
            else if (user.Algorithms.Length > 0 && (!Int32.TryParse(user.Algorithms, out grade) || grade < 0 || grade > 100))
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Algorithms grade must be a number in range 0-100')", true);
                return false;
            }
            else if (user.Datamining.Length > 0 && (!Int32.TryParse(user.Datamining, out grade) || grade < 0 || grade > 100))
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Data mining grade must be a number in range 0-100')", true);
                return false;
            }
            else if (user.WebDev.Length > 0 && (!Int32.TryParse(user.WebDev, out grade) || grade < 0 || grade > 100))
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Web Development grade must be a number in range 0-100')", true);
                return false;
            }
            else if (user.Calculus.Length > 0 && (!Int32.TryParse(user.Calculus, out grade) || grade < 0 || grade > 100))
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Calculus grade must be a number in range 0-100')", true);
                return false;
            }
            else if (user.OperatinsSystems.Length > 0 && (!Int32.TryParse(user.OperatinsSystems, out grade) || grade < 0 || grade > 100))
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Operating Systems grade must be a number in range 0-100')", true);
                return false;
            }
            return true;
        }

        protected void updateBtn_Click(object sender, GridViewEditEventArgs e)
        {
            var userToEdit = wpe.tableUsers.SingleOrDefault(f => f.ID == idToEdit);

        }

        protected void btnAvg_Click(object sender, EventArgs e)
        {
            Session["returnToPage"] = "5";
            Label idl = studentGrid.Rows[0].FindControl("lbl_ID") as Label;
            var id = idl.Text;
            var user = wpe.tableUsers.FirstOrDefault(u => u.ID.Equals(id));
            List<Int32> grades = new List<Int32>();
            if (user.Algebra != "") grades.Add(Int32.Parse(user.Algebra));
            if (user.Algorithms != "") grades.Add(Int32.Parse(user.Algorithms));
            if (user.Datamining != "") grades.Add(Int32.Parse(user.Datamining));
            if (user.Calculus != "") grades.Add(Int32.Parse(user.Calculus));
            if (user.WebDev != "") grades.Add(Int32.Parse(user.WebDev));
            if (user.OperatinsSystems != "") grades.Add(Int32.Parse(user.OperatinsSystems));
            if (grades.Count > 0)
            {
                float avg = grades.Sum() / grades.Count;
                string average = avg.ToString();
                lbl_avg.Visible = true;
                lbl_avg.Text = average;
            }
            else
            {
                lbl_avg.Visible = true;
                lbl_avg.Text = "You have no grades yet";
            }
        }
            protected void submit_Contact(object sender, EventArgs e)
        {
            var msg = new tableMsgs()
            {
                fname = fname_contact.Text,
                lname = lname_contact.Text,
                msg = subject_contact.Text,
                dep = "Software"
            };
            wpe.tableMsgs.Add(msg);
            try
            {
                wpe.SaveChanges();
            }
            catch(Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Error!')", true);
                return;
            }
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Thank you for your Message!')", true);

        }

        protected void addNewStudent(object sender, EventArgs e)
        {
            Session["returnToPage"] = "6";
            toStudentTbl.Visible = false;
            if (newStudentEmail.Text.Length == 0 || newStudentID.Text.Length == 0 || newStudentPassword.Text.Length == 0) // mandatory fields are empty
            {
                addStudent_lbl.Visible = true;
            }

            else // form is filled OK
            {
                if (!isValidEmail(newStudentEmail.Text))
                {
                    addStudent_lbl.Visible = false;
                    toStudentTbl.Visible = false;
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Invalid Email Address!')", true);
                }
                else
                {
                    using (var db = new webProjectEntities())
                    {

                        var newUser = new tableUsers()
                        {
                            ID = newStudentID.Text,
                            Email = newStudentEmail.Text,
                            Password = newStudentPassword.Text,
                            Fullname = newStudentFullname.Text.Length == 0 ? "" : newStudentFullname.Text,
                            Algebra = "",
                            Algorithms = "",
                            Datamining = "",
                            WebDev = "",
                            Calculus = "",
                            OperatinsSystems = "",
                            type = "student"
                        };

                        newStudentEmail.Text = "";
                        newStudentID.Text = "";
                        newStudentPassword.Text = "";
                        newStudentFullname.Text = "";

                        try
                        {
                            db.tableUsers.Add(newUser);
                            db.SaveChanges();
                        }
                        catch (Exception ex)
                        {
                            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('ID already exists')", true);
                            addStudent_lbl.Visible = false;
                            toStudentTbl.Visible = false;
                            return;
                        }
                    }
                    addStudent_lbl.ForeColor = System.Drawing.Color.Green;
                    addStudent_lbl.Text = "New Student Added Successfully";
                    addStudent_lbl.Visible = true;
                    toStudentTbl.Attributes.Add("style", "margin-left: 25px;");
                    toStudentTbl.Visible = true;
                }
            }
        }

       protected void toStudentTbl_Click(object sender, EventArgs e)
        {
            Session["returnToPage"] = "4";
            Response.Redirect("Homepage.aspx");
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

    }
}