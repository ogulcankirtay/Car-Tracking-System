using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
namespace yazlab2._1
{
    
    public partial class WebForm1 : System.Web.UI.Page
    {
        int i = 1;    
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection baglanti = new SqlConnection(@"Data Source=DESKTOP-AN0EVIC;Initial Catalog=yazlab2.1;Integrated Security=True");
            string x = TextBox1.Text;
            baglanti.Open();
            SqlCommand komut =new  SqlCommand("Select * from TBLUSER where KULLANICI=@P1 AND SIFRE =@P2", baglanti);
            komut.Parameters.AddWithValue("@P1",TextBox1.Text);
            komut.Parameters.AddWithValue("@P2", TextBox2.Text);
            SqlDataReader dr = komut.ExecuteReader();
          
            if (dr.Read())
            {
              
                Response.Redirect("Veriler.Aspx?ad="+x);
            }
            else if (HiddenField2.Value.Length>2)
            {
               
                
                Response.Write("<script>alert('hatalı giriş')</script>");
               
            }
            else
            {
                Response.Write("" + i);
                HiddenField2.Value += "1";
            }
            baglanti.Close();   
        }
    }
}