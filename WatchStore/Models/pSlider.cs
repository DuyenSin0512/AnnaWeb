using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Runtime.InteropServices.ComTypes;
using System.Web;
using System.Web.Mvc;

namespace WatchStore.Models
{
    public class pSlider
    {
        public int Id { get; set; }
        [Required(ErrorMessage = "vui lòng nhập tên")]
        public string Name { get; set; }
        public string Link { get; set; }
        [Required(ErrorMessage = "vui lòng nhập vị trí")]
        public string Position { get; set; }
        [Required(ErrorMessage = "vui lòng chọn ảnh")]
        public string Img { get; set; }
        public int? Orders { get; set; }
        public DateTime? Created_at { get; set; }
        public int? Created_by { get; set; }
        public DateTime? Updated_at { get; set; }
        public int? Updated_by { get; set; }
        public int? Status { get; set; }
    }
}