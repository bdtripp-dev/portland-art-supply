DROP TABLE IF EXISTS product_item;

DROP TABLE IF EXISTS product_group;

DROP TABLE IF EXISTS product_color;

DROP TABLE IF EXISTS product_size;

DROP TABLE IF EXISTS product_subcategory;

DROP TABLE IF EXISTS product_category;

DROP TABLE IF EXISTS product_manufacturer;

DROP TABLE IF EXISTS account_data;

DROP TABLE IF EXISTS users;

CREATE TABLE users (
	UserID			INT AUTO_INCREMENT,
	Username		VARCHAR(200) NOT NULL UNIQUE,
	PassswordHash	VARCHAR(200) NOT NULL,
	PRIMARY KEY (UserID)
);

CREATE TABLE account_data (
	UserID			INT,
	SessionData		VARCHAR(65535),
    PRIMARY KEY (UserID),
    FOREIGN KEY (UserID) REFERENCES users (UserID)
);

CREATE TABLE product_manufacturer (
	ManufacturerID     INT,
	ManufacturerName   VARCHAR(200)NOT NULL,
    PRIMARY KEY (ManufacturerID)
);

CREATE TABLE product_category (
	CategoryID		INT, 
    CategoryName    VARCHAR(200) NOT NULL,
    PRIMARY KEY (CategoryID)
);

CREATE TABLE product_subcategory (
	SubcategoryID      INT,
	CategoryID         INT NOT NULL,
    SubcategoryName    VARCHAR(200) NOT NULL,
    PRIMARY KEY (SubcategoryID),
    FOREIGN KEY (CategoryID) REFERENCES product_category (CategoryID)
);

CREATE TABLE product_size (
    SizeID          INT,
    SizeDescription VARCHAR(200) NOT NULL,
    PRIMARY KEY (SizeID)
);

CREATE TABLE product_color (
    ColorID         INT,
    ColorName       VARCHAR(200) NOT NULL,
    PRIMARY KEY     (ColorID)
);

CREATE TABLE product_group (
    ProductGroupID      INT,
    CategoryID          INT NOT NULL,
    SubcategoryID       INT NOT NULL,
    ManufacturerID      INT NOT NULL,
    GroupDescription    VARCHAR(200) NOT NULL,
    GroupInformation    VARCHAR(5000) NOT NULL,
    GroupCode    VARCHAR(1000) NOT NULL,
    PRIMARY KEY (ProductGroupID),
    FOREIGN KEY (CategoryID) REFERENCES product_category(CategoryID),
    FOREIGN KEY (SubcategoryID) REFERENCES product_subcategory(SubcategoryID),
    FOREIGN KEY (ManufacturerID) REFERENCES product_manufacturer(ManufacturerID)
);

CREATE TABLE product_item (
	ProductItemID	INT,
    ProductGroupID  INT NOT NULL,
	ColorID			INT NULL,
	SizeID			INT NULL,
	Price			DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (ProductItemID),
    FOREIGN KEY (ProductGroupID) REFERENCES product_group(ProductGroupID),
    FOREIGN KEY (ColorID) REFERENCES product_color(ColorID),
    FOREIGN KEY (SizeID) REFERENCES product_size(SizeID)
);