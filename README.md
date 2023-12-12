# fastkart SQL project
We have a  “Fastkart” database and seek answers to the following queries as the results from these queries will help the company in making data-driven decisions that will impact the overall growth of the online retail stores.
"Fastkart" database have 6 tables (carddetails, categories, products, purchasedetails, roles, users). Let's explore furthur 
Table "carddetails" fields consist of 
a. CardNumber- credit/debit card number
b. NameOnCard- name on that card
c. CardType- type of card master/visa
d. CVVNumber- cvv number on that card
e. ExpiryDate- expiry date on that card
f. Balance- balance money in that card

table "categories" fields consist of
a. CategoryId- unique ID of the product in fastkart
b. CategoryName- calssification of that product

table "products" fields consist of 
a. ProductId- ID of that product
b. ProductName- name of the product
c. CategoryId- unique ID of the product in fastkart
d. Price- price of that product
e. QuantityAvailable- available quantity of that product

table "purchasedetails" fields consist of 
a. PurchaseId- prucahse id of that product
b. EmailId- email id of the customer 
c. ProductId- product id of the product
d. QuantityPurchased- quantity purcahsed by the certain customer
e. DateOfPurchase- date of purchase of the product

table "roles"
a. RoleId- unique id of that role
b. RoleName- role of that perticular section

table "users"
a. EmailId- mail id of the person
b. UserPassword- password of the email id
c. RoleId- id of that role
d. Gender- male/female
e. DateOfBirth- birth day of the person
f. Address- address of the person
