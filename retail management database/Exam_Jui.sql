create database Inventory_Management_System;

create table Customer (
    CustomerID INT AUTO_INCREMENT primary key,
    FirstName VARCHAR (50) NOT NULL,
    LastName VARCHAR (50) NOT NULL,
    BirthDate DATE NOT NULL,
    EmailID VARCHAR (50) NOT NULL,
    Phone VARCHAR (15) NOT NULL,
    Address VARCHAR (100) NOT NULL
);

create table Department (
    DepartmentID INT AUTO_INCREMENT primary key,
    DepartmentName VARCHAR (50) NOT NULL
);

create table Employee (
    EmployeeID INT AUTO_INCREMENT primary key,
    Name VARCHAR (50) NOT NULL,
    Position VARCHAR (30) NOT NULL,
    EmailID VARCHAR (50) NOT NULL,
    Phone VARCHAR (15) NOT NULL,
    DepartmentID INT NOT null,
    foreign key (DepartmentID) references Department (DepartmentID)
);

create table Orders (
    OrderID INT AUTO_INCREMENT primary key,
    OrderDate DATE NOT NULL,
    TotalAmount DECIMAL (8,2) NOT NULL,
    PaymentStatus VARCHAR (50) NOT NULL,
    ShippingAddress VARCHAR (100) NOT NULL,
    CustomerID INT NOT NULL,
    EmployeeID INT NOT null,
    foreign key (CustomerID) references Customer (CustomerID),
    foreign key (EmployeeID) references Employee (EmployeeID)
);

create table Transaction (
    TransactionID INT AUTO_INCREMENT primary key,
    PaymentMethod VARCHAR (30) NOT NULL,
    PaymentDate DATE NOT NULL
);

create table Payment (
    PaymentID INT AUTO_INCREMENT primary key,
    TransactionID INT NOT NULL,
    AmountPaid DECIMAL (8,2) NOT null,
    foreign key (TransactionID) references transaction (TransactionID)
);

create table ParentCategory (
    ParentCategoryID INT AUTO_INCREMENT primary key,
    Description VARCHAR (100) NOT NULL
);

create table Category (
    CategoryID INT AUTO_INCREMENT primary key,
    CategoryName VARCHAR (50) NOT NULL,
    ParentCategoryID INT NOT null,
    IsActive BOOLEAN not null,
    CreatedDate DATE not null,
    foreign key (ParentCategoryID) references ParentCategory (ParentCategoryID)
);


create table Supplier (
    SupplierID INT AUTO_INCREMENT primary key,
    SupplierName VARCHAR (50) NOT NULL,
    ContactPerson VARCHAR (50) NOT NULL,
    EmailID VARCHAR (50) NOT NULL,
    Phone VARCHAR (15) NOT null,
    Address VARCHAR (100) not null
);

create table Manager (
    ManagerID INT AUTO_INCREMENT primary key,
    ManagerName VARCHAR (50) NOT NULL,
    Phone VARCHAR (15) NOT NULL
);

create table Warehouse (
    WarehouseID INT AUTO_INCREMENT primary key,
    WarehouseName VARCHAR (50) NOT NULL,
    WarehouseLocation VARCHAR (100) NOT null,
    Capacity DECIMAL (5,2) not null,
    ManagerID INT not null,
    foreign key (ManagerID) references Manager (ManagerID)
);

create table Inventory (
    InventoryID INT AUTO_INCREMENT primary key,
    WarehouseID INT NOT NULL,
    StockLevel DECIMAL (5,2) NOT null,
    LastUpdated DATE not null,
    ReorderPoint DECIMAL (5,2) not null,
    SupplierID INT not null,
    foreign key (WarehouseID) references Warehouse (WarehouseID),
    foreign key (SupplierID) references Supplier (SupplierID)
);


