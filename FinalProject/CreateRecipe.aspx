<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateRecipe.aspx.cs" Inherits="FinalProject.WebForm6" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Create Recipe</title>
    <style type="text/css">
        :root {
            --green-dark: #1b5e33;
            --green: #2e7d47;
            --green-light: #eaf6ec;
            --green-border: #bfe3c9;
            --text-main: #222831;
            --text-muted: #4a4a4a;
            --max-width: 700px;
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

        .header .aspNetDisabled,
        .header a,
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

        .form-card {
            background-color: #ffffff;
            border: 1px solid var(--green-border);
            border-radius: 12px;
            padding: 28px 32px;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.05);
        }

        .field-group {
            margin-bottom: 22px;
        }

        .field-label {
            display: block;
            font-weight: 600;
            color: var(--green-dark);
            margin-bottom: 6px;
            font-size: 0.95rem;
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

        .btn-secondary {
            background-color: #ffffff;
            color: var(--green-dark);
            border: 2px solid var(--green);
            border-radius: 8px;
            font-weight: 600;
            cursor: pointer;
            transition: background-color 0.15s ease;
        }

        .btn-secondary:hover {
            background-color: var(--green-light);
        }

        .txt-input {
            border: 1px solid #cfd8d2;
            border-radius: 6px;
            padding: 8px 10px;
            font-size: 0.95rem;
            width: 100%;
        }

        .txt-input:focus {
            outline: none;
            border-color: var(--green);
            box-shadow: 0 0 0 2px var(--green-light);
        }

        /* Ingredient row */
        .ingredient-row {
            display: flex;
            gap: 12px;
            align-items: flex-end;
            flex-wrap: wrap;
        }

        .ingredient-row .field-group {
            margin-bottom: 0;
        }

        .ingredient-row .amount-field {
            width: 110px;
        }

        .ingredient-row .amount-field input {
            width: 100%;
        }

        .ingredient-actions {
            display: flex;
            gap: 8px;
        }

        .ingredients-list {
            background-color: var(--green-light);
            border: 1px solid var(--green-border);
            border-radius: 8px;
            padding: 12px 20px;
            margin: 18px 0;
            list-style-position: inside;
        }

        .ingredients-list li {
            padding: 4px 0;
            color: var(--text-main);
        }

        .create-action {
            display: flex;
            justify-content: flex-end;
            margin-top: 24px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="header">
                <h1><asp:Label ID="RecipeHeader" runat="server" Text="Create Your Own Recipe"></asp:Label></h1>
                <asp:Button ID="ReturnButton" runat="server" CssClass="btn-return" Text="Return" OnClick="ReturnButton_Click" />
            </div>
            <div class="content">
                <div class="form-card">

                    <div class="field-group">
                        <span class="field-label">Recipe Name</span>
                        <asp:TextBox ID="RecipeName" runat="server" CssClass="txt-input"></asp:TextBox>
                    </div>

                    <div class="field-group">
                        <span class="field-label">Add an ingredient</span>
                        <div class="ingredient-row">
                            <div class="field-group">
                                <asp:TextBox ID="IngredientBox" runat="server" CssClass="txt-input" placeholder="Ingredient" Width="260px"></asp:TextBox>
                            </div>
                            <div class="field-group amount-field">
                                <asp:TextBox ID="AmountBox" runat="server" CssClass="txt-input" TextMode="Number" placeholder="Grams"></asp:TextBox>
                            </div>
                            <div class="ingredient-actions">
                                <asp:Button ID="AddButton" runat="server" CssClass="btn-primary" Text="Add" Width="80px" OnClick="AddButton_Click" />
                                <asp:Button ID="RemoveButton" runat="server" CssClass="btn-secondary" Text="Remove" Width="80px" OnClick="RemoveButton_Click" />
                            </div>
                        </div>
                    </div>

                    <asp:BulletedList ID="IngredientsList" runat="server" CssClass="ingredients-list">
                    </asp:BulletedList>

                    <div class="field-group">
                        <span class="field-label">Additional Instructions</span>
                        <asp:TextBox ID="InstructionsBox" runat="server" CssClass="txt-input" TextMode="MultiLine" Rows="4"></asp:TextBox>
                    </div>

                    <div class="create-action">
                        <asp:Button ID="CreateRecipe" runat="server" CssClass="btn-primary" OnClick="CreateRecipe_Click" Text="Create" Width="120px" />
                    </div>

                </div>
            </div>
        </div>
    </form>
</body>
</html>
