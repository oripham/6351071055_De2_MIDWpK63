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
                BindGridView();
                LoadBeverageCategories();
            }
        }
        protected void BindGridView()
        {
            QLDoUongEntities context = new QLDoUongEntities();
            var query = (from p in context.Beverages select p).ToList<Beverage>();
            GridViewBeverages.DataSource = query;
            GridViewBeverages.DataBind();
        }
        protected void ButtonAddNew_Click(object sender, EventArgs e)
        {
            string filename = "";
            if (FileUploadPicture.HasFile)
            {
                filename = FileUploadPicture.FileName;
                FileUploadPicture.SaveAs(Server.MapPath("~/images/Beverages/" + filename));
            }

            QLDoUongEntities context = new QLDoUongEntities();
            Beverage p = new Beverage();

            p.Name = TextBoxName.Text;
            p.Price = decimal.Parse(TextBoxPrice.Text);
            p.Description = TextBoxDescription.Text;
            p.CatID = int.Parse(DropDownListCategory.Items[DropDownListCategory.SelectedIndex].Value);
            p.ImageFilePath = filename;

            context.Beverages.Add(p);
            context.SaveChanges();

            BindGridView(); // Cập nhật lại dữ liệu trong GridView
            Page.Master.DataBind();

        }

        protected void GridViewBeverages_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridViewBeverages.PageIndex = e.NewPageIndex;

            BindGridView();
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