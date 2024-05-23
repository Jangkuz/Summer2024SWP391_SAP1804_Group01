﻿// <auto-generated />
using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;
using backend.Data;

#nullable disable

namespace backend.Migrations
{
    [DbContext(typeof(ApplicationDbContext))]
    partial class ApplicationDbContextModelSnapshot : ModelSnapshot
    {
        protected override void BuildModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "8.0.5")
                .HasAnnotation("Relational:MaxIdentifierLength", 128);

            SqlServerModelBuilderExtensions.UseIdentityColumns(modelBuilder);

            modelBuilder.Entity("backend.Models.Accessory", b =>
                {
                    b.Property<long>("AccessoryId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("bigint")
                        .HasColumnName("accessory_id");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<long>("AccessoryId"));

                    b.Property<long>("AccessoryTypeId")
                        .HasColumnType("bigint")
                        .HasColumnName("accessory_type_id");

                    b.Property<int>("Karat")
                        .HasColumnType("int")
                        .HasColumnName("karat");

                    b.Property<float>("MaterialWeight")
                        .HasColumnType("real")
                        .HasColumnName("material_weight");

                    b.Property<string>("Name")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)")
                        .HasColumnName("name");

                    b.Property<long>("ShapeId")
                        .HasColumnType("bigint")
                        .HasColumnName("shape_id");

                    b.HasKey("AccessoryId");

                    b.HasIndex("AccessoryTypeId");

                    b.HasIndex("ShapeId");

                    b.ToTable("accessory");
                });

            modelBuilder.Entity("backend.Models.AccessoryImage", b =>
                {
                    b.Property<long>("AccessoryImageId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("bigint")
                        .HasColumnName("image_id");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<long>("AccessoryImageId"));

                    b.Property<long>("AccessoryId")
                        .HasColumnType("bigint")
                        .HasColumnName("accessory_id");

                    b.Property<string>("Url")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)")
                        .HasColumnName("image_url");

                    b.HasKey("AccessoryImageId");

                    b.HasIndex("AccessoryId");

                    b.ToTable("accessory_image");
                });

            modelBuilder.Entity("backend.Models.AccessoryType", b =>
                {
                    b.Property<long>("AccessoryTypeId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("bigint")
                        .HasColumnName("accessory_type_id");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<long>("AccessoryTypeId"));

                    b.Property<string>("Name")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)")
                        .HasColumnName("name");

                    b.Property<double>("ProcessingPrice")
                        .HasColumnType("float")
                        .HasColumnName("processing_price");

                    b.HasKey("AccessoryTypeId");

                    b.ToTable("accessory_type");
                });

            modelBuilder.Entity("backend.Models.Account", b =>
                {
                    b.Property<long>("AccountId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("bigint")
                        .HasColumnName("account_id");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<long>("AccountId"));

                    b.Property<string>("Address")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)")
                        .HasColumnName("address");

                    b.Property<DateTime>("Birthday")
                        .HasColumnType("datetime2")
                        .HasColumnName("birthday");

                    b.Property<DateTime>("CreatedAt")
                        .HasColumnType("datetime2")
                        .HasColumnName("created_at");

                    b.Property<string>("Email")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)")
                        .HasColumnName("email");

                    b.Property<string>("Gender")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)")
                        .HasColumnName("gender");

                    b.Property<string>("Name")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)")
                        .HasColumnName("name");

                    b.Property<string>("Password")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)")
                        .HasColumnName("password");

                    b.Property<string>("PhoneNumber")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)")
                        .HasColumnName("phone_number");

                    b.Property<long>("RankId")
                        .HasColumnType("bigint")
                        .HasColumnName("rank_id");

                    b.Property<int>("RewardPoint")
                        .HasColumnType("int")
                        .HasColumnName("reward_point");

                    b.Property<long>("RoleId")
                        .HasColumnType("bigint")
                        .HasColumnName("role_id");

                    b.HasKey("AccountId");

                    b.HasIndex("RankId");

                    b.HasIndex("RoleId");

                    b.ToTable("account");
                });

            modelBuilder.Entity("backend.Models.Diamond", b =>
                {
                    b.Property<long>("DiamondId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("bigint")
                        .HasColumnName("diamond_id");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<long>("DiamondId"));

                    b.Property<bool>("Availability")
                        .HasColumnType("bit")
                        .HasColumnName("availability");

                    b.Property<float>("Carat")
                        .HasColumnType("real")
                        .HasColumnName("carat");

                    b.Property<long>("CertificateNumber")
                        .HasColumnType("bigint")
                        .HasColumnName("certificate_number");

                    b.Property<string>("CertificateUrl")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)")
                        .HasColumnName("certificate_url");

                    b.Property<string>("Clarity")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)")
                        .HasColumnName("clarity");

                    b.Property<string>("Color")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)")
                        .HasColumnName("color");

                    b.Property<string>("Cut")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)")
                        .HasColumnName("cut");

                    b.Property<string>("Fluorescence")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)")
                        .HasColumnName("fluorescence");

                    b.Property<string>("ImageUrl")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)")
                        .HasColumnName("image_url");

                    b.Property<string>("Lab")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)")
                        .HasColumnName("lab");

                    b.Property<string>("Polish")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)")
                        .HasColumnName("polish");

                    b.Property<long>("ShapeId")
                        .HasColumnType("bigint")
                        .HasColumnName("shape_id");

                    b.Property<string>("Symmetry")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)")
                        .HasColumnName("symmetry");

                    b.HasKey("DiamondId");

                    b.HasIndex("ShapeId");

                    b.ToTable("diamond");
                });

            modelBuilder.Entity("backend.Models.Order", b =>
                {
                    b.Property<long>("OrderId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("bigint")
                        .HasColumnName("order_id");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<long>("OrderId"));

                    b.Property<string>("ConfirmStatus")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)")
                        .HasColumnName("confirm_status");

                    b.Property<string>("ContactStatus")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)")
                        .HasColumnName("contact_status");

                    b.Property<DateTime>("CreatedAt")
                        .HasColumnType("datetime2")
                        .HasColumnName("created_at");

                    b.Property<long>("CustomerId")
                        .HasColumnType("bigint")
                        .HasColumnName("customer_id");

                    b.Property<long>("DeliveryStaffId")
                        .HasColumnType("bigint")
                        .HasColumnName("delivery_staff_id");

                    b.Property<string>("DeliveryStatus")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)")
                        .HasColumnName("delivery_status");

                    b.Property<string>("OrderStatus")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)")
                        .HasColumnName("order_status");

                    b.Property<long?>("PromotionId")
                        .HasColumnType("bigint")
                        .HasColumnName("promotion_id");

                    b.Property<long>("SaleStaffId")
                        .HasColumnType("bigint")
                        .HasColumnName("sale_staff_id");

                    b.Property<string>("ShippingAddress")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)")
                        .HasColumnName("shipping_address");

                    b.Property<float>("TotalDiscountPercent")
                        .HasColumnType("real")
                        .HasColumnName("total_discount_percent");

                    b.Property<double>("TotalPrice")
                        .HasColumnType("float")
                        .HasColumnName("total_price");

                    b.HasKey("OrderId");

                    b.HasIndex("CustomerId");

                    b.HasIndex("DeliveryStaffId");

                    b.HasIndex("PromotionId");

                    b.HasIndex("SaleStaffId");

                    b.ToTable("order");
                });

            modelBuilder.Entity("backend.Models.OrderDetail", b =>
                {
                    b.Property<long>("OrderDetailId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("bigint")
                        .HasColumnName("order_detail_id");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<long>("OrderDetailId"));

                    b.Property<long>("AccessoryId")
                        .HasColumnType("bigint")
                        .HasColumnName("accessory_id");

                    b.Property<long>("DiamondId")
                        .HasColumnType("bigint")
                        .HasColumnName("diamond_id");

                    b.Property<double>("ItemPrice")
                        .HasColumnType("float")
                        .HasColumnName("item_price");

                    b.Property<long>("OrderId")
                        .HasColumnType("bigint")
                        .HasColumnName("order_id");

                    b.Property<float?>("Size")
                        .HasColumnType("real")
                        .HasColumnName("size");

                    b.Property<long>("WarrantyCardId")
                        .HasColumnType("bigint")
                        .HasColumnName("warranty_card_id");

                    b.HasKey("OrderDetailId");

                    b.HasIndex("AccessoryId");

                    b.HasIndex("DiamondId");

                    b.HasIndex("OrderId");

                    b.HasIndex("WarrantyCardId")
                        .IsUnique();

                    b.ToTable("order_detail");
                });

            modelBuilder.Entity("backend.Models.Promotion", b =>
                {
                    b.Property<long>("PromotionId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("bigint")
                        .HasColumnName("promotion_id");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<long>("PromotionId"));

                    b.Property<float>("DiscountPercent")
                        .HasColumnType("real")
                        .HasColumnName("discount_percent");

                    b.Property<DateTime>("EndTime")
                        .HasColumnType("datetime2")
                        .HasColumnName("end_time");

                    b.Property<DateTime>("StartTime")
                        .HasColumnType("datetime2")
                        .HasColumnName("start_time");

                    b.HasKey("PromotionId");

                    b.ToTable("promotion");
                });

            modelBuilder.Entity("backend.Models.Rank", b =>
                {
                    b.Property<long>("RankId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("bigint")
                        .HasColumnName("rank_id");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<long>("RankId"));

                    b.Property<float>("Discount")
                        .HasColumnType("real")
                        .HasColumnName("discount");

                    b.Property<string>("RankName")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)")
                        .HasColumnName("rank_name");

                    b.Property<int>("RewardPoint")
                        .HasColumnType("int")
                        .HasColumnName("reward_point");

                    b.HasKey("RankId");

                    b.ToTable("rank");

                    b.HasData(
                        new
                        {
                            RankId = 1L,
                            Discount = 0.025f,
                            RankName = "Bronze",
                            RewardPoint = 0
                        },
                        new
                        {
                            RankId = 2L,
                            Discount = 0.05f,
                            RankName = "Silver",
                            RewardPoint = 500
                        },
                        new
                        {
                            RankId = 3L,
                            Discount = 0.075f,
                            RankName = "Gold",
                            RewardPoint = 1000
                        },
                        new
                        {
                            RankId = 4L,
                            Discount = 0.1f,
                            RankName = "Platinum",
                            RewardPoint = 1500
                        },
                        new
                        {
                            RankId = 5L,
                            Discount = 0.125f,
                            RankName = "Emerald",
                            RewardPoint = 2000
                        },
                        new
                        {
                            RankId = 6L,
                            Discount = 0.15f,
                            RankName = "Diamond",
                            RewardPoint = 2500
                        });
                });

            modelBuilder.Entity("backend.Models.Role", b =>
                {
                    b.Property<long>("RoleId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("bigint")
                        .HasColumnName("role_id");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<long>("RoleId"));

                    b.Property<string>("RoleName")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)")
                        .HasColumnName("role_name");

                    b.HasKey("RoleId");

                    b.ToTable("role");

                    b.HasData(
                        new
                        {
                            RoleId = 1L,
                            RoleName = "Customer"
                        },
                        new
                        {
                            RoleId = 2L,
                            RoleName = "SaleStaff"
                        },
                        new
                        {
                            RoleId = 3L,
                            RoleName = "DeliveryStaff"
                        },
                        new
                        {
                            RoleId = 4L,
                            RoleName = "WarrantyStaff"
                        },
                        new
                        {
                            RoleId = 5L,
                            RoleName = "Manager"
                        },
                        new
                        {
                            RoleId = 6L,
                            RoleName = "Administrator"
                        });
                });

            modelBuilder.Entity("backend.Models.Shape", b =>
                {
                    b.Property<long>("ShapeId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("bigint")
                        .HasColumnName("shape_id");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<long>("ShapeId"));

                    b.Property<string>("Name")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)")
                        .HasColumnName("name");

                    b.HasKey("ShapeId");

                    b.ToTable("shape");
                });

            modelBuilder.Entity("backend.Models.Transaction", b =>
                {
                    b.Property<long>("TransactionId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("bigint")
                        .HasColumnName("transaction_id");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<long>("TransactionId"));

                    b.Property<DateTime>("CreatedAt")
                        .HasColumnType("datetime2")
                        .HasColumnName("created_at");

                    b.Property<long>("OrderId")
                        .HasColumnType("bigint")
                        .HasColumnName("order_id");

                    b.Property<string>("PaymentMethod")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)")
                        .HasColumnName("payment_method");

                    b.Property<string>("TransactionStatus")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)")
                        .HasColumnName("transaction_status");

                    b.HasKey("TransactionId");

                    b.HasIndex("OrderId");

                    b.ToTable("Transactions");
                });

            modelBuilder.Entity("backend.Models.WarrantyCard", b =>
                {
                    b.Property<long>("WarrantyCardId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("bigint")
                        .HasColumnName("warranty_card_id");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<long>("WarrantyCardId"));

                    b.Property<DateTime>("EndTime")
                        .HasColumnType("datetime2")
                        .HasColumnName("end_time");

                    b.Property<long>("OrderDetaiId")
                        .HasColumnType("bigint")
                        .HasColumnName("order_detail_id");

                    b.Property<DateTime>("StartTime")
                        .HasColumnType("datetime2")
                        .HasColumnName("start_time");

                    b.HasKey("WarrantyCardId");

                    b.ToTable("WarrantyCards");
                });

            modelBuilder.Entity("backend.Models.WarrantyRequest", b =>
                {
                    b.Property<long>("WarrantyRequestId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("bigint")
                        .HasColumnName("warranty_request_id");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<long>("WarrantyRequestId"));

                    b.Property<DateTime>("ReceiveTime")
                        .HasColumnType("datetime2")
                        .HasColumnName("receive_time");

                    b.Property<DateTime>("ReturnTime")
                        .HasColumnType("datetime2")
                        .HasColumnName("return_time");

                    b.Property<long>("WarrantyCardId")
                        .HasColumnType("bigint")
                        .HasColumnName("warranty_card_id");

                    b.Property<long>("WarrantyStaffId")
                        .HasColumnType("bigint")
                        .HasColumnName("warranty_staff_id");

                    b.Property<string>("WarrantyStatus")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)")
                        .HasColumnName("warranty_status");

                    b.HasKey("WarrantyRequestId");

                    b.HasIndex("WarrantyCardId");

                    b.HasIndex("WarrantyStaffId");

                    b.ToTable("WarrantyRequests");
                });

            modelBuilder.Entity("backend.Models.Accessory", b =>
                {
                    b.HasOne("backend.Models.AccessoryType", "AccessoryType")
                        .WithMany("Accessories")
                        .HasForeignKey("AccessoryTypeId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("backend.Models.Shape", "Shape")
                        .WithMany("Accessories")
                        .HasForeignKey("ShapeId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("AccessoryType");

                    b.Navigation("Shape");
                });

            modelBuilder.Entity("backend.Models.AccessoryImage", b =>
                {
                    b.HasOne("backend.Models.Accessory", "Accessory")
                        .WithMany("AccessoryImages")
                        .HasForeignKey("AccessoryId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Accessory");
                });

            modelBuilder.Entity("backend.Models.Account", b =>
                {
                    b.HasOne("backend.Models.Rank", "Rank")
                        .WithMany("Accounts")
                        .HasForeignKey("RankId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("backend.Models.Role", "Role")
                        .WithMany("Accounts")
                        .HasForeignKey("RoleId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Rank");

                    b.Navigation("Role");
                });

            modelBuilder.Entity("backend.Models.Diamond", b =>
                {
                    b.HasOne("backend.Models.Shape", "Shape")
                        .WithMany("Diamonds")
                        .HasForeignKey("ShapeId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Shape");
                });

            modelBuilder.Entity("backend.Models.Order", b =>
                {
                    b.HasOne("backend.Models.Account", "Customer")
                        .WithMany("OrdersOfCustomer")
                        .HasForeignKey("CustomerId")
                        .OnDelete(DeleteBehavior.Restrict)
                        .IsRequired();

                    b.HasOne("backend.Models.Account", "DeliveryStaff")
                        .WithMany("OrdersOfDeliveryStaff")
                        .HasForeignKey("DeliveryStaffId")
                        .OnDelete(DeleteBehavior.Restrict)
                        .IsRequired();

                    b.HasOne("backend.Models.Promotion", "Promotion")
                        .WithMany("Orders")
                        .HasForeignKey("PromotionId");

                    b.HasOne("backend.Models.Account", "SaleStaff")
                        .WithMany("OrdersOfSaleStaff")
                        .HasForeignKey("SaleStaffId")
                        .OnDelete(DeleteBehavior.Restrict)
                        .IsRequired();

                    b.Navigation("Customer");

                    b.Navigation("DeliveryStaff");

                    b.Navigation("Promotion");

                    b.Navigation("SaleStaff");
                });

            modelBuilder.Entity("backend.Models.OrderDetail", b =>
                {
                    b.HasOne("backend.Models.Accessory", "Accessory")
                        .WithMany("OrderDetails")
                        .HasForeignKey("AccessoryId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("backend.Models.Diamond", "Diamond")
                        .WithMany("OrderDetails")
                        .HasForeignKey("DiamondId")
                        .OnDelete(DeleteBehavior.Restrict)
                        .IsRequired();

                    b.HasOne("backend.Models.Order", "Order")
                        .WithMany("OrderDetails")
                        .HasForeignKey("OrderId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("backend.Models.WarrantyCard", "WarrantyCard")
                        .WithOne("OrderDetail")
                        .HasForeignKey("backend.Models.OrderDetail", "WarrantyCardId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Accessory");

                    b.Navigation("Diamond");

                    b.Navigation("Order");

                    b.Navigation("WarrantyCard");
                });

            modelBuilder.Entity("backend.Models.Transaction", b =>
                {
                    b.HasOne("backend.Models.Order", "Order")
                        .WithMany("Transactions")
                        .HasForeignKey("OrderId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Order");
                });

            modelBuilder.Entity("backend.Models.WarrantyRequest", b =>
                {
                    b.HasOne("backend.Models.WarrantyCard", "WarrantyCard")
                        .WithMany("WarrantyRequests")
                        .HasForeignKey("WarrantyCardId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("backend.Models.Account", "WarrantyStaff")
                        .WithMany("RequestOfWarrantyStaff")
                        .HasForeignKey("WarrantyStaffId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("WarrantyCard");

                    b.Navigation("WarrantyStaff");
                });

            modelBuilder.Entity("backend.Models.Accessory", b =>
                {
                    b.Navigation("AccessoryImages");

                    b.Navigation("OrderDetails");
                });

            modelBuilder.Entity("backend.Models.AccessoryType", b =>
                {
                    b.Navigation("Accessories");
                });

            modelBuilder.Entity("backend.Models.Account", b =>
                {
                    b.Navigation("OrdersOfCustomer");

                    b.Navigation("OrdersOfDeliveryStaff");

                    b.Navigation("OrdersOfSaleStaff");

                    b.Navigation("RequestOfWarrantyStaff");
                });

            modelBuilder.Entity("backend.Models.Diamond", b =>
                {
                    b.Navigation("OrderDetails");
                });

            modelBuilder.Entity("backend.Models.Order", b =>
                {
                    b.Navigation("OrderDetails");

                    b.Navigation("Transactions");
                });

            modelBuilder.Entity("backend.Models.Promotion", b =>
                {
                    b.Navigation("Orders");
                });

            modelBuilder.Entity("backend.Models.Rank", b =>
                {
                    b.Navigation("Accounts");
                });

            modelBuilder.Entity("backend.Models.Role", b =>
                {
                    b.Navigation("Accounts");
                });

            modelBuilder.Entity("backend.Models.Shape", b =>
                {
                    b.Navigation("Accessories");

                    b.Navigation("Diamonds");
                });

            modelBuilder.Entity("backend.Models.WarrantyCard", b =>
                {
                    b.Navigation("OrderDetail")
                        .IsRequired();

                    b.Navigation("WarrantyRequests");
                });
#pragma warning restore 612, 618
        }
    }
}
