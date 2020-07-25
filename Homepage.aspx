<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Homepage.aspx.cs" Inherits="Final_Project.Homepage" %>

<!DOCTYPE html>

<html ng-app="app">
<head>
    <title>Grade-Me Homepage</title>
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="styles_homepage.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.8.0/angular.js" integrity="sha512-CiKQCmN86Y1I8Ewkt2gGnSNmsiVrS9Ez5MoudCBhTiBJScg+GjA9OlKdaeI0IuxdCl43Fs5x5zpeew2hfOatOA==" crossorigin="anonymous"></script>
    <script src="http://code.jquery.com/jquery-3.4.1.js" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" crossorigin="anonymous"></script>
    
    <script>
        var app = angular.module('app', []);
        app.controller('mainController', function ($scope) {
            $scope.ret = '<%= Convert.ToString(Session["returnToPage"]) %>'; // works
            $scope.page = !$scope.ret ? 1 : $scope.ret;
            $scope.permission = '<%= Session["type"] %>';
            $scope.fullname = '<%= Session["Fullname"] %>';
            $scope.hello = !$scope.fullname ? $scope.permission : $scope.fullname;

            $scope.dropDownItem = "Choose an option";
            $scope.checkIfTeacher = function () {
                if ($scope.permission == "teacher") $scope.page = 4;
                else alert("Permmision denied");
            }

            $scope.checkIfStudent = function () {
                if ($scope.permission == "student") $scope.page = 5;
                else alert("Permmision denied");
            }

            $scope.changeDropDownItem = function (item) {
                $scope.dropDownItem = item;
            }
            //

        });
    </script>

</head>
<body ng-controller="mainController">
    <form runat="server">
        <nav class="navbar navbar-default">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" ng-click="page=1" href="#">Grade-Me</a>
                </div>

                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li ng-class="{'active': page === 1}"><a href="#" ng-click="page=1">Home</a></li>
                        <li ng-class="{'active': page === 2}"><a href="#" ng-click="page=2">About</a></li>
                        <li ng-class="{'active': page === 3}"><a href="#" ng-click="page=3">Contact</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-text" style="text-align: center; color: black">
                        <li style="text-transform: capitalize;">Welcome, <b>{{hello}}</b></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <asp:LinkButton runat="server" ID="logout" OnClick="Logout_Click">Logout<i class="fas fa-user" style="margin-left:8px;"></i></asp:LinkButton></li>
                    </ul>
                </div>
            </div>
        </nav>
        <div runat="server" id="page1" class="container" ng-show="page==1">
            <div class="row">
                <div class="col-lg-12">
                    <div id="toCenter">
                         <img src="https://www.wgalil.ac.il/files/education.jpg"width="300" height="70" alt="webmaster logo" />
                        <h1>Grade-Me</h1>
                        <h3>Ort Braude's new Grading System</h3>
                        <hr>
                        <button class="btn btn-default btn-lg" type="button" ng-click="checkIfStudent()"><i class="fas fa-graduation-cap" style="margin-right:8px;"></i>Students Zone</button>
                        <button class="btn btn-default btn-lg" type="button" ng-click="checkIfTeacher()"><i class="fas fa-chalkboard-teacher" style="margin-right:8px;"></i>Teachers Zone</button>
                    </div>
                </div>
            </div>
        </div>
        <div runat="server" id="page2" class="about" ng-show="page==2">
            <div class="container" style="font-size:16px; line-height:40px;">
            <h2>About us:</h2>
            <p>
               ORT Braude Academic College of Engineering 
               <br />The college was established in 1993 with the aim of developing a unique academic center in the north of the country in the fields of engineering and cultivating,through its graduates, interactions with industry.
               <br /> Today, the college operates with the approval and budget of the Council for Higher Education and prepares for the degree of "Bachelor of Science" (B.Sc.)
               <br /> and the degree of "Master of Science" (M.Sc.)
             </p>
                <br />
             <p> 
                   We are two software engineering students at ORT Braude College.
               <br />Following a final project in the "WEB" course we were required to develop a website of the college 
               <br />that would allow lecturers and students to log in, make changes and see certain details about grades in their courses 
               <br /> <b>If you have suggestions for improvement or technical problems on the site you can contact us from the <a href="#" ng-click="page=3" onclick="return false;">Contact Us page</a></b>
               <br /> Ido Levi :  <a href="mailto:idolevi235@gmail.com">idolevi235@gmail.com</a>
               <br /> Nofar Hazan : <a href="mailto:nofarhazan5@gmail.com">nofarhazan5@gmail.com</a>
                    </p>

            </div>
           
        </div>

        <div runat="server" id="page3" class="contact" ng-show="page==3">
            <div class="container_contact">
    <label for="fname">First Name</label>
    <asp:TextBox runat="server" ID="fname_contact" placeholder="Your name.."></asp:TextBox> 

    <label for="lname">Last Name</label>
    <asp:TextBox runat="server" ID="lname_contact" placeholder="Your Last name.."></asp:TextBox> 

    <label for="dep">Department</label>
    <select id="dep" name="dep">
      <option value="Software Engineering">Software Engineering</option>
      <option value="Industrial Engineering">Industrial Engineering</option>
      <option value="Mechanical Engineering">Mechanical Engineering</option>
      <option value="Electrical Engineering">Electrical Engineering</option>

    </select>

    <label for="subject">Subject</label>
    <asp:TextBox runat="server" ID="subject_contact" placeholder="Write something.." Height="200"></asp:TextBox>
    <asp:Button runat="server" ID="contact_submit" Text="Submit" OnClick="submit_Contact" />
