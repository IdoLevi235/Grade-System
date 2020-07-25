<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Final_Project.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Grade-Me registration</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="styles.css">

</head>
<body>
    <div class="container">
        <div class="d-flex justify-content-center h-100">
            <div class="card">
                <div class="card-header">
                    <h3>Register To "Grade-Me"!</h3>
                </div>
                <div class="card-body">
                    <form runat="server">
                        <div class="input-group form-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text" style="margin-top:0px;margin-bottom:0px;"><i class="fa fa-id-card" aria-hidden="true"></i></span>
                            </div>
                            <asp:TextBox runat="server" TextMode="SingleLine" CssClass="form-control" ID="inputid" placeholder="ID" />
                        </div>
                        <div class="input-group form-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text" style="margin-top:0px;margin-bottom:0px;"><i class="fas fa-at"></i></span>
                            </div>
                            <asp:TextBox runat="server" TextMode="SingleLine" CssClass="form-control" ID="inputEmail" placeholder="E-mail"  />
                        </div>
                        <div class="input-group form-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text" style="margin-top:0px;margin-bottom:0px;"><i class="fas fa-key"></i></span>
                            </div>
                        <asp:TextBox runat="server" TextMode="Password" CssClass="form-control" ID="inputPassword" placeholder="Password" />
                        </div>
                        <div class="input-group form-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text" style="margin-top:0px;margin-bottom:0px;"><i class="fas fa-user"></i></span>
                            </div>
                        <asp:TextBox runat="server" TextMode="SingleLine" CssClass="form-control" ID="inputFullname" placeholder="Full name (optional)" />
                        </div>
                        <span class="input-group ">
                         <asp:RadioButton ID="radio_student" CssClass="radio float-left" Text="I am a Student" Checked="True" GroupName="RadioGroup1" runat="server" />
                         <asp:RadioButton ID="radio_teacher" CssClass="radio float-left" Text="I am a Teacher" Checked="False" GroupName="RadioGroup1" runat="server" /><br />
                        </span>
                        <span class="form-group">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                            ControlToValidate="inputID" ForeColor="Red"
                            ErrorMessage="You Must fill ID">You must fill ID!</asp:RequiredFieldValidator><br />
                        </span>
                        <span class="form-group">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator" runat="server"
                            ControlToValidate="inputEmail" ForeColor="Red"
                            ErrorMessage="You Must fill E-mail">You must fill E-mail!</asp:RequiredFieldValidator><br />
                        </span>
                        <span class="form-group">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                            ControlToValidate="inputPassword" ForeColor="Red"
                            ErrorMessage="You Must fill Password">You must fill Password!</asp:RequiredFieldValidator><br />
                        </span>
                        <div>
                            <asp:label ID="RegisteredSuccess" runat="server" ForeColor="LightSeaGreen" Visible="false">You registered succesfully!</asp:label>
                            <asp:Button  runat="server" CssClass="btn float-roght gotologin_btn" Text="Go to login.." ID="gotoLogin" OnClick="gotoLogin_click" Visible="false"/>
                        </div>
                    <div class="form-group">
                         <asp:Panel runat="server" CssClass="alert alert-danger" ID="pnlMessage" Visible="false">Registration failed, try again..
                          </asp:Panel>
                    </div>

                <div class="form-group">
                    <div class="col-xs-8 col-xs-offset-4">
                        <asp:Button  runat="server" CssClass="btn login_btn" Text="Sign Up!" ID="signupBtn" OnClick="Register_Click" Visible="true"/>
                        <asp:Button  runat="server" CausesValidation="False" Text="Reset" CssClass="btn float-right login_btn" OnClick="Reset_Click" Visible="true"/>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-xs-8 col-xs-offset-4" style="margin-right:125px; margin-left:125px;">
                        <asp:Button runat="server" CausesValidation="False" CssClass="btn signup_btn" Text="Back to login"  OnClick="gotoLogin_click" ID="backToLogin" Visible="true"/>
                    </div>
                </div>

                   </form>
                </div>
            </div>
        </div>
    </div>


</body>

</html>