create table Product (
    ProductID INT AUTO_INCREMENT primary key,
    ProductName VARCHAR (50) not null,
    Category VARCHAR (50) not null,
    Price DECIMAL (8,2) not null,
    InventoryID INT not null,
    Description VARCHAR (100) not null,
    CategoryID INT not null,
    foreign key (InventoryID) references Inventory (InventoryID),
    foreign key (CategoryID) references Category (CategoryID)
);

create table OrderDetails (
    OrderDetailsID INT AUTO_INCREMENT primary key,
    OrderID INT not null,
    ProductID INT not null,
    Quantity INT not null,
    Price DECIMAL (8,2) not null,
    Discount DECIMAL (5,2) not null,
    PaymentID INT not null,
    foreign key (ProductID) references Product (ProductID),
    foreign key (PaymentID) references Payment (PaymentID),
    foreign key (OrderID) references Orders (OrderID)
);

insert into Customer (FirstName, LastName, BirthDate, EmailID, Phone, Address) values
('John', 'Doe', '1990-05-15', 'john.doe@gmail.com', '555-123-4567', '123 Elm Street, Toronto, ON'),
('Jane', 'Smith', '1985-09-22', 'jane.smith@yahoo.com', '555-987-6543', '456 Maple Avenue, Vancouver, BC'),
('Michael', 'Johnson', '1992-12-10', 'michael.j@hotmail.com', '555-234-5678', '789 Oak Road, Calgary, AB'),
('Emily', 'Brown', '1988-03-05', 'emily.brown@gmail.com', '555-345-6789', '321 Pine Street, Montreal, QC'),
('David', 'Wilson', '1995-07-30', 'david.wilson@yahoo.com', '555-456-7890', '654 Cedar Lane, Ottawa, ON');


insert into Department (DepartmentName) values
('Human Resources'),
('Finance'),
('Marketing'),
('Sales'),
('IT'),
('Customer Support');


insert into Employee (Name, Position, EmailID, Phone, DepartmentID) values
('Alice Johnson', 'HR Manager', 'alice.johnson@gmail.com', '555-101-2345', 1),
('Brian Smith', 'Accountant', 'brian.smith@yahoo.com', '555-102-3456', 2),
('Catherine Lee', 'Marketing Specialist', 'catherine.lee@hotmail.com', '555-103-4567', 3),
('Daniel Brown', 'Sales Executive', 'daniel.brown@gmail.com', '555-104-5678', 4),
('Evelyn Davis', 'IT Support', 'evelyn.davis@yahoo.com', '555-105-6789', 5);



insert into Orders (OrderDate, TotalAmount, PaymentStatus, ShippingAddress, CustomerID, EmployeeID) values
('2025-11-01', 250.75, 'Paid', '123 Elm Street, Toronto, ON', 1, 1),
('2025-11-03', 120.50, 'Pending', '456 Maple Avenue, Vancouver, BC', 2, 2),
('2025-11-05', 310.00, 'Paid', '789 Oak Road, Calgary, AB', 3, 3),
('2025-11-07', 450.25, 'Shipped', '321 Pine Street, Montreal, QC', 4, 4),
('2025-11-10', 89.99, 'Cancelled', '654 Cedar Lane, Ottawa, ON', 5, 5);

insert into Transaction (PaymentMethod, PaymentDate) values
('Credit Card', '2025-11-01'),
('PayPal', '2025-11-03'),
('Debit Card', '2025-11-05'),
('Bank Transfer', '2025-11-07'),
('Cash', '2025-11-10');

insert into Payment (TransactionID, AmountPaid ) values
(1, 250.75),
(2, 120.50),
(3, 310.00),
(4, 450.25),
(5, 89.99);

insert into ParentCategory (Description) values
('Electronics and Gadgets'),
('Home and Kitchen Appliances'),
('Clothing and Accessories'),
('Books and Stationery'),
('Health and Personal Care');

insert into Category (CategoryName, ParentCategoryID, IsActive, CreatedDate) values
('Smartphones', 1, TRUE, '2025-01-15'),
('Laptops', 1, TRUE, '2025-02-10'),
('Kitchen Appliances', 2, TRUE, '2025-03-05'),
('Men Clothing', 3, TRUE, '2025-04-20'),
('Personal Care', 5, TRUE, '2025-05-12');