</div>
        </div>

<div id="page4" class="teacherzone" ng-show="page==4" style="margin-top: 20px; margin-left: 50px;">
            <h1 style="color:black;">Teachers Zone!</h1>
            <h3 style="color:black;">Here you can see all of the student's grades, and many more options..</h3>

<button id="btn_addstudent" type="button" class="btn" style="margin:5px;margin-left: 45%;background-color: #97bf8c;color: black;" ng-click="page=6">Add New Student</button>
  <div class="container" style="margin: 20px auto;">
    <div class="row">
      <div class="col-md-12">
        <div class="table-responsive" style="text-align:center">
            <asp:Label runat="server" ID="noStudents" Text="Currently, There are no students in the Database" Visible="false"></asp:Label>
            <asp:GridView ID="teacherGrid" runat="server" AutoGenerateColumns="False" CellPadding="6"
                OnRowCancelingEdit="teacherGrid_RowCancelingEdit" 
                OnRowEditing="teacherGrid_RowEditing" 
                OnRowUpdating="teacherGrid_RowUpdating" 
                OnRowDeleting="teacherGrid_RowDelete"
                CssClass="table table-responsive table-condensed table-hover"
                BackColor="#f2f2f2" AlternatingRowStyle-BackColor="#ffffff" HeaderStyle-BackColor="#adbaed"
                >  
            <Columns>  
                <asp:TemplateField>  
                    <ItemTemplate>  
                        <asp:Button ID="btn_Edit" runat="server" Text="Edit" CommandName="Edit" CssClass="btn btn-primary"/>
                        <asp:Button ID="btn_Delete" runat="server" Text="Delete" CommandName="Delete" CssClass="btn btn-danger"/> 
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:Button ID="btn_Update" runat="server" Text="Update" CommandName="Update" CssClass="btn btn-success"/>  
                        <asp:Button ID="btn_Cancel" runat="server" Text="Cancel" CommandName="Cancel" CssClass="btn btn-warning"/>  
                    </EditItemTemplate>  
                </asp:TemplateField>  
                <asp:TemplateField HeaderText="ID" HeaderStyle-CssClass="text-center">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_ID" runat="server" Text='<%#Eval("ID") %>'></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField>  
                <asp:TemplateField HeaderText="Email" HeaderStyle-CssClass="text-center">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_email" runat="server" Text='<%#Eval("Email") %>'></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField>  
                <asp:TemplateField HeaderText="Full Name" HeaderStyle-CssClass="text-center">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_fullname" runat="server" Text='<%#Eval("Fullname") %>'></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField>  
                <asp:TemplateField HeaderText="Algorithms" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_algo" runat="server" Text='<%#Eval("Algorithms") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txt_algo" runat="server" Text='<%#Eval("Algorithms") %>' ></asp:TextBox>  
                    </EditItemTemplate>  
                    <ControlStyle Width="50px"></ControlStyle>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Algebra" HeaderStyle-CssClass="text-center" ItemStyle-HorizontalAlign="Center">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_algeb" runat="server" Text='<%#Eval("Algebra") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate >  
                        <asp:TextBox ID="txt_algeb" runat="server" Text='<%#Eval("Algebra") %>' ></asp:TextBox>  
                    </EditItemTemplate>  
                    <ControlStyle Width="50px"></ControlStyle>
                </asp:TemplateField> 
                <asp:TemplateField HeaderText="Data Mining" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_datam" runat="server" Text='<%#Eval("Datamining") %>' ></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txt_datam" runat="server" Text='<%#Eval("Datamining") %>' ></asp:TextBox>  
                    </EditItemTemplate>
                    <ControlStyle Width="50px"></ControlStyle>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Web Developing" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_web" runat="server" Text='<%#Eval("WebDev") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txt_web" runat="server" Text='<%#Eval("WebDev") %>' ></asp:TextBox>  
                    </EditItemTemplate>
                   <ControlStyle Width="50px"></ControlStyle>
                </asp:TemplateField> 
                <asp:TemplateField HeaderText="Calculus" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_calculus" runat="server" Text='<%#Eval("Calculus") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txt_calculus" runat="server" Text='<%#Eval("Calculus") %>'></asp:TextBox>  
                    </EditItemTemplate> 
                    <ControlStyle Width="50px"></ControlStyle>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Operating Systems" HeaderStyle-CssClass="text-center" ItemStyle-HorizontalAlign="Center">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_os" runat="server" Text='<%#Eval("OperatinsSystems") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txt_os" runat="server" Text='<%#Eval("OperatinsSystems") %>'></asp:TextBox>  
                    </EditItemTemplate> 
                  <ControlStyle Width="50px"></ControlStyle>
                </asp:TemplateField> 
            </Columns>  
        </asp:GridView>  
            </div>
            </div>
        </div>

  </div>

        </div>

