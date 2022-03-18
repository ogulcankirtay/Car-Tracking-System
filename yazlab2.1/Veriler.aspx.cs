using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data.SqlClient;
using System.Data;



using System.Drawing;
namespace yazlab2._1
{
    public partial class Veriler : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string username = Request.QueryString["ad"].ToString();
            DataSet1TableAdapters.TBLUSERTableAdapter dt = new DataSet1TableAdapters.TBLUSERTableAdapter();
            DataSet1TableAdapters.aracTableAdapter d = new DataSet1TableAdapters.aracTableAdapter();

            int id=dt.GetData(username)[0].ID;   

            Repeater2.DataSource = d.GetDataBy(id);
            Repeater2.DataBind();
            DataSet1TableAdapters.TBLUSERTableAdapter a = new DataSet1TableAdapters.TBLUSERTableAdapter();
            var zaman=DateTime.Now.ToString();
            a.update(zaman, username);
            
        }
   

        protected void Button1_Click(object sender, EventArgs e)
        {
            string username = Request.QueryString["ad"].ToString();
            DataSet1TableAdapters.TBLUSERTableAdapter dt = new DataSet1TableAdapters.TBLUSERTableAdapter();
            int id = dt.GetData(username)[0].ID;
            DataSet1TableAdapters.TBLUSERTableAdapter a = new DataSet1TableAdapters.TBLUSERTableAdapter();
            var zaman = DateTime.Now.ToString();
            a.UpdateQuery(zaman, id);
            Response.Redirect("WebForm1.Aspx?");
        }
    }
}