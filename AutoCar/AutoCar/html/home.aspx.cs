using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Runtime.Remoting.Messaging;
using System.Transactions;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;


namespace AutoCar.html
{
    public partial class home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["auth"] != null)
            {
                if (Session["is_emp"] != null && Session["is_emp"].ToString().Equals("True"))
                {
                    Response.Redirect("./error404.aspx");
                }
                else if (Session["is_emp"] != null && !Session["is_emp"].ToString().Equals("True"))
                {
                    logout_button.Visible = true;
                    login_button.Visible = false;
                    register_button.Visible = false;
                }
            }
            else
            {
                HttpCookie auth = new HttpCookie("userauth");
                auth = Request.Cookies[auth.Name];
                if (auth != null)
                {
                    logout_button.Visible = true;
                    login_button.Visible = false;
                    register_button.Visible = false;

                    string email = auth.Values["email"];
                    string password = auth.Values["password"];

                    if (auth != null)
                    {
                        check_user(email, password);
                    }

                }
                else
                {
                    logout_button.Visible = false;
                }
            }
        }
        public void check_user(string email, string password)
        {


            //create a connection string 
            string connectionString = "server=localhost;user id=naim;password=na.123;database=auto_car";

            // Create a connection object
            MySqlConnection conn = new MySqlConnection(connectionString);

            //query to select the user  from user table and otpimaize if emp 
            string query = "SELECT users_id,email,password,is_emp,first_name,last_name FROM users";
            string get_driver_info = "select nn,driver_id from drivers where emp_id=@emp_id";

            MySqlCommand cmd = new MySqlCommand(query, conn);
            

            try
            {
                conn.Open();
                MySqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    //here get the email and password first 
                    string email_data = reader.GetString("email");
                    string password_data = reader.GetString("password");

                    //check if email and password is valid
                    if (email_data == email && password_data == password)
                    {
                        // when i sure from the user i fetch the rest data
                        string first_name_data = reader.GetString("first_name");
                        string last_name_data = reader.GetString("last_name");
                        int user_id = reader.GetInt32("users_id");
                        bool is_emp = reader.GetBoolean("is_emp");

                        // now check if user emp or customer


                        ///emp redirects
                        if (is_emp)
                        {
                            //close the query that fetch user info and start query that fetch the dept_id & role_id &
                            //of emp and per_id to know wher to redirect the emp
                            //
                            reader.Close();
                            string get_emp_info = "SELECT emp_id,dept_name,role_name,per_add,per_delete,per_update,per_read " +
                                "FROM employees JOIN departments ON employees.dept_id = departments.dept_id " +
                                "JOIN role ON employees.role_id = role.role_id " +
                                "JOIN permissions ON employees.per_id = permissions.per_id " +
                                "WHERE user_id=@user_id";
                            MySqlCommand cmd1 = new MySqlCommand(get_emp_info, conn);
                            cmd1.Parameters.AddWithValue("@user_id", user_id);
                            MySqlDataReader reader_emp = cmd1.ExecuteReader();
                            string dept_name = "";
                            string role_name = "";
                            bool per_add = false;
                            bool per_delete = false;
                            bool per_update = false;
                            bool per_read = false;
                            int emp_id = -1;
                            while (reader_emp.Read())
                            {
                                emp_id = reader_emp.GetInt32("emp_id");
                                dept_name = reader_emp.GetString("dept_name");
                                role_name = reader_emp.GetString("role_name");
                                per_add = reader_emp.GetBoolean("per_add");
                                per_delete = reader_emp.GetBoolean("per_delete");
                                per_update = reader_emp.GetBoolean("per_update");
                                per_read = reader_emp.GetBoolean("per_read");
                            }
                            reader_emp.Close();
                            create_emp_session(user_id,emp_id,first_name_data, last_name_data, email_data, password_data, is_emp, dept_name, role_name, per_add, per_delete, per_update, per_read);

                            if (dept_name.Equals("admin"))
                            {
                                Response.Redirect("./admin.aspx");
                            }
                            else if (dept_name.Equals("hr"))
                            {
                                Response.Redirect("./hr.aspx");
                            }
                            else if (dept_name.Equals("finance"))
                            {
                                Response.Redirect("./finance.aspx");
                            }
                            else if (dept_name.Equals("vendor"))
                            {
                                Response.Redirect("./vendor.aspx");
                            }
                            else if (dept_name.Equals("driver"))
                            {
                                MySqlCommand cmd2 = new MySqlCommand(get_driver_info, conn);
                                cmd2.Parameters.AddWithValue("emp_id", emp_id);
                                int driver_id = 0;
                                int nn = 00000000000;
                               
                                MySqlDataReader reader_driver = cmd2.ExecuteReader();
                                while (reader_driver.Read())
                                {
                                    driver_id=reader_driver.GetInt32("driver_id");
                                    nn = reader_driver.GetInt32("nn");
                                }
                                Session["driver_id"] = driver_id;
                                Session["nn"] = nn;
                                Response.Redirect("./driver.aspx");
                            }
                            else
                            {

                            }

                        }
                        //customer redirects
                        else
                        {
                            //close the query that fetch user info and start query that fetch customer phone number
                            reader.Close();

                            string get_phone_number = "SELECT cust_id,phone_number FROM customers where user_id=@user_id";
                            MySqlCommand cmd1 = new MySqlCommand(get_phone_number, conn);
                            cmd1.Parameters.AddWithValue("@user_id", user_id);
                            MySqlDataReader reader_phone = cmd1.ExecuteReader();

                            while (reader_phone.Read())
                            {
                                string phone_number = reader_phone.GetString("phone_number");
                                int cust_id = reader_phone.GetInt32("cust_id");
                                if (!phone_number.Equals(""))
                                {
                                    //function for create sessions and cookies
                                    create_customer_session(user_id,cust_id, first_name_data, last_name_data, email_data, password_data, is_emp, phone_number);
                                    Response.Redirect("./home.aspx");
                                }

                            }
                        }

                    }
                    //error meassage because user  not found !!
                    else
                    {

                    }
                }

            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
            finally
            {
                conn.Close();
            }
        }
        public void create_customer_session(int user_id,int cust_id, string firstname, string lastname, string email, string password, bool is_emp, string phone_number)
        {
            //create sessions
            Session["auth"] = true;
            Session["is_emp"] = is_emp;
            Session["user_id"] = user_id;
            Session["cust_id"]=cust_id;
            Session["phonenumber"] = phone_number;
        }
        public void create_emp_session(int user_id,int emp_id,string firstname, string lastname, string email, string password, bool is_emp, string dept_name, string role_name, bool per_add, bool per_delete, bool per_update, bool per_read)
        {
            //create sessions
            Session["auth"] = true;
            Session["is_emp"] = is_emp;
            Session["user_id"] = user_id;
            Session["dept_name"] = dept_name;
            Session["role_name"] = role_name;
            Session["per_add"] = per_add;
            Session["per_delete"] = per_delete;
            Session["per_update"] = per_update;
            Session["per_read"] = per_read;
            Session["emp_id"] = emp_id;
        }
        protected void register_button_click(object sender, EventArgs e)
        {
            Response.Redirect("./register.aspx");
        }
        protected void login_button_click(object sender, EventArgs e)
        {
            Response.Redirect("./login.aspx");
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
        protected void order_button_click(object sender, EventArgs e)
        {

            HttpCookie auth = new HttpCookie("userauth");
            auth = Request.Cookies[auth.Name];

            if (auth != null)
            {

                Response.Redirect("./order.aspx");

            }
            else
            {

                Response.Redirect("./login.aspx");
            }
        }
    }
}