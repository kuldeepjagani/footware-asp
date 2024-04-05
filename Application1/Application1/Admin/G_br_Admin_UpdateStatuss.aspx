<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/G_br_Admin.Master" AutoEventWireup="true" CodeBehind="G_br_Admin_UpdateStatuss.aspx.cs" Inherits="Application1.Admin.G_br_Admin_UpdateStatuss" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="navbar" align="center">
        <asp:Label ID="Label1" runat="server" Text="Update User Statuss" Font-Size="50px" Font-Bold="true" Font-Underline="true" ForeColor="Green"></asp:Label>
    </div>
    <div align="center" class="navbar" style="height:auto; width: 1510px" >
        <%--Display List Of Order--%>
        <div align="center">
            <asp:LinkButton ID="AllOrder" runat="server" OnClick="AllOrder_Click" ><h3>Show All Order Record</h3></asp:LinkButton>
            &nbsp;
        </div>

        <%--Date Selection--%>
        <b>Select Date:</b>
        <asp:TextBox ID="TextBox1" runat="server" TextMode="Date" Height="29px" Width="168px" ></asp:TextBox>
        &nbsp;
        <%--Button To Process the data--%>
        <asp:Button ID="Button1" runat="server" Text="Click" OnClick="Button1_Click" CssClass="button" Font-Bold="true" Height="39px" Width="72px"/>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <%--Order Id Selection--%>
        <b> Order_Id & Status:</b>
        <asp:TextBox ID="TextBox2" runat="server" Height="29px" Width="168px" placeholder="Enter Order_Id & Status"></asp:TextBox>
        &nbsp;
        <%--Button to fetch data--%>
        <asp:Button ID="Button3" runat="server" Height="38px" OnClick="Button3_Click" CssClass="button" Font-Bold="true" style="margin-left: 21px" Text="Click" Width="65px"/>
        <br />
        <br />
        <%--Display Order Details Based On Selected Data--%>
        <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#666666" BorderStyle="None" BorderWidth="12px" CellPadding="3" GridLines="Vertical" OnRowDataBound="GridView1_RowDataBound" Width="90%">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <Columns>
                <asp:TemplateField HeaderText="Prouduct Status">
                    <ItemTemplate>
                        <asp:RadioButton ID="RadioButton1" runat="server" Checked="true" GroupName="Pstatus" Text="Panding" />
                        &nbsp;<asp:RadioButton ID="RadioButton2" runat="server" GroupName="Pstatus" Text="Complite" />
                        <%--&nbsp;<asp:RadioButton ID="RadioButton3" runat="server" GroupName="Pstatus" Text="Delivery" />
                        &nbsp;<asp:RadioButton ID="RadioButton4" runat="server" GroupName="Pstatus" Text="Complite" />--%>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
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

            <%--Button To Update Order Status--%>
        <asp:Button ID="Button2" runat="server" Text="Update Status" OnClick="Button2_Click" CssClass="button" Font-Bold="true" Height="49px" Width="173px" />

        <br />
        <br />
    </div>
</asp:Content>
