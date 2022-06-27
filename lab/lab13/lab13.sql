.read data.sql


CREATE TABLE average_prices AS
  SELECT category, AVG(MSRP) AS average_price FROM products
    GROUP BY category;


CREATE TABLE lowest_prices AS
  SELECT b.store, a.item, MIN(a.price) AS price FROM inventory AS a, inventory AS b
    WHERE a.item = b.item AND a.store = b.store
    GROUP BY a.item;


CREATE TABLE best_deal_by_category AS
  SELECT name, MIN(MSRP / rating) FROM products
    GROUP BY category;


CREATE TABLE shopping_list AS
  SELECT b.name, l.store FROM best_deal_by_category AS b, lowest_prices AS l
    WHERE b.name = l.item;


CREATE TABLE total_bandwidth AS
  SELECT SUM(s.Mbs) FROM shopping_list AS l, stores AS s
    WHERE l.store = s.store;

