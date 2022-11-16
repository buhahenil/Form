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
        private object txtCunrtyId;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                btnSubmit.Enabled = true;
                bindCountry();
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
        // moblie number
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
            }
            else
            {
                ddlState.Enabled = false;
                ddlState.SelectedValue = "0";
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
            cmd.Parameters.AddWithValue("@Gendar", rblGender.SelectedValue);
            cmd.Parameters.AddWithValue("@Hobbies", string.Join(",", cblHobbies.Items.OfType<ListItem>().Where(r => r.Selected).Select(r => r.Text)));
            cmd.Parameters.AddWithValue("@DMLFlag", "I");
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.ExecuteNonQuery();
            db.Close();
        }
    }
}