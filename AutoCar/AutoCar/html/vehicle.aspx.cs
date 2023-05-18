using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AutoCar.html
{
    public partial class vehicle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
         /*   if (!IsPostBack)
            {
                HttpCookie auth = new HttpCookie("userauth");
                auth = Request.Cookies[auth.Name];

                if (auth != null)
                {
                    if (Session["is_emp"] != null && Session["is_emp"].ToString().Equals("True") && 
                        Session["dept_name"]!=null && !Session["dept_name"].ToString().Equals("admin"))
                    {
                        Response.Redirect("./error404.aspx");
                    }else if (Session["is_emp"] != null && Session["is_emp"].ToString().Equals("False"))
                    {
                        Response.Redirect("./home.aspx");
                    }
                    //else here mean the department is valid here we will ckeck the role and per
                    else
                    {

                    }
                    
                }
                else
                {
                    // select_place.Visible = false;
                    Response.Redirect("./login.aspx");
                }
            }*/
        }
    }
}