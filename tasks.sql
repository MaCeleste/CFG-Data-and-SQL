-----------------------------------------------------------------------------------------
-- Tasks
-----------------------------------------------------------------------------------------


-----------------------------------------------------------------------------------------
-- Using any types of the joins create a view that combines multiple
-- tables in a logical way.
-----------------------------------------------------------------------------------------

-- This view shows a list of the nail polishes currently owned by the user 
-- with some key information.

CREATE VIEW my_collection AS
SELECT nail_polish.npname as 'Name', brands.bname as 'Brand', collections.cname as 'Collection', nail_polish.main_colour as 'MainColour', nail_polish.finish as 'Finish', np_owned.date_of_purchase as 'DateofPurchase', np_owned.worn as 'Worn'
FROM nail_polish
RIGHT JOIN np_owned on np_owned.np_id = nail_polish.np_id
LEFT JOIN brands ON nail_polish.brand_id = brands.brand_id
LEFT JOIN collections ON nail_polish.collection_id = collections.collection_id
ORDER BY bname, npname ASC;

SELECT * FROM my_collection;

-- This view shows a list of the nail polishes currently in the user's wishlist.

CREATE VIEW my_wishlist AS
SELECT nail_polish.npname as 'Name', brands.bname as 'Brand', collections.cname as 'Collection', nail_polish.main_colour as 'MainColour', nail_polish.finish as 'Finish', wishlist.date_added as 'DateAdded'
FROM nail_polish
RIGHT JOIN wishlist on wishlist.np_id = nail_polish.np_id
LEFT JOIN brands ON nail_polish.brand_id = brands.brand_id
LEFT JOIN collections ON nail_polish.collection_id = collections.collection_id
ORDER BY bname, npname ASC;

SELECT * FROM my_wishlist;

-----------------------------------------------------------------------------------------
-- In your database, create a stored function that can be applied to a query in your DB
-----------------------------------------------------------------------------------------

-- This function concatenates the nail polish name and brand and will be used to show 
-- a random nail polish from the user's collection as a suggestion for the day.

DELIMITER $$
CREATE FUNCTION np_suggestion(polishname VARCHAR(100), brandname VARCHAR(25))
RETURNS VARCHAR(200)
DETERMINISTIC

BEGIN
RETURN CONCAT('Today you should try: ', polishname, ' by ',brandname);

END $$
DELIMITER ;

SELECT np_suggestion(Name, Brand)
FROM my_collection
ORDER BY RAND()
LIMIT 1;

-----------------------------------------------------------------------------------------
-- In your database, create a stored procedure and demonstrate how it runs
-----------------------------------------------------------------------------------------

-- This procedure uses the function defined earlier to suggest a random unworn nail polish
-- that matches either the colour or finish entered by the user.

DELIMITER $$
CREATE PROCEDURE np_suggestion(selection VARCHAR(25))
BEGIN
IF selection in (SELECT MainColour FROM my_collection) OR selection in (SELECT Finish FROM my_collection) THEN
	SELECT np_suggestion(Name, Brand) as 'Suggestion'
		FROM my_collection
		WHERE my_collection.Worn = FALSE AND
			(CASE 
				WHEN selection in (SELECT MainColour FROM my_collection) THEN  my_collection.MainColour=selection
				WHEN selection in (SELECT Finish FROM my_collection) THEN my_collection.Finish=selection
			END)
			
			
		ORDER BY RAND()
		LIMIT 1;
ELSE 
	SELECT 'No nail polishes matching the description found' as 'Error';
END IF;
END$$
DELIMITER ;

CALL np_suggestion('Red');
CALL np_suggestion('Holographic');
CALL np_suggestion('Olive');

-----------------------------------------------------------------------------------------
-- Prepare an example query with a subquery to demonstrate how to extract data from 
-- you DB for analysis
-----------------------------------------------------------------------------------------

-- Query with a subquery to identify nail polishes owned by the user released by a brand
-- from the UK.

SELECT Name, Brand
FROM my_collection
WHERE Brand IN (SELECT bname from brands WHERE Country = 'UK');

-----------------------------------------------------------------------------------------
-- Prepare an example query with group by and having to demonstrate how to extract data
-- from your DB for analysis
-----------------------------------------------------------------------------------------

-- This query shows most owned nail polishes brands (more than 5 nail polishes owned 
-- from that particular brand)

SELECT Brand, COUNT(Brand)
FROM my_collection
GROUP BY Brand
HAVING COUNT(Brand) > 5
ORDER BY COUNT(Brand) DESC;

-- We assume the user has set a budget of £25 per month to spend on nail polish. This 
-- query shows those months when the user went over budget, the number of bottles 
-- purchased and the average price per bottle paid.

SELECT DATE_FORMAT(date_of_purchase, '%m-%Y') as Month, ROUND(SUM(Cost),2) as 'Total Spent', COUNT(np_id) as 'Number of bottles', ROUND(SUM(Cost)/COUNT(np_id),2) as 'Average price per bottle'
FROM np_owned 
GROUP BY DATE_FORMAT(date_of_purchase, '%m-%Y')
having SUM(Cost) > 25
ORDER BY date_of_purchase;

-----------------------------------------------------------------------------------------
-- In your database, create a trigger and demonstrate how it runs
-----------------------------------------------------------------------------------------

-- This trigger will be executed when a new nail polish is added to the np_owned table. 
-- It will check if the nail polish is on the user's wishlist, and if true, it will 
-- remove it from the wishlist.

DELIMITER $$
CREATE TRIGGER check_if_np_exists
BEFORE INSERT on np_owned
FOR EACH ROW
BEGIN
	IF NEW.np_id IN (SELECT wishlist.np_id FROM wishlist)
		THEN 
			DELETE FROM wishlist WHERE wishlist.np_id=NEW.np_id;
    END IF;
END$$
DELIMITER ;

INSERT INTO np_owned
(np_id, quantity_owned, date_of_purchase, worn, cost)
VALUES
(2,1,'2022-02-10',FALSE,5);

SELECT * FROM wishlist;
SELECT * FROM np_owned;