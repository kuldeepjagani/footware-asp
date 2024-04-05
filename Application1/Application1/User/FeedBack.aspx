<%@ Page Title="" Language="C#" MasterPageFile="~/User/user_ms.Master" AutoEventWireup="true" CodeBehind="FeedBack.aspx.cs" Inherits="Application1.User.FeedBack" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div align="center">
        <table style="width:415px; border-radius:10px; height:347px; background-color:bisque; margin-top: 48px;" border="2" align="center">
            
            <tr>
                <td align="center" style="border-top-left-radius:5px;" class="auto-style3" >
                    <b>Email_ID:-</b>
                </td>
                <td style="vertical-align:top; border-top-right-radius:5px;" class="auto-style2" align="center">
                    <asp:TextBox ID="TextBox1" CssClass="text form-control" runat="server" Height="55px" Width="252px" placeholder="Enter Your Email" Font-Size="Large" TextMode="Email" Font-Bold="true" TabIndex="2" style="margin-top: 51px"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox1" 
                        ErrorMessage="Emali_ID Is Empty" ForeColor="Red"></asp:RequiredFieldValidator>

                </td>
            </tr>
            <tr>

               <td colspan="2">
                   <asp:RadioButton ID="RadioButton1" GroupName="g1" CssClass="custom-radio" Checked="true" Font-Bold="true" runat="server" Text="Product is not addting my Cart" Font-Size="Large" />
               </td>

            </tr>

            <tr>
                <td colspan="2">
                    <asp:RadioButton ID="RadioButton2" GroupName="g1" runat="server" Font-Bold="true" Text="View Details Page Problem" Font-Size="Large" />
                </td>
           </tr>
            <tr>
                
                <td colspan="2">
                    <asp:RadioButton ID="RadioButton3" GroupName="g1" runat="server" Font-Bold="true" Text="Not Show My Order Details" Font-Size="Large" />
                </td>
            </tr>
            <tr>
                <td colspan="2" style="border-bottom-left-radius:5px; border-bottom-right-radius:5px;">
                    <asp:RadioButton ID="RadioButton4" GroupName="g1" runat="server" Font-Bold="true" Text="Payment Page Problem" Font-Size="Large" />
                </td>
            </tr>
        </table>
        <br />

        <asp:Button ID="Button1" CssClass="btn" runat="server" Text="Submite"  Font-Bold="True" Font-Italic="True" Font-Size="Larger" Height="39px" Width="175px" BackColor="#FF9900" BorderColor="#66FF99" BorderStyle="Dotted" OnClick="Button1_Click"></asp:Button>
        
    </div>
    <br />
</asp:Content>
