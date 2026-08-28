<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignIn.aspx.cs" Inherits="FinalProject.WebForm3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        body {
            display: flex;
            align-items: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <p>
                Username:
                <asp:TextBox ID="UsernameText" runat="server"></asp:TextBox>
            </p>
            <p>
                Password:
                <input id="PasswordText" type="password" runat="server"/>
                <asp:Button ID="RandomPasswordButton" runat="server" OnClick="RandomPasswordButton_Click" Text="Generate Random Password" />
                <asp:Label ID="RandomPassword" runat="server" Text=""></asp:Label>
                
            </p>

            <p>
                Confirm Password:
                <input id="PasswordConfirmation" type="password" runat="server" />
                <asp:Label ID="PasswordFail" runat="server" Text="Passwords Do Not Match" Visible="False" ForeColor="Red"></asp:Label>
            </p>
            <p>
                Gender:
                <asp:DropDownList ID="GenderList" runat="server" style="width: 176px">
                    <asp:ListItem>Enter your Gender...</asp:ListItem>
                    <asp:ListItem>Male</asp:ListItem>
                    <asp:ListItem>Female</asp:ListItem>
                    <asp:ListItem>Other / Choose not to say</asp:ListItem>
                </asp:DropDownList>
            </p>
            <p>
                Age:
                <asp:TextBox ID="AgeText" runat="server" TextMode="Number"></asp:TextBox>
            </p>
            <p>
                Weight:
                <asp:TextBox ID="WeightText" runat="server" TextMode="Number"></asp:TextBox>
                <asp:DropDownList ID="WeightList" runat="server">
                    <asp:ListItem>KG</asp:ListItem>
                    <asp:ListItem>Lbs</asp:ListItem>
                </asp:DropDownList>
            </p>
            <p>
                Height:
                <asp:TextBox ID="HeightText" runat="server" TextMode="Number"></asp:TextBox>
                <asp:DropDownList ID="UnitList" runat="server">
                    <asp:ListItem>Centimeters</asp:ListItem>
                    <asp:ListItem>Inches</asp:ListItem>
                </asp:DropDownList>
            </p>
            <p>
                Activity Level:
                <asp:DropDownList ID="ActivityList" runat="server">
                    <asp:ListItem>No / Low Activity</asp:ListItem>
                    <asp:ListItem>Moderate Activity</asp:ListItem>
                    <asp:ListItem>High Activity</asp:ListItem>
                </asp:DropDownList>
            </p>
            <p>
                Goals:
                <asp:DropDownList ID="GoalsList" runat="server">
                    <asp:ListItem>Eat Healthier</asp:ListItem>
                    <asp:ListItem>Loose Weight</asp:ListItem>
                    <asp:ListItem>Gain Muscle</asp:ListItem>
                </asp:DropDownList>
            </p>
             <p>
                    <asp:Button ID="SignUpButton" runat="server" Text="Sign Up" OnClick="SignUpButton_Click"/>
             </p>
        </div>
    </form>
</body>
</html>
