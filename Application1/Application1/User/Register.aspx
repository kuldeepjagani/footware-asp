<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Application1.User.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
<style>
        body{
            background-image: linear-gradient(to right, rgba(132, 250, 176, 0.5), rgba(143, 211, 244, 0.5)),url('https://mdbcdn.b-cdn.net/img/Photos/new-templates/search-box/img4.webp');
        }
        #Button1{
            background: linear-gradient(to right, rgba(132, 250, 176, 1), rgba(143, 211, 244, 1))
        }
    </style>
    <link rel="stylesheet" href="../boostrap/css/bootstrap.css" type="text/css" />
    <link rel="stylesheet" href="../boostrap/css/bootstrap.min.css" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <section class="vh-100 bg-image">
            <div class="container h-100">
                <div class="row d-flex justify-content-center align-items-center h-100" align="center">
                    <div class="col-12 col-md-9 col-lg-7 col-xl-6">
                        <div class="card mt-4" style="border-radius: 15px;">
                            <div class="card-body p-5">
                                <%--Header Text--%>
                                <div class="col">
                                    <h2 class="text-uppercase text-center mb-5">Create account</h2>
                                </div>

                                 <%--First Name With Required & Regular Expression Validation--%>
                                <div class="col bg-white">

                                    <asp:TextBox ID="TextBox1" runat="server" placeholder="Enter Your Name.." CssClass="form-control" BackColor="Transparent" Font-Size="Larger" TabIndex="1"></asp:TextBox>

                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="First Name Is Empty" ForeColor="Red">*</asp:RequiredFieldValidator>
                                </div>


                                <%--Email-id With Required Field Validation--%>

                                <div class="col">
                                    <asp:TextBox ID="TextBox3" CssClass="form-control" placeholder="Enter Your Email..." runat="server" BackColor="Transparent" TextMode="Email" Font-Size="Larger" TabIndex="3"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage="Emali_ID Is Empty" ForeColor="Red">*</asp:RequiredFieldValidator>

                                </div>

                                <%--Gender With Required Field Validation--%>

                                <div class="col">
                                    <asp:DropDownList ID="DropDownList1" runat="server" BackColor="Transparent" CssClass="custom-select" Font-Size="Larger" TabIndex="4">
                                        <asp:ListItem Value="Select Gender">Select Gender</asp:ListItem>
                                        <asp:ListItem>Male</asp:ListItem>
                                        <asp:ListItem>Female</asp:ListItem>
                                        <asp:ListItem>Other</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="DropDownList1" ErrorMessage="Select Gender" ForeColor="Red" InitialValue="Select Gender">*</asp:RequiredFieldValidator>
                                </div>


                                <%--Phone No. With Required Field & Regular Expression Validation--%>

                                <div class="col">
                                    <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control" placeholder="Enter Mobile no.." BackColor="Transparent" Font-Size="Larger" TabIndex="6" MaxLength="10"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox5" ErrorMessage="Phone_No Is Empty" ForeColor="Red">*</asp:RequiredFieldValidator>

                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TextBox5"  ErrorMessage="Phone_No Is Empty" ForeColor="Red" ValidationExpression="[0-9]{10}">*</asp:RegularExpressionValidator>
                                </div>

                                <%--Password With Required Field Validation--%>

                                <div class="col">

                                    <asp:TextBox ID="TextBox6" runat="server" placeholder="Enter Password..." CssClass="form-control" BackColor="Transparent" TextMode="Password" Font-Size="Larger" TabIndex="7"></asp:TextBox>

                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBox6" ErrorMessage="Password Is Empty" ForeColor="Red">*</asp:RequiredFieldValidator>
                                </div>


                                <%--Confrom Password With Required Field & Compare Validation--%>

                                <div class="col">
                                    <asp:TextBox ID="TextBox7" runat="server" CssClass="form-control" placeholder="Repeat your password..." BackColor="Transparent" TextMode="Password" Font-Size="Larger" TabIndex="8"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="TextBox7" ErrorMessage="Confirm Password Is Empty" ForeColor="Red">*</asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="TextBox7" ControlToCompare="TextBox6" ErrorMessage="Password Not Matched" ForeColor="Red">*</asp:CompareValidator>

                                </div>
                               

                                <%--Register Button--%>

                                <div class="col">
                                    <asp:Button ID="Button1" runat="server" Text="Register" Font-Size="Larger" CssClass="btn btn-success btn-block btn-lg text-body" OnClick="Button1_Click" />
                                   
                                </div>

                                <div class="col">
                                    <p class="text-center text-muted mt-5 mb-0">Have already an account? 
                                        <a href="Login.aspx" class="fw-bold text-body"><u>Login here</u></a></p>
                                </div>

                                <%--Validation Summary For Display all Validaion Error Mesage--%>

                                <div colspan="3">
                                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" HeaderText="Fix the following errors" Font-Bold="true" ShowMessageBox="True" ShowSummary="False" />
                                </div>



                                <%--Lable For displaying error message--%>
                                <div class="auto-style1">
                                    <asp:Label ID="Label1" runat="server" ForeColor="#66FF66" Font-Size="Larger"></asp:Label>
                                </div>
                            </div>
                       </div>

                    </div>
                </div>
            </div>
        </section>
    </form>
</body>
</html>
