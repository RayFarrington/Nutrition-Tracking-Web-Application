<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StaffPage.aspx.cs" Inherits="FinalProject.StaffPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Staff Page</title>
    <style type="text/css">
        :root {
            --green-dark: #1b5e33;
            --green: #2e7d47;
            --green-light: #eaf6ec;
            --green-border: #bfe3c9;
            --text-main: #222831;
            --text-muted: #4a4a4a;
            --max-width: 900px;
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
            padding: 24px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 12px;
        }

        .header h1 {
            margin: 0;
            color: #ffffff;
            font-size: 1.6rem;
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
            padding: 32px 20px 60px;
        }

        .recipe-panel {
            display: block;
            background-color: #ffffff;
            border: 1px solid var(--green-border);
            border-radius: 12px;
            padding: 20px 24px;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.05);
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="header">
                <h1>Staff Page</h1>
                <asp:Button ID="Button1" runat="server" CssClass="btn-return" Text="Return" PostBackUrl="~/Public.aspx" />
            </div>
            <div class="content">
                <asp:Panel ID="RecipePanel" runat="server" CssClass="recipe-panel">
                </asp:Panel>
            </div>
        </div>
    </form>
</body>
</html>
