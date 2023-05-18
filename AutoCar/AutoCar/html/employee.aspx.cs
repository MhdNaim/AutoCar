using System;
using System.Collections;
using System.Collections.Generic;
using System.Drawing;
using System.Globalization;
using System.Linq;
using System.Reflection;
using System.Reflection.Emit;
using System.Runtime.Remoting.Messaging;
using System.Transactions;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

namespace AutoCar.html
{
    public partial class employee : System.Web.UI.Page
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
                        car_div.Visible = false;
                        shift_div.Visible = false;
                        nn_div.Visible = false;
                        company_name_div.Visible = false;


                        Read.Checked = true;
                        add.Checked = true;
                        update.Checked = true;
                        delete.Checked = true;
                        //create a connection string 
                        string connectionString = "server=localhost;user id=naim;password=na.123;database=auto_car";

                        // Create a connection object
                        MySqlConnection conn = new MySqlConnection(connectionString);

                        //query to selet price  
                        string get_departments = "SELECT dept_id,dept_name from departments";
                        string get_roles = "SELECT role_id,role_name from role WHERE dept_id=1";


                        MySqlCommand cmd1 = new MySqlCommand(get_departments, conn);
                        MySqlCommand cmd2 = new MySqlCommand(get_roles, conn);


                        string dept_name;
                        int dept_id;


                        try
                        {
                            conn.Open();
                            MySqlDataReader dept_reder = cmd1.ExecuteReader();
                            while (dept_reder.Read())
                            {
                                dept_id = dept_reder.GetInt32("dept_id");
                                dept_name = dept_reder.GetString("dept_name");

                                ListItem item = new ListItem(dept_id.ToString() + "." + dept_name);
                                dept.Items.Add(item);
                            }
                            dept_reder.Close();
                            MySqlDataReader role_reder = cmd2.ExecuteReader();
                            while (role_reder.Read())
                            {

                                string role_name = role_reder.GetString("role_name");
                                int role_id = role_reder.GetInt32("role_id");

                                ListItem item = new ListItem(role_id.ToString() + "." + role_name);
                                role.Items.Add(item);
                            }


                        }
                        catch (Exception ex)
                        {
                            Response.Write(ex.Message);
                        }
                        finally
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

