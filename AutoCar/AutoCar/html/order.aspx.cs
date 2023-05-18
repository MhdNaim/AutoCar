using System;
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
    public partial class order : System.Web.UI.Page
    {
         static int cost_per_km;
        protected void Page_Load(object sender, EventArgs e)
        {
       
            if (!IsPostBack)
            {
                HttpCookie auth = new HttpCookie("userauth");
                auth = Request.Cookies[auth.Name];

                if (auth != null)
                {
                    if (Session["is_emp"] != null && Session["is_emp"].ToString().Equals("True"))
                    {
                        Response.Redirect("./error404.aspx");
                    }
                    else
                    {
                        //create a connection string 
                        string connectionString = "server=localhost;user id=naim;password=na.123;database=auto_car";

                        // Create a connection object
                        MySqlConnection conn = new MySqlConnection(connectionString);

                        //query to selet price  
                        string get_price = "SELECT cost from order_properties where type=@type";


                        MySqlCommand cmd = new MySqlCommand(get_price, conn);
                        cmd.Parameters.AddWithValue("type", "normal");


                        try
                        {
                            conn.Open();
                            MySqlDataReader reader = cmd.ExecuteReader();
                            while (reader.Read())
                            {
                                cost_per_km = reader.GetInt32("cost");
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


                        select_place.Visible = true;
                        cost.InnerText = "We Take " + cost_per_km.ToString() + " SYP For 1 KM";
                    }


                }
                else
                {
                    // select_place.Visible = false;
                    Response.Redirect("./login.aspx");
                }
            }
        }



        protected void confirm_order_click(object sender, EventArgs e)
        {
            int cust_id = 0;
            string c_lang = cust_lang.Value;
            string c_lant = cust_lant.Value;
            string d_lang = dest_lang.Value;
            string d_lant = dest_lant.Value;
            string destnatoin_name = destination.Value;
            float dis = float.Parse(distance.Value,NumberStyles.Number);
            float total_cost = (dis * cost_per_km);
            
            if (Session["cust_id"] != null)
            {
                cust_id = int.Parse(Session["cust_id"].ToString());
            }

          
            //create a connection string 
            string connectionString = "server=localhost;user id=naim;password=na.123;database=auto_car";

            // Create a connection object
            MySqlConnection conn = new MySqlConnection(connectionString);

            //query to selet price  
            string insert_order = "insert into orders(customer_id,cust_lang,cust_lant,dest_lang,dest_lant,destnation_name,distance_km,price,total_cost)" +
                "VALUES(@cust_id,@cust_lang,@cust_lant,@dest_lang,@dest_lant,@destnation_name,@distance_km,@price,@total_cost);";


            MySqlCommand cmd = new MySqlCommand(insert_order, conn);
            cmd.Parameters.AddWithValue("cust_id", cust_id);
            cmd.Parameters.AddWithValue("cust_lang", c_lang);
            cmd.Parameters.AddWithValue("cust_lant", c_lant);
            cmd.Parameters.AddWithValue("dest_lang", d_lang);
            cmd.Parameters.AddWithValue("dest_lant", d_lant);
            cmd.Parameters.AddWithValue("destnation_name", destnatoin_name);
            cmd.Parameters.AddWithValue("distance_km", dis);
            cmd.Parameters.AddWithValue("price", cost_per_km);
            cmd.Parameters.AddWithValue("total_cost", total_cost);
            price.Text = "6000";

            try
            {
                conn.Open();
                cmd.ExecuteNonQuery();
                

            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
                error.InnerText = ex.Message;
            }
            finally
            {
                conn.Close();
            }
        }
    }








}