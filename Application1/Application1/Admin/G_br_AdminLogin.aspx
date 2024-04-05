<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="G_br_AdminLogin.aspx.cs" Inherits="Application1.Admin.G_br_AdminLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <link rel="shortcut icon" href="Images/m-icon2.png" type="image/x-icon">
    <link rel="stylesheet" href="../boostrap/css/bootstrap.css" />
    <link rel="stylesheet" href="../boostrap/css/bootstrap.min.css" />
    <title>Sasta Bazaar</title>
     <style type="text/css">
         .table1 {
           border-radius: 30px;
           box-shadow: 1px 5px 10px 10px;
         }
         .auto-style2 {
             width: 100%;
             height: 100%;
         }
         .auto-style4 {
             width: 473px;
             height: 597px;
         }
         .auto-style5 {
             height: 597px;
         }
         .auto-style6 {
             width: 624px;
             height: 597px;
         }
         .auto-style7 {
             height: 57px;
         }
         .image{
            border-radius:50px;
            box-shadow:0px 2px 5px 6px blue;
            
         }
         .tex {
            border-radius:10px;
            
         }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="text-align:center">
        
    
        <table class="auto-style2">
            <tr>
                <td class="auto-style4 form-group" align="center">
                    <table align="center" class="table1" style="height:517px; width: 30%; margin:0 auto; background-image: linear-gradient(-20deg,#00cdac 0%, #8ddad5 100%)">

                        <%--Display Login Logo Images--%>
                        <tr>
                            <td align="center" colspan="2">
                                <img id="Img1" runat="server" class="image" alt="" src="~/image/Adminlogo.jpg" style="height:220px; width:300px" /> </td>
                        </tr>

                         <%--Email id with Requird Field Validation--%>
                        <tr>
                            
                            <td align="center">
                                <b>User Name </b>
                                <br />
                                <asp:TextBox ID="TextBox1" CssClass="tex form-control" runat="server" Width="90%" BackColor="white"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Enter UserName" ForeColor="Red">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>

                        <%--Password with Required Field Validation--%>
                        <tr>
                           
                            <td align="center">
                                <b>Password 
                                <br />
                                </b>
                                <asp:TextBox ID="TextBox2" runat="server" BackColor="white" Width="90%" CssClass="tex form-control" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox1" ErrorMessage="Enter Valid Password" ForeColor="Red">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>

                        <%--Button For Login & Redirect to Default Page--%>
                        <tr>
                            <td align="center" colspan="2">
                                <asp:ImageButton ID="ImageButton1" runat="server" CssClass="btn" Height="57px" ImageUrl="~/image/submit-button.png" Onclick="ImageButton1_Click" Width="201px" />
                            </td>
                        </tr>
                        <tr>
                        <%--Lable For Displaying Error Message--%>
                            <td class="auto-style1" align="center">
                                <asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="true" ShowSummary="false"/>

                                
                            </td>
                            
                        </tr>
                       
                    </table>
                </td>
            </tr>
       
        </table>
        
    </div>
    </form>
</body>
</html>
