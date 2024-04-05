<%@ Page Title="" Language="C#" MasterPageFile="~/User/user_ms.Master" AutoEventWireup="true" CodeBehind="Address_Page.aspx.cs" Inherits="Application1.User.Address_Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 <style>
        div #HyperLink2{
            margin-left: 150px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-12 col-md-9 col-lg-7 col-xl-6">

                    <div>
                        <div align="center" class="form-control mb-3" style="border-radius: 15px;">

                            <div class="pb-3">
                                <asp:Label ID="Label1" runat="server" Text="Customer Address" Font-Italic="True" Font-Size="XX-Large" Font-Underline="True" Font-Bold="True" ForeColor="#0066FF"></asp:Label>
                            </div>

                            <div class="col">
                                <asp:TextBox ID="TextBox1" runat="server" CssClass="text form-inline form-control" placeholder="First Name (Required)" Width="440px" Height="52px" Font-Italic="True" Font-Size="Larger"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="Red" runat="server" ErrorMessage="Enter The Name" ControlToValidate="TextBox1">*</asp:RequiredFieldValidator>
                                <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="First Name Must Be In Characters" ForeColor="Red" 
                            ValidationExpression="^[A-Za-z]*$">*</asp:RegularExpressionValidator>--%>
                            </div>


                            <div class="col">

                                <asp:TextBox ID="TextBox2" runat="server" CssClass="text form-control form-inline" placeholder="Mobile Number (Required)" MaxLength="10" Width="440px" Height="52px" Font-Italic="True" Font-Size="Larger"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Must Be Enter Number" ControlToValidate="TextBox2" ForeColor="Red">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Number Must Be 10 Digits" ControlToValidate="TextBox2" ForeColor="Red" ValidationExpression="[0-9]{10}">*</asp:RegularExpressionValidator>
                            </div>


                            <div class="col " align="left">
                                <asp:TextBox ID="TextBox3" runat="server" CssClass="text form-control form-inline ml-4" MaxLength="6" placeholder="Pincode(Required)" Height="46px" Width="179px" Font-Bold="False" Font-Italic="True" Font-Size="Larger"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ForeColor="Red" ErrorMessage="Enter Pin No" ControlToValidate="TextBox3">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Number Must Be 6 Digits" ControlToValidate="TextBox3" ForeColor="Red" ValidationExpression="[0-9]{6}">*</asp:RegularExpressionValidator>
                            </div>
                            <div class="ml-5 col">
                                <%--<asp:TextBox ID="TextBox4" runat="server" CssClass="text" placeholder="Use My location" Height="46px" Width="179px" Font-Italic="True" Font-Size="Larger"></asp:TextBox>
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Choos the Location" ForeColor="Red" ControlToValidate="TextBox4">*</asp:RequiredFieldValidator>
                                --%>
                            </div>


                            <div class="col custom-control-inline">
                                <asp:TextBox ID="TextBox5" runat="server" CssClass="text form-control form-inline ml-4" placeholder="State(Required)" Height="46px" Width="179px" Font-Italic="True" Font-Size="Larger"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Enter Your State" ForeColor="Red" ControlToValidate="TextBox5">*</asp:RequiredFieldValidator>
                            
                                <asp:TextBox ID="TextBox6" runat="server" CssClass="text form-control form-inline ml-5" Height="46px" Width="179px" placeholder="City(Required)" Font-Italic="True" Font-Size="Larger"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Enter City Name" ForeColor="Red" ControlToValidate="TextBox6">*</asp:RequiredFieldValidator>
                            </div>


                            <div class="mt-4 col">
                                <asp:TextBox ID="TextBox7" runat="server" CssClass="text form-control form-inline" Width="440px" Height="45px" placeholder="House No.,Building Name (Required)" Font-Italic="True" Font-Size="Larger"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Enter House No,Building Name" ForeColor="Red" ControlToValidate="TextBox7">*</asp:RequiredFieldValidator>
                            </div>

                            <div class="col">
                                <asp:TextBox ID="TextBox8" runat="server" Width="440px" CssClass="text form-control form-inline" Height="52px" placeholder="Road name,Area,Colony (Required)" Font-Italic="True" Font-Size="Larger"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Enter Road name,Area,Colony" ControlToValidate="TextBox8" ForeColor="Red">*</asp:RequiredFieldValidator>


                            </div>

                            <div class="col">

                               
                            <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary w-100" Text="Submite" BackColor="Aqua" BorderColor="red" Font-Bold="true"
                                Font-Size="Large" ForeColor="black" Height="44px" Width="188px" OnClick="Button1_Click" />
                               
                            </div>

                            <div class="col-4 ml-5 w-100 pt-3 custom-control-inline">
                                <asp:HyperLink ID="HyperLink1" CssClass="" Font-Bold="True" runat="server" ForeColor="Blue" NavigateUrl="~/User/AddtoCart.aspx">Previous Page</asp:HyperLink>
                           </div>

                           <div class="col-4 ml-5 w-100 custom-control-inline">
                                <asp:HyperLink ID="HyperLink2" Font-Bold="True" runat="server" ForeColor="Blue" NavigateUrl="~/User/home.aspx">Home Page</asp:HyperLink>
                            </div>



                            <%--Validation Summery for dispalying all error Message--%>

                            <div class="col">
                                <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="validation" Font-Bold="true" ForeColor="Red" HeaderText="Fix the Following errors" Height="100px" Width="500px" ShowMessageBox="True" ShowSummary="False" />
                            </div>



                        </div>
                    </div>

                </div>
            </div>
        </div>

    <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
    <script>
        function OpenPaymentWindow(key, amountInSubunits, currency, name, descritpion, imageLogo, orderId, profileName, profileEmail, profileMobile, notes) {
            notes = $.parseJSON(notes);
            var options = {
                "key": key, // Enter the Key ID generated from the Dashboard
                "amount": amountInSubunits, // Amount is in currency subunits. Default currency is INR. Hence, 50000 refers to 50000 paise
                "currency": currency,
                "name": name,
                "description": descritpion,
                "image": imageLogo,
                "order_id": orderId, //This is a sample Order ID. Pass the `id` obtained in the response of Step 1
                "handler": function (response) {
                    window.location.href = "razorpay_callBack.aspx?orderId=" + response.razorpay_order_id + "&paymentId=" + response.razorpay_payment_id;
                    //alert(response.razorpay_payment_id);
                    //alert(response.razorpay_order_id);
                    //alert(response.razorpay_signature)
                },
                "prefill": {
                    "name": profileName,
                    "email": profileEmail,
                    "contact": profileMobile
                },
                "notes": notes,
                "theme": {
                    "color": "#F37254"
                }
            };
            var rzp1 = new Razorpay(options);
            rzp1.open();
            rzp1.on('payment.failed', function (response) {
                console.log(response.error);
                alert("Oops, something went wrong and payment failed. Please try again later");
            });
        }

    </script>
</asp:Content>
