using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace Form
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["Preson"].ConnectionString;
        
        //private object txtCunrtyId;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                btnUpDate.Visible = false;
                btnSubmit.Enabled = true;
                //btnUpDate.Visible = false;
                bindCountry();
                DataDisplay();
                ddlState.Enabled = false;
                ddlCity.Enabled = false;

            }
        }
        //first name 
        protected void txtFirstName_TextChanged(object sender, EventArgs e)
        {

        }

        // middlename
        protected void txtMiddleName_TextChanged(object sender, EventArgs e)
        {

        }
        //lastname
        protected void txtLastName_TextChanged(object sender, EventArgs e)
        {

        }
        
        protected void txtMoblieNumber_TextChanged(object sender, EventArgs e)
        {

        }
        protected void txtAddress_TextChanged(object sender, EventArgs e)
        {

        }

        public void bindCountry()
        {
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("spGetCountry", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            cmd.CommandType = CommandType.StoredProcedure;
            DataTable dt = new DataTable();
            sda.Fill(dt);
            ddlCountry.DataSource = dt;
            ddlCountry.DataValueField = "CountryId";
            ddlCountry.DataTextField = "CountryName";
            ddlCountry.DataBind();
            ddlCountry.Items.Insert(0, new ListItem("Select Country", "0"));

        }

        protected void ddlCountry_SelectedIndexChanged1(object sender, EventArgs e)
        {
            if (ddlCountry.SelectedValue != "0")
            {
                SqlConnection con = new SqlConnection(connectionString);
                SqlCommand cmd = new SqlCommand("spGetStateByCountry", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                cmd.CommandType = CommandType.StoredProcedure;
                DataTable dt = new DataTable();
                cmd.Parameters.AddWithValue("@CountryId", ddlCountry.SelectedItem.Value);
                sda.Fill(dt);
                ddlState.DataSource = dt;
                ddlState.DataValueField = "StateId";
                ddlState.DataTextField = "StateName";
                ddlState.DataBind();
                ddlState.Items.Insert(0, new ListItem("Select State", "0"));
                ddlState.Enabled = true;
                ddlCity.Items.Clear();

            }
            else
            {
                ddlState.Enabled = false;
                ddlState.SelectedValue = "0";
                ddlCity.Enabled = false;
                ddlCity.SelectedValue = "0";
            }
        }

        protected void ddlState_SelectedIndexChanged1(object sender, EventArgs e)
        {
            if (ddlState.SelectedValue != "0")
            {
                SqlConnection con = new SqlConnection(connectionString);
                SqlCommand cmd = new SqlCommand("spGetCityByStateId", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                cmd.CommandType = CommandType.StoredProcedure;
                DataTable dt = new DataTable();
                cmd.Parameters.AddWithValue("@StateId", ddlState.SelectedItem.Value);
                sda.Fill(dt);
                ddlCity.DataSource = dt;
                ddlCity.DataValueField = "CityId";
                ddlCity.DataTextField = "CityName";
                ddlCity.DataBind();
                ddlCity.Items.Insert(0, new ListItem("Select City", "0"));
                ddlCity.Enabled = true;

            }
            else
            {
                ddlCity.Enabled = false;
                ddlCity.SelectedValue = "0";
            }
        }

        protected void txtPincode_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtDate_TextChanged(object sender, EventArgs e)
        {

        }

        protected void rblGender_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void cblHobbies_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        // terms and condition
        protected void chkIsTermsAccept_CheckedChanged(object sender, EventArgs e)
        {
            if (chkIsTermsAccept.Checked)
            {
                btnSubmit.Enabled = true;
            }
            else
            {
                btnSubmit.Enabled = false;
            }
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            SqlConnection db = new SqlConnection(connectionString);
            string insert = "sppersonCrud";
            db.Open();
            SqlCommand cmd = new SqlCommand(insert, db);
            cmd.Parameters.AddWithValue("@FirstName", txtFirstName.Text);
            cmd.Parameters.AddWithValue("@MiddleName", txtMiddleName.Text);
            cmd.Parameters.AddWithValue("@LastName", txtLastName.Text);
            cmd.Parameters.AddWithValue("@MoblieNumber", txtMoblieNumber.Text);
            cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
            cmd.Parameters.AddWithValue("@Country", ddlCountry.SelectedValue);
            cmd.Parameters.AddWithValue("@State", ddlState.SelectedValue);
            cmd.Parameters.AddWithValue("@City", ddlCity.SelectedValue);
            cmd.Parameters.AddWithValue("@Pincode", txtPincode.Text);
            cmd.Parameters.AddWithValue("@DateOfBrith", txtDate.Text);
            cmd.Parameters.AddWithValue("@Gender", rblGender.SelectedItem.Value);
            cmd.Parameters.AddWithValue("@Hobbies", string.Join(",", cblHobbies.Items.OfType<ListItem>().Where(r => r.Selected).Select(r => r.Text)));
            cmd.Parameters.AddWithValue("@TermsAndConditions", chkIsTermsAccept.Checked);
            cmd.Parameters.AddWithValue("@DMLFlag", "I");
            cmd.CommandType = CommandType.StoredProcedure;
            

            cmd.ExecuteNonQuery();
            db.Close();

            Response.Redirect(Request.Url.AbsoluteUri);
        }
        //gridview bind
        private void DataDisplay()
        {
            SqlConnection con = new SqlConnection(connectionString);
            string select = "sppersonSelected";
            SqlCommand cmd = new SqlCommand(select, con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            con.Open();
            sda.Fill(dt);
            grvDataDisplay.DataSource = dt;
            grvDataDisplay.DataBind();
            con.Close();
        }

        protected void grvDataDisplay_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grvDataDisplay.EditIndex = e.NewEditIndex;
            DataDisplay();
        }

        // Gridview in button EDIT and DELETE 
        protected void grvDataDisplay_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditRecord")
            {
                int Pid = Convert.ToInt32(e.CommandArgument);
                FillTheData(Pid);
                btnUpDate.Visible = true;  // button update visible
                btnSubmit.Visible = false; // button submit is not visible 
            }
            else if (e.CommandName == "DeleteRecord")
            {
                int Pid = Convert.ToInt32(e.CommandArgument);
                DeleteTheDate(Pid);
            }
        }
        // Detele Record 
        private void DeleteTheDate(int Pid) 
        {
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("sppersonDelete", con);
            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            cmd.CommandType = CommandType.StoredProcedure;
            DataTable dt = new DataTable();
            cmd.Parameters.AddWithValue("@Pid", Pid);
            cmd.ExecuteNonQuery();
            sda.Fill(dt);
            con.Close();

            DataDisplay();
        }
        //open the data form
        private void FillTheData(int Pid)
        {
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("sppersonSelectedbyId", con);
            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            cmd.CommandType = CommandType.StoredProcedure;
            DataTable dt = new DataTable();
            DataSet ds = new DataSet();
            cmd.Parameters.AddWithValue("@Pid", Pid);
            sda.Fill(dt);
            con.Close();
            if (dt.Rows.Count > 0)
            {
                Databind(dt.Rows[0]);
            }
        }
        // Gridview in Edit
        protected void Databind(DataRow row)
        {
            hdnPid.Value = Convert.ToString(row["Pid"]);
            txtFirstName.Text = Convert.ToString(row["FirstName"]);
            txtMiddleName.Text = Convert.ToString(row["MiddleName"]);
            txtLastName.Text = Convert.ToString(row["LastName"]);
            txtMoblieNumber.Text = Convert.ToString(row["MoblieNumber"]);
            txtAddress.Text = Convert.ToString(row["Address"]);
            txtPincode.Text = Convert.ToString(row["Pincode"]);

            //------------

            ddlCountry.SelectedValue = Convert.ToString(row["Country"]);
            ddlCountry_SelectedIndexChanged1(null, null);

            ddlState.SelectedValue = Convert.ToString(row["State"]);
            ddlState_SelectedIndexChanged1(null, null);

            ddlCity.SelectedValue = Convert.ToString(row["City"]);

            txtDate.Text = Convert.ToDateTime(row["DateOfBrith"]).ToString("yyyy-MM-dd");
            
            rblGender.SelectedValue = Convert.ToString(row["Gender"]);

         
            string[] array = Convert.ToString(row["Hobbies"]).Split(',');
            
            for (int i = 0; i < cblHobbies.Items.Count; i++)
            {
                cblHobbies.Items[i].Selected = false;
                for (int k = 0; k < array.Length; k++)
                {
                    if (cblHobbies.Items[i].Text == array[k])
                    {
                        cblHobbies.Items[i].Selected = true;
                    }
                }
            }  
            //-----------
        }


        //this code is Record Upadte 
        protected void btnUpDate_Click(object sender, EventArgs e)
        {
            SqlConnection db = new SqlConnection(connectionString);
            string update = "sppersonUpdate";
            db.Open();
            SqlCommand cmd = new SqlCommand(update, db);
            
            cmd.Parameters.AddWithValue("@Pid", hdnPid.Value);
            cmd.Parameters.AddWithValue("@FirstName", txtFirstName.Text);
            cmd.Parameters.AddWithValue("@MiddleName", txtMiddleName.Text);
            cmd.Parameters.AddWithValue("@LastName", txtLastName.Text);
            cmd.Parameters.AddWithValue("@MoblieNumber", txtMoblieNumber.Text);
            cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
            cmd.Parameters.AddWithValue("@Country", ddlCountry.SelectedValue);
            cmd.Parameters.AddWithValue("@State", ddlState.SelectedValue);
            cmd.Parameters.AddWithValue("@City", ddlCity.SelectedValue);
            cmd.Parameters.AddWithValue("@Pincode", txtPincode.Text);
            cmd.Parameters.AddWithValue("@DateOfBrith", txtDate.Text);
            cmd.Parameters.AddWithValue("@Gender", rblGender.SelectedItem.Value);
            cmd.Parameters.AddWithValue("@Hobbies", string.Join(",", cblHobbies.Items.OfType<ListItem>().Where(r => r.Selected).Select(r => r.Text)));
            cmd.CommandType = CommandType.StoredProcedure;

            
            cmd.ExecuteNonQuery();
            db.Close();

            Response.Redirect(Request.Url.AbsoluteUri);
        }

        protected void btnAddnew_Click(object sender, EventArgs e)
        {
            btnUpDate.Visible = false;
        }
    }
}