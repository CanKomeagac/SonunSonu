using DevExpress.Web.ASPxDiagram;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SonunSonu
{
    public partial class Machines : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindLayoutDropdown();
                BindGridView();
            }
        }
        protected void PopulateDropDownList(object sender, EventArgs e)
        {
            string imagesFolderPath = Server.MapPath("~/Images");
            string[] imageFiles = Directory.GetFiles(imagesFolderPath, "*.jpg");

            foreach (string imageFile in imageFiles)
            {
                string fileName = Path.GetFileName(imageFile);
                ddlPhoto.Items.Add(new ListItem(fileName, "Images/" + fileName));
            }
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridView1.Rows[e.RowIndex];
            int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);

            TextBox txtCode = (TextBox)row.FindControl("txtEditCode"); // Örnek: txtEditName, düzenleme için kullanılan TextBox'ın ID'si
            TextBox txtName = (TextBox)row.FindControl("txtEditName"); // Örnek: txtEditName, düzenleme için kullanılan TextBox'ın ID'si
            TextBox txtWidth = (TextBox)row.FindControl("txtEditWidth"); // Örnek: txtEditWidth
            TextBox txtHeight = (TextBox)row.FindControl("txtEditHeight"); // Örnek: txtEditHeight
            TextBox txtInfo1 = (TextBox)row.FindControl("txtEditInfo1"); // Örnek: txtEditName, düzenleme için kullanılan TextBox'ın ID'si
            TextBox txtInfo2 = (TextBox)row.FindControl("txtEditInfo2"); // Örnek: txtEditWidth
            TextBox txtPositionX = (TextBox)row.FindControl("txtEditPositionX");
            TextBox txtPositionY = (TextBox)row.FindControl("txtEditPositionY"); // Örnek: txtEditName, düzenleme için kullanılan TextBox'ın ID'si
            TextBox txtRunningStatus = (TextBox)row.FindControl("txtEditRunningStatus"); // Örnek: txtEditWidth
            TextBox txtLayoutOid = (TextBox)row.FindControl("txtEditLayoutOid");// Diğer düzenlenebilir alanları da ekleyin




            try
            {
                // Güncelleme işlemini yapın
                SqlDataSource2.UpdateParameters["Code"].DefaultValue = txtCode.Text;
                if (!string.IsNullOrEmpty(txtName.Text))
                    SqlDataSource2.UpdateParameters["Name"].DefaultValue = txtName.Text;
                else
                    SqlDataSource2.UpdateParameters["Name"].DefaultValue = "Name"; // Boş değilse geçerli bir değer kullanabilirsiniz
                SqlDataSource2.UpdateParameters["Width"].DefaultValue = txtWidth.Text;
                SqlDataSource2.UpdateParameters["Height"].DefaultValue = txtHeight.Text;
                SqlDataSource2.UpdateParameters["Info1"].DefaultValue = txtInfo1.Text;
                SqlDataSource2.UpdateParameters["Info2"].DefaultValue = txtInfo2.Text;
                SqlDataSource2.UpdateParameters["PositionX"].DefaultValue = txtPositionX.Text;
                SqlDataSource2.UpdateParameters["PositionY"].DefaultValue = txtPositionY.Text;
                SqlDataSource2.UpdateParameters["RunningStatus"].DefaultValue = txtRunningStatus.Text;
                SqlDataSource2.UpdateParameters["LayoutOid"].DefaultValue = txtLayoutOid.Text;
                // Diğer güncelleme parametrelerini de ekleyin

                SqlDataSource2.UpdateParameters["ID"].DefaultValue = id.ToString();
                SqlDataSource2.Update();


                lblErrorMessage.Visible = false;
            }
            catch (Exception ex)
            {
                lblErrorMessage.Text = "An error occurred while updating the machine: " + ex.Message;
                lblErrorMessage.Visible = true;
            }

            GridView1.EditIndex = -1; // Düzenleme modunu kapat
            BindGridView(); // GridView'ı tekrar bağla
        }
        private void BindGridView()
        {
            GridView1.DataBind();
        }
        private void BindLayoutDropdown()
        {
            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["myProjectDBConnectionString"].ConnectionString))
            {
                string query = "SELECT Oid, Name FROM LayoutTable"; // LayoutTable'ın alan adlarını ve tablo adını düzeltin
                SqlCommand command = new SqlCommand(query, connection);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();

                ddlLayout.DataSource = reader;
                ddlLayout.DataBind();
            }
        }
        
        protected void Insert(object sender, EventArgs e)
        {
            

            string info1 = string.IsNullOrEmpty(txtInfo1.Text) ? null : txtInfo1.Text;
            string info2 = string.IsNullOrEmpty(txtInfo2.Text) ? null : txtInfo2.Text;
            string photo = string.IsNullOrEmpty(ddlPhoto.Text) ? null : ddlPhoto.Text;

            try
            {
                string code = txtCode.Text;
                string name = txtName.Text;
                int width = Convert.ToInt32(txtWidth.Text);
                int height = Convert.ToInt32(txtHeight.Text);
                float positionX = Convert.ToInt32(txtPositionX.Text);
                float positionY = Convert.ToInt32(txtPositionY.Text);
                
                int layoutOid = Convert.ToInt32(ddlLayout.SelectedValue);
                bool runningStatus = chkRunningStatus.Checked;


                SqlDataSource2.InsertParameters["Code"].DefaultValue = code;
                SqlDataSource2.InsertParameters["Name"].DefaultValue = name;
                SqlDataSource2.InsertParameters["Width"].DefaultValue = width.ToString();
                SqlDataSource2.InsertParameters["Height"].DefaultValue = height.ToString();

                if (!string.IsNullOrEmpty(info1))
                    SqlDataSource2.InsertParameters["Info1"].DefaultValue = info1;
                else
                    SqlDataSource2.InsertParameters["Info1"].DefaultValue = DBNull.Value.ToString();

                if (!string.IsNullOrEmpty(info2))
                    SqlDataSource2.InsertParameters["Info2"].DefaultValue = info2;
                else
                    SqlDataSource2.InsertParameters["Info2"].DefaultValue = DBNull.Value.ToString();
                if (!string.IsNullOrEmpty(info2))
                    SqlDataSource2.InsertParameters["PhotoUrl"].DefaultValue = photo;
                else
                    SqlDataSource2.InsertParameters["PhotoUrl"].DefaultValue = DBNull.Value.ToString();


                SqlDataSource2.InsertParameters["PositionX"].DefaultValue = positionX.ToString();
                SqlDataSource2.InsertParameters["PositionY"].DefaultValue = positionY.ToString();
                SqlDataSource2.InsertParameters["LayoutOid"].DefaultValue = layoutOid.ToString();
                SqlDataSource2.InsertParameters["RunningStatus"].DefaultValue = runningStatus.ToString();

                SqlDataSource2.Insert();
                lblErrorMessage.Visible = false;
            }

            catch
            {
                lblErrorMessage.Text = "An error occurred while adding the machine.";
                lblErrorMessage.Visible = true;
            }
            
        }

    }
}