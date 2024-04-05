<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="razorpay_callBack.aspx.cs" Inherits="Application1.User.razorpay_callBack" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1 runat="server" id="h1Message"></h1>
            <p runat="server" id="pTxnId"></p>
            <p runat="server" id="pOrderId"></p>

            <p>Click here to go to home</p>

            <p><a href="home.aspx">Home</a></p>
        </div>
    </form>
</body>
</html>
