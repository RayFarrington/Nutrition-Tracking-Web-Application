# Nutrition Tracking Web Application

A web application created as part of my Distributed Software Development class. This ASP.NET Web Forms project allows users to track recipes, calories, and nutritional information. Users can create accounts, manage recipes, and view automatically calculated nutrition data. Staff members have additional tools for reviewing and managing recipes.

## Features

* User account registration and login
* User profile management
* Recipe creation and management
* Automatic calorie calculation
* Automatic nutritional information calculation
* Secure password generation
* Staff login and administrative access
* Recipe review and flagging system
* XML-based data storage
* Cookie-based user identification
* USDA FoodData Central API integration

## Getting Started

### User Login

Existing users can log in using their username and password.

Example test account:

```text
Username: user
Password: password
```

### Creating a New Account

New users can select **New User** to create an account by entering their information.

The application can also generate a secure password using the Genratr API:

[Genratr API](https://api.genratr.com)

### Creating a Recipe

After logging in, users are taken to their profile, where they can view their account information and recipes.

To create a recipe:

1. Enter the recipe name.
2. Enter the ingredients as plain text.
3. Specify ingredient amounts in grams.
4. Enter any additional recipe information.
5. Submit the recipe.

The application uses USDA food information to calculate the recipe's calories and nutritional data.

## Staff Access

The application provides different levels of staff access.

### Higher-Level Staff

Higher-level staff can review and delete recipes when necessary.

Example test account:

```text
Username: staff
Password: password
```

### Lower-Level Staff

Lower-level staff can flag recipes that require review by higher-level staff.

Example test account:

```text
Username: lowerstaff
Password: 1234
```

## Application Components

| Provider            | Page / Component               | Description                                                                | Resources / Methods                                            |
| ------------------- | ------------------------------ | -------------------------------------------------------------------------- | -------------------------------------------------------------- |
| Chandler Farrington | ASPX Pages and Server Controls | The public page is the default page and provides links to the other pages. | GUI design and C# code                                         |
| Chandler Farrington | User Control                   | Provides the login page and authentication verification.                   | C# code                                                        |
| Genratr API         | Service                        | Returns a randomly generated password.                                     | [Genratr API](https://api.genratr.com)                         |
| Chandler Farrington | Nutrition Service              | Calculates calories based on a given recipe.                               | USDA FoodData Central API                                      |
| Chandler Farrington | Nutrition Service              | Calculates nutritional information for a recipe.                           | USDA FoodData Central API                                      |
| Chandler Farrington | Cookies                        | Stores the user's `UserID`.                                                | GUI design and C# code                                         |
| Chandler Farrington | XML Databases                  | Stores recipes, users, and staff information.                              | XML file design and C# code                                    |


## Author

**Chandler Farrington**
