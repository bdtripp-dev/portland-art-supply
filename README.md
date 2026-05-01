# Portland Art Supply

Portland Art Supply (PAS) is a fictional e-commerce site. 

Note: This is a fully functional website except for the “checkout” process. If this was a “live” website, additional web pages would be added for the “checkout” process, to include shipping, and payment options. Plus, a separate page for admins to add and delete products from the database would be added.  

---

## Features
- View products by category, subcategory, and product group.
- View products along with their description, color and size options, and price.
- Add and delete products in the shopping cart and the quantity, sub-total, and total purchase amounts will be adjusted accordingly.
- Create an account to automatically save shopping cart history

---

## Techinal Highlights

- Designed a nine‑table relational database for category, product, and user account data. 
- Implemented dynamic drop-down lists for product color and size options using multi-JOIN queries.
- Used AJAX to provide real-time updates to shopping cart quantities and totals.
- Stored PHP sessions in the database so the shopping cart is restored when the user logs in.

---

## Tech Stack

- Languages: HTML5, CSS3, JavaScript, PHP
- Database: MySQL
- DevOps / Workflow: Docker, Dev Container, GitHub Actions

---

Visit the site at https://portland-art-supply.bdtripp.com/  

To view an ERD of the PAS database, visit my portfolio site at https://bdtripp.com/#projects . Click on the “View Details” button for PAS. Then click on the document icon to the right of “Data Modeling”.  

**Code Highlights:**

### Code Highlights

- **Database access**  
  [`includes/db_code.php`](includes/db_code.php) contains the SQL queries for retrieving product information from the database.

- **UI generation**  
  [`includes/ui_code.php`](includes/ui_code.php) is responsible for dynamically generating the navigation bar (including dropdow menus), product pages, and the shopping cart interface.

- **Dynamic product options**  
  [`public/js/pas.js.php`](public/js/pas.js.php) generates the color and size dropdowns and updates the UI based on user selections.

**Images:**  
Images are organized by category and subcategory folders.

- Category folders contain multiple subcategories
- Subcategory folders contain images of all products in that subcategory
- Three types of images
  - General product image
  - Specific product image for a particular color and size
  - Color thumbnail
- The category, sub category, group code, color, and size are stored in the database for each product. The data is retrieved from the database and used to generate “src” attribute for each <img> tag. (see includes/ui_code.php lines 245 – 268)  
  <br/>

**Naming convention for the images:**

General product image: &nbsp;&nbsp;&nbsp;&nbsp;group code.jpg

Specific product image: &nbsp;&nbsp;&nbsp;&nbsp;group code-color name-size description.jpg
Color thumbnail: &nbsp;&nbsp;&nbsp;&nbsp;group code-tn-color name.jpg

Note: There will always be a “general product image”. Some products will not have a “specific product image” or a “color thumbnail”.  
<br/>

**Image Files and Folders Example:**

Category Folder: Paint  
&nbsp;&nbsp;&nbsp;&nbsp;Sub Category Folder: Oil  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gamblin-1980-oils.jpg &nbsp;&nbsp;&nbsp;&nbsp; <- group code  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gamblin-1980-oils-burnt-sienna-37-ml.jpg &nbsp;&nbsp;&nbsp;&nbsp; <- group code-color name-size description

&nbsp;&nbsp;&nbsp;&nbsp; Sub Category Folder: Oil Color Thumbnails  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gamblin-1980-oils-tn-burnt-sienna.jpg &nbsp;&nbsp;&nbsp;&nbsp; <- group code-tn-color name
