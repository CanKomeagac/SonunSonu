using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SonunSonu.Models
{
    public class Machine
    {
        public int ID { get; set; }
        public string Type { get; set; }
        public string Code { get; set; }
        public string Name { get; set; }        
        public int Width { get; set; }
        public int Height { get; set; }
        public string Info1 { get; set; }
        public string Info2 { get; set; }
        public string Style { get; set; }
        public int PositionX { get; set; }
        public int PositionY { get; set; }
        public int LayoutOid { get; set; }
        public string PhotoUrl { get; set; }





    }
}