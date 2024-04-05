<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/G_br_Admin.Master" AutoEventWireup="true" CodeBehind="G_br_Admin_UserReg.aspx.cs" Inherits="Application1.Admin.G_br_Admin_UserReg" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="navbar" align="center">
        
        <asp:Label ID="Label1" runat="server" Text="User Register Details" Font-Size="50px" Font-Bold="true" Font-Underline="true" ForeColor="#ff0066"></asp:Label>
    </div>
    <br />
    <div align="center" class="navbar" style="width: 1510px">
        <br />
        <table align="center" class="navbar" style="width: 100%">
        <asp:GridView ID="GridView1" runat="server" CellPadding="4" Width="60%"  AutoGenerateColumns="False" EmptyDataText="No Requird User" OnRowDataBound="GridView1_RowDataBound" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                  <asp:TemplateField HeaderText="Delete" >
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkdelete" runat="server" OnClick="lnkdelete_Click">Delete</asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>  

                 <asp:BoundField DataField="Id" HeaderText="User_Id" ItemStyle-HorizontalAlign="Center" ></asp:BoundField>

                <asp:BoundField DataField="Name" HeaderText="Name" ItemStyle-HorizontalAlign="Center" ></asp:BoundField>

                <asp:BoundField DataField="Email_id" HeaderText="Email" ItemStyle-HorizontalAlign="Center" ></asp:BoundField>
                    
                <asp:BoundField DataField="Gender" HeaderText="Gender" ItemStyle-HorizontalAlign="Center" ></asp:BoundField>  

                <asp:BoundField DataField="Phone_no" HeaderText="Phone_No" ItemStyle-HorizontalAlign="Center" ></asp:BoundField>
                
                <asp:BoundField DataField="Password" HeaderText="Password" ItemStyle-HorizontalAlign="Center" ></asp:BoundField>

            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle ForeColor="White" HorizontalAlign="Center" BackColor="#2461BF" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
        </table>
        
    </div>
</asp:Content>
