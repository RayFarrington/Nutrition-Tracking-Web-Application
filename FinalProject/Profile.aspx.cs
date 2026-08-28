using System;
using System.Web;
using System.Web.UI.WebControls;
using System.Xml;

namespace FinalProject
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie userID = Request.Cookies["UserID"];
            string ID;
            string user;
            if (userID == null) //make sure cookies exist
            {
                ID = "0";
                user = "test";
            }
            else
            {
                user = userID["UserName"]; //get username and id
                ID = userID["ID"];
            }

            XmlDocument userDoc = new XmlDocument(); //open users.xml
            string path = Server.MapPath("~/App_Data/Users.xml");
            userDoc.Load(path);
            XmlNodeList users = userDoc.SelectNodes("//User"); //get all users
            foreach (XmlNode node in users)
            {
                if (node.Attributes["id"].Value == ID) //check if user matches the logged in one
                {
                    user = node["Username"].InnerText; //display user info
                    Username.Text = "Name:\t" + node["Username"].InnerText;
                    Gender.Text = "Gender:\t" + node["Gender"].InnerText;
                    Age.Text = "Age:\t" + node["Age"].InnerText;
                    Weight.Text = "Weight:\t" + node["Weight"].InnerText + " " + node["WeightUnits"].InnerText;
                    Height.Text = "Height:\t" + node["Height"].InnerText + " " + node["HeightUnits"].InnerText;
                    ActivityLevel.Text = "Activity Level:\t" + node["ActivityLevel"].InnerText;
                    Goals.Text = "Goals:\t" + node["Goals"].InnerText;
                    break;
                }
            }
            XmlDocument recipeDoc = new XmlDocument(); //open recipies.xml
            path = Server.MapPath("~/App_Data/Recipes.xml");
            recipeDoc.Load(path);
            XmlNodeList recipes = recipeDoc.SelectNodes("//Recipe[@user='" + user + "']"); //get the recipies made by the user
            if(recipes.Count <= 0) //display if the user doesn't have a recipe yet
            {
                Label newLabel = new Label();
                newLabel.Text = "Looks like you don't have any recipes yet";
                RecipePanel.Controls.Add(newLabel);
            }
            foreach (XmlNode recipe in recipes) //display a link to each recipe
            {
                HyperLink link = new HyperLink();
                link.Text = recipe.Attributes["name"].Value;
                link.NavigateUrl = "~/Recipe.aspx?id=" + recipe.Attributes["ID"].Value;
                link.Style["display"] = "block";
                RecipePanel.Controls.Add(link);
            }
        }

        protected void CreateButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/CreateRecipe.aspx");
        }

        protected void ReturnButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Public.aspx");
        }
    }
}