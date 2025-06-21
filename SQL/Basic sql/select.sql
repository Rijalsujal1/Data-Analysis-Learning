SELECT * from demo.player_auction_2024;

SELECT name, 
status,
base_price_lakh,
(base_price_lakh +3)*10
FROM demo.player_auction_2024;

#PEMDAS
# while using the calulation in select it uses the pemdad
# p = parenthesis
# E = exponents
# M = multiplication
# D = Divison
# A = Addition
# S = Subtraction


SELECT distinct base_price_lakh, final_price_lakh
from demo.player_auction_2024;


