<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Application1.User.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
 <link rel="stylesheet" href="../boostrap/css/bootstrap.css" type="text/css" />
    <style>
        #Button1{
            background: linear-gradient(to right, #ee7724, #d8363a, #dd3675, #b44593);
        }
    </style>
</head>
<body class="">
    <form id="form1" runat="server">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-12 col-md-9 col-lg-7 col-xl-5" align="center">
                    <div class="card mt-5" style="border-radius:15px">
                        <div class="card-body bg-light" style="border-radius:15px">
                            <div class="col" style="margin-top: 50px;">
                                <%--<img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/lotus.webp" style="width: 185px;" alt="logo" />--%>
                            </div>

                            <div class="col bg-light pt-3">
                                <asp:Label ID="Label1" CssClass="" runat="server" Font-Bold="true" Font-Italic="true" Text="Sign In" Font-Size="XX-Large" Font-Underline="true"></asp:Label>
                            </div>

                            <div class="col bg-light pt-4">
                                <asp:TextBox ID="TextBox1" runat="server" placeholder="Enter Register Email..." Font-Size="Larger" CssClass="form-control"></asp:TextBox>
                                <br />
                            </div>

                            <div class="col bg-light ">
                                <asp:TextBox ID="TextBox2" runat="server" TextMode="Password" Font-Size="Larger" placeholder="Enter Password..." CssClass="form-control"></asp:TextBox>
                                <br />
                            </div>
                            <div class="col bg-light pt-4 pb-4">
                                <asp:Button ID="Button1" runat="server" Text="Login" CssClass="btn w-100 pb-2" Font-Size="X-Large" Font-Bold="true" OnClick="Button1_Click" />
                                <br />
                            </div>
                            <div class="col bg-light pt-2">
                                <asp:Label ID="Label4" runat="server" Text=""></asp:Label>
                            </div>
                            <div class="col bg-light pt-2">
                               <!--<asp:HyperLink ID="HyperLink1" ForeColor="Black" runat="server" NavigateUrl="forget.aspx">Forgot password?</asp:HyperLink>-->
                            </div>

                            <div class="col bg-light pt-2">
                                <span class="custom-control-inline">
                                    <p class="mb-0 me-2">Don't have an account?</p>
                                    &nbsp;
                            <asp:Button ID="Button2" runat="server" CssClass="btn btn-outline-danger" OnClick="Button2_Click" Text="Create New" /></span>
                                <br />
                            </div>
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
