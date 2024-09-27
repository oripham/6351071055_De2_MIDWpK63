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
                BindDropDownList(); 
            }
        }

        protected void BindGridView()
        {
            QLDoUongEntities context = new QLDoUongEntities();
            var query = (from p in context.Beverages select p).ToList();
            GridViewBeverages.DataSource = query; 
            GridViewBeverages.DataBind();
        }

        protected void BindDropDownList()
        {
            using (QLDoUongEntities context = new QLDoUongEntities())
            {
                DropDownListCategory.DataSource = context.Categories.ToList(); 
                DropDownListCategory.DataTextField = "CatName"; 
                DropDownListCategory.DataValueField = "CatID"; 
                DropDownListCategory.DataBind();
            }
            DropDownListCategory.Items.Insert(0, new ListItem("-- Chọn loại đồ uống --", "")); 
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
            Beverage p = new Beverage
            {
                Name = TextBoxName.Text,
                Price = decimal.Parse(TextBoxPrice.Text),
                Description = TextBoxDescription.Text,
                CatID = int.Parse(DropDownListCategory.SelectedValue), 
                ImageFilePath = filename
            };

            context.Beverages.Add(p);
            context.SaveChanges();

            BindGridView(); 
            Page.Master.DataBind();
        }

        protected void GridViewBeverages_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridViewBeverages.PageIndex = e.NewPageIndex;
            BindGridView(); 
        }
    }
}
