using DevExpress.Web.Internal.XmlProcessor;
using DevExpress.XtraPrinting.Native;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SonunSonu
{
    public partial class Layouts : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }


        protected void Insert(object sender, EventArgs e)
        {

            try
            {
                string code = txtCode.Text;
                string name = txtName.Text;
                int width = Convert.ToInt32(txtLayoutWidth.Text);
                int height = Convert.ToInt32(txtLayoutHeight.Text);


                SqlDataSource1.InsertParameters["Code"].DefaultValue = code;
                SqlDataSource1.InsertParameters["Name"].DefaultValue = name;
                SqlDataSource1.InsertParameters["LayoutWidth"].DefaultValue = width.ToString();
                SqlDataSource1.InsertParameters["LayoutHeight"].DefaultValue = height.ToString();

                SqlDataSource1.Insert();
                lblErrorMessage.Visible = false;
            }

            catch
            {
                lblErrorMessage.Text = "An error occurred while adding the machine.";
                lblErrorMessage.Visible = true;
            }

        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string updatedCode = txtCode.Text.Trim();
            string updatedName = txtName.Text.Trim();
            string updatedWidth = txtLayoutWidth.Text.Trim();
            string updatedHeight = txtLayoutHeight.Text.Trim();

            string defaultCode = "DefaultCode";
            string defaultName = "DefaultName";
            int defaultWidth = 100;
            int defaultHeight = 100;

            // Null değerleri kontrol et ve gerekirse default değerlerle değiştir
            if (string.IsNullOrEmpty(updatedCode))
                updatedCode = defaultCode;

            if (string.IsNullOrEmpty(updatedName))
                updatedName = defaultName;

            int width, height;
            if (!int.TryParse(updatedWidth, out width))
                updatedWidth = defaultWidth.ToString();

            if (!int.TryParse(updatedHeight, out height))
                updatedHeight = defaultHeight.ToString();

            // Update işlemini gerçekleştir
            SqlDataSource1.UpdateParameters["Code"].DefaultValue = updatedCode;
            SqlDataSource1.UpdateParameters["Name"].DefaultValue = updatedName;
            SqlDataSource1.UpdateParameters["LayoutWidth"].DefaultValue = updatedWidth;
            SqlDataSource1.UpdateParameters["LayoutHeight"].DefaultValue = updatedHeight;
            SqlDataSource1.Update();

            // GridView'i güncelle
            GridView1.DataBind();
        }
    }
}