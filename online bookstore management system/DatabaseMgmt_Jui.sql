CREATE DATABASE Online_Bookstore_Management_System;
USE Online_Bookstore_Management_System;


CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Phone VARCHAR(15) NULL,
    Email VARCHAR(50) UNIQUE,
    Address VARCHAR(100),
    MembershipType VARCHAR(20) DEFAULT 'Regular'
);

CREATE TABLE Authors (
    AuthorID INT AUTO_INCREMENT PRIMARY KEY,
    AuthorFirstName VARCHAR(50),
    AuthorLastName VARCHAR(50),
    Phone VARCHAR(15) NULL,
    Email VARCHAR(50) UNIQUE,
    Address VARCHAR(100)
);

CREATE TABLE Categories (
    CategoryID INT AUTO_INCREMENT PRIMARY KEY,
    CategoryName VARCHAR(50),
    Description VARCHAR(100)
);

CREATE TABLE Books (
    BookID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(100),
    Price DECIMAL(6,2),
    PublishedDate DATE,
    Stock INT,
    AuthorID INT,
    CategoryID INT,
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID),
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    OrderDateTime DATETIME,
    TotalAmount DECIMAL(8,2),
    OrderStatus VARCHAR(15),
    CustomerID INT,
    InventoryRestored BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE OrderDetails (
    OrderDetailsID INT AUTO_INCREMENT PRIMARY KEY,
    Quantity INT,
    UnitPrice DECIMAL(6,2),
    BookID INT,
    OrderID INT,
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

CREATE TABLE Payments (
    PaymentID INT AUTO_INCREMENT PRIMARY KEY,
    PaymentDate DATE,
    PaymentAmount DECIMAL(8,2),
    PaymentMethod VARCHAR(15),
    PaymentStatus VARCHAR(15),
    OrderID INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- =========================
-- INSERT DATA: CUSTOMERS
-- =========================

INSERT INTO Customers (FirstName, LastName, Phone, Email, Address, MembershipType) VALUES
('Liam', 'Anderson', '4165551234', 'liam.anderson@gmail.com', '123 Queen St W, Toronto, ON', 'Gold'),
('Emma', 'Tremblay', '5145552345', 'emma.tremblay@yahoo.com', '456 Rue Sainte-Catherine, Montreal, QC', 'Silver'),
('Noah', 'Chen', '6045553456', 'noah.chen@hotmail.com', '789 Granville St, Vancouver, BC', 'Platinum'),
('Olivia', 'Martin', '4035554567', 'olivia.martin@gmail.com', '321 8 Ave SW, Calgary, AB', 'Regular'),
('William', 'Singh', '9055555678', 'william.singh@yahoo.com', '654 Main St, Brampton, ON', 'Gold'),
('Ava', 'Roy', '4385556789', 'ava.roy@hotmail.com', '987 Blvd Saint-Laurent, Montreal, QC', 'Silver'),
('James', 'Wilson', '6475557890', 'james.wilson@gmail.com', '159 King St E, Toronto, ON', 'Platinum'),
('Sophia', 'Gagnon', '4505558901', 'sophia.gagnon@yahoo.com', '753 Chemin Chambly, Longueuil, QC', 'Regular'),
('Benjamin', 'Brown', '7785559012', 'benjamin.brown@hotmail.com', '852 Hastings St, Vancouver, BC', 'Regular'),
('Isabella', 'Taylor', '7805550123', 'isabella.taylor@gmail.com', '951 Jasper Ave, Edmonton, AB', 'Gold'),
('Lucas', 'White', '6135551122', 'lucas.white@yahoo.com', '741 Bank St, Ottawa, ON', 'Silver'),
('Mia', 'Clark', '2895552233', 'mia.clark@hotmail.com', '852 Dundas St, Mississauga, ON', 'Platinum'),
('Henry', 'Lewis', '9025553344', 'henry.lewis@gmail.com', '963 Spring Garden Rd, Halifax, NS', 'Regular'),
('Charlotte', 'Walker', '7055554455', 'charlotte.walker@yahoo.com', '147 Bayfield St, Barrie, ON', 'Regular'),
('Alexander', 'Hall', '2045555566', 'alex.hall@hotmail.com', '258 Portage Ave, Winnipeg, MB', 'Gold'),
('Amelia', 'Young', '3065556677', 'amelia.young@gmail.com', '369 2nd Ave N, Saskatoon, SK', 'Silver'),
('Daniel', 'Allen', '5195557788', 'daniel.allen@yahoo.com', '159 Richmond St, London, ON', 'Regular'),
('Harper', 'King', '7095558899', 'harper.king@hotmail.com', '753 Water St, St Johns, NL', 'Regular'),
('Matthew', 'Wright', '3435559900', 'matthew.wright@gmail.com', '951 Elgin St, Ottawa, ON', 'Gold'),
('Evelyn', 'Scott', '8675551010', 'evelyn.scott@yahoo.com', '357 Franklin Ave, Yellowknife, NT', 'Silver'),
('Jackson', 'Green', '2505551111', 'jackson.green@hotmail.com', '654 Douglas St, Victoria, BC', 'Regular'),
('Abigail', 'Baker', '2265552222', 'abigail.baker@gmail.com', '852 King St N, Waterloo, ON', 'Regular'),
('Sebastian', 'Adams', '3655553333', 'sebastian.adams@yahoo.com', '741 Upper James St, Hamilton, ON', 'Gold'),
('Emily', 'Nelson', '5795554444', 'emily.nelson@hotmail.com', '963 Rue Sherbrooke, Montreal, QC', 'Silver'),
('David', 'Carter', '4185555555', 'david.carter@gmail.com', '147 Grande Allee, Quebec City, QC', 'Regular'),
('Ella', 'Mitchell', '5065556666', 'ella.mitchell@yahoo.com', '258 King St, Fredericton, NB', 'Regular'),
('Joseph', 'Perez', '9025557777', 'joseph.perez@hotmail.com', '369 University Ave, Charlottetown, PE', 'Platinum'),
('Scarlett', 'Roberts', '4165558888', 'scarlett.roberts@gmail.com', '951 Bloor St W, Toronto, ON', 'Gold'),
('Samuel', 'Turner', '5145559999', 'samuel.turner@yahoo.com', '753 Rue Notre-Dame, Montreal, QC', 'Silver'),
('Victoria', 'Phillips', '6045550000', 'victoria.phillips@hotmail.com', '852 Robson St, Vancouver, BC', 'Regular');

-- =========================
-- INSERT DATA: AUTHORS
-- =========================

INSERT INTO Authors (AuthorFirstName, AuthorLastName, Phone, Email, Address) VALUES
('Ethan', 'McLeod', '4165551111', 'ethan.mcleod@gmail.com', '12 King St W, Toronto, ON'),
('Chloe', 'Bouchard', '5145552222', 'chloe.bouchard@yahoo.com', '45 Rue Saint-Paul, Montreal, QC'),
('Lucas', 'Nguyen', '6045553333', 'lucas.nguyen@hotmail.com', '78 Granville St, Vancouver, BC'),
('Mason', 'OConnor', '4035554444', 'mason.oconnor@gmail.com', '90 17 Ave SW, Calgary, AB'),
('Sophie', 'Desjardins', '4385555555', 'sophie.desjardins@yahoo.com', '123 Rue Rachel, Montreal, QC'),
('Oliver', 'Patel', '9055556666', 'oliver.patel@hotmail.com', '56 Main St, Brampton, ON'),
('Amelie', 'Gauthier', '4505557777', 'amelie.gauthier@gmail.com', '89 Chemin du Lac, Laval, QC'),
('Jack', 'Thompson', '6475558888', 'jack.thompson@yahoo.com', '34 Queen St E, Toronto, ON'),
('Lily', 'Roy', '4185559999', 'lily.roy@hotmail.com', '67 Grande Allee, Quebec City, QC'),
('Noah', 'Kaur', '7805550001', 'noah.kaur@gmail.com', '88 Jasper Ave, Edmonton, AB'),
('Aiden', 'Campbell', '6135551010', 'aiden.campbell@yahoo.com', '23 Bank St, Ottawa, ON'),
('Zoe', 'Lefebvre', '5795552020', 'zoe.lefebvre@hotmail.com', '45 Rue Sherbrooke, Montreal, QC'),
('Benjamin', 'Wong', '7785553030', 'benjamin.wong@gmail.com', '67 Robson St, Vancouver, BC'),
('Mila', 'Girard', '8195554040', 'mila.girard@yahoo.com', '12 Rue King, Gatineau, QC'),
('Logan', 'Murphy', '9025555050', 'logan.murphy@hotmail.com', '34 Spring Garden Rd, Halifax, NS'),
('Ella', 'Tremblay', '4505556060', 'ella.tremblay@gmail.com', '78 Boulevard Cure-Labelle, Laval, QC'),
('William', 'Scott', '7055557070', 'william.scott@yahoo.com', '90 Bayfield St, Barrie, ON'),
('Charlotte', 'Dubois', '4185558080', 'charlotte.dubois@hotmail.com', '23 Rue Cartier, Quebec City, QC'),
('Henry', 'Singh', '2895559090', 'henry.singh@gmail.com', '56 Dundas St, Mississauga, ON'),
('Aria', 'Marchand', '5145551112', 'aria.marchand@yahoo.com', '89 Rue Notre-Dame, Montreal, QC'),
('Sebastian', 'Reid', '2505551212', 'sebastian.reid@hotmail.com', '34 Douglas St, Victoria, BC'),
('Victoria', 'Poirier', '5065551313', 'victoria.poirier@gmail.com', '78 King St, Fredericton, NB'),
('Daniel', 'Cooper', '5195551414', 'daniel.cooper@yahoo.com', '12 Richmond St, London, ON'),
('Avery', 'Fortin', '4185551515', 'avery.fortin@hotmail.com', '67 Rue Saint-Jean, Quebec City, QC'),
('Matthew', 'Bell', '3435551616', 'matthew.bell@gmail.com', '45 Elgin St, Ottawa, ON'),
('Scarlett', 'Gagne', '4385551717', 'scarlett.gagne@yahoo.com', '89 Rue Laurier, Montreal, QC'),
('David', 'Peters', '2045551818', 'david.peters@hotmail.com', '23 Portage Ave, Winnipeg, MB'),
('Emily', 'Lavoie', '4505551919', 'emily.lavoie@gmail.com', '56 Boulevard Saint-Martin, Laval, QC'),
('Joseph', 'Bennett', '9025552021', 'joseph.bennett@yahoo.com', '78 Hollis St, Halifax, NS'),
('Grace', 'Carriere', '8675552121', 'grace.carriere@hotmail.com', '12 Franklin Ave, Yellowknife, NT');

-- =========================
-- INSERT DATA: CATEGORIES
-- =========================

INSERT INTO Categories (CategoryName, Description) VALUES
('Fiction', 'Imaginary stories including novels and short stories'),
('Non-Fiction', 'Informative books based on real facts and events'),
('Science Fiction', 'Futuristic concepts, space, and advanced technology'),
('Fantasy', 'Magic, mythical creatures, and imaginary worlds'),
('Mystery', 'Suspenseful stories involving solving crimes or puzzles'),
('Thriller', 'Fast-paced stories with tension and excitement'),
('Romance', 'Love stories and emotional relationships'),
('Historical Fiction', 'Stories set in historical time periods'),
('Biography', 'Life stories of real people'),
('Autobiography', 'Self-written life stories'),
('Self-Help', 'Books focused on personal development and growth'),
('Business', 'Entrepreneurship, management, and finance topics'),
('Technology', 'Books about computers, IT, and modern tech'),
('Programming', 'Coding languages, software development, and algorithms'),
('Health & Fitness', 'Wellness, exercise, and healthy living'),
('Cooking', 'Recipes, culinary skills, and food culture'),
('Travel', 'Guides and experiences from around the world'),
('Children', 'Books for young readers and kids'),
('Young Adult', 'Books targeted toward teenagers'),
('Education', 'Academic and learning materials'),
('Religion & Spirituality', 'Beliefs, faith, and spiritual practices'),
('Science', 'Physics, chemistry, biology, and research topics'),
('History', 'Events and civilizations from the past'),
('Art & Photography', 'Creative arts, design, and visual storytelling'),
('Comics & Graphic Novels', 'Illustrated stories and comic books'),
('Poetry', 'Collections of poems and literary expressions'),
('Horror', 'Scary and supernatural stories'),
('Drama', 'Serious narratives with emotional themes'),
('Sports', 'Books about sports, athletes, and training'),
('Politics', 'Government, policies, and political analysis');

-- =========================
-- INSERT DATA: BOOKS
-- =========================

INSERT INTO Books (Title, Price, PublishedDate, Stock, AuthorID, CategoryID) VALUES
('The Silent Forest', 19.99, '2020-05-12', 50, 5, 12),
('Beyond the Horizon', 24.50, '2019-08-23', 40, 2, 7),
('Galactic Wars', 29.99, '2021-03-15', 35, 14, 3),
('Dragon Realm', 22.75, '2018-11-10', 60, 8, 4),
('The Hidden Clue', 18.99, '2020-01-05', 45, 11, 5),
('Final Escape', 21.50, '2022-06-20', 30, 3, 6),
('Love in Paris', 17.99, '2017-02-14', 55, 7, 7),
('War of Kings', 26.99, '2016-09-09', 25, 15, 8),
('Life of a Genius', 23.50, '2021-12-01', 20, 9, 9),
('My Journey', 20.00, '2019-04-18', 28, 1, 10),
('Better You', 15.99, '2022-01-10', 70, 6, 11),
('Startup Secrets', 27.99, '2021-07-07', 33, 12, 12),
('Future Tech', 30.00, '2023-03-03', 22, 4, 13),
('Learn SQL Fast', 18.50, '2022-10-10', 80, 14, 14),
('Healthy Living Guide', 16.75, '2020-06-06', 65, 10, 15),
('MasterChef Recipes', 28.25, '2018-12-12', 40, 16, 16),
('World Explorer', 21.00, '2019-05-25', 35, 18, 17),
('Kids Fun Stories', 14.99, '2021-11-11', 90, 20, 18),
('Teen Dreams', 19.50, '2020-08-08', 50, 19, 19),
('Math Basics', 25.00, '2017-09-01', 60, 13, 20),
('Spiritual Path', 18.00, '2016-03-03', 45, 21, 21),
('Physics Simplified', 27.50, '2022-04-04', 30, 22, 22),
('Ancient Civilizations', 24.00, '2018-07-07', 38, 17, 23),
('Creative Arts', 22.00, '2021-09-09', 27, 24, 24),
('Superhero Tales', 17.75, '2020-10-10', 75, 25, 25),
('Poems of Life', 13.99, '2019-01-01', 55, 23, 26),
('Night Terrors', 20.50, '2023-02-02', 20, 27, 27),
('Family Drama', 19.25, '2017-06-06', 42, 26, 28),
('Champions Mindset', 23.99, '2021-03-21', 33, 29, 29),
('Global Politics', 26.75, '2022-05-05', 29, 30, 30);

-- =========================
-- INSERT DATA: ORDERS
-- =========================

INSERT INTO Orders (OrderDateTime, TotalAmount, OrderStatus, CustomerID, InventoryRestored) VALUES
('2023-01-15 10:00:00', 59.99, 'Paid', 5, FALSE),
('2023-02-10 11:15:00', 34.50, 'Shipped', 12, FALSE),
('2023-03-05 09:30:00', 78.25, 'Pending', 3, FALSE),
('2023-03-18 14:20:00', 22.99, 'Paid', 8, FALSE),
('2023-04-02 16:00:00', 45.00, 'Cancelled', 1, TRUE),
('2023-04-20 13:45:00', 67.80, 'Shipped', 15, FALSE),
('2023-05-11 10:10:00', 19.99, 'Paid', 7, FALSE),
('2023-05-25 12:30:00', 120.50, 'Pending', 20, FALSE),
('2023-06-14 15:40:00', 89.30, 'Paid', 9, FALSE),
('2023-06-30 17:00:00', 54.75, 'Shipped', 2, FALSE),
('2023-07-08 09:50:00', 33.20, 'Paid', 6, FALSE),
('2023-07-19 11:25:00', 72.00, 'Cancelled', 11, TRUE),
('2023-08-01 08:35:00', 48.60, 'Pending', 14, FALSE),
('2023-08-16 14:10:00', 95.99, 'Shipped', 4, FALSE),
('2023-09-03 10:45:00', 27.45, 'Paid', 10, FALSE),
('2023-09-21 16:20:00', 66.10, 'Shipped', 18, FALSE),
('2023-10-05 13:00:00', 39.99, 'Pending', 13, FALSE),
('2023-10-22 15:15:00', 84.25, 'Paid', 16, FALSE),
('2023-11-11 09:05:00', 51.50, 'Cancelled', 19, TRUE),
('2023-11-29 12:40:00', 73.80, 'Shipped', 17, FALSE),
('2023-12-07 10:30:00', 29.99, 'Paid', 21, FALSE),
('2023-12-18 14:50:00', 110.00, 'Pending', 22, FALSE),
('2024-01-04 09:25:00', 64.40, 'Shipped', 23, FALSE),
('2024-01-19 11:55:00', 41.75, 'Paid', 24, FALSE),
('2024-02-06 16:35:00', 58.20, 'Cancelled', 25, TRUE),
('2024-02-20 13:20:00', 99.99, 'Shipped', 26, FALSE),
('2024-03-03 10:15:00', 36.60, 'Pending', 27, FALSE),
('2024-03-15 12:45:00', 82.10, 'Paid', 28, FALSE),
('2024-03-28 15:05:00', 47.35, 'Shipped', 29, FALSE),
('2024-04-01 17:30:00', 69.90, 'Paid', 30, FALSE);

-- =========================
-- INSERT DATA: ORDER DETAILS
-- =========================

INSERT INTO OrderDetails (Quantity, UnitPrice, BookID, OrderID) VALUES
(2, 19.99, 1, 1),
(1, 24.50, 2, 1),
(1, 29.99, 3, 2),
(3, 17.99, 7, 2),
(2, 22.75, 4, 3),
(1, 18.99, 5, 3),
(1, 21.50, 6, 4),
(2, 26.99, 8, 5),
(1, 20.00, 10, 5),
(1, 15.99, 11, 6),
(2, 27.99, 12, 6),
(1, 30.00, 13, 7),
(3, 18.50, 14, 8),
(2, 16.75, 15, 9),
(1, 28.25, 16, 9),
(1, 21.00, 17, 10),
(2, 14.99, 18, 11),
(1, 19.50, 19, 12),
(2, 25.00, 20, 13),
(1, 18.00, 21, 14),
(1, 27.50, 22, 14),
(2, 24.00, 23, 15),
(1, 22.00, 24, 16),
(3, 17.75, 25, 17),
(1, 13.99, 26, 18),
(2, 20.50, 27, 19),
(1, 19.25, 28, 20),
(2, 23.99, 29, 21),
(1, 26.75, 30, 22),
(1, 19.99, 1, 23),
(2, 24.50, 2, 23),
(1, 29.99, 3, 24),
(2, 22.75, 4, 25),
(1, 18.99, 5, 26),
(3, 21.50, 6, 27),
(2, 17.99, 7, 28),
(1, 26.99, 8, 29),
(2, 20.00, 10, 30);

-- =========================
-- INSERT DATA: PAYMENTS
-- =========================

INSERT INTO Payments (PaymentDate, PaymentAmount, PaymentMethod, PaymentStatus, OrderID) VALUES
('2023-01-15', 59.99, 'Credit Card', 'Completed', 1),
('2023-02-10', 34.50, 'PayPal', 'Completed', 2),
('2023-03-06', 78.25, 'Debit Card', 'Pending', 3),
('2023-03-18', 22.99, 'Credit Card', 'Completed', 4),
('2023-04-02', 45.00, 'Cash', 'Failed', 5),
('2023-04-20', 67.80, 'Debit Card', 'Completed', 6),
('2023-05-11', 19.99, 'Credit Card', 'Completed', 7),
('2023-05-25', 120.50, 'PayPal', 'Pending', 8),
('2023-06-14', 89.30, 'Credit Card', 'Completed', 9),
('2023-06-30', 54.75, 'Debit Card', 'Completed', 10),
('2023-07-08', 33.20, 'Credit Card', 'Completed', 11),
('2023-07-19', 72.00, 'Cash', 'Failed', 12),
('2023-08-01', 48.60, 'PayPal', 'Pending', 13),
('2023-08-16', 95.99, 'Debit Card', 'Completed', 14),
('2023-09-03', 27.45, 'Credit Card', 'Completed', 15),
('2023-09-21', 66.10, 'PayPal', 'Completed', 16),
('2023-10-05', 39.99, 'Debit Card', 'Pending', 17),
('2023-10-22', 84.25, 'Credit Card', 'Completed', 18),
('2023-11-11', 51.50, 'Cash', 'Failed', 19),
('2023-11-29', 73.80, 'Debit Card', 'Completed', 20),
('2023-12-07', 29.99, 'Credit Card', 'Completed', 21),
('2023-12-18', 110.00, 'PayPal', 'Pending', 22),
('2024-01-04', 64.40, 'Debit Card', 'Completed', 23),
('2024-01-19', 41.75, 'Credit Card', 'Completed', 24),
('2024-02-06', 58.20, 'Cash', 'Failed', 25),
('2024-02-20', 99.99, 'Debit Card', 'Completed', 26),
('2024-03-03', 36.60, 'PayPal', 'Pending', 27),
('2024-03-15', 82.10, 'Credit Card', 'Completed', 28),
('2024-03-28', 47.35, 'Debit Card', 'Completed', 29),
('2024-04-01', 69.90, 'Credit Card', 'Completed', 30);



USE Online_Bookstore_Management_System;

-- 3a. Views

-- 3a.1 vw_available_books_by_category

CREATE VIEW vw_available_books_by_category AS
SELECT
    b.BookID,
    b.Title,
    c.CategoryName,
    CONCAT(a.AuthorFirstName, ' ', a.AuthorLastName) AS AuthorName,
    b.Price,
    b.Stock
FROM Books b
JOIN Categories c
    ON b.CategoryID = c.CategoryID
JOIN Authors a
    ON b.AuthorID = a.AuthorID
WHERE b.Stock > 0;

-- 3a.2 vw_customer_order_summary 

CREATE VIEW vw_customer_order_summary AS
SELECT
    o.OrderID,
    o.OrderDateTime,
    CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName,
    o.TotalAmount,
    o.OrderStatus,
    o.InventoryRestored
FROM Orders o
JOIN Customers c
    ON o.CustomerID = c.CustomerID;
    
-- 3a.3 vw_revenue_by_category    

CREATE VIEW vw_revenue_by_category AS
SELECT
    c.CategoryID,
    c.CategoryName,
    SUM(od.Quantity) AS TotalBooksSold,
    SUM(od.Quantity * od.UnitPrice) AS TotalRevenue
FROM OrderDetails od
JOIN Books b
    ON od.BookID = b.BookID
JOIN Categories c
    ON b.CategoryID = c.CategoryID
JOIN Orders o
    ON od.OrderID = o.OrderID
WHERE o.OrderStatus IN ('Paid', 'Shipped')
GROUP BY c.CategoryID, c.CategoryName; 

-- =========================================================
-- Execute All views
-- =========================================================

SELECT * FROM vw_available_books_by_category;
SELECT * FROM vw_customer_order_summary;
SELECT * FROM vw_revenue_by_category;

-- =========================================================
-- User-Defined Functions (UDFs)
-- =========================================================

-- 3b.1 fn_get_discount_rate  

-- Create a user-defined function to return discount rate based on membership type
CREATE FUNCTION fn_get_discount_rate(p_membership VARCHAR(20))
RETURNS DECIMAL(5,2)
DETERMINISTIC  -- Indicates the function always returns the same output for the same input
BEGIN
    -- Declare a variable to store the calculated discount percentage
    DECLARE v_discount DECIMAL(5,2);

    -- Assign discount based on membership type using CASE logic
    SET v_discount =
        CASE
            -- Convert input to uppercase to make comparison case-insensitive
            WHEN UPPER(p_membership) = 'SILVER' THEN 5.00      -- 5% discount
            WHEN UPPER(p_membership) = 'GOLD' THEN 10.00       -- 10% discount
            WHEN UPPER(p_membership) = 'PLATINUM' THEN 15.00   -- 15% discount
            ELSE 0.00  -- No discount for other membership types
        END;

    -- Return the calculated discount value
    RETURN v_discount;
END;

-- Test the function by passing a membership type
SELECT fn_get_discount_rate('Gold') -- output: 10.00 ;


-- 3b.2 fn_discounted_price

-- Create a user-defined function to calculate the final price after applying a discount
CREATE FUNCTION fn_discounted_price(
    p_original_price DECIMAL(10,2),   -- Input parameter: original price of the product
    p_discount_rate DECIMAL(5,2)      -- Input parameter: discount percentage (e.g., 10 for 10%)
)
RETURNS DECIMAL(10,2)
DETERMINISTIC  -- Ensures the function always returns the same output for the same inputs
BEGIN
    -- Declare a variable to store the computed final price after discount
    DECLARE final_price DECIMAL(10,2);

    -- Calculate the discounted price using the formula:
    -- Final Price = Original Price - (Original Price × Discount Rate / 100)
    SET final_price = p_original_price - (p_original_price * p_discount_rate / 100);

    -- Return the calculated final price
    RETURN final_price;
END;

-- Test the function 
SELECT fn_discounted_price(1000,fn_get_discount_rate('Gold')) -- output: 900;



-- =========================================================
-- Stored Procedures
-- =========================================================

-- 3c.1 sp_update_inventory

-- Stored procedure to update book inventory after a purchase
-- Create procedure with input parameters:
-- p_BookID → ID of the book to update
-- p_Quantity → quantity to reduce from stock

CREATE PROCEDURE sp_update_inventory(
    IN p_BookID INT,
    IN p_Quantity INT
)
BEGIN
    -- Declare variables:
    -- v_stock → stores current stock of the book
    -- v_count → checks whether the book exists
    DECLARE v_stock INT DEFAULT 0;
    DECLARE v_count INT DEFAULT 0;

    -- Step 1: Check if the book exists in the Books table
    SELECT COUNT(*) INTO v_count
    FROM Books
    WHERE BookID = p_BookID;

    -- Step 2: Validate book existence
    IF v_count = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Book not found.';

    -- Step 3: Validate quantity input
    ELSEIF p_Quantity <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Quantity must be greater than zero.';

    ELSE
        -- Step 4: Retrieve current stock value
        SELECT Stock INTO v_stock
        FROM Books
        WHERE BookID = p_BookID;

        -- Step 5: Check if enough stock is available
        IF v_stock < p_Quantity THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Not enough stock available.';

        ELSE
            -- Step 6: Update inventory by reducing stock
            UPDATE Books
            SET Stock = Stock - p_Quantity
            WHERE BookID = p_BookID;

            -- Optional: return success message
            SELECT 'Inventory updated successfully' AS message;
        END IF;
    END IF;
END;

-- Check stock BEFORE
SELECT BookID, Stock 
FROM Books 
WHERE BookID = 3;

-- Run procedure
CALL sp_update_inventory(3, 2);

-- Check stock AFTER
SELECT BookID, Stock 
FROM Books 
WHERE BookID = 3;


-- 3c.2 sp_place_order 

-- Create stored procedure to place a new order
CREATE PROCEDURE sp_place_order(
    IN p_CustomerID INT,   -- Input: Customer placing the order
    IN p_BookID INT,       -- Input: Book being ordered
    IN p_Quantity INT      -- Input: Quantity requested
)
BEGIN

    -- Declare variables to store intermediate values
    DECLARE v_price DECIMAL(10,2);          -- Stores book price
    DECLARE v_stock INT;                    -- Stores available stock
    DECLARE v_membership VARCHAR(20);       -- Stores customer membership type
    DECLARE v_discount_rate DECIMAL(5,2);   -- Stores discount percentage
    DECLARE v_original_total DECIMAL(10,2); -- Total before discount
    DECLARE v_final_total DECIMAL(10,2);    -- Total after discount
    DECLARE v_order_id INT;                 -- Stores generated OrderID

   
    -- Step 1: Validate quantity
  
    IF p_Quantity <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Quantity must be greater than zero.';
    END IF;


    -- Step 2: Get book details
  
    SELECT Price, Stock INTO v_price, v_stock
    FROM Books
    WHERE BookID = p_BookID;

    -- Check if book exists
    IF v_price IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Book not found.';
    END IF;

    -- Check if enough stock is available
    IF v_stock < p_Quantity THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Insufficient stock.';
    END IF;

 
    -- Step 3: Get customer membership
 
    SELECT MembershipType INTO v_membership
    FROM Customers
    WHERE CustomerID = p_CustomerID;

    -- Check if customer exists
    IF v_membership IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Customer not found.';
    END IF;


    -- Step 4: Calculate pricing
  
    -- Get discount rate using UDF
    SET v_discount_rate = fn_get_discount_rate(v_membership);

    -- Calculate total before discount
    SET v_original_total = v_price * p_Quantity;

    -- Calculate final price after discount using UDF
    SET v_final_total = fn_discounted_price(v_original_total, v_discount_rate);

 
    -- Step 5: Create order record
  
    INSERT INTO Orders (
        OrderDateTime,
        TotalAmount,
        OrderStatus,
        CustomerID,
        InventoryRestored
    )
    VALUES (
        NOW(),              -- Current timestamp
        v_final_total,      -- Final discounted amount
        'Pending',          -- Initial order status
        p_CustomerID,
        FALSE               -- Inventory not restored yet
    );

    -- Capture the generated OrderID
    SET v_order_id = LAST_INSERT_ID();

    -- Step 6: Insert order details
 
    INSERT INTO OrderDetails (
        Quantity,
        UnitPrice,
        BookID,
        OrderID
    )
    VALUES (
        p_Quantity,
        v_price,
        p_BookID,
        v_order_id
    );


    -- Step 7: Update inventory
   
    CALL sp_update_inventory(p_BookID, p_Quantity);


    -- Step 8: Return output
  
    SELECT
        v_order_id AS OrderID,
        v_original_total AS OriginalAmount,
        v_discount_rate AS DiscountPercent,
        v_final_total AS FinalAmount;
END;

-- Testing
-- Step 1: Check stock before
SELECT BookID, Stock FROM Books WHERE BookID = 1;


-- Step 2: Place order “Customer 1 is ordering 2 copies of Book 1”
CALL sp_place_order(1, 1, 2);

-- Step 3: Check stock after
SELECT BookID, Stock FROM Books WHERE BookID = 1;


-- 3c.3 sp_process_payment -----------

-- Create stored procedure to process a payment for an order
CREATE PROCEDURE sp_process_payment(
    IN p_OrderID INT,             -- Input: Order ID for which payment is being made
    IN p_PaymentMethod VARCHAR(15), -- Input: Payment method (e.g., Credit Card, PayPal)
    IN p_PaymentStatus VARCHAR(15)  -- Input: Payment status (Completed, Pending, Failed)
)
BEGIN

    -- Declare variables to store intermediate values
    DECLARE v_total DECIMAL(8,2);  -- Stores total order amount
    DECLARE v_exists INT;          -- Stores whether order exists (count)

   
    -- Step 1: Validate order existence
    -- Count matching order and get its total amount
    SELECT COUNT(*), MAX(TotalAmount)
    INTO v_exists, v_total
    FROM Orders
    WHERE OrderID = p_OrderID;

    -- If no order found, raise an error
    IF v_exists = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Order not found.';
    END IF;


    -- Step 2: Validate payment status
    -- Ensure only valid statuses are accepted
    IF p_PaymentStatus NOT IN ('Completed', 'Pending', 'Failed') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid payment status.';
    END IF;

   
    -- Step 3: Insert payment record
   
    INSERT INTO Payments (
        PaymentDate,
        PaymentAmount,
        PaymentMethod,
        PaymentStatus,
        OrderID
    )
    VALUES (
        CURDATE(),          -- Current date
        v_total,            -- Total order amount
        p_PaymentMethod,    -- Payment method provided
        p_PaymentStatus,    -- Payment status provided
        p_OrderID           -- Associated order
    );

  
    -- Step 4: Update order status
    -- Update order status based on payment result

    IF p_PaymentStatus = 'Completed' THEN
        -- If payment successful → mark order as Paid
        UPDATE Orders
        SET OrderStatus = 'Paid'
        WHERE OrderID = p_OrderID;

    ELSEIF p_PaymentStatus = 'Failed' THEN
        -- If payment failed → cancel the order
        UPDATE Orders
        SET OrderStatus = 'Cancelled'
        WHERE OrderID = p_OrderID;

    ELSEIF p_PaymentStatus = 'Pending' THEN
        -- If payment still pending → keep order as Pending
        UPDATE Orders
        SET OrderStatus = 'Pending'
        WHERE OrderID = p_OrderID;
    END IF;

END;


-- Testing
-- Check an existing order

SELECT OrderID, TotalAmount, OrderStatus
FROM Orders
ORDER BY OrderID DESC;

-- Run the procedure
CALL sp_process_payment(31, 'Credit Card', 'Completed');

-- Check if payment was inserted
SELECT *
FROM Payments
ORDER BY PaymentID DESC
LIMIT 1;

-- Check if order status changed
SELECT OrderID, TotalAmount, OrderStatus
FROM Orders
WHERE OrderID = 31;

SELECT * FROM Orders ORDER BY OrderID DESC;



-- =========================================================
-- Events


-- 3d.1 evt_cancel_unpaid_orders — Purpose & Schedule
-- Purpose:
-- Automatically cancel/remove unpaid orders that remain
-- Pending for more than 48 hours.
-- Restore stock before deleting the order.
-- Runs every 1 hour.



SET GLOBAL event_scheduler = ON;

DROP EVENT IF EXISTS evt_cancel_unpaid_orders;

CREATE EVENT evt_cancel_unpaid_orders
ON SCHEDULE EVERY 1 HOUR
DO
DELETE FROM Orders
WHERE OrderStatus = 'Pending'
AND OrderDateTime <= NOW() - INTERVAL 48 HOUR;

    -- Step 1: Restore stock
    UPDATE Books b
    JOIN OrderDetails od ON b.BookID = od.BookID
    JOIN Orders o ON od.OrderID = o.OrderID
    SET b.Stock = b.Stock + od.Quantity
    WHERE o.OrderStatus = 'Pending'
      AND o.OrderDateTime <= NOW() - INTERVAL 48 HOUR;

    -- Step 2: Mark restored
    UPDATE Orders
    SET InventoryRestored = TRUE
    WHERE OrderStatus = 'Pending'
      AND OrderDateTime <= NOW() - INTERVAL 48 HOUR;

    -- Step 3: Delete Payments
    DELETE p
    FROM Payments p
    JOIN Orders o ON p.OrderID = o.OrderID
    WHERE o.OrderStatus = 'Pending'
      AND o.OrderDateTime <= NOW() - INTERVAL 48 HOUR;

    -- Step 4: Delete OrderDetails
    DELETE od
    FROM OrderDetails od
    JOIN Orders o ON od.OrderID = o.OrderID
    WHERE o.OrderStatus = 'Pending'
      AND o.OrderDateTime <= NOW() - INTERVAL 48 HOUR;

    -- Step 5: Delete Orders
    DELETE FROM Orders
    WHERE OrderStatus = 'Pending'
      AND OrderDateTime <= NOW() - INTERVAL 48 HOUR;

END;


--- User Roles and Permissions 


CREATE USER 'bookstore_admin'@'localhost' IDENTIFIED BY 'Admin@Secure123'; 

CREATE USER 'bookstore_seller'@'localhost' IDENTIFIED BY 'Seller@Secure456'; 

CREATE USER 'bookstore_customer'@'localhost' IDENTIFIED BY 'Customer@Secure789'; 



-- Admin : full access 

GRANT ALL PRIVILEGES  

ON Online_Bookstore_Management_System.*  

TO 'bookstore_admin'@'localhost' WITH GRANT OPTION; 



-- Seller : read only on all tables 

GRANT SELECT  

ON Online_Bookstore_Management_System.*  

TO 'bookstore_seller'@'localhost'; 



-- Customer: limited read on books and categories only 

 

GRANT SELECT (BookID, Title, Price, Stock, CategoryID)  

ON Online_Bookstore_Management_System.Books  

TO 'bookstore_customer'@'localhost'; 

GRANT SELECT  

ON Online_Bookstore_Management_System.Categories  

TO 'bookstore_customer'@'localhost';  

FLUSH PRIVILEGES; 


-- Verification of User and Permissions 

SELECT User, Host FROM mysql.user WHERE User LIKE 'bookstore_%'; 

SHOW GRANTS FOR 'bookstore_admin'@'localhost'; 

SHOW GRANTS FOR 'bookstore_seller'@'localhost'; 

SHOW GRANTS FOR 'bookstore_customer'@'localhost'; 




