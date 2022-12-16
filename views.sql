

CREATE OR REPLACE VIEW weight_feature
AS
  SELECT weight_option
  FROM weight
  ORDER BY weight_option;
  
  

CREATE OR REPLACE VIEW user_feature2
AS
  SELECT user_address
  FROM "user"
  ORDER BY user_address;



CREATE OR REPLACE VIEW user_feature1
AS
  SELECT user_name
  FROM "user"
  ORDER BY user_name;
  

CREATE OR REPLACE VIEW transaction_type_feature
AS
  SELECT transaction_name
  FROM transaction_type
  ORDER BY transaction_name;
  


CREATE OR REPLACE VIEW status_feature
AS
  SELECT status_name
  FROM status
  ORDER BY status_name;



CREATE OR REPLACE VIEW moustache_feature
AS
  SELECT moustache_option
  FROM moustache
  ORDER BY moustache_option;



CREATE OR REPLACE VIEW length_feature
AS
  SELECT length_option
  FROM "length"
  ORDER BY length_option;



CREATE OR REPLACE VIEW hair_feature
AS
  SELECT hair_option
  FROM hair
  ORDER BY hair_option;



CREATE OR REPLACE VIEW gender_feature
AS
  SELECT gender_option
  FROM gender
  ORDER BY gender_option;



CREATE OR REPLACE VIEW contract_feature
AS
  SELECT contract_address
  FROM contract
  ORDER BY contract_address;



CREATE OR REPLACE VIEW category_feature
AS
  SELECT category_name
  FROM category
  ORDER BY category_name;



CREATE OR REPLACE VIEW beard_feature
AS
  SELECT beard_option
  FROM beard
  ORDER BY beard_option;
 

CREATE OR REPLACE VIEW release_feature
AS
  SELECT i.item_name,
         r.release_qty,
	     r.release_date
   FROM "release" r
    LEFT JOIN item i ON r.item_id = i.id
  ORDER BY r.release_date;


CREATE OR REPLACE VIEW asset_feature
AS
  SELECT u.user_name,
         i.item_name,
         ass.asset_qty
   FROM asset ass
     LEFT JOIN "user" u ON ass.user_id = u.id
     LEFT JOIN item i ON ass.item_id = i.id
   WHERE ass.asset_qty <> 0
   ORDER BY u.user_name;
   
  
  
CREATE OR REPLACE VIEW character_feature
AS
   SELECT ch.character_name,
    u.user_name,
    gn.gender_option,
    w.weight_option,
    l.length_option,
    h.hair_option,
    b.beard_option,
    ms.moustache_option
   FROM "character" ch
     LEFT JOIN "user" u ON ch.user_id = u.id
     LEFT JOIN gender gn ON ch.gender_id = gn.id
     LEFT JOIN weight w ON ch.weight_id = w.id
     LEFT JOIN  "length" l ON ch.length_id = l.id
     LEFT JOIN hair h ON ch.hair_id = h.id
     LEFT JOIN beard b ON ch.beard_id = b.id
     LEFT JOIN moustache ms ON ch.moustache_id = ms.id;
	 
	 
CREATE OR REPLACE VIEW item_feature
AS
	  SELECT i.id,
    i.item_code,
    i.game_code,
	i.item_name,
    ct.category_name,
    cn.contract_address,
    it.item_name AS parent_item,
    s.status_name
   FROM item i
     LEFT JOIN category ct ON i.category_id = ct.id
     LEFT JOIN contract cn ON i.contract_id = cn.id
     LEFT JOIN item it ON i.parent_id = it.id
     LEFT JOIN status s ON i.status_id = s.id
  ORDER BY i.id;
  
  
CREATE OR REPLACE VIEW transaction_feature
AS
  SELECT tr.transaction_date,
    tr.transaction_qty,
    u.user_name AS "from",
    us.user_name AS "to",
    i.item_name,
    tt.transaction_name
   FROM "transaction" tr
     LEFT JOIN "user" u ON tr.user_from_id = u.id
     LEFT JOIN "user" us ON tr.user_to_id = us.id
     LEFT JOIN item i ON tr.item_id = i.id
     LEFT JOIN transaction_type tt ON tr.type_id = tt.id;
	 