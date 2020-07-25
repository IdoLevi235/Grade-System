<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Final_Project.Login"%>
<!DOCTYPE html>
<html ng-app="myApp">
<head runat="server">
    <title>Grade-Me Login</title>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>

<body>
    <!-- First div - login page -->
    <div class="container">
        <div class="d-flex justify-content-center h-100">
            <div class="card">
                <div class="card-header">
                    <h3>Sign In To "Grade-Me"</h3>
                </div>
                <div class="card-body">
                    <form runat="server">
                        <div class="input-group form-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text" style="margin-top:0px;margin-bottom:0px;"><i class="fa fa-id-card" aria-hidden="true"></i></span>
                            </div>
                            <asp:TextBox runat="server" TextMode="SingleLine" CssClass="form-control" ID="inputID" placeholder="ID" />

                        </div>
                        <div class="input-group form-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text" style="margin-top:0px;margin-bottom:0px;"><i class="fas fa-key"></i></span>
                            </div>
                        <asp:TextBox runat="server" TextMode="Password" CssClass="form-control" ID="inputPassword" placeholder="Password" />
                        </div>
                        <div class="form-group">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator" runat="server"
                            ControlToValidate="inputID" ForeColor="Red"
                            ErrorMessage="You Must fill ID">You must fill ID!</asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                            ControlToValidate="inputPassword" ForeColor="Red"
                            ErrorMessage="You Must fill Password">You must fill Password!</asp:RequiredFieldValidator>
                        </div>
                    <div class="form-group">
                         <asp:Panel runat="server" CssClass="alert alert-danger" ID="pnlMessage" Visible="false">Login failed, try again..
                          </asp:Panel>
                    </div>

                <div class="form-group">
                    <div class="col-xs-8 col-xs-offset-4">
                        <asp:Button  runat="server" CssClass="btn float-left login_btn" Text="Login!" OnClick="Login_Click" ID="loginBtn" Visible="true"/>
                        <asp:Button  runat="server" CausesValidation="False" Text="Reset" CssClass="btn float-right login_btn" OnClick="Reset_Click" Visible="true"/>
                    </div>
                </div>
                        <div>
                          <br /><br /><br /><br /><asp:Button runat="server" CausesValidation="False" CssClass="btn signup_btn" Text="If you don't have an account, register here!" OnClick="SignUp_Click" ID="signupBtn" Visible="true"/>
                        </div>  
                   </form>
                </div>
            </div>
        </div>
    </div>
    <!-- First div - login page ENDS HERE -->


</body>
</html>
