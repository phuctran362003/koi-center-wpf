-- Switch the database to single-user mode to close any open connections
ALTER DATABASE FA24_SE1702_PRN221_G3_KoiVeterinaryServiceCenter
SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
GO

-- Drop the database
DROP DATABASE FA24_SE1702_PRN221_G3_KoiVeterinaryServiceCenter;
GO




-- Create the database
CREATE DATABASE FA24_SE1702_PRN221_G3_KoiVeterinaryServiceCenter
GO


-- Use the newly created database
USE FA24_SE1702_PRN221_G3_KoiVeterinaryServiceCenter
GO

CREATE TABLE [Role] (
  [Id] int PRIMARY KEY IDENTITY(1, 1),
  [Name] varchar(50),
  [Description] text
)
GO

CREATE TABLE [User] (
  [Id] int PRIMARY KEY IDENTITY(1, 1),
  [RoleId] int,
  [FullName] varchar(255),
  [Email] varchar(255) UNIQUE,
  [PhoneNumber] varchar(50),
  [Address] varchar(255),
  [Username] varchar(255) UNIQUE,
  [PasswordHash] varchar(255),
  [ProfilePictureUrl] varchar(255),
  [DateOfBirth] datetime,
  [CreatedAt] datetime,
  [UpdatedAt] datetime,
  [CreatedBy] varchar(255),
  [IsDeleted] bit
)
GO

CREATE TABLE [Veterinarian] (
  [UserId] int PRIMARY KEY,
  [Specialization] varchar(255),
  [LicenseNumber] varchar(50),
  [YearsOfExperience] int,
  [ClinicAddress] varchar(255),
  [ProfilePictureUrl] varchar(255),
  [Rating] decimal(3,2),
  [CreatedAt] datetime,
  [UpdatedAt] datetime,
  [CreatedBy] varchar(255),
  [IsDeleted] bit
)
GO

CREATE TABLE [VeterinarianAvailability] (
  [Id] int PRIMARY KEY IDENTITY(1, 1),
  [VeterinarianId] int,
  [AvailableDate] datetime,
  [AvailableFromTime] datetime,
  [AvailableToTime] datetime,
  [CreatedAt] datetime,
  [UpdatedAt] datetime,
  [CreatedBy] varchar(255),
  [IsDeleted] bit
)
GO

CREATE TABLE [PetServiceCategory] (
  [Id] int PRIMARY KEY IDENTITY(1, 1),
  [Name] varchar(255),
  [Description] text,
  [ServiceType] varchar(50),
  [ApplicableTo] varchar(50),
  [CreatedAt] datetime,
  [UpdatedAt] datetime,
  [CreatedBy] varchar(255),
  [IsDeleted] bit
)
GO

CREATE TABLE [PetService] (
  [Id] int PRIMARY KEY IDENTITY(1, 1),
  [ServiceCategoryId] int,
  [BasePrice] decimal(10,2),
  [Duration] varchar(50),
  [ImageUrl] varchar(255),
  [StaffQuantity] int,
  [AvailableFrom] datetime,
  [AvailableTo] datetime,
  [TravelCost] decimal(10,2),
  [CreatedAt] datetime,
  [UpdatedAt] datetime,
  [CreatedBy] varchar(255),
  [IsDeleted] bit
)
GO

CREATE TABLE [PetType] (
  [Id] int PRIMARY KEY IDENTITY(1, 1),
  [EnvironmentId] int,
  [GeneralType] varchar(50),
  [SpecificType] varchar(100)
)
GO

CREATE TABLE [Environment] (
  [Id] int PRIMARY KEY IDENTITY(1, 1),
  [EnvironmentType] varchar(50)
)
GO

CREATE TABLE [Pet] (
  [Id] int PRIMARY KEY IDENTITY(1, 1),
  [Name] varchar(255),
  [Age] int,
  [PetTypeId] int,
  [Breed] varchar(255),
  [ImageUrl] varchar(255),
  [Color] varchar(255),
  [Length] float,
  [Weight] float,
  [Quantity] int,
  [LastHealthCheck] datetime,
  [OwnerId] int,
  [HealthStatus] int,
  [CreatedAt] datetime,
  [UpdatedAt] datetime,
  [CreatedBy] varchar(255),
  [IsDeleted] bit
)
GO

CREATE TABLE [Product] (
  [Id] int PRIMARY KEY IDENTITY(1, 1),
  [ProductCategoryId] int,
  [Name] varchar(255),
  [Description] text,
  [Price] decimal(10,2),
  [StockQuantity] int,
  [ImageUrl] varchar(255),
  [CreatedAt] datetime,
  [UpdatedAt] datetime,
  [CreatedBy] varchar(255),
  [IsDeleted] bit
)
GO

