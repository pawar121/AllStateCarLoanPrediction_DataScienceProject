using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Threading.Tasks;
using Newtonsoft.Json;
using System.Web.Script.Serialization;


namespace WebApplication1
{
    public partial class Default : System.Web.UI.Page
    {
       public string year = DateTime.Now.Year.ToString();
       int credit_score_code = 0;


        protected void Page_Load(object sender, EventArgs e)
        {
            Server.Transfer("WebAppPage1.aspx");

        }

        protected void purpose_SelectedIndexChanged(object sender, EventArgs e)
        {

        }





    }
}