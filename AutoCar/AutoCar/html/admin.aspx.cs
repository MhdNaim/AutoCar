using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

namespace AutoCar.html
{
    public partial class admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                HttpCookie auth = new HttpCookie("userauth");
                auth = Request.Cookies[auth.Name];

                if (auth != null)
                {
                    if (Session["is_emp"] != null && Session["is_emp"].ToString().Equals("True") &&
                        Session["dept_name"] != null && !Session["dept_name"].ToString().Equals("admin"))
                    {
                        Response.Redirect("./error404.aspx");
                    }
                    else if (Session["is_emp"] != null && Session["is_emp"].ToString().Equals("False"))
                    {
                        Response.Redirect("./home.aspx");
                    }
                    //else here mean the department is valid here we will ckeck the role and per
                    else
                    {

                        string connectionString = "server=localhost;user id=naim;password=na.123;database=auto_car";

                        // Create a connection object
                        MySqlConnection conn = new MySqlConnection(connectionString);

                        string get_per = "SELECT users_id,first_name,last_name,is_emp from users" ;

                        MySqlCommand cmd1 = new MySqlCommand(get_per, conn);

                        try
                        {
                            conn.Open();
                            DataTable dt = new DataTable();
                            MySqlDataReader reader = cmd1.ExecuteReader();
                             /*   dt.Columns.Add(new DataColumn("FirstName"));
                                dt.Columns.Add(new DataColumn("LastName"));
                                dt.Columns.Add(new DataColumn("IsEmployee"));

                            while (reader.Read()) 
                            {
                                dt.Rows.Add(reader.GetString("first_name"), reader.GetString("last_name"), reader.GetString("is_emp"));
                            
                            }*/

                            
                         
                            // Bind the DataTable to the GridView control
                            myGridView.DataSource = reader;
                            myGridView.DataBind();

                        }
                        catch (Exception ex) 
                        {

                            Response.Write(ex.Message);
                        }finally 
                        { 
                            conn.Close();
                        }



















                    }

                }
                else
                {
                    // select_place.Visible = false;
                    Response.Redirect("./login.aspx");
                }
            }
        }
        protected void logout_button_click(object sender, EventArgs e)
        {
            HttpCookie auth = new HttpCookie("userauth");
            auth = Request.Cookies[auth.Name];
            if (auth != null)
            {
                //remove cookies
                auth.Expires = DateTime.Now.AddDays(-1);
                Response.Cookies.Add(auth);
                //remove session
                Session.RemoveAll();
                Response.Redirect("./home.aspx");
            }

        }
    }
}