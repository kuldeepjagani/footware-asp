<%@ Page Title="" Language="C#" MasterPageFile="~/User/user_ms.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="Application1.User.home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .img{
            transition:transform .2s;
        }
        .img:hover{
            transform:scale(0.9);
        }
        .kk{
            background-color: #bcfae5;
        }
       #a {
          box-shadow: inset 0 -3px 0 -1px #FFF986;
          color: black;
          line-height: 40px;
        }

        img:hover {
          transition-duration:15s;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="aa" class="col-md-10" style="width: 100%; margin: 0 auto; padding: 10px;">
        <asp:DataList ID="dlProductList" runat="server" RepeatDirection="Horizontal" RepeatColumns="4" DataSourceID="SqlDataSource1" OnItemCommand="DataList1_ItemCommand">
            <HeaderTemplate>
            </HeaderTemplate>
            <ItemTemplate>
                <div class="">
                    <div class="row" style="width: 100%; margin: 0 auto; border: 1px solid #eeeeee; border-radius: 10px;">
                            <div class="col-sm-6 col-md-12">
                                <div class="col-md-12 img">
                                        <div class="thumbnail">
                                            <div class="">
                                                <div>
                                                    <asp:ImageButton ID="ImageButton1" runat="server" CssClass="mt-2 rounded" ImageUrl='<%# Eval("Pimage") %>' Height="250px" Width="250px" CommandArgument='<%# Eval("Product_id") %>' CommandName="View" />
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

                                                <asp:Button ID="Button1" runat="server" Text="Add to Cart" class=" col btn btn-outline-primary" CommandName="Addtocart" CommandArgument='<%#Eval("Product_id") %>' />
                                            </div>
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
      
        
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MB FootWareConnectionString %>" SelectCommand="SELECT [Product_id], [Pimage], [Product_name], [Price], [dumy_price] FROM [Product] order by(dumy_price - Price) desc"></asp:SqlDataSource>
   
</asp:Content>