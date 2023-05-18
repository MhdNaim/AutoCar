using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

namespace AutoCar.html
{
    public partial class register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["auth"] != null)
            {
                Response.Redirect("./home.aspx");
            }
        }

        protected void registrationForm_ServerClick(object sender, EventArgs e)
        {
            string firstname = Request.Form["firstname"];
            string lastname = Request.Form["lastname"];
            string birthdate = Request.Form["birthdate"];
            string gender = Request.Form["gender"];
            string email = Request.Form["email"];
            string password = Request.Form["password"];
            string confirmpassword = Request.Form["confirmpassword"];
            string phonenumber = Request.Form["phonenumber"];
            // phonenumber = "+963947207299";

            //create a connection string 
            string connectionString = "server=localhost;user id=naim;password=na.123;database=auto_car";

            // Create a connection object
            MySqlConnection conn = new MySqlConnection(connectionString);

            //query to save the customer data into user table and customer table in serial

            string query = " INSERT INTO users (first_name, last_name, birth_date,gender,email,password,is_verfied,is_emp)" +
            "VALUES (@first_name,@last_name,@birth_date,@gender,@email,@password,@v,@e);" +
            "INSERT INTO customers (phone_number,is_verified,user_id) VALUES(@phonenumber,1,( SELECT MAX(users_id) FROM users ));";
            
            MySqlCommand cmd = new MySqlCommand(query, conn);

            cmd.Parameters.AddWithValue("@first_name", firstname);
            cmd.Parameters.AddWithValue("@last_name", lastname);
            cmd.Parameters.AddWithValue("@birth_date", birthdate);
            cmd.Parameters.AddWithValue("@gender", gender);
            cmd.Parameters.AddWithValue("@email", email);
            cmd.Parameters.AddWithValue("@password", password);
            cmd.Parameters.AddWithValue("@v", 0);
            cmd.Parameters.AddWithValue("@e", 0);
            cmd.Parameters.AddWithValue("@phonenumber", phonenumber);

            try
            {
                conn.Open();
                cmd.ExecuteNonQuery();
                //coockies & sessions for customer only here we dont have registreation for emp
                create_customer_session_cookies(firstname,lastname,email,password,false,phonenumber);
                Response.Redirect("./home.aspx");
            }
            catch (Exception ex)
            {
                Label1.Text = ex.Message;
            }
            finally
            {
                conn.Close();
            }

        }
        public void create_customer_session_cookies(string firstname, string lastname, string email, string password, bool is_emp, string phone_number)
        {
            //create cookies
            HttpCookie auth = new HttpCookie("userauth");
            auth.Expires = DateTime.Now.AddMinutes(30);
            auth.Secure = true;
            auth.Values.Add("firstname", firstname);
            auth.Values.Add("lastname", lastname);
            auth.Values.Add("email", email);
            auth.Values.Add("password", password);
            auth.Values.Add("phone_number", phone_number);
            Response.Cookies.Add(auth);
            //create sessions
            Session["auth"] = true;
            Session["is_emp"] = is_emp;
        }
    }
}