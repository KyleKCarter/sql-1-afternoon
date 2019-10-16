-- TABLE-person
-- 1. Create a table called person that records a person's id, name, age, height ( in cm ), city, favorite_color.
CREATE TABLE person(
  id SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  age INTEGER NOT NULL,
  height INTEGER NOT NULL,
  city VARCHAR(50) NOT NULL,
  favorite_color VARCHAR(50) NOT NULL
)
-- 2. Add 5 different people into the person database.
INSERT INTO person
(name, age, height, city, favorite_color)
VALUES
('Jon Snow', 23, 173 cm, 'Winterfell', 'Black'),
('Daenerys Targaryen', 23, 157 cm, 'Dragonstone', 'Red'),
('Bran Stark', 17, 180 cm,'Winterfell', 'Black'),
('Sansa Stark', 20, 175 cm, 'Winterfell', 'Blue'),
('Tyrion Lannister', 39, 132 cm, 'Casterly Rock', 'Gold')
-- 3. List all the people in the person table by height from tallest to shortest.
SELECT * FROM person ORDER BY height DESC;
-- 4. List all the people in the person table by height from shortest to tallest.
SELECT * FROM person ORDER BY height ASC;
-- 5. List all the people in the person table by age from oldest to youngest.
SELECT * FROM person ORDER BY age DESC;
-- 6. List all the people in the person table older than age 20.
SELECT * FROM person WHERE age >20;
-- 7. List all the people in the person table that are exactly 18.
SELECT * FROM person WHERE age = 18;
-- 8. List all the people in the person table that are less than 20 and older than 30.
SELECT * FROM person WHERE age < 20 OR age > 30;
-- 9. List all the people in the person table that are not 27 (Use not equals).
SELECT * FROM person WHERE age != 27;
-- 10. List all the people in the person table where their favorite color is not red.
SELECT * FROM person WHERE favorite_color != 'Red';
-- 11. List all the people in the person table where their favorite color is not red and is not blue.
SELECT * FROM person WHERE favorite_color != 'Red' AND favorite_color != 'Blue';
-- 12. List all the people in the person table where their favorite color is orange or green.
SELECT * FROM person WHERE favorite_color = 'Orange' OR favorite_color = 'Green';
-- 13. List all the people in the person table where their favorite color is orange, green or blue (use IN).
SELECT * FROM person WHERE favorite_color IN ('Orange', 'Green', 'Blue');
-- 14. List all the people in the person table where their favorite color is yellow or purple (use IN).
SELECT * FROM person WHERE favorite_color IN ('Yellow', 'Purple');


-- TABLE - orders
-- 1. Create a table called orders that records: order_id, person_id, product_name, product_price, quantity.
CREATE TABLE orders (
 order_id SERIAL PRIMARY KEY,
 person_id INTEGER,
 product_name VARCHAR(100) NOT NULL,
 product_price NUMERIC NOT NULL,
 quantity INTEGER NOT NULL
)
-- 2. Add 5 orders to the orders table. Make orders for at least two different people. person_id should be different for different people.
INSERT INTO orders
(person_id, product_name, product_price, quantity)
VALUES
(0, 'Valerian Steel', 500, 1),
(1, 'Ships', 5000, 1000),
(2, 'Wheel Chair', 50, 1),
(3, 'Crown', 1000, 1),
(4, 'Wine', 100, 30)
-- 3. Select all the records from the orders table.
SELECT * FROM orders
-- 4. Calculate the total number of products ordered.
SELECT sum(quantity) FROM orders
-- 5. Calculate the total order price.
SELECT sum(product_price) FROM orders
-- 6. Calculate the total order price by a single person_id.
SELECT sum(product_price * quantity) FROM orders WHERE person_id=1;


-- TABLE - artist
-- 1. Add 3 new artists to the artist table. ( "It's already created" )
INSERT INTO artist
(artist_id, name)
VALUES
(276, 'The Beatles'),
(277, 'Coldplay'),
(278, 'Logic')
-- 2. Select 10 artists in reverse alphabetical order.
SELECT * FROM artist ORDER BY name DESC LIMIT 10;
-- 3. Select 5 artists in alphabetical order.
SELECT * FROM artist ORDER BY name ASC LIMIT 5;
-- 4. Select all artists that start with the word 'Black'.
SELECT * FROM artist WHERE name LIKE 'Black%';
-- 5. Select all artists that contain the word 'Black'.
SELECT * FROM artist WHERE name LIKE '%Black%';


-- TABLE - employee
-- List all employee first and last names only that live in Calgary.
SELECT (first_name, last_name) FROM employee WHERE city = 'Calgary';
-- Find the birthdate for the youngest employee.
SELECT MAX(birth_date) FROM employee;
-- Find the birthdate for the oldest employee.
SELECT MIN(birth_date) FROM employee;
-- Find everyone that reports to Nancy Edwards (Use the ReportsTo column). You will need to query the employee table to find the Id for Nancy Edwards
SELECT * FROM employee WHERE reports_to = 2;
-- Count how many people live in Lethbridge.
SELECT COUNT(*) FROM employee WHERE city = 'Lethbridge';


-- TABLE - invoice
-- Count how many orders were made from the USA.
SELECT COUNT(*) FROM invoice WHERE billing_country = 'USA';
-- Find the largest order total amount.
SELECT MAX(total) FROM invoice;
-- Find the smallest order total amount.
SELECT MIN(total) FROM invoice;
-- Find all orders bigger than $5.
SELECT * FROM invoice WHERE total > 5;
-- Count how many orders were smaller than $5.
SELECT COUNT(*) FROM invoice WHERE total < 5;
-- Count how many orders were in CA, TX, or AZ (use IN).
SELECT COUNT(*) FROM invoice WHERE billing_state IN ('CA', 'TX', 'AZ');
-- Get the average total of the orders.
SELECT AVG(total) FROM invoice;
-- Get the total sum of the orders.
SELECT SUM(total) FROM invoice;