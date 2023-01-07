CREATE DATABASE IF NOT EXISTS NailPolishApp;

USE NailPolishApp;

---------------------------------------------------------------------------------------
-- Create tables
---------------------------------------------------------------------------------------

-- Nail polish data tables

CREATE TABLE IF NOT EXISTS brands (
    brand_id INT NOT NULL AUTO_INCREMENT,
    bname VARCHAR(25) NOT NULL,
    country VARCHAR(25),
    PRIMARY KEY (brand_id)
);

CREATE TABLE IF NOT EXISTS collections (
    collection_id INT NOT NULL AUTO_INCREMENT,
    cname VARCHAR(100) NOT NULL,
    brand_id INT NOT NULL,
    year_released INT,
    season VARCHAR(25),
    line VARCHAR(25),
    PRIMARY KEY (collection_id),
    FOREIGN KEY (brand_id) REFERENCES brands(brand_id)
);

CREATE TABLE IF NOT EXISTS nail_polish (
    np_id INT NOT NULL AUTO_INCREMENT,
    npname VARCHAR(100) NOT NULL,
    brand_id INT NOT NULL,
    collection_id INT NOT NULL,
    main_colour VARCHAR(25) NOT NULL,
    secondary_colour VARCHAR(25),
    topper BOOLEAN,
    finish VARCHAR(25) NOT NULL,
    PRIMARY KEY (np_id),
    FOREIGN KEY (brand_id) REFERENCES brands(brand_id),
    FOREIGN KEY (collection_id) REFERENCES collections(collection_id)
);

-- Nail polishes owned by the user

CREATE TABLE IF NOT EXISTS np_owned (
    npowned_id INT NOT NULL AUTO_INCREMENT,
    np_id INT NOT NULL UNIQUE,
    quantity_owned INT DEFAULT 1,
    date_of_purchase DATE DEFAULT (CURRENT_DATE),
    worn BOOLEAN DEFAULT FALSE,
    cost FLOAT(2) NOT NULL,
    PRIMARY KEY (npowned_id),
    FOREIGN KEY (np_id) REFERENCES nail_polish(np_id)
);

-- Nail polishes in the user's wishlist

CREATE TABLE IF NOT EXISTS wishlist (
    wishlist_id INT NOT NULL AUTO_INCREMENT,
    np_id INT NOT NULL UNIQUE,
    date_added DATE DEFAULT (CURRENT_DATE),
    PRIMARY KEY (wishlist_id),
    FOREIGN KEY (np_id) REFERENCES nail_polish(np_id)
);