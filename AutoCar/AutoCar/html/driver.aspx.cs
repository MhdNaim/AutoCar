using System;
using System.Collections.Generic;
using System.Data;
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
using Google.Protobuf.WellKnownTypes;
using MySql.Data.MySqlClient;
using MySql.Data.Types;
using static System.Net.Mime.MediaTypeNames;

namespace AutoCar.html
{
    public partial class driver : System.Web.UI.Page
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
                        Session["dept_name"] != null && !Session["dept_name"].ToString().Equals("driver"))
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
                        //query to get drivers info is_wroking and strat_shift end_shift
                        string connectionString = "server=localhost;user id=naim;password=na.123;database=auto_car";

                        // Create a connection object
                        MySqlConnection conn = new MySqlConnection(connectionString);
                        //Query to get orders details from orders_log  with State="NOW"
                        string get_order_id = "select orders_log.order_id,orders_log.order_start_date,destnation_name,distance_km,total_cost from orders_log JOIN orders ON orders_log.order_id=orders.order_id where order_state=@state";

                        //query to select driver   
                        string get_driver_info = "select is_working,start_shift,end_shift from drivers JOIN shifts ON drivers.shift_id = shifts.shift_id WHERE driver_id=@driver_id";

                        //get the driver order
                        string get_driver_order = "SELECT orders_log.order_id,cust_lang,cust_lant,destnation_name,distance_km,total_cost,phone_number,first_name,last_name from " +
                            "orders_log JOIN orders ON orders_log.order_id=orders.order_id JOIN customers ON orders.customer_id=customers.cust_id JOIN users " +
                            "ON customers.user_id=users.users_id WHERE orders_log.driver_id=@driver_id AND orders_log.order_state='processing';";

                        string get_driver_trip = "SELECT  orders_log.order_id,start_trip,destnation_name,distance_km,total_cost,phone_number,first_name,last_name from " +
                           "orders_log JOIN orders ON orders_log.order_id=orders.order_id JOIN customers ON orders.customer_id=customers.cust_id JOIN users " +
                           "ON customers.user_id=users.users_id WHERE orders_log.driver_id=@driver_id AND orders_log.order_state='start';";

                        //get order destination and price 
                        MySqlCommand cmd1 = new MySqlCommand(get_order_id, conn);
                        MySqlCommand cmd2 = new MySqlCommand(get_driver_info, conn);
                        MySqlCommand cmd3 = new MySqlCommand(get_driver_order, conn);
                        MySqlCommand cmd4 = new MySqlCommand(get_driver_trip, conn);
                        cmd1.Parameters.AddWithValue("state", "NEW");
                        //current time to compire wuth driver's shift
                        int order_id;
                        string destnation_name;
                        float distance_km;
                        float total_cost;
                        int order_counter = 0;
                        Boolean new_order_exist;
                        Boolean processing_order_exist;
                        Boolean trip_exist = false;
                        DateTime order_start_date = DateTime.Now;
                        DateTime currentTime = DateTime.Now;
                        Boolean is_working = false;
                        string start_s = "00:00:00";
                        string end_s = "23:00:00";
                        int driver_id = int.Parse(Session["driver_id"].ToString());

                        try
                        {
                            conn.Open();


                            cmd3.Parameters.AddWithValue("driver_id", driver_id);
                            MySqlDataReader reader_driver_order = cmd3.ExecuteReader();

                            processing_order_exist = reader_driver_order.HasRows;
                            /// if has processing order
                            if (processing_order_exist)
                            {
                                done_div.Visible = false;
                                List<Tuple<string, float, float, string, string, string, int>> data = new List<Tuple<string, float, float, string, string, string, int>>();
                                string custlant;
                                string custlang;
                                string firstname;
                                string lastname;
                                string phoneNumber;
                                while (reader_driver_order.Read())
                                {
                                    order_id = reader_driver_order.GetInt32("order_id");
                                    custlang = reader_driver_order.GetString("cust_lang");
                                    custlant = reader_driver_order.GetString("cust_lant");
                                    phoneNumber = reader_driver_order.GetString("phone_number");
                                    firstname = reader_driver_order.GetString("first_name");
                                    lastname = reader_driver_order.GetString("last_name");
                                    destnation_name = reader_driver_order.GetString("destnation_name");
                                    distance_km = reader_driver_order.GetFloat("distance_km");
                                    total_cost = reader_driver_order.GetFloat("total_cost");
                                    data.Add(Tuple.Create(destnation_name, distance_km, total_cost, firstname, lastname, phoneNumber, order_id));
                                }

                                if (reader_driver_order.HasRows)
                                {

                                    Repeater1.DataSource = data;
                                    Repeater1.DataBind();


                                }




                               
                            }




                            // don' has processing order we will see the new one and if the driver can take it 
                            else
                            {
                                /// check for order that driver is doing now 
                                reader_driver_order.Close();
                                cmd4.Parameters.AddWithValue("driver_id", driver_id);
                                MySqlDataReader reader_trip_exist = cmd4.ExecuteReader();
                                trip_exist = reader_trip_exist.HasRows;

                                if (trip_exist)
                                {
                                   
                                    DateTime start_trip_time = DateTime.Now;
                                    string fullname;
                                    string order_time;
                                    string phone_number;
                                    string first_name;
                                    string last_name;
                                    List<Tuple<string, float, float, string, string, string, int>> data = new List<Tuple<string, float, float, string, string, string, int>>();

                                    while (reader_trip_exist.Read())
                                    {
                                        order_counter++;
                                        order_id = reader_trip_exist.GetInt32("order_id");
                                        destnation_name = reader_trip_exist.GetString("destnation_name");
                                        distance_km = reader_trip_exist.GetFloat("distance_km");
                                        total_cost = reader_trip_exist.GetFloat("total_cost");
                                        phone_number = reader_trip_exist.GetString("phone_number");
                                        first_name = reader_trip_exist.GetString("first_name");
                                        last_name = reader_trip_exist.GetString("last_name");
                                        start_trip_time = reader_trip_exist.GetDateTime("start_trip");
                                        TimeSpan timeSpan = currentTime.Subtract(start_trip_time);
                                        int hoursDifference = timeSpan.Hours;
                                        int minutesDifference = timeSpan.Minutes;
                                        fullname = first_name + " " + last_name;
                                        order_time = hoursDifference + " Hour and " + minutesDifference+ "minutes";
                                        data.Add(Tuple.Create(destnation_name, distance_km, total_cost, fullname, phone_number, order_time, order_id));


                                    }
                                    done_div.Visible = true;
                                    orders_num.InnerText = order_counter.ToString();
                                    Repeater3.DataSource = data;
                                    Repeater3.DataBind();



                                   
                                }

                                else
                                {
                                    reader_trip_exist.Close();
                                    MySqlDataReader reader1 = cmd1.ExecuteReader();
                                    new_order_exist = reader1.HasRows;
                                    //check if there is new  orders 
                                    if (new_order_exist)
                                    {
                                        //get order_id from orders_log 


                                        List<Tuple<string, float, float, int, int, int, int>> data = new List<Tuple<string, float, float, int, int, int, int>>();
                                        while (reader1.Read())
                                        {
                                            order_counter++;
                                            order_id = reader1.GetInt32("order_id");
                                            order_start_date = reader1.GetDateTime("order_start_date");
                                            destnation_name = reader1.GetString("destnation_name");
                                            distance_km = reader1.GetFloat("distance_km");
                                            total_cost = reader1.GetFloat("total_cost");
                                            TimeSpan timeSpan = currentTime.Subtract(order_start_date);
                                            int daysDifference = timeSpan.Days;
                                            int hoursDifference = timeSpan.Hours;
                                            int minutesDifference = timeSpan.Minutes;


                                            data.Add(Tuple.Create(destnation_name, distance_km, total_cost, order_id, daysDifference, hoursDifference, minutesDifference));
                                        }


                                        reader1.Close();
                                        cmd2.Parameters.AddWithValue("driver_id", driver_id);
                                        MySqlDataReader reader2 = cmd2.ExecuteReader();
                                        while (reader2.Read())
                                        {
                                            is_working = reader2.GetBoolean("is_working");
                                            start_s = reader2.GetString("start_shift");
                                            end_s = reader2.GetString("end_shift");
                                        }
                                        DateTime start_shift = DateTime.ParseExact(start_s, "HH:mm:ss", CultureInfo.InvariantCulture);
                                        DateTime end_shift = DateTime.ParseExact(end_s, "HH:mm:ss", CultureInfo.InvariantCulture);

                                       

                                        if (is_working == false && start_shift < currentTime && end_shift > currentTime)
                                        {
                                            orders_num.InnerText = order_counter.ToString();
                                            Repeater2.DataSource = data;
                                            Repeater2.DataBind();
                                        }
                                        reader2.Close();

                                    }
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
        protected void take_order_click(object sender, EventArgs e)
        {
            Button take_order = sender as Button;
            int order_id = int.Parse(take_order.CommandArgument);
            string connectionString = "server=localhost;user id=naim;password=na.123;database=auto_car";
            // Create a connection object
            MySqlConnection conn = new MySqlConnection(connectionString);
            //Query to update the driver id
            string update_driver_id = "UPDATE orders_log SET orders_log.driver_id = @driver_id ,orders_log.order_state='processing'  WHERE orders_log.order_id = @order_id;";
            string update_driver_is_working = "UPDATE drivers SET is_working = 1 WHERE driver_id =@driver_id";
            MySqlCommand cmd1 = new MySqlCommand(update_driver_id, conn);
            MySqlCommand cmd2 = new MySqlCommand(update_driver_is_working, conn);

            try
            {
                conn.Open();
                if (Session["driver_id"] != null)
                {
                    int driver_id = int.Parse(Session["driver_id"].ToString());
                    cmd1.Parameters.AddWithValue("@driver_id", driver_id);
                    cmd2.Parameters.AddWithValue("@driver_id", driver_id);

                }
                cmd1.Parameters.AddWithValue("@order_id", order_id);
                cmd1.ExecuteNonQuery();
                cmd2.ExecuteNonQuery();
                Response.Redirect(Request.Url.ToString());


            }
            catch (Exception ex)
            {
                Response.Write(ex.Message + "\r\n");

            }
            finally
            {
                conn.Close();
            }

        }

        protected void start_order_click(object sender, EventArgs e)
        {

            Button start_trip = sender as Button;
            int order_id = int.Parse(start_trip.CommandArgument);

            trip_div.Visible = false;
            string connectionString = "server=localhost;user id=naim;password=na.123;database=auto_car";
            // Create a connection object
            MySqlConnection conn = new MySqlConnection(connectionString);
            string update_start_trip_date = "UPDATE orders_log SET start_trip =@start_trip_date ,order_state='start' WHERE orders_log.order_id=@order_id";

            MySqlCommand cmd1 = new MySqlCommand(update_start_trip_date, conn);
           
            DateTime currentTime = DateTime.Now;
            int driver_id = int.Parse(Session["driver_id"].ToString());
 
            List<Tuple<string, float, float, string, string, string, int>> data = new List<Tuple<string, float, float, string, string, string, int>>();
            try
            {
                conn.Open();
                cmd1.Parameters.AddWithValue("start_trip_date", currentTime);
                cmd1.Parameters.AddWithValue("order_id", order_id);
                cmd1.ExecuteNonQuery();

                    Response.Redirect(Request.Url.ToString());

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

        protected void done_order_click(object sender, EventArgs e)
        {

            Button done_trip = sender as Button;
            int order_id = int.Parse(done_trip.CommandArgument);
            int driver_id = int.Parse(Session["driver_id"].ToString());

            trip_div.Visible = false;
            ///
            done_div.Visible = true;



            string connectionString = "server=localhost;user id=naim;password=na.123;database=auto_car";
            // Create a connection object
            MySqlConnection conn = new MySqlConnection(connectionString);
            string update_start_trip_date = "UPDATE orders_log SET order_state = 'done' , order_end_date=@order_end_date WHERE order_id=@order_id";
            string update_driver_is_working = "UPDATE drivers SET is_working = 0 WHERE driver_id=@driver_id";
            MySqlCommand cmd1 = new MySqlCommand(update_start_trip_date, conn);
            MySqlCommand cmd2 = new MySqlCommand(update_driver_is_working, conn);

            try
            {
                conn.Open();
                cmd1.Parameters.AddWithValue("order_id", order_id);
                cmd1.Parameters.AddWithValue("order_end_date", DateTime.Now);
                cmd1.ExecuteNonQuery();
                cmd2.Parameters.AddWithValue("driver_id", driver_id);
                cmd2.ExecuteNonQuery();
                Response.Redirect(Request.Url.ToString());

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

    }
}