<div id="page5" class="studentzone" ng-show="page==5" style="margin-top: 20px; margin-left: 50px;">
            <h1 style="color:black;">Students Zone!</h1>
            <h3 style="color:black;">Here you can see youe grades, and many more..</h3>
  <div class="container" style="margin: 50px auto">
    <div class="row">
      <div class="col-md-12">
        <div class="table-responsive" style="text-align:center">
            <asp:GridView ID="studentGrid" runat="server" AutoGenerateColumns="False" CellPadding="6"
                CssClass="table table-responsive table-condensed table-hover"
                BackColor="#f2f2f2" AlternatingRowStyle-BackColor="#ffffff" HeaderStyle-BackColor="#adbaed"
                >  
            <Columns>  
                <asp:TemplateField HeaderText="ID" HeaderStyle-CssClass="text-center">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_ID" runat="server" Text='<%#Eval("ID") %>'></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField>  
                <asp:TemplateField HeaderText="Email" HeaderStyle-CssClass="text-center">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_email" runat="server" Text='<%#Eval("Email") %>'></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField>  
                <asp:TemplateField HeaderText="Full Name" HeaderStyle-CssClass="text-center">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_fullname" runat="server" Text='<%#Eval("Fullname") %>'></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField>  
                <asp:TemplateField HeaderText="Algorithms" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_algo" runat="server" Text='<%#Eval("Algorithms") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txt_algo" runat="server" Text='<%#Eval("Algorithms") %>' ></asp:TextBox>  
                    </EditItemTemplate>  
                    <ControlStyle Width="50px"></ControlStyle>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Algebra" HeaderStyle-CssClass="text-center" ItemStyle-HorizontalAlign="Center">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_algeb" runat="server" Text='<%#Eval("Algebra") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate >  
                        <asp:TextBox ID="txt_algeb" runat="server" Text='<%#Eval("Algebra") %>' ></asp:TextBox>  
                    </EditItemTemplate>  
                    <ControlStyle Width="50px"></ControlStyle>
                </asp:TemplateField> 
                <asp:TemplateField HeaderText="Data Mining" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_datam" runat="server" Text='<%#Eval("Datamining") %>' ></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txt_datam" runat="server" Text='<%#Eval("Datamining") %>' ></asp:TextBox>  
                    </EditItemTemplate>
                    <ControlStyle Width="50px"></ControlStyle>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Web Developing" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_web" runat="server" Text='<%#Eval("WebDev") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txt_web" runat="server" Text='<%#Eval("WebDev") %>' ></asp:TextBox>  
                    </EditItemTemplate>
                   <ControlStyle Width="50px"></ControlStyle>
                </asp:TemplateField> 
                <asp:TemplateField HeaderText="Calculus" ItemStyle-HorizontalAlign="Center" HeaderStyle-CssClass="text-center">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_calculus" runat="server" Text='<%#Eval("Calculus") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txt_calculus" runat="server" Text='<%#Eval("Calculus") %>'></asp:TextBox>  
                    </EditItemTemplate> 
                    <ControlStyle Width="50px"></ControlStyle>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Operating Systems" HeaderStyle-CssClass="text-center" ItemStyle-HorizontalAlign="Center">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_os" runat="server" Text='<%#Eval("OperatinsSystems") %>'></asp:Label>  
                    </ItemTemplate>  
                    <EditItemTemplate>  
                        <asp:TextBox ID="txt_os" runat="server" Text='<%#Eval("OperatinsSystems") %>'></asp:TextBox>  
                    </EditItemTemplate> 
                  <ControlStyle Width="50px"></ControlStyle>
                </asp:TemplateField> 
            </Columns>  
        </asp:GridView>  
            </div>
            </div>
        </div>
  </div>
     <hr />
    <div class="container">
      <h3 style="color:black; margin:30px;">Choose what you want to do next.. </h3>
         <div style="margin: 30px;">
            <asp:Button ID="btn_avg" runat="server" Text="Calculate your average" OnClick="btnAvg_Click" CssClass="btn btn-primary"/> 
            <asp:Label ID="lbl_avg" runat="server" Visible="false" CssClass="avglbl" ></asp:Label>  
         </div>
        <div style="margin: 30px;">
                <a class="button" href="#popup1"><b>Contact College Staff</b></a>
            <div id="popup1" class="overlay">
	            <div class="popup">
		            <a class="close" href="#">&times;</a>
		            <div class="content"><br /><br />
             <asp:GridView ID="contactTeachersGrid" runat="server" AutoGenerateColumns="False" CellPadding="6"
                CssClass="table table-responsive table-condensed table-hover"
                BackColor="#f2f2f2" AlternatingRowStyle-BackColor="#ffffff" HeaderStyle-BackColor="#adbaed"
                >  
            <Columns>  
                <asp:TemplateField HeaderText="Email" HeaderStyle-CssClass="text-center" ItemStyle-HorizontalAlign="Center">  
                    <ItemTemplate>  
                    <asp:hyperlink id="lnkEmail" runat="server" navigateurl='<%# Eval("Email", "mailto:{0}") %>'
                       text='<%# Eval("Email") %>'></asp:hyperlink>
                    </ItemTemplate>  
                </asp:TemplateField>  
                <asp:TemplateField HeaderText="Full Name" HeaderStyle-CssClass="text-center" ItemStyle-HorizontalAlign="Center">  
                    <ItemTemplate>  
                        <asp:Label ID="lbl_fullname1" runat="server" Text='<%#Eval("Fullname") %>'></asp:Label>  
                    </ItemTemplate>  
                </asp:TemplateField>  
            </Columns>  
        </asp:GridView>  

		            </div>
	            </div>
            </div>
        </div>
    </div>

        </div>

