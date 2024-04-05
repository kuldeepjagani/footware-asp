<%@ Page Title="" Language="C#" MasterPageFile="~/User/user_ms.Master" AutoEventWireup="true" CodeBehind="Complite.aspx.cs" Inherits="Application1.User.Complite" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="text-center font-weight-bold">
        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-outline-info mt-3" OnClick="LinkButton1_Click">Check Complite Order</asp:LinkButton>
    </div>
    <br />
        <div align="center">
            <asp:GridView ID="GridView1" align="center" AutoGenerateColumns="false" runat="server" BackColor="black" ForeColor="White" BorderColor="#666666" BorderStyle="None" BorderWidth="12px" 
                CellPadding="3" GridLines="Vertical" Width="72%" EmptyDataText="You Have Not Purchas the Product" Height="215px" Font-Bold="true" style="margin-top: 0px">
                <AlternatingRowStyle BackColor="#DCDCDC" />
                <Columns>
                   

                     <asp:BoundField DataField="orderid" HeaderText="Order Id" ItemStyle-HorizontalAlign="Left" >
                        <ItemStyle HorizontalAlign="Left"></ItemStyle>
                      </asp:BoundField>

                    <asp:BoundField DataField="productname" HeaderText="Product Name" ItemStyle-HorizontalAlign="Left" >
                        <ItemStyle HorizontalAlign="Left"></ItemStyle>
                      </asp:BoundField>

                    <asp:BoundField DataField="price" HeaderText="Product Price" ItemStyle-HorizontalAlign="Center" >  
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:BoundField>

                    <asp:BoundField DataField="quantity" HeaderText="Quantity" ItemStyle-HorizontalAlign="Center" >  
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:BoundField>

                    <asp:BoundField DataField="orderdate" HeaderText="Order Date" SortExpression="orderdate">

                    </asp:BoundField>

                    <asp:BoundField DataField="status" HeaderText="Status" ItemStyle-HorizontalAlign="Center" >  
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:BoundField>
           
 
                </Columns>
                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                <HeaderStyle BackColor="#000084" Font-Bold="true" ForeColor="White" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                <SelectedRowStyle BackColor="#008A8C" Font-Bold="true" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#0000A9" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#000065" />
            </asp:GridView>
        
            <br />
            <asp:Button ID="Button1" runat="server" Width="150px" CssClass="btn btn-outline-dark mb-3" Text="Back" Visible="false" PostBackUrl="~/User/Complite.aspx" />
        </div>
</asp:Content>
