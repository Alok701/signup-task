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
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html.simpleparser;



public partial class Admin : System.Web.UI.Page
{
    SqlConnection sqlCon = new SqlConnection(ConfigurationManager.ConnectionStrings["Myselfsam"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        BindTeam();

    }

    protected void BindTeam()
    {
        try
        {
            using (sqlCon)
            {

                using (SqlCommand sqlCmd = new SqlCommand("Search", sqlCon))
                {


                    sqlCon.Open();
                    DataTable dt = new DataTable();
                    sqlCmd.CommandType = System.Data.CommandType.StoredProcedure;
                    Matchdetail.DataSource = sqlCmd.ExecuteReader();
                    Matchdetail.DataBind();

                    if (Matchdetail.Rows.Count == 0)
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert(' No record found')", true);

                    }

                    sqlCon.Close();

                }
            }
        }
        catch (Exception ex)
        {
            Response.Write("Error:" + ex.Message.ToString());
        }
    }

    protected void btnexcel_Click(object sender, EventArgs e)
    {
        ExportGridToExcel();
    }


    private void ExportGridToExcel()
    {

        Response.ContentType = "application/pdf";

        Response.AddHeader("content-disposition", "attachment;filename=GridViewExport.pdf");

        Response.Cache.SetCacheability(HttpCacheability.NoCache);

        StringWriter sw = new StringWriter();

        HtmlTextWriter hw = new HtmlTextWriter(sw);

        Matchdetail.AllowPaging = false;

        Matchdetail.DataBind();

        Matchdetail.RenderControl(hw);

        StringReader sr = new StringReader(sw.ToString());

        Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 10f, 0f);

        HTMLWorker htmlparser = new HTMLWorker(pdfDoc);

        PdfWriter.GetInstance(pdfDoc, Response.OutputStream);

        pdfDoc.Open();

        htmlparser.Parse(sr);

        pdfDoc.Close();

        Response.Write(pdfDoc);

        Response.End();




    }

    public override void VerifyRenderingInServerForm(Control control)
    {
        //required to avoid the runtime error "  
        //Control 'GridView1' of type 'GridView' must be placed inside a form tag with runat=server."  
    }

}