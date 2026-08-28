<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LogIn.aspx.cs" Inherits="FinalProject.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:Login ID="Login1" runat="server" CreateUserUrl="~/SignIn.aspx" DestinationPageUrl="~/Profile.aspx" OnAuthenticate="Login1_Authenticate" CreateUserText="New User">
        </asp:Login>
    </form>
</body>
</html>
