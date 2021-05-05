DROP DATABASE IF EXISTS shop_test;
CREATE DATABASE IF NOT EXISTS shop_test;
USE shop_test;
-- DROP USER IF EXISTS 'shopMgr'@'localhost';
-- FLUSH PRIVILEGES;        
        
-- CREATE USER 'shopMgr'@'localhost'
--   IDENTIFIED WITH caching_sha2_password BY 'csc131';
-- GRANT ALL PRIVILEGES ON shop_test.* TO 'shopMgr'@'localhost';

CREATE TABLE `customer` (
  `CUSTOMER_ID` int AUTO_INCREMENT NOT NULL,
  `USERNAME` varchar(45) NOT NULL,
  `FIRST_NAME` varchar(45) DEFAULT NULL,
  `LAST_NAME` varchar(45) DEFAULT NULL,
  `EMAIL` varchar(45) DEFAULT NULL,
  `PHONE` char(12) DEFAULT NULL,
  PRIMARY KEY (`CUSTOMER_ID`, `USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `order` (
  `ORDER_ID` int NOT NULL,
  `CUSTOMER_ID` int NOT NULL,
  `ORDER_DATE` datetime DEFAULT NULL,
  `SHIPPING_COST` decimal(5,2) DEFAULT NULL,
  `TAX` decimal(5,2) DEFAULT NULL,
  `TOTAL_COST` decimal(6,2) DEFAULT NULL,
  PRIMARY KEY (`ORDER_ID`),
  KEY `CUSTOMER_ID_idx` (`CUSTOMER_ID`),
  CONSTRAINT `CUSTOMER_ID` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `customer` (`CUSTOMER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `products` (
  `PRODUCT_ID` varchar(30) NOT NULL,
  `PRODUCT_TYPE` varchar(45) DEFAULT NULL,
  `PRODUCT_NAME` varchar(30) DEFAULT NULL,
  `PRICE` decimal(5,2) DEFAULT NULL,
  `QUANTITY_IN_STOCK` int DEFAULT NULL,
  `REORDER` int DEFAULT '5',
  PRIMARY KEY (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `order_details` (
  `ORDER_ID` int NOT NULL,
  `ORDER_LINE_NUMBER` int NOT NULL,
  `PRODUCT_ID` varchar(45) NOT NULL,
  `ORDERED_QUANTITY` int DEFAULT NULL,
  `PRICE` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`ORDER_LINE_NUMBER`,`ORDER_ID`),
  KEY `PRODUCT_ID_idx` (`PRODUCT_ID`),
  CONSTRAINT `PRODUCT_ID` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `products` (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `shop_test`.`cart` (
  `CUSTOMER_ID_CART` INT NOT NULL,
  `PRODUCT_ID` VARCHAR(45) NOT NULL,
  `QUANTITY_ORDERED` INT NULL,
  `TOTAL_COST` DECIMAL(5,2) DEFAULT NULL,
  PRIMARY KEY (`CUSTOMER_ID_CART`, `PRODUCT_ID`),
  INDEX `PRODUCT_ID_CART_IDX_idx` (`PRODUCT_ID` ASC) VISIBLE,
  CONSTRAINT `CUSTOMER_ID_CART_IDX`
    FOREIGN KEY (`CUSTOMER_ID_CART`)
    REFERENCES `shop_test`.`customer` (`CUSTOMER_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `PRODUCT_ID_CART_IDX`
    FOREIGN KEY (`PRODUCT_ID`)
    REFERENCES `shop_test`.`products` (`PRODUCT_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
INSERT INTO `products` (`PRODUCT_ID`,`PRODUCT_TYPE`,`PRODUCT_NAME`,`PRICE`,`QUANTITY_IN_STOCK`,`REORDER`) VALUES ('ALC01','Alcohol','Whiskey',10.99,30,5);
INSERT INTO `products` (`PRODUCT_ID`,`PRODUCT_TYPE`,`PRODUCT_NAME`,`PRICE`,`QUANTITY_IN_STOCK`,`REORDER`) VALUES ('ALC02','Alcohol','Beer',5.99,30,5);
INSERT INTO `products` (`PRODUCT_ID`,`PRODUCT_TYPE`,`PRODUCT_NAME`,`PRICE`,`QUANTITY_IN_STOCK`,`REORDER`) VALUES ('ALC03','Alcohol','Wine',10.99,30,5);
INSERT INTO `products` (`PRODUCT_ID`,`PRODUCT_TYPE`,`PRODUCT_NAME`,`PRICE`,`QUANTITY_IN_STOCK`,`REORDER`) VALUES ('ALC04','Alcohol','Vodka',12.99,30,5);
INSERT INTO `products` (`PRODUCT_ID`,`PRODUCT_TYPE`,`PRODUCT_NAME`,`PRICE`,`QUANTITY_IN_STOCK`,`REORDER`) VALUES ('ALC05','Alcohol','Gin',10.99,30,5);
INSERT INTO `products` (`PRODUCT_ID`,`PRODUCT_TYPE`,`PRODUCT_NAME`,`PRICE`,`QUANTITY_IN_STOCK`,`REORDER`) VALUES ('BAKE01','Bakery','Bread',2.99,30,5);
INSERT INTO `products` (`PRODUCT_ID`,`PRODUCT_TYPE`,`PRODUCT_NAME`,`PRICE`,`QUANTITY_IN_STOCK`,`REORDER`) VALUES ('BAKE02','Bakery','Muffin',2.99,30,5);
INSERT INTO `products` (`PRODUCT_ID`,`PRODUCT_TYPE`,`PRODUCT_NAME`,`PRICE`,`QUANTITY_IN_STOCK`,`REORDER`) VALUES ('BAKE03','Bakery','Cake',5.99,30,5);
INSERT INTO `products` (`PRODUCT_ID`,`PRODUCT_TYPE`,`PRODUCT_NAME`,`PRICE`,`QUANTITY_IN_STOCK`,`REORDER`) VALUES ('BAKE04','Bakery','Doughnut',0.99,30,5);
INSERT INTO `products` (`PRODUCT_ID`,`PRODUCT_TYPE`,`PRODUCT_NAME`,`PRICE`,`QUANTITY_IN_STOCK`,`REORDER`) VALUES ('BREAK01','Breakfast','Cereal',3.99,30,5);
INSERT INTO `products` (`PRODUCT_ID`,`PRODUCT_TYPE`,`PRODUCT_NAME`,`PRICE`,`QUANTITY_IN_STOCK`,`REORDER`) VALUES ('BREAK02','Breakfast','Oatmeal',5.99,30,5);
INSERT INTO `products` (`PRODUCT_ID`,`PRODUCT_TYPE`,`PRODUCT_NAME`,`PRICE`,`QUANTITY_IN_STOCK`,`REORDER`) VALUES ('BREAK03','Breakfast','Syrup',4.99,30,5);
INSERT INTO `products` (`PRODUCT_ID`,`PRODUCT_TYPE`,`PRODUCT_NAME`,`PRICE`,`QUANTITY_IN_STOCK`,`REORDER`) VALUES ('BREAK04','Breakfast','Pancake_mix',5.99,30,5);
INSERT INTO `products` (`PRODUCT_ID`,`PRODUCT_TYPE`,`PRODUCT_NAME`,`PRICE`,`QUANTITY_IN_STOCK`,`REORDER`) VALUES ('DIAR01','Dairy','Gallon_2% Milk',3.99,30,5);
INSERT INTO `products` (`PRODUCT_ID`,`PRODUCT_TYPE`,`PRODUCT_NAME`,`PRICE`,`QUANTITY_IN_STOCK`,`REORDER`) VALUES ('DIAR02','Dairy','Gallon_1% Milk',3.99,30,5);
INSERT INTO `products` (`PRODUCT_ID`,`PRODUCT_TYPE`,`PRODUCT_NAME`,`PRICE`,`QUANTITY_IN_STOCK`,`REORDER`) VALUES ('DIAR03','Dairy','Gallon_Whole Milk',3.99,30,5);
INSERT INTO `products` (`PRODUCT_ID`,`PRODUCT_TYPE`,`PRODUCT_NAME`,`PRICE`,`QUANTITY_IN_STOCK`,`REORDER`) VALUES ('DIAR04','Dairy','Gallon_fatfree milk',3.99,30,5);
INSERT INTO `products` (`PRODUCT_ID`,`PRODUCT_TYPE`,`PRODUCT_NAME`,`PRICE`,`QUANTITY_IN_STOCK`,`REORDER`) VALUES ('DIAR05','Dairy','shredded_mozzarella',4.99,30,5);
INSERT INTO `products` (`PRODUCT_ID`,`PRODUCT_TYPE`,`PRODUCT_NAME`,`PRICE`,`QUANTITY_IN_STOCK`,`REORDER`) VALUES ('DIAR06','Dairy','shredded_ItalianBlend',4.99,30,5);
INSERT INTO `products` (`PRODUCT_ID`,`PRODUCT_TYPE`,`PRODUCT_NAME`,`PRICE`,`QUANTITY_IN_STOCK`,`REORDER`) VALUES ('DIAR07','Dairy','shredded_PepperJack',4.99,30,5);
INSERT INTO `products` (`PRODUCT_ID`,`PRODUCT_TYPE`,`PRODUCT_NAME`,`PRICE`,`QUANTITY_IN_STOCK`,`REORDER`) VALUES ('DIAR08','Dairy','sliced_mozzarella',4.99,30,5);
INSERT INTO `products` (`PRODUCT_ID`,`PRODUCT_TYPE`,`PRODUCT_NAME`,`PRICE`,`QUANTITY_IN_STOCK`,`REORDER`) VALUES ('DIAR09','Dairy','sliced_PepperJack',4.99,30,5);
INSERT INTO `products` (`PRODUCT_ID`,`PRODUCT_TYPE`,`PRODUCT_NAME`,`PRICE`,`QUANTITY_IN_STOCK`,`REORDER`) VALUES ('DIAR10','Dairy','Butter',5.99,30,5);
INSERT INTO `products` (`PRODUCT_ID`,`PRODUCT_TYPE`,`PRODUCT_NAME`,`PRICE`,`QUANTITY_IN_STOCK`,`REORDER`) VALUES ('MEA01','Meat_seafood','Beef',10.99,30,5);
INSERT INTO `products` (`PRODUCT_ID`,`PRODUCT_TYPE`,`PRODUCT_NAME`,`PRICE`,`QUANTITY_IN_STOCK`,`REORDER`) VALUES ('MEA02','Meat_seafood','Chicken',10.99,30,5);
INSERT INTO `products` (`PRODUCT_ID`,`PRODUCT_TYPE`,`PRODUCT_NAME`,`PRICE`,`QUANTITY_IN_STOCK`,`REORDER`) VALUES ('MEA03','Meat_seafood','Turkey',12.99,30,5);
INSERT INTO `products` (`PRODUCT_ID`,`PRODUCT_TYPE`,`PRODUCT_NAME`,`PRICE`,`QUANTITY_IN_STOCK`,`REORDER`) VALUES ('MEA04','Meat_seafood','Lamb',20.00,30,5);
INSERT INTO `products` (`PRODUCT_ID`,`PRODUCT_TYPE`,`PRODUCT_NAME`,`PRICE`,`QUANTITY_IN_STOCK`,`REORDER`) VALUES ('MEA05','Meat_seafood','Pork',10.99,30,5);
INSERT INTO `products` (`PRODUCT_ID`,`PRODUCT_TYPE`,`PRODUCT_NAME`,`PRICE`,`QUANTITY_IN_STOCK`,`REORDER`) VALUES ('MEA06','Meat_seafood','Salmon',15.99,30,5);
INSERT INTO `products` (`PRODUCT_ID`,`PRODUCT_TYPE`,`PRODUCT_NAME`,`PRICE`,`QUANTITY_IN_STOCK`,`REORDER`) VALUES ('MEA07','Meat_seafood','Tuna',15.99,30,5);
INSERT INTO `products` (`PRODUCT_ID`,`PRODUCT_TYPE`,`PRODUCT_NAME`,`PRICE`,`QUANTITY_IN_STOCK`,`REORDER`) VALUES ('MEA08','Meat_seafood','Crab',15.99,30,5);
INSERT INTO `products` (`PRODUCT_ID`,`PRODUCT_TYPE`,`PRODUCT_NAME`,`PRICE`,`QUANTITY_IN_STOCK`,`REORDER`) VALUES ('PROD01','Produce','Brocolli',2.99,30,5);
INSERT INTO `products` (`PRODUCT_ID`,`PRODUCT_TYPE`,`PRODUCT_NAME`,`PRICE`,`QUANTITY_IN_STOCK`,`REORDER`) VALUES ('PROD02','Produce','Cabbage',2.99,30,5);
INSERT INTO `products` (`PRODUCT_ID`,`PRODUCT_TYPE`,`PRODUCT_NAME`,`PRICE`,`QUANTITY_IN_STOCK`,`REORDER`) VALUES ('PROD03','Produce','Avocado',4.99,30,5);
INSERT INTO `products` (`PRODUCT_ID`,`PRODUCT_TYPE`,`PRODUCT_NAME`,`PRICE`,`QUANTITY_IN_STOCK`,`REORDER`) VALUES ('PROD04','Produce','Radish',1.99,30,5);
INSERT INTO `products` (`PRODUCT_ID`,`PRODUCT_TYPE`,`PRODUCT_NAME`,`PRICE`,`QUANTITY_IN_STOCK`,`REORDER`) VALUES ('PROD05','Produce','Potato',0.99,30,5);
INSERT INTO `products` (`PRODUCT_ID`,`PRODUCT_TYPE`,`PRODUCT_NAME`,`PRICE`,`QUANTITY_IN_STOCK`,`REORDER`) VALUES ('PROD06','Produce','Mushroom',2.99,30,5);

INSERT INTO `customer` (CUSTOMER_ID, USERNAME, FIRST_NAME, LAST_NAME, EMAIL, PHONE) VALUES (1,'default','Jagannadha','Chidella','foo@bar.com','number');
INSERT INTO `customer` (CUSTOMER_ID, USERNAME, FIRST_NAME, LAST_NAME, EMAIL, PHONE) VALUES (2,'user2','Jacob','Normington','foo@bar.com','number');
INSERT INTO `customer` (CUSTOMER_ID, USERNAME, FIRST_NAME, LAST_NAME, EMAIL, PHONE) VALUES (3,'user3','Alexander','Gunby','foo@bar.com','number');
INSERT INTO `customer` (CUSTOMER_ID, USERNAME, FIRST_NAME, LAST_NAME, EMAIL, PHONE) VALUES (4,'user4','Sai','Suresh','foo@bar.com','number');
INSERT INTO `customer` (CUSTOMER_ID, USERNAME, FIRST_NAME, LAST_NAME, EMAIL, PHONE) VALUES (5,'user5','Daniel','Beauchamp','foo@bar.com','number');
INSERT INTO `customer` (CUSTOMER_ID, USERNAME, FIRST_NAME, LAST_NAME, EMAIL, PHONE) VALUES (6,'user6','Youser','Alalusi','foo@bar.com','number');
INSERT INTO `customer` (CUSTOMER_ID, USERNAME, FIRST_NAME, LAST_NAME, EMAIL, PHONE) VALUES (7,'user7','Sikander','Ghafary','foo@bar.com','number');


CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = 'shopMgr'@'localhost' 
    SQL SECURITY DEFINER
VIEW `alcohol` AS
    SELECT 
        `products`.`PRODUCT_ID` AS `PRODUCT_ID`,
        `products`.`PRODUCT_TYPE` AS `PRODUCT_TYPE`,
        `products`.`PRODUCT_NAME` AS `PRODUCT_NAME`,
        `products`.`PRICE` AS `PRICE`,
        `products`.`QUANTITY_IN_STOCK` AS `QUANTITY_IN_STOCK`,
        `products`.`REORDER` AS `REORDER`
    FROM
        `products`
    WHERE
        (`products`.`PRODUCT_TYPE` = 'Alcohol');

CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = 'shopMgr'@'localhost' 
    SQL SECURITY DEFINER
VIEW `bakery` AS
    SELECT 
        `products`.`PRODUCT_ID` AS `PRODUCT_ID`,
        `products`.`PRODUCT_TYPE` AS `PRODUCT_TYPE`,
        `products`.`PRODUCT_NAME` AS `PRODUCT_NAME`,
        `products`.`PRICE` AS `PRICE`,
        `products`.`QUANTITY_IN_STOCK` AS `QUANTITY_IN_STOCK`,
        `products`.`REORDER` AS `REORDER`
    FROM
        `products`
    WHERE
        (`products`.`PRODUCT_TYPE` = 'Bakery');
        
        
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = 'shopMgr'@'localhost' 
    SQL SECURITY DEFINER
VIEW `breakfast` AS
    SELECT 
        `products`.`PRODUCT_ID` AS `PRODUCT_ID`,
        `products`.`PRODUCT_TYPE` AS `PRODUCT_TYPE`,
        `products`.`PRODUCT_NAME` AS `PRODUCT_NAME`,
        `products`.`PRICE` AS `PRICE`,
        `products`.`QUANTITY_IN_STOCK` AS `QUANTITY_IN_STOCK`,
        `products`.`REORDER` AS `REORDER`
    FROM
        `products`
    WHERE
        (`products`.`PRODUCT_TYPE` = 'Breakfast');
        
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = 'shopMgr'@'localhost' 
    SQL SECURITY DEFINER
VIEW `dairy` AS
    SELECT 
        `products`.`PRODUCT_ID` AS `PRODUCT_ID`,
        `products`.`PRODUCT_TYPE` AS `PRODUCT_TYPE`,
        `products`.`PRODUCT_NAME` AS `PRODUCT_NAME`,
        `products`.`PRICE` AS `PRICE`,
        `products`.`QUANTITY_IN_STOCK` AS `QUANTITY_IN_STOCK`,
        `products`.`REORDER` AS `REORDER`
    FROM
        `products`
    WHERE
        (`products`.`PRODUCT_TYPE` = 'Dairy');
        
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = 'shopMgr'@'localhost' 
    SQL SECURITY DEFINER
VIEW `meat_seafood` AS
    SELECT 
        `products`.`PRODUCT_ID` AS `PRODUCT_ID`,
        `products`.`PRODUCT_TYPE` AS `PRODUCT_TYPE`,
        `products`.`PRODUCT_NAME` AS `PRODUCT_NAME`,
        `products`.`PRICE` AS `PRICE`,
        `products`.`QUANTITY_IN_STOCK` AS `QUANTITY_IN_STOCK`,
        `products`.`REORDER` AS `REORDER`
    FROM
        `products`
    WHERE
        (`products`.`PRODUCT_TYPE` = 'Meat_seafood');
        
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = 'shopMgr'@'localhost' 
    SQL SECURITY DEFINER
VIEW `produce` AS
    SELECT 
        `products`.`PRODUCT_ID` AS `PRODUCT_ID`,
        `products`.`PRODUCT_TYPE` AS `PRODUCT_TYPE`,
        `products`.`PRODUCT_NAME` AS `PRODUCT_NAME`,
        `products`.`PRICE` AS `PRICE`,
        `products`.`QUANTITY_IN_STOCK` AS `QUANTITY_IN_STOCK`,
        `products`.`REORDER` AS `REORDER`
    FROM
        `products`
    WHERE
        (`products`.`PRODUCT_TYPE` = 'Produce');
        
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = 'shopMgr'@'localhost' 
    SQL SECURITY DEFINER
VIEW `shop_test`.`customer_cart_v` AS
    SELECT 
        `b`.`PRODUCT_NAME` AS `product_name`,
        `a`.`QUANTITY_ORDERED` AS `quantity_ordered`,
        (`b`.`PRICE` * `a`.`QUANTITY_ORDERED`) AS `total_cost`
    FROM
        (`shop_test`.`cart` `a`
        JOIN `shop_test`.`products` `b`)
    WHERE
        (`a`.`PRODUCT_ID` = `b`.`PRODUCT_ID`);
        
DELIMITER $$
CREATE TRIGGER RESTOCK_PRODUCT_UPDATE BEFORE UPDATE ON PRODUCTS 
	FOR EACH ROW 
	BEGIN 
	IF (NEW.QUANTITY_IN_STOCK <= 5) THEN 
		SET NEW.QUANTITY_IN_STOCK = NEW.QUANTITY_IN_STOCK+30; 
	END IF; 
	END $$