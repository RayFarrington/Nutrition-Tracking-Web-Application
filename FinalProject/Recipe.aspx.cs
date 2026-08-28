using System;
using System.Xml;

namespace FinalProject
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string recipeID = Request.QueryString["id"]; //get recipe id by query
            XmlDocument rDoc = new XmlDocument(); 
            string path = Server.MapPath("~/App_Data/Recipes.xml"); //open recipies.xml
            rDoc.Load(path);
            XmlNode recipe = rDoc.SelectSingleNode("//Recipe[@ID=" + recipeID + "]"); //get the recipe that matched the id
            RecipeHeader.Text = recipe.Attributes["name"].Value; //display recipe
            XmlNodeList ingredients = recipe.SelectNodes("Ingredients/Ingredient");
            foreach (XmlNode ingredient in ingredients) //display each ingredient and their amount
            {
                string name = ingredient.InnerText;
                string amount = ingredient.Attributes["amount"].Value;
                RecipeList.Items.Add(($" {amount} grams of {name}"));
            }
            InstructionsLabel.Text = recipe["Instructions"].InnerText; //add additional instructions
            CalorieLabel.Text = recipe["Nutrition"].Attributes["calories"].Value;
            NLabel.Text = recipe["Nutrition"].InnerText;
        }

        protected void ReturnButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Profile.aspx");
        }
    }
}