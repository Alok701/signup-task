using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;

public partial class Login : System.Web.UI.Page
{
    string conString = ConfigurationManager.ConnectionStrings["Myselfsam"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (FileUpload1.PostedFile != null)
        {
            try
            {
                string str = FileUpload1.FileName;
                FileUpload1.PostedFile.SaveAs(Server.MapPath("~/AdharImg/" + str));


                string str2 = FileUpload2.FileName;
                FileUpload2.PostedFile.SaveAs(Server.MapPath("~/PanImage/" + str2));



                string EmpAdharImageImgName = Path.GetFileName(FileUpload1.PostedFile.FileName);

                string EmpPANImageImgName = Path.GetFileName(FileUpload2.PostedFile.FileName);


                SqlConnection con = new SqlConnection(conString);

                SqlCommand cmd = new SqlCommand("sp_Registration", con);

                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@EmpName", SqlDbType.VarChar).Value = txtName.Text.Trim();
                cmd.Parameters.AddWithValue("@EmpContact", SqlDbType.NChar).Value = txtcontact.Text.Trim();
                cmd.Parameters.AddWithValue("@EmpEmail", SqlDbType.NVarChar).Value = txtEmail.Text.Trim();
                cmd.Parameters.AddWithValue("@EmpNumber", SqlDbType.VarChar).Value = txtcity.Text.Trim();
                cmd.Parameters.AddWithValue("@EmpAdharImageImgName", EmpAdharImageImgName);
                cmd.Parameters.AddWithValue("@EmpAdharImgPath", "AdharImg/" + EmpAdharImageImgName);

                cmd.Parameters.AddWithValue("@EmpPANImageImgName", EmpPANImageImgName);
                cmd.Parameters.AddWithValue("@EmpPANImgPath", "PanImage/" + EmpPANImageImgName);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                con.Dispose();

                txtName.Text = String.Empty;
                txtcontact.Text = String.Empty;
                txtEmail.Text = String.Empty;
                txtcity.Text = String.Empty;
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
            lblmsg.Text = "Save Employee Information";

        }
    }




}