insert into Supplier (SupplierName, ContactPerson, EmailID, Phone, Address ) values
('TechSource Inc.', 'Alice Martin', 'alice.martin@gmail.com', '555-201-3456', '100 Tech Park, Toronto, ON'),
('HomeGoods Co.', 'Brian Lee', 'brian.lee@yahoo.com', '555-202-4567', '200 Maple Street, Vancouver, BC'),
('FashionHub Ltd.', 'Catherine Kim', 'catherine.kim@hotmail.com', '555-203-5678', '300 Oak Avenue, Calgary, AB'),
('BookWorld', 'Daniel Smith', 'daniel.smith@gmail.com', '555-204-6789', '400 Pine Road, Montreal, QC'),
('HealthPlus', 'Evelyn Brown', 'evelyn.brown@yahoo.com', '555-205-7890', '500 Cedar Lane, Ottawa, ON');

insert into Manager (ManagerName, Phone) values
('John Peterson', '555-301-1234'),
('Mary Thompson', '555-302-2345'),
('Robert Johnson', '555-303-3456'),
('Linda Davis', '555-304-4567'),
('Michael Wilson', '555-305-5678');

insert into Warehouse (WarehouseName, WarehouseLocation, Capacity, ManagerID ) values
('Central Warehouse', '123 Main Street, Toronto, ON', 150.50, 1),
('Westside Depot', '456 Maple Avenue, Vancouver, BC', 120.75, 2),
('North Storage', '789 Oak Road, Calgary, AB', 100.00, 3),
('East Logistics', '321 Pine Street, Montreal, QC', 130.25, 4),
('South Hub', '654 Cedar Lane, Ottawa, ON', 110.80, 5);

insert into Inventory (WarehouseID, StockLevel, LastUpdated, ReorderPoint, SupplierID) values
(1, 500.00, '2025-11-01', 100.00, 1),
(2, 300.50, '2025-11-02', 50.00, 2),
(3, 450.25, '2025-11-03', 75.00, 3),
(4, 600.75, '2025-11-04', 120.00, 4),
(5, 250.00, '2025-11-05', 60.00, 5);



insert into Product (ProductName, Category, Price, InventoryID, Description, CategoryID) values
('iPhone 15', 'Smartphones', 1200.00, 1, 'Latest Apple smartphone with advanced features', 1),
('Dell XPS 13', 'Laptops', 1500.00, 2, 'High-performance laptop for professionals', 2),
('Blender Pro', 'Kitchen Appliances', 85.50, 3, 'Multi-speed kitchen blender', 3),
('Men T-Shirt', 'Men Clothing', 25.00, 4, 'Cotton T-shirt for men', 4),
('Vitamin C Supplement', 'Personal Care', 15.75, 5, 'Daily vitamin C tablets for immunity', 5);

insert into OrderDetails (OrderID, ProductID, Quantity, Price, Discount, PaymentID) values
(1, 1, 1, 1200.00, 50.00, 1),
(2, 2, 1, 1500.00, 100.00, 2),
(3, 3, 2, 85.50, 10.00, 3),
(4, 4, 3, 25.00, 5.00, 4),
(5, 5, 5, 15.75, 0.00, 5);

select * from Supplier;

ALTER TABLE Payment
RENAME COLUMN AmountPaid TO PaymentAmount;

ALTER TABLE Payment
MODIFY PaymentAmount DECIMAL(10,2) NOT NULL;


ALTER TABLE OrderDetails
DROP FOREIGN KEY orderdetails_ibfk_2;

ALTER TABLE OrderDetails
DROP COLUMN PaymentID;

DROP TABLE Payment;

ALTER TABLE Inventory DROP FOREIGN KEY inventory_ibfk_1;
TRUNCATE TABLE Warehouse;

