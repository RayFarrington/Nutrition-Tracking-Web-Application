<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Public.aspx.cs" Inherits="FinalProject.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Public</title>
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
            padding: 28px 20px;
            text-align: center;
        }

        .header h1 {
            margin: 0;
            color: #ffffff;
            font-size: 2rem;
            font-weight: 700;
            letter-spacing: 0.5px;
        }

        .header p.tagline {
            margin: 8px 0 0;
            color: var(--green-light);
            font-size: 1rem;
        }

        /* Main content */
        .content {
            flex: 1;
            width: 100%;
            max-width: var(--max-width);
            margin: 0 auto;
            padding: 32px 20px 60px;
        }

        /* Login buttons */
        .login-actions {
            display: flex;
            gap: 16px;
            justify-content: center;
            flex-wrap: wrap;
            margin-bottom: 32px;
        }

        .login-actions a,
        .login-actions .aspNetDisabled {
            display: inline-block;
            padding: 12px 28px;
            border-radius: 8px;
            font-size: 1rem;
            font-weight: 600;
            text-decoration: none;
            cursor: pointer;
            border: 2px solid var(--green);
            transition: background-color 0.15s ease, color 0.15s ease;
        }

        .login-actions .primary-btn {
            background-color: var(--green);
            color: #ffffff;
        }

        .login-actions .primary-btn:hover {
            background-color: var(--green-dark);
            border-color: var(--green-dark);
        }

        .login-actions .secondary-btn {
            background-color: #ffffff;
            color: var(--green-dark);
        }

        .login-actions .secondary-btn:hover {
            background-color: var(--green-light);
        }

        /* Info card */
        .info-card {
            background-color: #ffffff;
            border: 1px solid var(--green-border);
            border-radius: 12px;
            padding: 24px 28px;
            margin-bottom: 32px;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.05);
        }

        .info-card h2 {
            margin-top: 0;
            font-size: 1.3rem;
            color: var(--green-dark);
        }

        .info-card p {
            margin: 0 0 14px;
            color: var(--text-muted);
        }

        .info-card p:last-child {
            margin-bottom: 0;
        }

        .info-card p strong {
            color: var(--text-main);
        }

        code {
            background-color: var(--green-light);
            border: 1px solid var(--green-border);
            border-radius: 4px;
            padding: 1px 6px;
            font-size: 0.92em;
            color: var(--green-dark);
        }

        /* Summary table */
        .table-section h2 {
            font-size: 1.3rem;
            color: var(--green-dark);
            margin-bottom: 12px;
        }

        .table-scroll {
            overflow-x: auto;
            border: 1px solid var(--green-border);
            border-radius: 10px;
            background-color: #ffffff;
        }

        table.summary-table {
            border-collapse: collapse;
            width: 100%;
            min-width: 640px;
            font-size: 0.92rem;
        }

        table.summary-table td {
            padding: 10px 14px;
            border-bottom: 1px solid #eef2ee;
            vertical-align: top;
            color: var(--text-muted);
        }

        table.summary-table tr:last-child td {
            border-bottom: none;
        }

        table.summary-table td.table-title {
            font-weight: 700;
            color: var(--green-dark);
            font-size: 1.02rem;
            background-color: var(--green-light);
        }

        table.summary-table td.table-url {
            font-family: Consolas, monospace;
            font-size: 0.85rem;
            color: var(--green-dark);
            background-color: var(--green-light);
        }

        table.summary-table td.col-header {
            font-weight: 700;
            color: #ffffff;
            background-color: var(--green);
        }

        table.summary-table tr:nth-child(even) td:not(.table-title):not(.table-url):not(.col-header) {
            background-color: #fafcfa;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="header">
                <h1>Welcome</h1>
                <p class="tagline">Nutrition Tracking Web Application</p>
            </div>
            <div class="content">

                <div class="login-actions">
                    <asp:LinkButton ID="LinkButton1" runat="server" CssClass="primary-btn" PostBackUrl="~/LogIn.aspx">Login</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton2" runat="server" CssClass="secondary-btn" PostBackUrl="~/StaffLogin.aspx">Staff Login</asp:LinkButton>
                </div>

                <div class="info-card">
                    <h2>About this site</h2>
                    <p>Welcome to this Nutrition Tracking Web Application.</p>
                    <p>Here you can keep track of your recipes. The website will also automatically caluclate calories and nutrition data for you to help meet your nutrition goals.</p>
                </div>

                <div class="info-card">
                    <h2>Getting started</h2>
                    <p>To start, you can click login to sign in with a username and password, example, username: <code>user</code> password: <code>password</code></p>
                    <p>Or you can click New User to enter your own information and create your own accout. The signup page can also generate a secure password for you using the service from api.genratr.com</p>
                    <p>Once you login, you will be brought to your profile, where you can see your information and your recipes</p>
                    <p>To create a recipe, just enter the name of the recipe, then the ingredients in plain text and the amount in grams. Then add any additional information as needed</p>
                </div>

                <div class="info-card">
                    <h2>Staff access</h2>
                    <p>The staff can login though the staff login. Higher level staff, like username: <code>staff</code> password: <code>password</code>, can delete any recipes if neccisary</p>
                    <p>Lower access staff, like username: <code>lowerstaff</code> password: <code>1234</code>, can flag a recipe for review by a higher staff</p>
                </div>

                <div class="table-section">
                    <h2>Application and Components Summary Table</h2>
                    <div class="table-scroll">
                        <asp:Table ID="Table1" runat="server" CssClass="summary-table">
                            <asp:TableRow runat="server">
                                <asp:TableCell runat="server" CssClass="table-title" ColumnSpan="4">Application and Components Summary Table</asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow runat="server">
                                <asp:TableCell runat="server" CssClass="table-url" ColumnSpan="4"></asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow runat="server">
                                <asp:TableCell runat="server" CssClass="col-header">Provider name</asp:TableCell>
                                <asp:TableCell runat="server" CssClass="col-header">Page and Component</asp:TableCell>
                                <asp:TableCell runat="server" CssClass="col-header">Component Discription</asp:TableCell>
                                <asp:TableCell runat="server" CssClass="col-header">Resources and methods used</asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow runat="server">
                                <asp:TableCell runat="server">Chandler Farrington</asp:TableCell>
                                <asp:TableCell runat="server">aspx pages and server controls</asp:TableCell>
                                <asp:TableCell runat="server">The public page is the default and links to all other pages</asp:TableCell>
                                <asp:TableCell runat="server">GUI design and C# code</asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow runat="server">
                                <asp:TableCell runat="server">Chandler Farrington</asp:TableCell>
                                <asp:TableCell runat="server">User Control</asp:TableCell>
                                <asp:TableCell runat="server">Login page and authication varification</asp:TableCell>
                                <asp:TableCell runat="server">C# code</asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow runat="server">
                                <asp:TableCell runat="server">https://api.genratr.com/</asp:TableCell>
                                <asp:TableCell runat="server">Service</asp:TableCell>
                                <asp:TableCell runat="server">Returns a randomly generated password </asp:TableCell>
                                <asp:TableCell runat="server">Service from https://api.genratr.com/</asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow runat="server">
                                <asp:TableCell runat="server">Chandler Farrington</asp:TableCell>
                                <asp:TableCell runat="server">Service</asp:TableCell>
                                <asp:TableCell runat="server">Output calories based on a given recipe.</asp:TableCell>
                                <asp:TableCell runat="server">Uses USDA API for food information: https://api.nal.usda.gov/fdc/v1/</asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow runat="server">
                                <asp:TableCell runat="server">Chandler Farrington</asp:TableCell>
                                <asp:TableCell runat="server">Service</asp:TableCell>
                                <asp:TableCell runat="server">Calculates the nutrients in a recipe</asp:TableCell>
                                <asp:TableCell runat="server">Uses USDA API for food information: https://api.nal.usda.gov/fdc/v1/</asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow runat="server">
                                <asp:TableCell runat="server">Chandler Farrington</asp:TableCell>
                                <asp:TableCell runat="server">Cookies</asp:TableCell>
                                <asp:TableCell runat="server">Stores UserID </asp:TableCell>
                                <asp:TableCell runat="server">GUI design and C# code</asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow runat="server">
                                <asp:TableCell runat="server">Chandler Farrington</asp:TableCell>
                                <asp:TableCell runat="server">XML databases</asp:TableCell>
                                <asp:TableCell runat="server">Stores Recipes, Users, and Staff information</asp:TableCell>
                                <asp:TableCell runat="server">XML file design and C# code to access it</asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                    </div>
                </div>

            </div>
        </div>
    </form>
</body>
</html>
