<%@ Page Title="" Language="C#" MasterPageFile="~/User/user_ms.Master" AutoEventWireup="true" CodeBehind="AddtoCart.aspx.cs" Inherits="Application1.User.AddtoCart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <style>
        
    </style>
    <div align="center" style=" margin: 0 auto;">
        <br />

        <%--Redirect you to default page--%>
        <asp:HyperLink ID="HyperLink1" runat="server" Font-Underline="true" Font-Bold="true" Font-Names="Colonna MT" Font-Size="X-Large"
           NavigateUrl="~/User/home.aspx">Continue Shopping</asp:HyperLink>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

        <%--Clear all product present in your cart--%>
        <asp:LinkButton ID="LinkButton1" runat="server" Font-Underline="true" Font-Size="Large" OnClick="LinkButton1_Click">Clear All Cart</asp:LinkButton>
        <br /><br />

        <%--Display prouduct present in your cart--%>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderWidth="1px"
            EmptyDataText="No Product Avilable in Shopping Cart" Font-Bold="True" Height="30%" ShowFooter="True" Width="80%" OnRowDeleting="GridView1_RowDeleting" BorderStyle="None" CellPadding="4" >
            <Columns>
                <asp:BoundField DataField="sno" HeaderText="Sr No" >
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>    

                <asp:BoundField DataField="pid" HeaderText="Product Id" Visible="true" >
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>   

                <asp:ImageField DataImageUrlField="pimage" HeaderText="Prouduct Image" ItemStyle-CssClass="data">
                    <ControlStyle Height="250px" Width="220px" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:ImageField>

                <asp:BoundField DataField="pname" HeaderText="Product Name" >
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                
                <asp:BoundField DataField="pdesc" HeaderText="Description" >
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField> 

                <asp:BoundField DataField="pprice" HeaderText="Price" >
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>

                <asp:BoundField DataField="pquantity" HeaderText="Quantity" >
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>

                <asp:BoundField DataField="ptotalprice" HeaderText="Total Price" >
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>

                <asp:TemplateField HeaderText="Select Size">
                    <ItemTemplate>
                        <asp:DropDownList ID="DropDownList1" Width="100%" CssClass="custom-select" runat="server">
                            <asp:ListItem>Select</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                            <asp:ListItem>6</asp:ListItem>
                            <asp:ListItem>7</asp:ListItem>
                            <asp:ListItem>8</asp:ListItem>
                            <asp:ListItem>9</asp:ListItem>
                        </asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>
                           
                <asp:CommandField DeleteText="Remove" ItemStyle-ForeColor="Blue" ShowDeleteButton="true" >
                    <ItemStyle ForeColor="Blue"></ItemStyle>
                </asp:CommandField>
            </Columns>
            
            <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
            <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
            <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
            <RowStyle BackColor="White" ForeColor="#003399" />
            <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
            <SortedAscendingCellStyle BackColor="#EDF6F6" />
            <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
            <SortedDescendingCellStyle BackColor="#D6DFDF" />
            <SortedDescendingHeaderStyle BackColor="#002876" />
            
        </asp:GridView>

        <br />
        <%--Button to online order which redirects you to Payment Page--%>
        <asp:Button CssClass="btn btn-outline-success" ID="Button1" runat="server" Text="Order Now" Width="150px" onclick="Button1_Click"  />

        <%--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;


        <asp:Button CssClass="Ofline Order" ID="Button2" runat="server" Text="Ofline Order" BackColor="#FF6699" BorderColor="#0A2C2A"
            BorderStyle="Ridge" Font-Bold="true" Font-Size="Large" Height="46px" Width="135px" onclick="Button2_Click"  />--%>
            &nbsp;</div>
    <br />
</asp:Content>