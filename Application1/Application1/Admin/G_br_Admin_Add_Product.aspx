<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/G_br_Admin.Master" AutoEventWireup="true" CodeBehind="G_br_Admin_Add_Product.aspx.cs" Inherits="Application1.Admin.G_br_Admin_Add_Product" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="navbar" style="border-width: 3px; border-color: #333333; height: auto; width: 1510px"  >
        <table style=" height: 390px; background-color: darkkhaki" align="center">
            <%--Header Text--%>
            <tr>
                <td align="center" width="50%" colspan="2">
                    <h1>
                        Adding Product
                    </h1>
                    <hr />
                </td>
            </tr>

            <%--Category DropDownList with Required Field Validation--%>
            <tr>
                <td align="center" width="50%" >
                    <h3>Category:</h3>
                </td>
                 <%--DataSourceID="SqlDataSource1" DataTextField="CategoryName" DataValueField="CategoryId"--%>
                <td width="50%">
                    <asp:DropDownList ID="DropDownList1" runat="server" AppendDataBoundItems="true"
                        Height="33px" Width="50%" >
                        <asp:ListItem>Select</asp:ListItem>
                    </asp:DropDownList>
                    
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DropDownList1" Display="Dynamic"
                             ErrorMessage="Catagory Is Mandatory" ForeColor="Red" InitialValue="Select">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <%--Sub-category DropDownlist with Required fild Validation--
            <tr>
                <td>
                    <h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Sub Category:</h3>
                </td>
                 <%--DataSourceID="SqlDataSource2" DataTextField="Sub_Category_name" DataValueField="Sub_CategoryId"
                <td width="50%">
                    <asp:DropDownList ID="DropDownList2" runat="server" AppendDataBoundItems="true" 
                         Height="33px" Width="50%">
                        <asp:ListItem>Select</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>--%>
            <%--Prouduct Name with Required Field Validation--%>
            <tr>
                <td align="center" width="50%" >
                    <h3>Prouduct Name:</h3>
                </td>
                <td width="50%">
                    <asp:TextBox ID="txtName" runat="server"></asp:TextBox>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtName" Display="Dynamic"
                         ErrorMessage="Product Name is Madnatory" ForeColor="Red">*</asp:RequiredFieldValidator>
                </td>
            </tr>

            <%--Prouduct Desc with Required Field Validation--%>
           <tr>
             <td align="center" width="50%" >
                    <h3>Prouduct Desc:</h3>
                </td>
                <td width="50%">
                    <asp:TextBox ID="txtDesc" runat="server" TextMode="MultiLine"></asp:TextBox>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtDesc" Display="Dynamic" 
                        ErrorMessage="Product Desc is Madnatory" ForeColor="Red">*</asp:RequiredFieldValidator>
                </td>
            </tr>
           
            <%--Product Image upload with Required Field validator--%>
            <tr>
             <td align="center" width="50%" >
                    <h3>Prouduct Image:</h3>
                </td>
                <td width="50%">
                    <asp:FileUpload ID="imageUpload" runat="server" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="imageUpload" Display="Dynamic"
                         ErrorMessage="Product image is Madnatory" ForeColor="Red">*</asp:RequiredFieldValidator>
                </td>
            </tr>

            <%--Product Price With Required Feild Validation--%>
            <tr>
                <td align="center" width="50%">
                    <h3>
                        Original Price:
                    </h3>
                </td>
                <td width="50%">
                    <asp:TextBox ID="txtPrice" runat="server"></asp:TextBox>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtPrice" Display="Dynamic"
                         ErrorMessage="Price Is Madnator" ForeColor="Red">*</asp:RequiredFieldValidator>

                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtPrice" Display="Dynamic" 
                        ErrorMessage="Price is invalid" ForeColor="Red" ValidationExpression="[0-9]*">*</asp:RegularExpressionValidator>
                </td>
            </tr>

             <%--Product Quantity With Required Feild & Regular Expression Validation--%>
            <tr>
                <td align="center" width="50%">
                    <h3>
                        Product Quantity:-
                    </h3>
                </td>
                <td width="50%">
                    <asp:TextBox ID="txtQuantity" runat="server"></asp:TextBox>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtQuantity" Display="Dynamic"
                         ErrorMessage="Quantity Is Madnator" ForeColor="Red">*</asp:RequiredFieldValidator>

                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtQuantity" Display="Dynamic"
                         ErrorMessage="Quantity Is Invalid" ForeColor="Red" ValidationExpression="[0-9]*">*</asp:RegularExpressionValidator>
                </td>
            </tr>
            <%--Product Quantity With Required Feild & Regular Expression Validation--%>
            <tr>
                <td align="center" width="50%">
                    <h3>
                        Discount:
                    </h3>
                </td>
                <td width="50%">
                    <asp:TextBox ID="txtwait" runat="server"></asp:TextBox>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtwait" Display="Dynamic"
                         ErrorMessage="Waite Is Madnator" ForeColor="Red">*</asp:RequiredFieldValidator>

                </td>
            </tr>

            <%--Button To Add Prouduct Details--%>
            <tr>
                <td align="center" width="50%" colspan="2">
                    <asp:Button ID="btnSubmit" runat="server" Text="Add Product" Font-Bold="True" ForeColor="Black" Height="36px" Width="50%" OnClick="btnSubmit_Click" BackColor="Fuchsia" Font-Italic="True" />
                </td>
            </tr>

            <%--Lable To Display Message Product added or not--%>
            <tr>
                <td align="center" width="50%" colspan="2">
                    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                </td>
            </tr>

            <%--Validation Summary to Display of Product--%>
            <tr>
                <td colspan="2" align="center">
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" HeaderText="Fix the Following Error" />
                </td>
            </tr>
        </table>
    </div>
    <%--DataSource to Populate DropDownList TO Prouduct--%>
    <div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:MB FootWareConnectionString %>" 
            SelectCommand="SELECT * FROM [Category]"></asp:SqlDataSource>
    </div>
</asp:Content>
