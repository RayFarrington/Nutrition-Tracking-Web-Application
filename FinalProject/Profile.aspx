<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="FinalProject.WebForm4" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Profile</title>
    <style type="text/css">
        :root {
            --green-dark: #1b5e33;
            --green: #2e7d47;
            --green-light: #eaf6ec;
            --green-border: #bfe3c9;
            --text-main: #222831;
            --text-muted: #4a4a4a;
        }

        * {
            box-sizing: border-box;
        }

        body {
            font-family: -apple-system, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f7f9f7;
            color: var(--text-main);
            line-height: 1.6;
        }

        .container {
            display: flex;
            min-height: 100vh;
            flex-wrap: wrap;
        }

        /* Left sidebar */
        .left {
            width: 300px;
            flex-shrink: 0;
            padding: 24px;
            background-color: var(--green-dark);
            color: #ffffff;
        }

        .left h1 {
            font-size: 1.4rem;
            margin: 20px 0 18px;
            color: #ffffff;
        }

        .btn-return {
            background-color: transparent;
            color: #ffffff;
            border: 2px solid #ffffff;
            border-radius: 8px;
            padding: 8px 18px;
            font-size: 0.9rem;
            font-weight: 600;
            cursor: pointer;
            transition: background-color 0.15s ease, color 0.15s ease;
        }

        .btn-return:hover {
            background-color: #ffffff;
            color: var(--green-dark);
        }

        .profile-field {
            margin-bottom: 12px;
            padding-bottom: 12px;
            border-bottom: 1px solid rgba(255, 255, 255, 0.25);
        }

        .profile-field:last-child {
            border-bottom: none;
        }

        .profile-field .asp-label,
        .profile-field span {
            color: var(--green-light);
            font-size: 0.95rem;
        }

        /* Right content */
        .right {
            flex: 1;
            min-width: 280px;
            padding: 32px;
            background-color: #f7f9f7;
        }

        .recipe-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 16px;
            margin-bottom: 24px;
            padding-bottom: 16px;
            border-bottom: 2px solid var(--green-border);
        }

        .recipe-header h1 {
            margin: 0;
            font-size: 1.5rem;
            color: var(--green-dark);
        }

        .btn-primary {
            background-color: var(--green);
            color: #ffffff;
            border: 2px solid var(--green);
            border-radius: 8px;
            padding: 9px 20px;
            font-weight: 600;
            cursor: pointer;
            transition: background-color 0.15s ease;
        }

        .btn-primary:hover {
            background-color: var(--green-dark);
            border-color: var(--green-dark);
        }

        .recipe-body {
            height: 100%;
        }

        .recipe-panel {
            display: block;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="left">
                <asp:Button ID="ReturnButton" runat="server" CssClass="btn-return" Text="Return" OnClick="ReturnButton_Click" />
                <h1>User Profile</h1>

                <div class="profile-field">
                    <asp:Label ID="Username" runat="server" Text="Label"></asp:Label>
                </div>
                <div class="profile-field">
                    <asp:Label ID="Gender" runat="server" Text="Label"></asp:Label>
                </div>
                <div class="profile-field">
                    <asp:Label ID="Age" runat="server" Text="Label"></asp:Label>
                </div>
                <div class="profile-field">
                    <asp:Label ID="Weight" runat="server" Text="Label"></asp:Label>
                </div>
                <div class="profile-field">
                    <asp:Label ID="Height" runat="server" Text="Label"></asp:Label>
                </div>
                <div class="profile-field">
                    <asp:Label ID="ActivityLevel" runat="server" Text="Label"></asp:Label>
                </div>
                <div class="profile-field">
                    <asp:Label ID="Goals" runat="server" Text="Label"></asp:Label>
                </div>
            </div>
            <div class="right">
                <div class="recipe-body">
                    <div class="recipe-header">
                        <h1>Your Recipes</h1>
                        <asp:Button ID="CreateButton" runat="server" CssClass="btn-primary" Text="Create A New Recipe" OnClick="CreateButton_Click" />
                    </div>
                    <asp:Panel ID="RecipePanel" runat="server" CssClass="recipe-panel">
                    </asp:Panel>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
