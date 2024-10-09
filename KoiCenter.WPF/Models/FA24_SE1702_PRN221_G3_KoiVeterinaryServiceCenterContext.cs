﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;

namespace KoiCenter.WPF.Models;

public partial class FA24_SE1702_PRN221_G3_KoiVeterinaryServiceCenterContext : DbContext
{


    public FA24_SE1702_PRN221_G3_KoiVeterinaryServiceCenterContext()
    {
        
    }

    public FA24_SE1702_PRN221_G3_KoiVeterinaryServiceCenterContext(DbContextOptions<FA24_SE1702_PRN221_G3_KoiVeterinaryServiceCenterContext> options )
        : base(options)
    {
          ;
    }

    public virtual DbSet<Cart> Carts { get; set; }

    public virtual DbSet<CartItem> CartItems { get; set; }

    public virtual DbSet<Environment> Environments { get; set; }

    public virtual DbSet<Feedback> Feedbacks { get; set; }

    public virtual DbSet<Order> Orders { get; set; }

    public virtual DbSet<OrderItem> OrderItems { get; set; }

    public virtual DbSet<Payment> Payments { get; set; }

    public virtual DbSet<Pet> Pets { get; set; }

    public virtual DbSet<PetHealthRecord> PetHealthRecords { get; set; }

    public virtual DbSet<PetService> PetServices { get; set; }

    public virtual DbSet<PetServiceCategory> PetServiceCategories { get; set; }

    public virtual DbSet<PetType> PetTypes { get; set; }

    public virtual DbSet<Product> Products { get; set; }

    public virtual DbSet<ProductCategory> ProductCategories { get; set; }

    public virtual DbSet<Role> Roles { get; set; }

    public virtual DbSet<SystemTransaction> SystemTransactions { get; set; }

    public virtual DbSet<User> Users { get; set; }

    public virtual DbSet<UserWallet> UserWallets { get; set; }

    public virtual DbSet<Veterinarian> Veterinarians { get; set; }

    public virtual DbSet<VeterinarianAvailability> VeterinarianAvailabilities { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    {
        if (!optionsBuilder.IsConfigured)
        {
            var config = new ConfigurationBuilder().AddJsonFile("appsettings.json").Build();
            string ConnectionStr = config.GetConnectionString("MyDB");

            optionsBuilder.UseSqlServer(ConnectionStr);
        }
    }


    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Cart>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Cart__3214EC076685DBEE");
        });

        modelBuilder.Entity<CartItem>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__CartItem__3214EC07AC8817CD");
        });

        modelBuilder.Entity<Environment>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Environm__3214EC07122B0BDC");
        });

        modelBuilder.Entity<Feedback>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Feedback__3214EC077CC4A898");
        });

        modelBuilder.Entity<Order>(entity =>
        {
            entity.HasKey(e => e.OrderId).HasName("PK__Order__C3905BCFDD331F06");
        });

        modelBuilder.Entity<OrderItem>(entity =>
        {
            entity.HasKey(e => e.OrderItemId).HasName("PK__OrderIte__57ED0681337CB49E");
        });

        modelBuilder.Entity<Payment>(entity =>
        {
            entity.HasKey(e => e.PaymentId).HasName("PK__Payment__9B556A38A632C46F");
        });

        modelBuilder.Entity<Pet>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Pet__3214EC07C9382846");
        });

        modelBuilder.Entity<PetHealthRecord>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__PetHealt__3214EC071360EDF6");
        });

        modelBuilder.Entity<PetService>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__PetServi__3214EC07B9860AC4");
        });

        modelBuilder.Entity<PetServiceCategory>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__PetServi__3214EC072579817C");
        });

        modelBuilder.Entity<PetType>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__PetType__3214EC07D1895DE4");
        });

        modelBuilder.Entity<Product>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Product__3214EC07FA22EA97");
        });

        modelBuilder.Entity<ProductCategory>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__ProductC__3214EC0731E7D239");
        });

        modelBuilder.Entity<Role>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Role__3214EC0728F9C25B");
        });

        modelBuilder.Entity<SystemTransaction>(entity =>
        {
            entity.HasKey(e => e.SystemTransactionId).HasName("PK__SystemTr__03823808F37A49D3");
        });

        modelBuilder.Entity<User>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__User__3214EC0726EC734F");
        });

        modelBuilder.Entity<UserWallet>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__UserWall__3214EC070DF4DA14");
        });

        modelBuilder.Entity<Veterinarian>(entity =>
        {
            entity.HasKey(e => e.UserId).HasName("PK__Veterina__1788CC4CBA724F9C");

            entity.Property(e => e.UserId).ValueGeneratedNever();
        });

        modelBuilder.Entity<VeterinarianAvailability>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Veterina__3214EC079A1C9B9E");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}