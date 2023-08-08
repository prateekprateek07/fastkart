USE fastkart;
/*  List Top 3 products based on QuantityAvailable. (productid, productname, QuantityAvailable ). 
(3 Rows) [Note: Products] */
SELECT 
    productid, productname, quantityavailable
FROM
    products
ORDER BY QuantityAvailable DESC
LIMIT 3;


/* Display EmailId of those customers who have done more than ten purchases. (EmailId, Total_Transactions). 
(5 Rows) [Note: Purchasedetails, products] */
SELECT 
    emailid, COUNT(quantitypurchased)
FROM
    purchasedetails
GROUP BY emailid
HAVING COUNT(quantitypurchased) > 10;


/* list the Total QuantityAvailable category wise in descending order. (Name of the category, QuantityAvailable) 
(7 Rows) [Note: products, categories].*/

SELECT 
    c.categoryname, SUM(p.quantityavailable)
FROM
    products p
        JOIN
    categories c ON c.CategoryId = p.CategoryId
GROUP BY 1
ORDER BY 2 DESC;

/* Display ProductId, ProductName, CategoryName, Total_Purchased_Quantity for the product which has been sold 
maximum in terms of quantity? (1 Row) [Note: purchasedetails, products, categories] */


SELECT 
    p.productid,
    p.productname,
    c.categoryname,
    SUM(pur.quantitypurchased)
FROM
    ((products p
    JOIN categories c ON p.categoryid = c.categoryid)
    JOIN purchasedetails pur ON p.productid = pur.productid)
GROUP BY 3,2,1
ORDER BY 4 DESC
LIMIT 1;

/* Display the number of male and female customers in fastkart. (2 Rows) [Note: roles, users]*/

SELECT 
    gender, COUNT(gender)
FROM
    users
GROUP BY 1;


/* This criterion is linked to a Learning Outcome8. Display the percentage of females present among all Users. 
(Round up to 2 decimal places) Add “%” sign while displaying the percentage. (1 Row) [Note: users]*/

Select concat(round(((f_count/tot)*100), 2),'%') from (Select
Sum(Case when gender='F' then 1 else 0 end) as f_count,
Count(emailid) as tot
From users) as a;


/*  Display the average balance for both card types for those records only where CVVNumber > 333 
and NameOnCard ends with the alphabet “e”. (2 Rows) [Note: carddetails]*/


SELECT 
    cardtype, AVG(balance)
FROM
    carddetails
where cvvnumber > 333 AND nameoncard LIKE '%e'
GROUP BY cardtype
;


/* What is the 2nd most valuable item available which does not belong to the
 “Motor” category. Value of an item = Price * QuantityAvailable. Display ProductName,
 CategoryName, value. (1 Row) [Note: products, categories]*/

Select a.productname, a.categoryname,a.value_ from (Select 
Productname,
Categoryname,
Price * quantityavailable as value_, dense_rank() over(order by price*quantityavailable desc) as rank1
From products p join categories c on c.categoryid=p.categoryid
Where c.categoryid <> 1) as a
Where a.rank1=2
Order by 3 desc;


/* . Display ProductId, ProductName, Price and Item_Classes of all the products where Item_Classes are as
 follows: If the price of an item is less than 2,000 then “Affordable”, If the price of an item is in 
 between 2,000 and 50,000 then “High End Stuff”, If the price of an item is more than 50,000 then “Luxury”.*/
 
 
 SELECT productid, productname, price, 
 case
   when price < 2000 then "affordable"
   when price between 2000 and 50000 then "high end stuff"
   else "luxury"
end as item_classes
from products;


/* Write a query to display ProductId, ProductName,
 CategoryName, Old_Price(price) and New_Price as per the following criteria a. If the category is “Motors”,
 decrease the price by 3000 b. If the category is “Electronics”, increase the price by 50 c.
 If the category is “Fashion”, increase the price by 150 For the rest of the categories price remains same.
 Hint: Use case statement, there should be no permanent change done in table/DB.
 (57 Rows) Note: products, categories */
 
 
 SELECT p.productid, p.productname, c.categoryname, p.price,
 case
  when c.categoryname = "motor" then p.price - 3000
  when c.categoryname = "electronics" then p.price + 50
  when c.categoryname = "fashion" then p.price + 150
  else p.price
 end as new_price 
 from products p join categories c on p.categoryid = c.categoryid;