using System;
using System.Web;
using System.Xml;

namespace FinalProject
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        private HttpCookie userID;
        protected void Page_Load(object sender, EventArgs e)
        {
            userID = Request.Cookies["UserID"];
        }

        protected void ReturnButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Profile.aspx");
        }

        protected void AddButton_Click(object sender, EventArgs e)
        {
            if (IngredientBox.Text.Length > 0 && AmountBox.Text.Length > 0) //check if both boxes have a value
            {
                //add both with a tab inbetween
                IngredientsList.Items.Add(IngredientBox.Text + "\t" + AmountBox.Text + "g");
                IngredientBox.Text = "";
                AmountBox.Text = "";
            }
        }

        protected void RemoveButton_Click(object sender, EventArgs e)
        {
            if (IngredientsList.Items.Count > 0)
            {
                //remove the last added item
                IngredientsList.Items.RemoveAt(IngredientsList.Items.Count - 1);
            }
        }

        protected void CreateRecipe_Click(object sender, EventArgs e)
        {
            if (IngredientsList.Items.Count > 0)
            {
                //open the recipies.xml
                string path = Server.MapPath("~/App_Data/Recipes.xml");
                XmlDocument doc = new XmlDocument();
                doc.Load(path);
                XmlElement newRecipe = doc.CreateElement("Recipe");
                //get the last recipe
                XmlNode lastRecipe = doc.SelectSingleNode("/Recipes/Recipe[last()]");
                string lastID = lastRecipe.Attributes["ID"].Value; 

                string newID = (int.Parse(lastID) + 1).ToString(); //id is just the last id plus 1

                newRecipe.SetAttribute("ID", newID);
                string username = userID["UserName"]; //get username from cookie
                newRecipe.SetAttribute("user", username);
                XmlElement ingredients = doc.CreateElement("Ingredients");
                XmlElement instructions = doc.CreateElement("Instructions");
                instructions.InnerText = InstructionsBox.Text;
                newRecipe.SetAttribute("name", RecipeName.Text);
                newRecipe.SetAttribute("flag", "0");


                string[] str;
                string input = "";
                foreach (var item in IngredientsList.Items)
                {
                    //get the ingedients from the list and format them for the service also add each ingredient to the xml element
                    str = item.ToString().Split('\t');
                    XmlElement ingredient = doc.CreateElement("Ingredient");
                    ingredient.SetAttribute("amount", str[1]);
                    ingredient.InnerText = str[0];
                    ingredients.AppendChild(ingredient);
                    input += str[0] + "," + str[1].Remove(str[1].Length - 1) + ";";
                }
                input = input.Remove(input.Length - 1);
                NutritionInfo.CalorieCounterClient client = new NutritionInfo.CalorieCounterClient(); //get nutrients from calorie service
                XmlElement nutrients = doc.CreateElement("Nutrition");
                nutrients.SetAttribute("calories", client.GetCalories(input)); //calories
                nutrients.InnerText = client.GetNutrients(input); //nutrients
                newRecipe.AppendChild(nutrients);
                newRecipe.AppendChild(ingredients);
                newRecipe.AppendChild(instructions);
                doc.DocumentElement.AppendChild(newRecipe);
                doc.Save(path);
                input = input.Remove(input.Length - 1);
                Response.Redirect("~/Recipe.aspx?id=" + newID); //send user to the recipe they just created
            }
        }
    }
}