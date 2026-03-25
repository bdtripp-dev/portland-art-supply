SELECT          *
FROM            product_item;

-- Selects a single product for each product group for a given subcategory
-- Using variables because DENSE_RANK isn't supported :
-- DENSE_RANK() OVER(PARTITION BY ProductGroupID ORDER BY Price) AS 'RowNumber'

set @productGroup = '';
set @rowNum = 1;

SELECT          *, 
                @rn := if(@productGroup = ProductGroupID, @rowNum + 1, 1) AS RowNumber,
                @productGroup := ProductGroupID
FROM            product_item
WHERE           ProductGroupID IN (
    SELECT      ProductGroupID
    FROM            product_group
    JOIN            product_category ON product_group.CategoryID = product_category.CategoryID
    JOIN            product_subcategory ON product_group.SubcategoryID = product_subcategory.SubcategoryID
    WHERE           CategoryName = 'Paint'
        AND         SubcategoryName = 'Oil'
)
    AND         @rn := if(@productGroup = ProductGroupID, @rowNum + 1, 1) = 1
ORDER BY        ProductGroupID;



SELECT          ProductGroupCode, 
                GroupDescription
FROM            product_group
JOIN            product_category ON product_group.CategoryID = product_category.CategoryID
JOIN            product_subcategory ON product_group.SubcategoryID = product_subcategory.SubcategoryID
WHERE           CategoryName = 'Paint'
    AND         SubcategoryName = 'Oil';
    

SELECT          *
FROM            product_item
WHERE           ProductGroupID =;
1;

SELECT 		ProductItemID,
			ColorName,
        	SizeDescription,
        	Price
FROM 		product_item
LEFT JOIN 	product_color ON product_item.ColorID = product_color.ColorID
LEFT JOIN 	product_size ON product_item.SizeID = product_size.SizeID
WHERE 		ProductGroupID = 1;

SELECT 	*
FROM 	product_item
WHERE 	ProductGroupID = 5;

    
    


