using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace FinalProject
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
        {
            XmlDocument userDoc = new XmlDocument(); //open users.xml
            string path = Server.MapPath("~/App_Data/Users.xml");
            userDoc.Load(path);
            XmlNodeList users = userDoc.SelectNodes("//User");
            string username = Login1.UserName;
            string password = Login1.Password;


            foreach (XmlNode node in users)
            {
                if (username == node["Username"].InnerText && password == node["Password"].InnerText) //compare if username and password match
                {
                    HttpCookie userID = new HttpCookie("UserID");
                    userID["ID"] = node.Attributes["id"].Value;
                    userID["UserName"] = node["Username"].InnerText;
                    Response.Cookies.Add(userID); //create cookies to keep track of which user is logged in
                    e.Authenticated = true;
                }
            }
        }
    }
}