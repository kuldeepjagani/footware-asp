<%@ Page Title="" Language="C#" MasterPageFile="~/User/user_ms.Master" AutoEventWireup="true" CodeBehind="search.aspx.cs" Inherits="Application1.User.search" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        .img{
            transition:transform .2s;
        }
        .img:hover{
            transform:scale(0.9);
        }
       
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="col-md-10" style="width: 100%; margin: 0 auto; padding: 10px;">
        <asp:DataList ID="dlProductList" runat="server" RepeatColumns="4" DataSourceID="SqlDataSource1" OnItemCommand="DataList1_ItemCommand">
            <HeaderTemplate>
            </HeaderTemplate>
            <ItemTemplate>
                <div class="row img" style="width: 100%; margin: 0 auto; border: 1px solid #eeeeee; border-radius: 10px;">
                    <div class="col-sm-6 col-md-12">
                        <div class="col-md-12">
                            <div class="thumbnail">
                                <div>
                                    <asp:ImageButton ID="ImageButton1" runat="server" CssClass="mt-2 rounded" ImageUrl='<%# Eval("Pimage") %>' Height="180px" Width="250px" CommandArgument='<%# Eval("Product_id") %>' CommandName="View" />
                                </div>
                                <div>
                                    <h6>
                                        <span>
                                            <%#Eval("Product_name") %>
                                        </span>
                                    </h6>
                                </div>
                                <div align="center" class="custom-control-inline col">
                                        <h6 class="ml-5"><span class="custom-control-inline">₹ <%#Eval("Price") %> &nbsp;&nbsp;MRP: &nbsp;<del> <%#Eval("dumy_price") %></del></span></h6>
                                </div>

                                <br />
                                <div>
                                
                                    <asp:Label ID="Label7" runat="server" Text='<%#Eval("Product_id") %>' Visible="false"></asp:Label>
                                    
                                    <asp:Button ID="Button1" runat="server" Text="Add to Cart...." class=" col btn btn-primary" CommandName="Addtocart" CommandArgument='<%#Eval("Product_id") %>'  />
                                </div>

                            </div>
                            <br />
                        </div>
                    </div>
                </div>
                </div>
            </ItemTemplate>

        </asp:DataList>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MB FootWareConnectionString %>" SelectCommand="SELECT [Product_id], [Pimage], [Product_name], [Price], [dumy_price] FROM [Product]">
        
    </asp:SqlDataSource>
   
</asp:Content>