        protected void dept_change_selected(object sender, EventArgs e)
        {


            string dept_selected_Value = dept.SelectedValue;
            string[] dept_values = dept_selected_Value.Split('.');
            string dept_name = dept_values[1];
            int dept_id = int.Parse(dept_values[0]);

            if (dept_name.Equals("driver"))
            {
                nn_div.Visible = true;
                car_div.Visible = true;
                shift_div.Visible = true;
                company_name_div.Visible = false;

            }

            else if (dept_name.Equals("vendor"))
            {
                nn_div.Visible = false;
                car_div.Visible = false;
                shift_div.Visible = false;
                company_name_div.Visible = true;

            }

            else
            {
                nn_div.Visible = false;
                car_div.Visible = false;
                shift_div.Visible = false;
                company_name_div.Visible = false;
            }


            //create a connection string 
            string connectionString = "server=localhost;user id=naim;password=na.123;database=auto_car";

            // Create a connection object
            MySqlConnection conn = new MySqlConnection(connectionString);

            string get_roles = "SELECT role_id,role_name,per_add,per_delete,per_update,per_read" +
                " from role JOIN permissions ON role.per_id = permissions.per_id WHERE dept_id=@dept_id";

            string get_per = "SELECT per_add,per_delete,per_update,per_read" +
             " from role JOIN permissions ON role.per_id = permissions.per_id WHERE role_id=@role_id AND role_name=@role_name";

            string get_cars = "SELECT car_number,company_name from cars WHERE is_used=0";
            string get_shifts = "SELECT shift_id ,shift_details from shifts";
            MySqlCommand cmd1 = new MySqlCommand(get_roles, conn);
            MySqlCommand cmd2 = new MySqlCommand(get_per, conn);
            MySqlCommand cmd3 = new MySqlCommand(get_cars, conn);
            MySqlCommand cmd4 = new MySqlCommand(get_shifts, conn);

            try
            {
                conn.Open();
                cmd1.Parameters.AddWithValue("dept_id", dept_id);
                /*cmd1.Parameters.AddWithValue("dept_id", role_id);*/


                MySqlDataReader role_reder = cmd1.ExecuteReader();
                role.Items.Clear();
                while (role_reder.Read())
                {
                    int role_id = role_reder.GetInt32("role_id");
                    string role_name = role_reder.GetString("role_name");
                    ListItem item = new ListItem(role_id.ToString() + "." + role_name);

                    role.Items.Add(item);
                }
                role_reder.Close();

                string role_selected_Value = role.SelectedValue;
                string[] role_values = role_selected_Value.Split('.');
                int role_id_s = int.Parse(role_values[0]);
                string role_name_s = role_values[1];


                bool per_add = false;
                bool per_delete = false;
                bool per_update = false;
                bool per_read = false;

                cmd2.Parameters.AddWithValue("role_id", role_id_s);
                cmd2.Parameters.AddWithValue("role_name", role_name_s);
                MySqlDataReader per_reder = cmd2.ExecuteReader();

                while (per_reder.Read())
                {

                    per_add = per_reder.GetBoolean("per_add");
                    per_delete = per_reder.GetBoolean("per_delete");
                    per_update = per_reder.GetBoolean("per_update");
                    per_read = per_reder.GetBoolean("per_read");
                }
                per_reder.Close();
                Read.Checked = per_read;
                add.Checked = per_add;
                update.Checked = per_update;
                delete.Checked = per_delete;


                if (dept_name.Equals("driver"))
                {
                    MySqlDataReader cars_reder = cmd3.ExecuteReader();
                    while (cars_reder.Read())
                    {
                        int car_id = cars_reder.GetInt32("car_number");
                        string car_name = cars_reder.GetString("company_name");
                        ListItem item = new ListItem(car_id.ToString() + " . " + car_name);

                        car.Items.Add(item);
                    }

                    cars_reder.Close();
                    MySqlDataReader shifts_reder = cmd4.ExecuteReader();
                    while (shifts_reder.Read())
                    {
                        int shift_id = shifts_reder.GetInt32("shift_id");
                        string shift_details = shifts_reder.GetString("shift_details");
                        ListItem item = new ListItem(shift_id.ToString() + " . " + shift_details);

                        shift.Items.Add(item);
                    }

                }



            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
            finally
            {
                conn.Close();
            }


        }

        protected void role_change_selected(object sender, EventArgs e)
        {




            string role_selected_Value = role.SelectedValue;
            string[] role_values = role_selected_Value.Split('.');
            int role_id_s = int.Parse(role_values[0]);
            string role_name_s = role_values[1];

            bool per_add = false;
            bool per_delete = false;
            bool per_update = false;
            bool per_read = false;

            string connectionString = "server=localhost;user id=naim;password=na.123;database=auto_car";

            // Create a connection object
            MySqlConnection conn = new MySqlConnection(connectionString);

            string get_per = "SELECT per_add,per_delete,per_update,per_read" +
           " from role JOIN permissions ON role.per_id = permissions.per_id WHERE role_id=@role_id AND role_name=@role_name";

            MySqlCommand cmd1 = new MySqlCommand(get_per, conn);

            try
            {
                conn.Open();
                cmd1.Parameters.AddWithValue("role_id", role_id_s);
                cmd1.Parameters.AddWithValue("role_name", role_name_s);
                MySqlDataReader per_reder = cmd1.ExecuteReader();

                while (per_reder.Read())
                {

                    per_add = per_reder.GetBoolean("per_add");
                    per_delete = per_reder.GetBoolean("per_delete");
                    per_update = per_reder.GetBoolean("per_update");
                    per_read = per_reder.GetBoolean("per_read");
                }
                per_reder.Close();
                Read.Checked = per_read;
                add.Checked = per_add;
                update.Checked = per_update;
                delete.Checked = per_delete;

            }
            catch (Exception ex)
            {

                Response.Write(ex);
            }
            finally
            {
                conn.Close();
            }
        }


        protected void register_button_click(object sender, EventArgs e)
        {
            string firstname = Request.Form["firstname"];
            string lastname = Request.Form["lastname"];
            string birthdate = Request.Form["birthdate"];
            string gender = Request.Form["gender"];
            string email = Request.Form["email"];
            string password = Request.Form["password"];
            string salary = Request.Form["salary"];


            error.Text = "";
            success.Text="";

            if (firstname != null
                && lastname != null
                && birthdate != null
                && gender != null
                && email != null
                && password != null
                && salary != null)
            {

                string connectionString = "server=localhost;user id=naim;password=na.123;database=auto_car";

                // Create a connection object
                MySqlConnection conn = new MySqlConnection(connectionString);

                //query to save the customer data into user table and customer table in serial

                //get dept_name and dept_id
                string dept_selected_Value = dept.SelectedValue;
                string[] dept_values = dept_selected_Value.Split('.');
                string dept_name = dept_values[1];
                int dept_id = int.Parse(dept_values[0]);

                string role_selected_Value = role.SelectedValue;
                string[] role_values = role_selected_Value.Split('.');
                int role_id_s = int.Parse(role_values[0]);
                string role_name_s = role_values[1];

                bool per_add = add.Checked;
                bool per_delete = delete.Checked;
                bool per_update = update.Checked;
                bool per_read = Read.Checked;
                int per_id = 16;


                string get_per_id = "select per_id from permissions where per_add=@per_add AND per_delete=@per_delete " +
                    "AND per_update=@per_update AND per_read=@per_read";

                MySqlCommand cmd1 = new MySqlCommand(get_per_id, conn);



                try
                {
                    conn.Open();
                    cmd1.Parameters.AddWithValue("@per_add", per_add);
                    cmd1.Parameters.AddWithValue("@per_delete", per_delete);
                    cmd1.Parameters.AddWithValue("@per_update", per_update);
                    cmd1.Parameters.AddWithValue("@per_read", per_read);

                    MySqlDataReader per_reader = cmd1.ExecuteReader();

                    while (per_reader.Read())
                    {
                        per_id = per_reader.GetInt32("per_id");

                    }

                }
                catch (Exception ex)
                {

                    error.Text = ex.Message;
                }
                finally
                {
                    conn.Close();
                }


                if (!dept_name.Equals("driver") && !dept_name.Equals("vendor"))
                {


                    string query = " INSERT INTO users (first_name, last_name, birth_date,gender,email,password,is_verfied,is_emp)" +
                    "VALUES (@first_name,@last_name,@birth_date,@gender,@email,@password,@v,@e);" +
                    "INSERT INTO employees(start_date,salary,user_id,dept_id,role_id,per_id,is_active) VALUES(@start_date,@salary,( SELECT MAX(users_id) FROM users )," +
                    "@dept_id,@role_id,@per_id,@is_active);";

                    MySqlCommand cmd = new MySqlCommand(query, conn);

                    cmd.Parameters.AddWithValue("@first_name", firstname);
                    cmd.Parameters.AddWithValue("@last_name", lastname);
                    cmd.Parameters.AddWithValue("@birth_date", birthdate);
                    cmd.Parameters.AddWithValue("@gender", gender);
                    cmd.Parameters.AddWithValue("@email", email);
                    cmd.Parameters.AddWithValue("@password", password);
                    cmd.Parameters.AddWithValue("@v", 0);
                    cmd.Parameters.AddWithValue("@e", 1);
                    cmd.Parameters.AddWithValue("@start_date", DateTime.Now);
                    cmd.Parameters.AddWithValue("@salary", salary);
                    cmd.Parameters.AddWithValue("@dept_id", dept_id);
                    cmd.Parameters.AddWithValue("@role_id", role_id_s);
                    cmd.Parameters.AddWithValue("@per_id", per_id);
                    cmd.Parameters.AddWithValue("@is_active", 1);

                    try
                    {
                        conn.Open();

                        cmd.ExecuteNonQuery();
                        success.Text = "Employee Inserted Successfully";
                    }
                    catch (Exception ex)
                    {

                        error.Text = ex.Message;
                    }
                    finally
                    {
                        conn.Close();
                    }


                }
                else if (dept_name.Equals("driver"))
                {
                    string nationalnumber = Request.Form["nationalnumber"];

                    if (nationalnumber != null)
                    {
                        string car_selected_Value = car.SelectedValue;
                        string[] car_values = car_selected_Value.Split('.');
                        string car_name = car_values[1];
                        int car_id = int.Parse(car_values[0]);

                        string shift_selected_Value = shift.SelectedValue;
                        string[] shift_values = shift_selected_Value.Split('.');
                        int shift_id = int.Parse(shift_values[0]);
                        string shift_name = shift_values[1];

                        string query = " INSERT INTO users (first_name, last_name, birth_date,gender,email,password,is_verfied,is_emp)" +
                                            "VALUES (@first_name,@last_name,@birth_date,@gender,@email,@password,@v,@e);" +
                                            "INSERT INTO employees (start_date,salary,user_id,dept_id,role_id,per_id,is_active) VALUES(@start_date,@salary,( SELECT MAX(users_id) FROM users )," +
                                            "@dept_id,@role_id,@per_id,@is_active);" +
                                            "INSERT INTO drivers(nn,emp_id,car_id,shift_id,is_working,is_active,lang,lant) VALUES(@nn,( SELECT MAX(emp_id) FROM employees ),@car_id,@shift_id,@is_working,1,@lang,@lant);";

                        MySqlCommand cmd = new MySqlCommand(query, conn);

                        cmd.Parameters.AddWithValue("@first_name", firstname);
                        cmd.Parameters.AddWithValue("@last_name", lastname);
                        cmd.Parameters.AddWithValue("@birth_date", birthdate);
                        cmd.Parameters.AddWithValue("@gender", gender);
                        cmd.Parameters.AddWithValue("@email", email);
                        cmd.Parameters.AddWithValue("@password", password);
                        cmd.Parameters.AddWithValue("@v", 0);
                        cmd.Parameters.AddWithValue("@e", 1);
                        cmd.Parameters.AddWithValue("@start_date", DateTime.Now);
                        cmd.Parameters.AddWithValue("@salary", salary);
                        cmd.Parameters.AddWithValue("@dept_id", dept_id);
                        cmd.Parameters.AddWithValue("@role_id", role_id_s);
                        cmd.Parameters.AddWithValue("@per_id", per_id);
                        cmd.Parameters.AddWithValue("@is_active", 1);
                        cmd.Parameters.AddWithValue("@nn", nationalnumber);
                        cmd.Parameters.AddWithValue("@car_id", car_id);
                        cmd.Parameters.AddWithValue("@shift_id", shift_id);
                        cmd.Parameters.AddWithValue("@is_working", 0);
                        cmd.Parameters.AddWithValue("@lang", null);
                        cmd.Parameters.AddWithValue("@lant", null);

                        try
                        {
                            conn.Open();

                            cmd.ExecuteNonQuery();
                            success.Text = "Employee Inserted Successfully";
                        }
                        catch (Exception ex)
                        {

                            error.Text = ex.Message;
                        }
                        finally
                        {
                            conn.Close();
                        }
                    }

                }
                else if (dept_name.Equals("vendor"))
                {
                    string companyname = Request.Form["companyname"];
                    if (companyname != null)
                    {
                        string query = " INSERT INTO users (first_name, last_name, birth_date,gender,email,password,is_verfied,is_emp)" +
                    "VALUES (@first_name,@last_name,@birth_date,@gender,@email,@password,@v,@e);" +
                    "INSERT INTO employees(start_date,salary,user_id,dept_id,role_id,per_id,is_active) VALUES(@start_date,@salary,( SELECT MAX(users_id) FROM users )," +
                    "@dept_id,@role_id,@per_id,@is_active);" +
                    "INSERT INTO vendors(emp_id,company_name) VALUES(( SELECT MAX(emp_id) FROM employees ),@company_name);";

                        MySqlCommand cmd = new MySqlCommand(query, conn);

                        cmd.Parameters.AddWithValue("@first_name", firstname);
                        cmd.Parameters.AddWithValue("@last_name", lastname);
                        cmd.Parameters.AddWithValue("@birth_date", birthdate);
                        cmd.Parameters.AddWithValue("@gender", gender);
                        cmd.Parameters.AddWithValue("@email", email);
                        cmd.Parameters.AddWithValue("@password", password);
                        cmd.Parameters.AddWithValue("@v", 0);
                        cmd.Parameters.AddWithValue("@e", 1);
                        cmd.Parameters.AddWithValue("@start_date", DateTime.Now);
                        cmd.Parameters.AddWithValue("@salary", salary);
                        cmd.Parameters.AddWithValue("@dept_id", dept_id);
                        cmd.Parameters.AddWithValue("@role_id", role_id_s);
                        cmd.Parameters.AddWithValue("@per_id", per_id);
                        cmd.Parameters.AddWithValue("@is_active", 1);
                        cmd.Parameters.AddWithValue("@company_name", companyname);

                        try
                        {
                            conn.Open();

                            cmd.ExecuteNonQuery();
                            success.Text = "Employee Inserted Successfully";
                        }
                        catch (Exception ex)
                        {

                            error.Text = ex.Message;
                        }
                        finally
                        {
                            conn.Close();
                        }

                    }

                }

          

            }
            else
            {
                error.Text = "You should To fill all Fileds !!";
            }

        }


    }
}