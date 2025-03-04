﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace KoiCenter.WPF.Models;

[Table("Payment")]
public partial class Payment
{
    [Key]
    public int PaymentId { get; set; }

    public int? OrderId { get; set; }

    public int? SystemTransactionId { get; set; }

    [Column(TypeName = "datetime")]
    public DateTime? TransactionDate { get; set; }

    [Column(TypeName = "decimal(10, 2)")]
    public decimal? TotalAmount { get; set; }

    [Column(TypeName = "decimal(10, 2)")]
    public decimal? Tax { get; set; }

    [Column(TypeName = "datetime")]
    public DateTime? CreatedAt { get; set; }

    [Column(TypeName = "datetime")]
    public DateTime? UpdatedAt { get; set; }

    [StringLength(255)]
    [Unicode(false)]
    public string CreatedBy { get; set; }

    public bool? IsDeleted { get; set; }
}