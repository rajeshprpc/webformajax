using System;
using System.Web.Services;
using System.Web.UI;

namespace WebApplication2
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                BindDatas(sender, e);
        }

        protected void BindDatas(object sender, EventArgs e)
        {
            try
            {
                txtTitle.Value = "Success";
            }
            catch (Exception)
            {

            }

        }

        protected void btnPostData_Click(object sender, EventArgs e)
        {
            try
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + txtTitle.Value + "')", true);
            }
            catch (Exception)
            {

            }

        }

        [WebMethod]
        public static string BindDataWebMethod()
        {
            return "{\"title\":\"AjaxCall\"}";
        }
    }
}