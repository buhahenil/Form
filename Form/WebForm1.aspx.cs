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
        private string con = ConfigurationManager.ConnectionStrings["Preson"].ConnectionString;


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                btnSubmit.Enabled = true;
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

        protected void ddlCountry_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                SqlConnection con = new SqlConnection(@"Data Source =.; Initial Catalog = Henil; Integrated Security = True");
                SqlCommand cmd = new SqlCommand("select * from tblCountry", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                ddlState.DataSource = dt;
                ddlState.DataBind();

            }
        }

        protected void ddlState_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlState.Items.Clear();
            ddlState.Items.Add("Select State");

            SqlConnection con = new SqlConnection(@"Data Source =.; Initial Catalog = Henil; Integrated Security = True");
            SqlCommand cmd = new SqlCommand("select * from tblState where CountryId=" + ddlState.SelectedItem.Value, con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            ddlCity.DataSource = dt;
            ddlCity.DataBind();
        }

        protected void ddlCity_SelectedIndexChanged(object sender, EventArgs e)    
        {
            ddlCity.Items.Clear();
            ddlCity.Items.Add("Select State");

            SqlConnection con = new SqlConnection(@"Data Source=.;Initial Catalog=Henil;Integrated Security=True");
            SqlCommand cmd = new SqlCommand("select * from tblCity where StateId=" + ddlCity.SelectedItem.Value, con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);

            ddlCity.DataSource = dt;
            ddlCity.DataBind();
        }

        protected void txtPincode_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtDate_TextChanged(object sender, EventArgs e)
        {

        }

        protected void rblGender_SelectedIndexChanged(object sender, EventArgs e)
        {
            //txtGender.Text = rblGender.SelectedValue;
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
            SqlConnection db = new SqlConnection(con);
            
            string insert = "sppersonCrud";
            db.Open();
            SqlCommand cmd = new SqlCommand(insert, db);
            cmd.Parameters.AddWithValue("@FirstName", txtFirstName.Text);
            cmd.Parameters.AddWithValue("@MiddleName", txtMiddleName.Text);
            cmd.Parameters.AddWithValue("@LastName", txtLastName.Text);
            cmd.Parameters.AddWithValue("@MoblieNumber", txtMoblieNumber.Text);
            cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
            cmd.Parameters.AddWithValue("@Country",ddlCountry.DataSource);
            cmd.Parameters.AddWithValue("@State",ddlState.DataSource);
            cmd.Parameters.AddWithValue("@City", ddlCity.DataSource);
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