<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Recipe.aspx.cs" Inherits="FinalProject.WebForm5" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Recipe</title>
    <style type="text/css">
        :root {
            --green-dark: #1b5e33;
            --green: #2e7d47;
            --green-light: #eaf6ec;
            --green-border: #bfe3c9;
            --text-main: #222831;
            --text-muted: #4a4a4a;
            --max-width: 760px;
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
            flex-direction: column;
            min-height: 100vh;
        }

        /* Header */
        .header {
            background-color: var(--green-dark);
            padding: 20px 24px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .header h1 {
            margin: 0;
            color: #ffffff;
            font-size: 1.5rem;
            font-weight: 700;
        }

        .btn-return {
            background-color: transparent;
            color: #ffffff;
            border: 2px solid #ffffff;
            border-radius: 8px;
            padding: 8px 18px;
            font-size: 0.95rem;
            font-weight: 600;
            cursor: pointer;
            transition: background-color 0.15s ease, color 0.15s ease;
        }

        .btn-return:hover {
            background-color: #ffffff;
            color: var(--green-dark);
        }

        /* Main content */
        .content {
            flex: 1;
            width: 100%;
            max-width: var(--max-width);
            margin: 0 auto;
            padding: 36px 20px 60px;
        }

        .info-card {
            background-color: #ffffff;
            border: 1px solid var(--green-border);
            border-radius: 12px;
            padding: 24px 28px;
            margin-bottom: 24px;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.05);
        }

        .info-card h2 {
            margin-top: 0;
            font-size: 1.15rem;
            color: var(--green-dark);
        }

        .ingredients-list {
            background-color: var(--green-light);
            border: 1px solid var(--green-border);
            border-radius: 8px;
            padding: 14px 24px;
            margin: 12px 0;
            list-style-position: inside;
        }

        .ingredients-list li {
            padding: 4px 0;
        }

        .instructions-text {
            display: block;
            margin-top: 8px;
            color: var(--text-muted);
            white-space: pre-wrap;
        }

        .nutrition-row {
            display: flex;
            gap: 8px;
            align-items: baseline;
            margin-bottom: 10px;
        }

        .nutrition-row .label {
            font-weight: 600;
            color: var(--green-dark);
        }

        .nutrients-block {
            display: block;
            white-space: pre-wrap;
            background-color: var(--green-light);
            border: 1px solid var(--green-border);
            border-radius: 8px;
            padding: 14px 18px;
            font-family: Consolas, monospace;
            font-size: 0.9rem;
            color: var(--text-main);
            margin-top: 8px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="header">
                <h1><asp:Label ID="RecipeHeader" runat="server" Text="Label"></asp:Label></h1>
                <asp:Button ID="ReturnButton" runat="server" CssClass="btn-return" Text="Return" OnClick="ReturnButton_Click" />
            </div>
            <div class="content">

                <div class="info-card">
                    <h2>Recipe</h2>
                    <asp:BulletedList ID="RecipeList" runat="server" CssClass="ingredients-list">
                    </asp:BulletedList>
                    <asp:Label ID="InstructionsLabel" runat="server" Text="Label" CssClass="instructions-text"></asp:Label>
                </div>

                <div class="info-card">
                    <h2>Nutrition Information</h2>
                    <div class="nutrition-row">
                        <span class="label">Calories:</span>
                        <asp:Label ID="CalorieLabel" runat="server" Text="Label"></asp:Label>
                    </div>
                    <div>
                        <span class="label">Nutrients per 100g</span>
                        <asp:Label ID="NLabel" runat="server" Text="Label" CssClass="nutrients-block"></asp:Label>
                    </div>
                </div>

            </div>
        </div>
    </form>
</body>
</html>
