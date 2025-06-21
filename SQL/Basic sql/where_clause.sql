-- WHERE Clause

SELECT * 
FROM demo.player_auction_2024
WHERE 
-- base_price_lakh = 2 and 
-- status = 'Sold' and 
franchise = 'Janakpur Bolts'
;


SELECT * 
FROM demo.player_auction_2024
where base_price_lakh >= 5;

SELECT name, category, base_price_lakh
FROM demo.player_auction_2024
where status = 'Unsold' and base_price_lakh <5;

SELECT name, franchise, final_price_lakh
FROM demo.player_auction_2024
where status = 'Sold' and base_price_lakh >= 5;

SELECT name, status
FROM player_auction_2024
WHERE NOT status = 'Sold';

SELECT *
FROM player_auction_2024
WHERE (final_price_lakh BETWEEN 2.0 AND 5.0) AND base_price_lakh = 2;



-- ✅ Task 6: Missing Franchise (Null Check)
-- Show players who were not bought by any franchise.

SELECT *
FROM player_auction_2024;
SELECT *
FROM demo.player_auction_2024
WHERE time LIKE '%2024%';

