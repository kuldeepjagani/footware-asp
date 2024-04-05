<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/G_br_Admin.Master" AutoEventWireup="true" CodeBehind="G_br_Admin_UpdateProducts.aspx.cs" Inherits="Application1.Admin.G_br_Admin_UpdateProducts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div align="center" class="navbar">
        <asp:Label ID="Label10" runat="server" Text="Update Product" Font-Size="50px" Font-Bold="true" Font-Underline="true" ForeColor="#ff0000"></asp:Label>
        <br />
        <br />

    </div>
    <br />
    <div align="center" class="navbar" style="height:auto; width:1510px">
        <br />
        <%--Sorting By Product Category--%>
        <asp:Label ID="Label9" runat="server" Text="Category " Font-Bold="true" Font-Size="X-Large"></asp:Label>
        <asp:DropDownList ID="DropDownList4" runat="server" AppendDataBoundItems="true" AutoPostBack="true" 
             Height="51px" Width="164px" OnSelectedIndexChanged="DropDownList4_SelectedIndexChanged" >
            <asp:ListItem>Select Category</asp:ListItem>
        </asp:DropDownList>
        
        <br />
        <br />
        <hr />
        <%--Gridview to Display Product--%>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" 
            onpageindexchanging="GridView1_PageIndexChanging" 
            onrowcancelingedit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting"
            onrowediting="GridView1_RowEditing" onrowupdating="GridView1_RowUpdating" 
            BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" DataKeyNames="Product_id"
             BorderWidth="1px" CellPadding="3" EmptyDataText="No Product Dispaly" Height="596px" style="margin-left: 0px" Width="90%">
            <Columns>
                <asp:TemplateField HeaderText="Product ID" >
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%#Eval("Product_id") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Name">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%#Eval("Product_name") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%#Eval("Product_name") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Description">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%#Eval("Pdesc") %>' TextMode="MultiLine"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%#Eval("Pdesc") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Image">
                    <EditItemTemplate>
                        <div>
                            <asp:Image ID="Image2" runat="server" Height="100px" Width="92px" ImageUrl='<%# Eval("Pimage") %>' />
                            <asp:Label ID="Label11" runat="server" Text='<%# Eval("Pimage") %>' Visible="false"></asp:Label>
                        </div>
                        <asp:FileUpload ID="FileUpload1" runat="server"/>
                        
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%#Eval("Pimage") %>' Height="100px" Width="92px" />
                        <asp:Label ID="Label12" runat="server" Text='<%# Eval("Pimage") %>' Visible="false"></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Price">
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%#Eval("Price") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Quantity">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%#Eval("quantity") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%#Eval("quantity") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Category">
                    <EditItemTemplate>
                        <%--DataSourceID="SqlDataSource1" DataTextField="CategoryName" DataValueField="CategoryName" SelectedValue='<%# Eval("Pcategory").ToString().Trim() %>'--%>
                        <asp:DropDownList ID="DropDownList1" runat="server" 
                         DataSourceID="SqlDataSource1" DataTextField="CategoryName" DataValueField="CategoryId" SelectedValue='<%# Eval("Category").ToString().Trim() %>' Height="200px" Width="150px" Font-Bold="true" >
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                            ConnectionString='<%$ ConnectionStrings:MB FootWareConnectionString %>' 
                            SelectCommand="SELECT * FROM [Category]">

                        </asp:SqlDataSource>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Eval("Category").ToString().Trim() %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>

                 <asp:TemplateField HeaderText="Persentage">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%#Eval("persentage") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label8" runat="server" Text='<%#Eval("persentage") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Original Price">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox6" runat="server" Text='<%#Eval("dumy_price") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label9" runat="server" Text='<%#Eval("dumy_price") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>

                <asp:CommandField HeaderText="Operation" ShowEditButton="true" ShowDeleteButton="true">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:CommandField>

            </Columns>
            
            <EmptyDataRowStyle Font-Bold="true" ForeColor="#CC0000" />
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="true" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="true" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>
    </div>
</asp:Content>
