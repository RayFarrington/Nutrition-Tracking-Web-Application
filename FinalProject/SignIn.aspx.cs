using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Net;
using System.Runtime.Serialization.Json;
using System.Web.UI;
using System.Xml;

namespace FinalProject
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void SignUpButton_Click(object sender, EventArgs e)
        {
            if (PasswordText.Value != PasswordConfirmation.Value) //passwords must match
            {
                PasswordFail.Visible = true;

            }
            else
            {
                string path = Server.MapPath("~/App_Data/Users.xml"); //open users.xml
                XmlDocument doc = new XmlDocument();
                doc.Load(path);

                XmlElement newUser = doc.CreateElement("User"); //create a new user
                XmlNodeList currentusers = doc.SelectNodes("Users/User");
                string lastID = currentusers.Item(currentusers.Count - 1).Attributes["id"].Value;
                string newID = (int.Parse(lastID) + 1).ToString(); //user id is last user's id plus 1
                newUser.SetAttribute("id", newID); 
                //add all information to user
                XmlElement usernameElement = doc.CreateElement("Username");
                XmlElement passwordElement = doc.CreateElement("Password");
                XmlElement genderElement = doc.CreateElement("Gender");
                XmlElement ageElement = doc.CreateElement("Age");
                XmlElement weightElement = doc.CreateElement("Weight");
                XmlElement weightUnitElement = doc.CreateElement("WeightUnits");
                XmlElement heightElement = doc.CreateElement("Height");
                XmlElement heightUnitElement = doc.CreateElement("HeightUnits");
                XmlElement activityElement = doc.CreateElement("ActivityLevel");
                XmlElement goalElement = doc.CreateElement("Goals");
                usernameElement.InnerText = UsernameText.Text;
                passwordElement.InnerText = PasswordText.Value;
                if (GenderList.SelectedIndex == 0) //just in case they don't select anything
                {
                    genderElement.InnerText = "Other / Choose not to say";
                }
                else
                {
                    genderElement.InnerText = GenderList.SelectedValue;
                }
                ageElement.InnerText = AgeText.Text;
                weightElement.InnerText = WeightText.Text;
                weightUnitElement.InnerText = WeightList.SelectedValue;
                heightElement.InnerText = HeightText.Text;
                heightUnitElement.InnerText = UnitList.SelectedValue;
                activityElement.InnerText = ActivityList.SelectedValue;
                goalElement.InnerText = GoalsList.SelectedValue;

                //add all elemts to user element
                newUser.AppendChild(usernameElement);
                newUser.AppendChild(passwordElement);
                newUser.AppendChild(genderElement);
                newUser.AppendChild(ageElement);
                newUser.AppendChild(weightElement);
                newUser.AppendChild(weightUnitElement);
                newUser.AppendChild(heightElement);
                newUser.AppendChild(heightUnitElement);
                newUser.AppendChild(activityElement);
                newUser.AppendChild(goalElement);
                doc.DocumentElement.AppendChild(newUser); //add user to document
                doc.Save(path);
                Response.Redirect("~/LogIn.aspx");
            }
        }

        protected void RandomPasswordButton_Click(object sender, EventArgs e)
        {
            //calls the random password generator then displays a sugested password
            WebClient client = new WebClient();
            string raw = client.DownloadString("https://api.genratr.com/?length=16&uppercase&lowercase&special&numbers");
            JObject jsonPassword = JObject.Parse(raw);
            string password = (string)jsonPassword["password"];
            RandomPassword.Text = password;
        }
    }
}