CREATE TABLE [ProductCategory] (
  [Id] int PRIMARY KEY IDENTITY(1, 1),
  [Name] varchar(255),
  [Description] text
)
GO

CREATE TABLE [Feedback] (
  [Id] int PRIMARY KEY IDENTITY(1, 1),
  [ServiceId] int,
  [CustomerId] int,
  [Rating] decimal(3,2),
  [FeedbackText] text
)
GO

CREATE TABLE [Cart] (
  [Id] int PRIMARY KEY IDENTITY(1, 1),
  [CustomerId] int
)
GO

CREATE TABLE [CartItem] (
  [Id] int PRIMARY KEY IDENTITY(1, 1),
  [CartId] int,
  [ServiceId] int,
  [ProductId] int,
  [IsDeleted] bit,
  [OrderHistoryId] int
)
GO

CREATE TABLE [Order] (
  [OrderId] int PRIMARY KEY IDENTITY(1, 1),
  [CustomerId] int,
  [TotalPrice] decimal(10,2),
  [OrderDate] datetime,
  [OrderStatus] varchar(50),
  [CreatedAt] datetime,
  [UpdatedAt] datetime,
  [CreatedBy] varchar(255),
  [IsDeleted] bit
)
GO

CREATE TABLE [OrderItem] (
  [OrderItemId] int PRIMARY KEY IDENTITY(1, 1),
  [OrderId] int,
  [PetId] int,
  [ServiceId] int,
  [ProductId] int,
  [VeterinarianId] int,
  [Price] decimal(10,2),
  [TravelCost] decimal(10,2),
  [Location] varchar(255),
  [Status] varchar(50),
  [AppointmentDateTime] datetime
)
GO

CREATE TABLE [UserWallet] (
  [Id] int PRIMARY KEY IDENTITY(1, 1),
  [UserId] int,
  [Amount] decimal(10,2),
  [LoyaltyPoints] int
)
GO

CREATE TABLE [Payment] (
  [PaymentId] int PRIMARY KEY IDENTITY(1, 1),
  [OrderId] int,
  [SystemTransactionId] int,
  [TransactionDate] datetime,
  [TotalAmount] decimal(10,2),
  [Tax] decimal(10,2),
  [CreatedAt] datetime,
  [UpdatedAt] datetime,
  [CreatedBy] varchar(255),
  [IsDeleted] bit
)
GO

CREATE TABLE [SystemTransaction] (
  [SystemTransactionId] int PRIMARY KEY IDENTITY(1, 1),
  [FromId] int,
  [ToId] int,
  [Amount] decimal(10,2),
  [TransactionType] varchar(50)
)
GO

CREATE TABLE [PetHealthRecord] (
  [Id] int PRIMARY KEY IDENTITY(1, 1),
  [OrderItemId] int,
  [CheckUpDate] datetime,
  [HealthStatus] varchar(255),
  [Diagnosis] text,
  [Treatment] text,
  [NextCheckUpDate] datetime,
  [Notes] text
)
GO


-- Insert sample data for [Role]
INSERT INTO [Role] ([Name], [Description])
VALUES 
('Customer', 'A customer role who can book veterinary services'),
('Veterinarian', 'A veterinarian responsible for providing Koi fish services'),
('Staff', 'Staff responsible for managing services and operations'),
('Manager', 'Manager responsible for overseeing staff and veterinarians')
GO

-- Insert sample data into the PetType table
INSERT INTO [FA24_SE1702_PRN221_G3_KoiVeterinaryServiceCenter].[dbo].[PetType] 
([EnvironmentId], [GeneralType], [SpecificType])
VALUES 
(1, 'Fish', 'Koi - Kohaku'),
(1, 'Fish', 'Koi - Sanke'),
(1, 'Fish', 'Koi - Showa'),
(1, 'Fish', 'Koi - Ogon'),
(2, 'Reptile', 'Turtle - Red-Eared Slider'),
(2, 'Reptile', 'Turtle - Painted Turtle'),
(3, 'Mammal', 'Dog - Golden Retriever'),
(3, 'Mammal', 'Dog - Shiba Inu'),
(4, 'Bird', 'Parrot - African Grey'),
(4, 'Bird', 'Canary - Yellow Canary')
GO

-- Insert sample data into the Environment table
INSERT INTO [FA24_SE1702_PRN221_G3_KoiVeterinaryServiceCenter].[dbo].[Environment] 
([EnvironmentType])
VALUES 
('Water'),     -- EnvironmentId = 1 (used for Koi Fish)
('Land'),      -- EnvironmentId = 2 (used for Reptiles)
('Domestic'),  -- EnvironmentId = 3 (used for Mammals like Dogs)
('Air')        -- EnvironmentId = 4 (used for Birds)
GO


