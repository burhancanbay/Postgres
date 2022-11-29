CREATE VIEW asset_feature
AS
  SELECT u.user_name,
    i.item_name,
    ass.asset_qty
   FROM asset ass
     LEFT JOIN "user" u ON ass.user_id = u.id
     LEFT JOIN item i ON ass.item_id = i.id
  ORDER BY u.user_name;
  
  
CREATE VIEW character_feature
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
	 
	 
CREATE VIEW item_feature
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
  
  
CREATE VIEW transaction_feature
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
	 