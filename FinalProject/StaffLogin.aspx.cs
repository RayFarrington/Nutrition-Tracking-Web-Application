using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace FinalProject
{
    public partial class WebForm7 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
        {
            XmlDocument doc = new XmlDocument();
            string path = Server.MapPath("~/App_Data/Staff.xml"); //open staff.xml
            doc.Load(path);
            XmlNodeList staff = doc.SelectNodes("//User");
            string username = Login1.UserName;
            string password = Login1.Password;


            foreach (XmlNode node in staff)
            {
                if (username == node["Username"].InnerText && password == node["Password"].InnerText) //check if username and password match
                {
                    HttpCookie userID = new HttpCookie("StaffID");
                    userID["access"] = node.Attributes["access"].Value; //creat cookies with staff access level
                    Response.Cookies.Add(userID);
                    e.Authenticated = true;
                }
            }
        }
    }
}