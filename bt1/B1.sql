create database ss03_bt1;
use ss03_bt1;
CREATE TABLE color (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    status BIT DEFAULT 0
);
CREATE TABLE product (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    created DATE
);
CREATE TABLE size (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    status BIT
);
CREATE TABLE product_detail (
    id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    FOREIGN KEY (product_id) REFERENCES product (id),
    color_id INT,
    FOREIGN KEY (color_id) REFERENCES color (id),
    size_id INT,
    FOREIGN KEY (size_id) REFERENCES size (id),
    price DOUBLE,
    stock INT,
    status BIT
);
-- them color
INSERT INTO color (name) 
VALUES ('Red'), ('Green'), ('Yellow'), ('Black');

SELECT id,name,CASE WHEN status = 0 THEN 'true' ELSE 'false' END AS status FROM color c;
    
INSERT INTO size (name, status)
VALUES ('X', 0), ('M', 0), ('L', 0), ('XL', 0), ('XXL', 0);

SELECT id,name,CASE WHEN status = 0 THEN 'true' ELSE 'false' END AS status FROM size;

INSERT INTO product (name, created)
VALUES
    ('quần dài', STR_TO_DATE('12/05/1990', '%d/%m/%Y')),
    ('áo dài', STR_TO_DATE('5/10/2005', '%d/%m/%Y')),
    ('mũ phớt', STR_TO_DATE('07/07/1995', '%d/%m/%Y')),
    ('asdasd', NULL),
    ('ao dai', '2000-10-05');
    
   SELECT * from product; 
    
    INSERT INTO product_detail (product_id, color_id, size_id, price, stock, status)
VALUES
    (1, 1, 1, 1200, 5, 0),
    (2, 1, 1, 1500, 2, 0),
    (1, 2, 3, 500, 3, 0),
    (1, 2, 3, 1600, 3, 1),
    (3, 1, 4, 1200, 5, 0),
    (3, 3, 5, 1200, 6, 0);

    SELECT product_id,color_id,size_id,price,stock,
    CASE WHEN status = 0 THEN 'true' ELSE 'false' END AS status FROM product_detail;
    select * from product_detail;