-- Insert sample data for [User]
-- Ensure RoleId exists in Role table
INSERT INTO [User] ([RoleId], [FullName], [Email], [PhoneNumber], [Address], [Username], [PasswordHash], [ProfilePictureUrl], [DateOfBirth], [CreatedAt], [UpdatedAt], [CreatedBy], [IsDeleted])
VALUES 
(1, 'Nguyen Van A', 'nguyena@example.com', '0905123456', '123 Koi Street', 'nguyena', 'hashedpassword1', 'customer1.jpg', '1987-10-05', GETDATE(), GETDATE(), 'System', 0),
(2, 'Dr. Le Thi B', 'drlethi@example.com', '0906789123', '456 Clinic Road', 'drlethi', 'hashedpassword2', 'veterinarian1.jpg', '1975-05-12', GETDATE(), GETDATE(), 'System', 0),
(3, 'Tran Van C', 'tranc@example.com', '0909988776', '789 Center St', 'tranc', 'hashedpassword3', 'staff1.jpg', '1992-03-08', GETDATE(), GETDATE(), 'System', 0),
(4, 'Pham Thi D', 'phamd@example.com', '0912345678', '321 Manager Ave', 'phamd', 'hashedpassword4', 'manager1.jpg', '1980-12-22', GETDATE(), GETDATE(), 'System', 0)
GO


-- Insert 3 more owners into the User table
-- Ensure RoleId = 1 corresponds to the "Customer" role
INSERT INTO [User] ([RoleId], [FullName], [Email], [PhoneNumber], [Address], [Username], [PasswordHash], [ProfilePictureUrl], [DateOfBirth], [CreatedAt], [UpdatedAt], [CreatedBy], [IsDeleted])
VALUES 
(1, 'Nguyen Thi E', 'nguyene@example.com', '0912456789', '654 Koi Pond Avenue', 'nguyene', 'hashedpassword5', 'customer2.jpg', '1990-06-25', GETDATE(), GETDATE(), 'System', 0),
(1, 'Tran Van F', 'tranvf@example.com', '0919876543', '987 Koi Village', 'tranvf', 'hashedpassword6', 'customer3.jpg', '1982-11-15', GETDATE(), GETDATE(), 'System', 0),
(1, 'Hoang Thi G', 'hoangg@example.com', '0911234567', '321 Fish Street', 'hoangg', 'hashedpassword7', 'customer4.jpg', '1995-02-20', GETDATE(), GETDATE(), 'System', 0)
GO

-- Insert sample data for [Veterinarian]
-- Ensure the UserId exists in User table with RoleId = 2 (Veterinarian)
INSERT INTO [Veterinarian] ([UserId], [Specialization], [LicenseNumber], [YearsOfExperience], [ClinicAddress], [ProfilePictureUrl], [Rating], [CreatedAt], [UpdatedAt], [CreatedBy], [IsDeleted])
VALUES 
(2, 'Koi Fish Specialist', 'VETKOI123', 15, '456 Clinic Road', 'veterinarian1.jpg', 4.9, GETDATE(), GETDATE(), 'System', 0)
GO

-- Insert sample data for [PetService]
-- Ensure ServiceCategoryId is valid
INSERT INTO [PetService] ([ServiceCategoryId], [BasePrice], [Duration], [ImageUrl], [StaffQuantity], [AvailableFrom], [AvailableTo], [TravelCost], [CreatedAt], [UpdatedAt], [CreatedBy], [IsDeleted])
VALUES 
(1, 200.00, '2 hours', 'consultation.jpg', 1, '2024-01-01 08:00:00', '2024-01-01 18:00:00', 50.00, GETDATE(), GETDATE(), 'System', 0),  -- On-site pond evaluation
(1, 100.00, '1 hour', 'onlineconsult.jpg', 1, '2024-01-01 09:00:00', '2024-01-01 17:00:00', 0.00, GETDATE(), GETDATE(), 'System', 0),  -- Online consultation
(2, 300.00, '3 hours', 'treatment.jpg', 2, '2024-01-01 10:00:00', '2024-01-01 17:00:00', 75.00, GETDATE(), GETDATE(), 'System', 0)  -- Disease treatment
GO

