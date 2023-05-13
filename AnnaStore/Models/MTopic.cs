namespace WatchStore.Models
{
    using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;


    
    [Table("Topics")]
    public class MTopic
    {
        [Key]
        public int Id { get; set; }

        [Required(ErrorMessage ="vui lòng nhập tên chủ đề")]
        public string Name { get; set; }
        public string Slug { get; set; }

        public int? ParentId { get; set; }

        public int? Orders { get; set; }
        [Required(ErrorMessage = "vui lòng nhập từ khóa")]
        public string Metakey { get; set; }
        [Required(ErrorMessage = "vui lòng nhập mô tả")]
        public string Metadesc { get; set; }

        public DateTime? Created_at { get; set; }

        public int? Created_by { get; set; }

        public DateTime? Updated_at { get; set; }

        public int? Updated_by { get; set; }

        public int? Status { get; set; }
    }
}