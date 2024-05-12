CREATE INDEX idx_lastname ON Employees (LastName);
CREATE INDEX idx_name_department ON Employees (LastName, DepartmentID);
CREATE UNIQUE INDEX idx_employee_id ON Employees (EmployeeID);
CREATE FULLTEXT INDEX ON Articles (ArticleContent)
    KEY INDEX idx_article_id ON FullTextCatalog;


CREATE TABLE Sales (
    SaleID int,
    SaleDate date,
    TotalAmount decimal
) PARTITION BY RANGE (SaleDate) (
    PARTITION p0 VALUES LESS THAN ('2020-01-01'),
    PARTITION p1 VALUES LESS THAN ('2021-01-01'),
    PARTITION p2 VALUES LESS THAN ('2022-01-01'),
    PARTITION p3 VALUES LESS THAN (MAXVALUE)
);
CREATE TABLE Employees (
    EmployeeID int,
    DepartmentID int,
    Name varchar(100)
) PARTITION BY LIST (DepartmentID) (
    PARTITION Sales VALUES IN (1, 2, 3),
    PARTITION Engineering VALUES IN (4, 5, 6),
    PARTITION HR VALUES IN (7, 8, 9)
);
CREATE TABLE Employees (
    EmployeeID int,
    DepartmentID int,
    Name varchar(100)
) PARTITION BY LIST (DepartmentID) (
    PARTITION Sales VALUES IN (1, 2, 3),
    PARTITION Engineering VALUES IN (4, 5, 6),
    PARTITION HR VALUES IN (7, 8, 9)
);
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    Amount DECIMAL(10,2),
    Status VARCHAR(20)
) PARTITION BY RANGE (YEAR(OrderDate)) (
    PARTITION p2020 VALUES LESS THAN ('2021-01-01'),
    PARTITION p2021 VALUES LESS THAN ('2022-01-01'),
    PARTITION p2022 VALUES LESS THAN ('2023-01-01')
);
CREATE INDEX idx_customer_region ON Customers (Region);
CREATE INDEX idx_order_date_status ON Orders (OrderDate, Status);
