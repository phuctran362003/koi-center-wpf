﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace KoiCenter.WPF.Models;

[Table("PetHealthRecord")]
public partial class PetHealthRecord
{
    [Key]
    public int Id { get; set; }

    public int? OrderItemId { get; set; }

    [Column(TypeName = "datetime")]
    public DateTime? CheckUpDate { get; set; }

    [StringLength(255)]
    [Unicode(false)]
    public string HealthStatus { get; set; }

    [Column(TypeName = "text")]
    public string Diagnosis { get; set; }

    [Column(TypeName = "text")]
    public string Treatment { get; set; }

    [Column(TypeName = "datetime")]
    public DateTime? NextCheckUpDate { get; set; }

    [Column(TypeName = "text")]
    public string Notes { get; set; }
}