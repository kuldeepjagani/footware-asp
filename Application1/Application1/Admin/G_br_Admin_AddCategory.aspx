<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/G_br_Admin.Master" AutoEventWireup="true" CodeBehind="G_br_Admin_AddCategory.aspx.cs" Inherits="Application1.Admin.G_br_Admin_AddCategory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            width: 202px;
        }
        .auto-style3 {
            height: 141px;
        }
        .button {
            border-radius: 20px;
        }
        .auto-style4 {
            width: 74px;
        }
    </style>
    
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
        <div class="navbar" style="border-width: 3px; border-color: #333333; height: 100%; width:100%">
            <table align="center" style="width: 650px; height: 390px; border: 3px solid blue; ">

                <%--Header Text--%>
                <tr colspan="2" align="center">
                    <br />
                    <h2>ADD CATEGORY</h2>
                    <br />
                </tr>

                <%--Category With Required Field Validation--%>
                <tr class="">
                    <td align="center" width="50%" >
                        <h3>&nbsp;&nbsp; Category Name </h3>
                    </td>
                    <td class="auto-style2">
                        <asp:TextBox ID="TextBox1" runat="server" CssClass="" Height="31px" Width="200px" CausesValidation="True" placeholder="Category Name"
                            BorderColor="#333333" BorderWidth="2px" Font-Bold="True" Font-Size="Medium" ForeColor="Black" BackColor="Transparent" style="margin-top: 13px"></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" Forecolor="Red" ErrorMessage="Enter Category Name">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
           
                <%--Button To Add Category--%>
                <tr>
                    <td colspan="2" align="center">
                        <asp:Button ID="Button1" runat="server" CssClass="button" Text="Add Catagory" Height="44px" Width="150px" Font-Bold="True" 
                            Font-Size="Medium" BackColor="Aqua" BorderColor="#333333" BorderWidth="2px" OnClick="Button1_Click" ></asp:Button>
                    </td>
                </tr>
                <%--Validation Summarry--%>
                <tr>
                    <td colspan="2"><br /></td>
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowSummary="false" ShowMessageBox="true"></asp:ValidationSummary>
                </tr>

                <%--Gridview to Display Category as Well as Can Edit And Delete--%>
                <tr>
                    <td colspan="2" align="center" class="auto-style3">
                        <asp:GridView CssClass="button" ID="GridView1" runat="server" AllowPaging="true" AutoGenerateColumns="false"
                            PageSize="4" Width="100%" DataKeyNames="CategoryId" BackColor="#CCFFFF"
                            onpageindexchanging="GridView1_PageIndexChanging" OnRowCancelingEdit="GridView1_RowCancelingEdit" 
                            OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" 
                            EmptyDataText="No Record To Display" BorderColor="#333333" BorderWidth="2px" Font-Bold="true" >

                            <Columns>
                                <asp:TemplateField HeaderText="Category_Id">
                                    <ItemTemplate>
          
                                        <asp:Label ID="Label2" runat="server" Text='<%#Eval("CategoryId") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Category">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Eval("CategoryName") %>' Font-Bold="true"></asp:TextBox>
                                    </EditItemTemplate>
             
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("CategoryName") %>' ></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                 </asp:TemplateField>
                   
                                <asp:CommandField CausesValidation="false" headertext="Operation" ShowDeleteButton="true" ShowEditButton="true"  >
                                    
                                    <ItemStyle HorizontalAlign="Center" ForeColor="blue" />
                                    
                                </asp:CommandField>
                            </Columns>
                            <HeaderStyle BorderColor="#333333" BorderWidth="3px" Font-Size="Large" />
                        </asp:GridView>
                    </td>
                </tr>
                
            </table>
            <br /> <br />
        </div>
    </center>
</asp:Content>
