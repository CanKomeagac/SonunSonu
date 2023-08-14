using DevExpress.ClipboardSource.SpreadsheetML;
using DevExpress.Utils.About;
using DevExpress.Web.ASPxDiagram;
using DevExpress.Web.ASPxDiagram.Internal;
using DevExpress.Web.Internal.Dialogs;
using DevExpress.Web.Internal.XmlProcessor;
using SonunSonu.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace SonunSonu
{
    
    public partial class Layout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int layoutId = Convert.ToInt32(Request.QueryString["layoutId"]);
            if (!IsPostBack)
            {


                SqlDataSource2.SelectParameters["LayoutOid"].DefaultValue = layoutId.ToString();

                Diagram.CustomShapes.AddRange(GetMachinesShapes());
            }
            SqlDataSource2.InsertParameters["LayoutOidd"].DefaultValue = layoutId.ToString();

        }


        protected void ASPxDiagram1_ItemInserted(object sender, DevExpress.Web.ASPxDiagram.DiagramItemInsertedEventArgs e)
        {
            
            


        }

        public class MachinesDataProviderSL
        {
            private string connectionString = "Data Source=LAPTOP-D00PHODB\\MSSQLSERVER01;Initial Catalog=myProjectDB;Integrated Security=True"; // Veritabanı bağlantı dizesini buraya ekleyin.

            public IEnumerable<Machine> GetMachines()
            {

                List<Machine> machines = new List<Machine>();
                Layout layoutInstance = new Layout();
                int layoutOid = Convert.ToInt32(layoutInstance.GetLayoutOidFromUrl());
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    SqlCommand command = new SqlCommand("SELECT ID, Code, Name,Width,Height,Style,PositionX,PositionY,PhotoUrl FROM Table_1 Where LayoutOid != @p1", connection);
                    command.Parameters.AddWithValue("@p1", layoutOid);
                    using (command)
                    {
                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                Machine machine = new Machine
                                {
                                    ID = Convert.ToInt32(reader["ID"]),
                                    Code = reader["Code"].ToString(),
                                    Name = reader["Name"].ToString(),
                                    Width = Convert.ToInt32(reader["Width"]),
                                    Height = Convert.ToInt32(reader["Height"]),
                                    Style = reader["Style"].ToString(),
                                    PhotoUrl = reader["PhotoUrl"].ToString(),
                                };

                                machines.Add(machine);
                            }
                        }
                    }
                }

                return machines;
            }
        }

        static IEnumerable<DiagramCustomShape> GetMachinesShapes()
        {

            var provider = new MachinesDataProviderSL();
            return provider.GetMachines().Select(e => new DiagramCustomShape
            {
                Type = "emp" + e.ID,
                BaseType =DiagramShapeType.CardWithImageOnTop,
                DefaultText = e.Name,
                CategoryName = "CategoryMachines",
                DefaultWidth = e.Width,
                DefaultImageUrl = e.PhotoUrl,
                DefaultHeight = e.Height,
            }) ;
        }
        protected void Page_Init(object sender, EventArgs e)
         {
            
            if (!IsPostBack)
            {
                string layoutOid = GetLayoutOidFromUrl();
                string connectionString = "Data Source=LAPTOP-D00PHODB\\MSSQLSERVER01;Initial Catalog=myProjectDB;Integrated Security=True"; // Veritabanı bağlantı dizesini buraya girin
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string query = "SELECT [LayoutWidth], [LayoutHeight] FROM [LayoutTable] WHERE [Oid] = @LayoutOid";
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@LayoutOid", SqlDbType.Int).Value = Convert.ToInt32(layoutOid);

                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    if (reader.Read())
                    {
                        int layoutWidth = Convert.ToInt32(reader["LayoutWidth"]);
                        int layoutHeight = Convert.ToInt32(reader["LayoutHeight"]);
                        Diagram.Width = new Unit(layoutWidth);
                        Diagram.Height = new Unit(layoutHeight);
                    }
                    reader.Close();
                }
            }
        }

        public string GetLayoutOidFromUrl()
        {
            string layoutOid = HttpContext.Current.Request.QueryString["layoutId"];
            return layoutOid;
        }

        protected void SqlDataSource2_Inserted1(object sender, SqlDataSourceStatusEventArgs e)
        {
            
        }
    }
}