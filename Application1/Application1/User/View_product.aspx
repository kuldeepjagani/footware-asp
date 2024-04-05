<%@ Page Title="" Language="C#" MasterPageFile="~/User/user_ms.Master" AutoEventWireup="true" CodeBehind="View_product.aspx.cs" Inherits="Application1.User.View_product" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 646px;
        }
        #box{
            border-block:groove
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mb-3">
        <div class="row mt-5">
            <asp:DataList ID="DataList1" runat="server" DataKeyField="Product_id" DataSourceID="SqlDataSource1" OnItemCommand="DataList1_ItemCommand">
                <ItemTemplate>
                    <div class="">
                <table width="100%">
                    <tr>
                        <td>
                            <asp:Image ID="Image1" runat="server" Width="550px" Height="550px" ImageUrl='<%# Eval("Pimage")%>' />

                        </td>
                        <td class="col-6 mb-4">
                               <div align="center">
                                    <h5>
                                        <span>
                                            <%#Eval("Product_name") %>
                                        </span>
                                    </h5>
                                </div>
                            
                            <div align="center" class="custom-control-inline col">
                                        <h6 class="ml-5"><span class="custom-control-inline">₹ <%#Eval("Price") %> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MRP: &nbsp;<del> <%#Eval("dumy_price") %></del></span></h6>
                            </div>
                            
                                 <asp:Label ID="Label4" runat="server" Text="Select Size :"></asp:Label><br /><br />
                                <div class="box" align="center">

                                    <asp:DropDownList CssClass="dropdown dropdown-item bg-light" ID="DropDownList1" runat="server">
                                        <asp:listitem>Select Size</asp:listitem>
                                        <asp:listitem>5</asp:listitem>
                                        <asp:listitem>6</asp:listitem>
                                        <asp:listitem>7</asp:listitem>
                                        <asp:listitem>8</asp:listitem>
                                        <asp:listitem>9</asp:listitem>
                                    </asp:DropDownList>

                                    <br />
                                    <br />
                                </div>
                                
                          

                            <asp:Button ID="Button1" runat="server" Text="Add To Cart" Width="100%" CssClass="btn btn-outline-primary text-dark font-weight-bold"  CommandArgument='<%# Eval("Product_id") %>' CommandName="AddToCart" /><br />
                            <br />
                            <!--<asp:Button ID="Button2" runat="server" Text="Buy it Now" Width="100%" CssClass="btn btn-primary" />-->

                        </td>
                    </tr>
                </table>
            </div>

                </ItemTemplate>
            </asp:DataList>
        </div>
    </div>
    <br />
    <br />
    <br />
    <%--Sql Data Source--%>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MB FootWareConnectionString %>" 
                SelectCommand="SELECT [Price], [Pimage], [Pdesc], [Product_name], [dumy_price], [Product_id] FROM [Product] WHERE ([Product_id] = @Product_id)">
                
                <SelectParameters>
                    <asp:QueryStringParameter Name="Product_id" QueryStringField="id" Type="Int32" />
                </SelectParameters>
        </asp:SqlDataSource>
   
</asp:Content>