<div class="container">
<div id="page6"  ng-show="page==6" >
  <div class="form-group">
    <label for="newStudentID">ID *</label>
    <asp:TextBox runat="server" TextMode="SingleLine" CssClass="form-control" ID="newStudentID" placeholder="Enter ID" />
  </div>
  <div class="form-group">
    <label for="newStudentEmail">Email address *</label>
    <asp:TextBox runat="server" TextMode="SingleLine" CssClass="form-control" ID="newStudentEmail" placeholder="Enter E-mail" />
  </div>
  <div class="form-group">
    <label for="newStudentPassword">Password *</label>
    <asp:TextBox runat="server" TextMode="Password" CssClass="form-control" ID="newStudentPassword" placeholder="Enter Password" />
    <small id="passHelp" class="form-text text-muted">Choose safe password for the new student.</small>
  </div>
  <div class="form-group">
    <label for="newStudentFullname">Full Name</label>
    <asp:TextBox runat="server" TextMode="SingleLine" CssClass="form-control" ID="newStudentFullname" placeholder="Enter Full Name (Optional)" />
  </div>
   <asp:Button runat="Server" UseSubmitBehavior="false" CssClass="btn btn-primary" Text="Submit" OnClick="addNewStudent"/>
   <span style="float:right;"><asp:Label runat="server" ForeColor="Red" ID="addStudent_lbl" Visible="false">You must fill all fields marked with * !!</asp:Label>
       <asp:Button runat="server" Visible="false" CssClass="btn btn-success" ID="toStudentTbl" Text="Back to Students table" OnClick="toStudentTbl_Click"/></span>
</div>
    </div>

    </form>
</body>
</html>
