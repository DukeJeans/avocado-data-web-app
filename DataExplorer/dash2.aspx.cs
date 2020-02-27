using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DataExplorer
{
    public partial class dash2 : System.Web.UI.Page
    {
        Parameter parameter;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void dash2SourceSales_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void txtRegion_TextChanged(object sender, EventArgs e)
        {
            parameter = new Parameter("searchStr");
            parameter.DefaultValue = txtRegion.Text;
        }
    }
}