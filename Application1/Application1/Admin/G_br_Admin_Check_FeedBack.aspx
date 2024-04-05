<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/G_br_Admin.Master" AutoEventWireup="true" CodeBehind="G_br_Admin_Check_FeedBack.aspx.cs" Inherits="Application1.Admin.G_br_Admin_Check_FeedBack" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        .mt{
            margin-bottom:20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="navbar" align="center">
         <asp:Label ID="Label1" runat="server" Text="Check User FeedBack" Font-Size="50px" ForeColor="Green" Font-Underline="true" Font-Bold="true"></asp:Label>
    </div>
    <br />
    <div class="navbar" align="center">
       <table>
            <%--Delete All FeedBack--%>
            <tr>
                <td align="center">
                    <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click"><b>Delete All Chart</b></asp:LinkButton>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </td>
        
            <%--Update User FeedBack--%>
                <td align="center">
                    <asp:TextBox ID="TextBox1" runat="server" placeholder="Enter FeedBack Id" Height="28px"></asp:TextBox>
                    &nbsp;<asp:Button ID="Button1" runat="server" Text="Click" OnClick="Button1_Click" CssClass="button" Font-Bold="true" Height="34px" Width="72px"/>
                </td>
            </tr>
       </table>
    </div>
   
    <div align="center" class="navbar" style="width: 1510px; height:100%;">
        <br />
      <table>
        
        <%--Show Data In the Gridview--%>
                <asp:GridView ID="GridView1" runat="server" CssClass="" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" Height="100%"
                    BorderWidth="1px" CellPadding="3" Width="1000px" AutoGenerateColumns="False" OnRowDataBound="GridView1_RowDataBound" SelectedIndex="1">
            <Columns>
                <asp:TemplateField HeaderText="Delete" >
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkdelete" runat="server" OnClick="lnkdelete_Click">Delete</asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                  <asp:BoundField DataField="id" HeaderText="User_Id" ItemStyle-HorizontalAlign="Center" />
                <asp:BoundField DataField="Email" HeaderText="Email" ItemStyle-HorizontalAlign="Center" />
                <asp:BoundField DataField="FeedBack" HeaderText="User Message" ItemStyle-HorizontalAlign="Center" />
            </Columns>
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                    <RowStyle ForeColor="#000066" />
                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#007DBB" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#00547E" />
                    
        </asp:GridView>
          
     </table>
        
   </div> 
</asp:Content>
