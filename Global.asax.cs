using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;


namespace WebApplication2
{
    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start(object sender, EventArgs e)
        {
            RouteTable.Routes.MapPageRoute("Home", "Home", "~/Page/Home.aspx");
            RouteTable.Routes.MapPageRoute("XML", "XML", "~/Page/XML.aspx");
            RouteTable.Routes.MapPageRoute("Chart", "Chart", "~/Page/Chart.aspx");
            RouteTable.Routes.MapPageRoute("About", "About", "~/Page/About.aspx");     
            RouteTable.Routes.MapPageRoute("Login", "Login", "~/Page/Login.aspx");
            RouteTable.Routes.MapPageRoute("Register", "Register", "~/Page/Register.aspx");                 
        }

        void Application_BeginRequest(object sender, EventArgs e)
        {            

        } 
    }
}
