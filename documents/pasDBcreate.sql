DROP TABLE IF EXISTS product_item;

DROP TABLE IF EXISTS product_group;

DROP TABLE IF EXISTS product_shape;

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
	ManufacturerID     INT AUTO_INCREMENT,
	ManufacturerName   VARCHAR(200)NOT NULL,
    PRIMARY KEY (ManufacturerID)
);

CREATE TABLE product_category (
	CategoryID		INT AUTO_INCREMENT, 
    CategoryName    VARCHAR(200) NOT NULL,
    PRIMARY KEY (CategoryID)
);

CREATE TABLE product_subcategory (
	SubcategoryID      INT AUTO_INCREMENT,
	CategoryID         INT NOT NULL,
    SubcategoryName    VARCHAR(200) NOT NULL,
    PRIMARY KEY (SubcategoryID),
    FOREIGN KEY (CategoryID) REFERENCES product_category (CategoryID)
);

CREATE TABLE product_size (
    SizeID          INT AUTO_INCREMENT,
    SizeDescription VARCHAR(200) NOT NULL,
    PRIMARY KEY (SizeID)
);

CREATE TABLE product_color (
    ColorID         INT AUTO_INCREMENT,
    ColorName       VARCHAR(200) NOT NULL,
    PRIMARY KEY     (ColorID)
);

CREATE TABLE product_group (
    ProductGroupID      INT AUTO_INCREMENT,
    CategoryID          INT NOT NULL,
    SubcategoryID       INT NOT NULL,
    ManufacturerID      INT NOT NULL,
    GroupDescription    VARCHAR(200) NOT NULL,
    GroupInformation    VARCHAR(5000) NOT NULL,
    GroupCode    VARCHAR(200) NOT NULL,
    PRIMARY KEY (ProductGroupID),
    FOREIGN KEY (CategoryID) REFERENCES product_category(CategoryID),
    FOREIGN KEY (SubcategoryID) REFERENCES product_subcategory(SubcategoryID),
    FOREIGN KEY (ManufacturerID) REFERENCES product_manufacturer(ManufacturerID)
);

CREATE TABLE product_item (
	ProductItemID	INT AUTO_INCREMENT,
    ProductGroupID  INT NOT NULL,
	ColorID			INT NULL,
	ShapeID			INT NULL,
	Price			DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (ProductItemID),
    FOREIGN KEY (ProductGroupID) REFERENCES product_group(ProductGroupID),
    FOREIGN KEY (ColorID) REFERENCES product_color(ColorID),
    FOREIGN KEY (SizeID) REFERENCES product_size(SizeID)
);

INSERT INTO product_manufacturer (ManufacturerName)
	VALUES 
    ('Gamblin'),
    ('Williamsburg'),
    ('Liquitex'),
    ('Fredrix');
    
INSERT INTO product_category (CategoryName)
	VALUES 
    ('Paint'),
    ('Canvas');
    
INSERT INTO product_subcategory (CategoryID, SubcategoryName)
	VALUES 
    (1, 'Oil'),
    (1, 'Acrylic'),
    (2, 'Unstretched Canvas');
    
INSERT INTO product_size (SizeDescription)
	VALUES 
    ('37 ml'),
    ('8 oz'),
    ('16 oz'),
    ('5 ml / 2 fl oz'),
    ('54" x 3 yds');
    
INSERT INTO product_color (ColorName)
	VALUES 
    ('Alizarin Crimson'),
    ('Blush'),
    ('Cadmium Red Medium'),
    ('Titanium White'),
    ('Muted Grey');
    
INSERT INTO product_group (CategoryID, SubcategoryID, ManufacturerID, GroupDescription, GroupInformation, GroupCode)
	VALUES 
    (1, 1, 1, 'Gamblin1980 Oils', '1980 colors are formulated with pure pigments, the finest refined linseed oil and marble dust (calcium carbonate). Affordable colors have been made with these three ingredients since oil painting began.', 'gamblin-1980-oils'),
    (1, 1, 2, 'Williamsburg Oil, Titanium White', 'Made in small batches no larger than five gallons at a time to ensure the highest level of control. Pigments are carefully ground to enhance the beauty and luminosity specific to each, and then combined with pure, premium, alkali-refined and pH-balanced linseed oil. Every ingredient is hand-measured, and every batch is scrutinized for quality. Titanium white is available in 37 ml. tubes, 8 and 16 oz. cans.', 'golden-williamsburg-oil-titanium-white'),
    (1, 2, 3, 'Liquitex Special Release Muted Heavy Body Collection', 'Providing a thick, buttery consistency, Heavy Body acrylics are formulated to retain crisp brushstrokes and knife marks. Great for Impasto, traditional acrylic painting on canvas or panel, collage, mixed media and acrylic printmaking; screen, mono and block!', 'liquitex-muted-heavy-body'),
    (2, 3, 4, 'Fredrix 138 Raw Linen Canvas Roll - 54" x 3 Yards', '138 54" W Unprimed Linen Pro Series Style 138 - This unprimed canvas features a coarse weave, heavy weight, loom state canvas. 9oz/305g raw. Available in 54" x 3 yard rolls.', '36820');
    
INSERT INTO product_item (ProductGroupID, SizeID, ColorID, ShapeID, Price)
	VALUES 
    (1, 1, 1, NULL, 5.96),
    (1, 1, 2, NULL, 5.96),
    (1, 1, 3, NULL, 7.46),
    (2, 2, 4, NULL, 36.95),
    (2, 3, 4, NULL, 62.92),
    (3, 4, 5, NULL, 10.14),
    (4, 5, NULL, NULL, 89.97);
    