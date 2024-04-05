<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/G_br_Admin.Master" AutoEventWireup="true" CodeBehind="G_br_Admin_UserSearch.aspx.cs" Inherits="Application1.Admin.G_br_Admin_UserSearch" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div align="center" class="navbar">
        
        <asp:Label ID="Label1" runat="server" ForeColor="#ffff00" Text="User Required Search" Font-Size="50px" Font-Bold="true" Font-Underline="true"></asp:Label>
    </div>
    <br />
    <div align="center" class="navbar" style="width: 1510px;">
       <br /> 
    <asp:GridView ID="GridView1" runat="server" CellPadding="4" Width="60%" AutoGenerateColumns="False" BackColor="White" BorderColor="#336666"
         BorderStyle="Double" BorderWidth="3px" EmptyDataText="No Requird User" OnRowDataBound="GridView1_RowDataBound" GridLines="Horizontal">
            <Columns>
                  <asp:TemplateField HeaderText="Delete" >
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkdelete" runat="server" OnClick="lnkdelete_Click">Delete</asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>  

                 <asp:BoundField DataField="User_Id" HeaderText="User_Id" ItemStyle-HorizontalAlign="Center" >
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                  </asp:BoundField>
                <asp:BoundField DataField="UserSearch" HeaderText="User Message" ItemStyle-HorizontalAlign="Center" >  
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                  </asp:BoundField>
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#333333" />
            <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
            <PagerStyle ForeColor="White" HorizontalAlign="Center" BackColor="#336666" />
            <RowStyle ForeColor="#333333" BackColor="White" />
            <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F7F7F7" />
            <SortedAscendingHeaderStyle BackColor="#487575" />
            <SortedDescendingCellStyle BackColor="#E5E5E5" />
            <SortedDescendingHeaderStyle BackColor="#275353" />
        </asp:GridView>
    </div>
</asp:Content>
