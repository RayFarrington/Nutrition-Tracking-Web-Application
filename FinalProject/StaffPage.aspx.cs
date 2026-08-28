using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace FinalProject
{
    public partial class StaffPage : System.Web.UI.Page
    {
        int access;
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie staffID = Request.Cookies["StaffID"]; //get staff level
            access = int.Parse(staffID["access"]);

            XmlDocument recipeDoc = new XmlDocument();
            string path = Server.MapPath("~/App_Data/Recipes.xml"); //open recipies.xml and load all recipies
            recipeDoc.Load(path);
            XmlNodeList recipes = recipeDoc.SelectNodes("//Recipe");
            
            foreach (XmlNode recipe in recipes)
            {
                Button button = new Button(); //create a button that either deletes or flags a recipe
                string recipeID = recipe.Attributes["ID"].Value;
                button.CommandArgument = recipeID;
                if (access == 1) //access 1 means user can delete recipe
                {
                    button.Text = "Delete";
                    button.Click += new EventHandler(Delete_Click);
                }
                else //access 0 means user can only flag a recipe
                {
                    button.Text = "Flag";
                    button.Click += new EventHandler(Flag_Click);
                }
                
                RecipePanel.Controls.Add(button);
                XmlNodeList ingredients = recipe.SelectNodes("Ingredients/Ingredient"); //display all the ingredients in a recipe
                Label label = new Label();
                if (recipe.Attributes["flag"].Value == "1") //if the recipe was flagged turn it red
                {
                    label.ForeColor = System.Drawing.Color.Red;
                }
                label.Style["white-space"] = "pre-wrap";
                label.Text = "\t" + recipe.Attributes["name"].Value + " by " + recipe.Attributes["user"].Value + "\n";
                foreach (XmlNode ingredient in ingredients)
                {
                    label.Text += "\t\t-" + ingredient.InnerText + "\n"; 
                }
                label.Text += "\n";
                RecipePanel.Controls.Add(label);
            }
        }

        protected void Delete_Click(object sender, EventArgs e)
        {
            //event if delete button pressed
            Button clickedButton = (Button)sender;
            string recipeID = clickedButton.CommandArgument;
            XmlDocument recipeDoc = new XmlDocument();
            string path = Server.MapPath("~/App_Data/Recipes.xml");
            recipeDoc.Load(path);
            XmlNode recipe = recipeDoc.SelectSingleNode("//Recipe[@ID=" + recipeID + "]"); //select the recipe that is to be deleted
            recipe.ParentNode.RemoveChild(recipe); //remove the recipe
            recipeDoc.Save(path);
            Response.Redirect("~/StaffPage.aspx"); //reload
        }
        protected void Flag_Click(object sender, EventArgs e)
        {
            //event if flag button pressed
            Button clickedButton = (Button)sender;
            string recipeID = clickedButton.CommandArgument;
            XmlDocument recipeDoc = new XmlDocument();
            string path = Server.MapPath("~/App_Data/Recipes.xml");
            recipeDoc.Load(path);
            XmlNode recipe = recipeDoc.SelectSingleNode("//Recipe[@ID=" + recipeID + "]"); //get the recipe to be flagged
            if(recipe.Attributes["flag"].Value == "0") //change flag atribute to 1 if not flagged and 0 if it already is
            {
                recipe.Attributes["flag"].Value = "1";
            }
            else
            {
                recipe.Attributes["flag"].Value = "0";
            }

                recipeDoc.Save(path);
            Response.Redirect("~/StaffPage.aspx"); //reload
        }
    }
}