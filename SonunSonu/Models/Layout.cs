using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace SonunSonu.Models
{
    public class Layout
    {
        [Key]
        public int Oid { get; set; }

        public string Code { get; set; }

        public string Name { get; set; }

        public double Widht { get; set; }

        public double Height { get; set; }
    }
}