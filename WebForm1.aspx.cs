using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
namespace Proyecto_nuevo
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        String conn = ConfigurationManager.ConnectionStrings["Conexion_BDS"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection cn;
            SqlDataAdapter da;
            DataSet ds;

            cn = new SqlConnection(conn);
            cn.Open();
            da = new SqlDataAdapter("select * from HOSPITALES", cn);
            ds = new DataSet();
            da.Fill(ds, "hospitales");
            GridView1.DataSource = ds;
            GridView1.DataBind();
            cn.Close();
        }
    }
}