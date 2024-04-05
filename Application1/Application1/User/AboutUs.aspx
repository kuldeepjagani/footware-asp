<%@ Page Title="" Language="C#" MasterPageFile="~/User/user_ms.Master" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="Application1.User.AboutUs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="mt-3 mb-5">
        <h2 align="center" style="text-decoration: underline overline; color: blue">About Us</h2>
        <table border="0" style="height: 147px; width: 58%; margin-left: 286px">
            <tr>
            <td align="justify">
            <font color="navy" size="+2">MB Footware online Shopping center was founded in <%=DateTime.Now.Year.ToString() %> by<u> Bimal Bera & Moulik</u> hometown
            of Rajkot and Bimal Bera hometown is Kolkata, India. when a friend suggested opning an online shopping
            center -then a rarity-he aggreed that the idea could prove successsful, and he started a business.We our 
            online shopping center speciality guaranteed product. online shopping is the process whereby consumers directly buy goods
                or services from a seller in real-time,without an intermediary service,over the internet.it is a form of the 
                commerce.This project is an attempt to provide the advantages of online shopping to customers of a real shop.Thus
                the customer will get the service of online shopping and home delivery from his favorite shop.
                
            </font>
        </td>
            </tr>
        </table>
    </div>
</asp:Content>
