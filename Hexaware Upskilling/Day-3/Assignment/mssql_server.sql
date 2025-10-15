CREATE DATABASE sales_azure;

USE sales_azure;

CREATE TABLE sales_data(
	sale_id INT IDENTITY(1,1) PRIMARY KEY,
    sale_date DATE,
    customer_name VARCHAR(100),
    product_name VARCHAR(100),
    quantity INT,
    unit_price DECIMAL(10,2),
    total_amount AS (quantity * unit_price)
);

INSERT INTO sales_data (sale_date, customer_name, product_name, quantity, unit_price)
VALUES
('2025-10-01', 'Alice Johnson', 'Laptop', 1, 950.00),
('2025-10-01', 'Bob Smith', 'Mouse', 3, 25.00),
('2025-10-02', 'Charlie Lee', 'Keyboard', 2, 45.00),
('2025-10-02', 'Diana Prince', 'Monitor', 1, 200.00),
('2025-10-03', 'Ethan Brown', 'USB Cable', 5, 10.00),
('2025-10-03', 'Fiona Davis', 'Laptop', 1, 970.00),
('2025-10-04', 'George Clark', 'Headphones', 2, 80.00),
('2025-10-04', 'Hannah Wilson', 'Webcam', 1, 60.00),
('2025-10-05', 'Ian Thomas', 'Printer', 1, 150.00),
('2025-10-05', 'Jane Miller', 'Mouse Pad', 4, 8.00),
('2025-10-06', 'Kevin Adams', 'Laptop', 1, 920.00),
('2025-10-06', 'Laura White', 'Monitor', 2, 210.00),
('2025-10-07', 'Michael Scott', 'Keyboard', 3, 50.00),
('2025-10-07', 'Nina Patel', 'USB Cable', 10, 9.50),
('2025-10-08', 'Oscar Turner', 'Laptop Stand', 2, 35.00),
('2025-10-08', 'Paula Green', 'Headphones', 1, 75.00),
('2025-10-09', 'Quentin Reed', 'Mouse', 5, 22.00),
('2025-10-09', 'Rachel Lee', 'Laptop', 1, 990.00),
('2025-10-10', 'Steve Martin', 'Webcam', 2, 65.00),
('2025-10-10', 'Tina Brooks', 'Printer', 1, 145.00);

SELECT * FROM sales_data;