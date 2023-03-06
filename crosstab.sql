CREATE EXTENSION IF NOT EXISTS tablefunc;

SELECT *
FROM crosstab('select  item_id,user_id,asset_qty from asset order by 1,2',$$VALUES ('1'::int), ('2'),('3'),('4')$$)
AS ct(item_id int,"user_id=1" int,"user_id=2" int,"user_id=3" int,"user_id=4" int);


SELECT *
FROM crosstab('select  item_name,user_name, asset_quantity from asset_view order by item_name,user_name',$$VALtUES ('system'::text), ('burhan'),('osman'),('can')$$)
AS ct(item_name text, "system" text,"burhan" text,"osman" text,"can" text);


SELECT *
FROM crosstab('select  user_name,item_name, asset_quantity from asset_view order by 1,2',$$VALUES ('gfvc'::text), ('mnhg'),('nbgt'),('qwer'),('tyui')$$)
AS ct(user_name text, "gfvc" text,"mnhg" text,"nbgt" text,"qwer" text,"tyui" text);