-- Insert sample data for [Pet]
-- Ensure PetTypeId and OwnerId exist
INSERT INTO [Pet] ([Name], [Age], [PetTypeId], [Breed], [ImageUrl], [Color], [Length], [Weight], [Quantity], [LastHealthCheck], [OwnerId], [HealthStatus], [CreatedAt], [UpdatedAt], [CreatedBy], [IsDeleted])
VALUES 
('KoiA', 2, 1, 'Kohaku', 'koia.jpg', 'Red and white', 0.8, 5.0, 1, '2023-12-15', 1, 1, GETDATE(), GETDATE(), 'System', 0),
('KoiB', 3, 1, 'Sanke', 'koib.jpg', 'White with red and black', 1.2, 6.5, 1, '2023-12-10', 1, 1, GETDATE(), GETDATE(), 'System', 0)
GO

INSERT INTO [Pet] ([Name], [Age], [PetTypeId], [Breed], [ImageUrl], [Color], [Length], [Weight], [Quantity], [LastHealthCheck], [OwnerId], [HealthStatus], [CreatedAt], [UpdatedAt], [CreatedBy], [IsDeleted])
VALUES 
('KoiC', 1, 1, 'Showa', 'koic.jpg', 'Black, red, and white', 1.1, 4.8, 1, '2023-12-05', 1, 1, GETDATE(), GETDATE(), 'System', 0),
('KoiD', 4, 2, 'Sanke', 'koid.jpg', 'Blue with red', 0.9, 5.3, 1, '2023-11-28', 1, 1, GETDATE(), GETDATE(), 'System', 0),
('KoiE', 2, 3, 'Showa', 'koie.jpg', 'Blue-gray with red', 1.3, 7.0, 1, '2023-12-01', 1, 1, GETDATE(), GETDATE(), 'System', 0),
('KoiF', 5, 4, 'Ogon', 'koif.jpg', 'White with red spot', 1.0, 6.2, 1, '2023-11-20', 1, 1, GETDATE(), GETDATE(), 'System', 0),
('KoiG', 3, 1, 'Kohaku', 'koig.jpg', 'Black with red and white', 1.4, 6.8, 1, '2023-12-08', 1, 1, GETDATE(), GETDATE(), 'System', 0),
('KoiH', 4, 2, 'Sanke', 'koih.jpg', 'White with blue edges', 1.0, 5.5, 1, '2023-12-03', 1, 1, GETDATE(), GETDATE(), 'System', 0),
('KoiI', 2, 3, 'Showa', 'koii.jpg', 'Black with white patterns', 1.1, 6.0, 1, '2023-12-07', 1, 1, GETDATE(), GETDATE(), 'System', 0),
('KoiJ', 3, 4, 'Ogon', 'koij.jpg', 'Brownish-green', 1.5, 7.5, 1, '2023-11-25', 1, 1, GETDATE(), GETDATE(), 'System', 0);


-- Insert sample data for [Product]
-- Ensure ProductCategoryId is valid
INSERT INTO [Product] ([ProductCategoryId], [Name], [Description], [Price], [StockQuantity], [ImageUrl], [CreatedAt], [UpdatedAt], [CreatedBy], [IsDeleted])
VALUES 
(1, 'Koi Food Premium', 'High-quality koi food to enhance color and growth', 50.00, 500, 'koifood.jpg', GETDATE(), GETDATE(), 'System', 0),
(1, 'Pond Filter', 'Efficient filter for Koi ponds', 200.00, 100, 'pondfilter.jpg', GETDATE(), GETDATE(), 'System', 0)
GO

-- Insert sample data for [ProductCategory]
INSERT INTO [ProductCategory] ([Name], [Description])
VALUES 
('Koi Food', 'Food products for Koi fish'),
('Pond Equipment', 'Equipment for pond maintenance and improvement')
GO

-- Insert sample data for [Feedback]
-- Ensure ServiceId and CustomerId are valid
INSERT INTO [Feedback] ([ServiceId], [CustomerId], [Rating], [FeedbackText])
VALUES 
(1, 1, 4.8, 'The on-site pond evaluation was thorough and very informative.'),
(2, 1, 4.7, 'The online consultation provided great advice on improving my Koi care.')
GO

-- Insert sample data for [Order]
-- Ensure CustomerId is valid
INSERT INTO [Order] ([CustomerId], [TotalPrice], [OrderDate], [OrderStatus], [CreatedAt], [UpdatedAt], [CreatedBy], [IsDeleted])
VALUES 
(1, 250.00, GETDATE(), 'Completed', GETDATE(), GETDATE(), 'System', 0),
(1, 100.00, GETDATE(), 'Processing', GETDATE(), GETDATE(), 'System', 0)
GO




---- Disable all foreign key constraints
--EXEC sp_msforeachtable "ALTER TABLE ? NOCHECK CONSTRAINT all"


---- Delete data from all tables
--EXEC sp_msforeachtable "DELETE FROM ?"


---- Re-enable all foreign key constraints
--EXEC sp_msforeachtable "ALTER TABLE ? WITH CHECK CHECK CONSTRAINT all"