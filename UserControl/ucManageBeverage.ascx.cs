using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace de1.UserControl
{
    public partial class ucManageBeverage : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) 
            {

                LoadBeverageCategories();
            }
        }

        protected void ButtonAddNew_Click(object sender, EventArgs e)
        {

        }

        protected void GridViewBeverages_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }

        private void LoadBeverageCategories()
        {
            using (QLDoUongEntities db = new QLDoUongEntities())
            {
                var categories = db.Categories.Select(c => c.CatName).ToList();

                DropDownListCategory.DataSource = categories;
                DropDownListCategory.DataBind();

                DropDownListCategory.Items.Insert(0, new ListItem("-- Chọn loại đồ uống --", ""));
            }
        }

    }
}