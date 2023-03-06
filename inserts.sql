
INSERT INTO "user" (user_name,user_address) 
VALUES ('system','postgres'),('burhan','avcilar'),('osman','beylikduzu'),('can','arnavutkoy');

INSERT INTO category (category_name) 
VALUES ('weapon'),('magazine'),('bullet'),('furniture');

INSERT INTO contract (contract_address) 
VALUES ('x0x1x2x3c21cft2yf1f13');

INSERT INTO status (status_name) 
VALUES ('on-use'),('on-stock'),('passive');

INSERT INTO transaction_type (transaction_name) 
VALUES ('sale'),('free');

INSERT INTO item (item_code,game_code,item_name,category_id,contract_id,parent_id,status_id) 
VALUES ('asdf','zxcv','qwer',1,1,null,1),
       ('ghjk','vbnm','tyui',2,1,null,2),
       ('qazx','wsxc','edcv',1,1,1,3),
       ('wqaz','ewsx','redc',3,1,2,1),
       ('vcde','bvfr','nbgt',4,1,null,1),
       ('reds','fdcx','gfvc',4,1,null,2),
       ('bgfr','nbgf','mnhg',3,1,5,2),
       ('rtgh','tghn','fgty',1,1,6,2),
       ('mjhn','mjki','ujko',2,1,null,2),
       ('vfgt','bghy','polk',4,1,null,3),
       ('loik','kiuj','juyh',1,1,9,1),
       ('hytg','gtrf','fred',3,1,1,1);
	   
INSERT INTO "release" (release_qty, item_id)
VALUES (100, 1),(150, 2),(100, 6),(150, 7);

INSERT INTO "transaction" (transaction_qty,from_user_id,to_user_id,item_id,type_id) 
VALUES (5,1,3,6,2),
       (10,1,4,6,1),
	   (7,1,2,7,2),
       (8,1,3,7,1),
	   (15,1,3,1,2),
       (10,1,4,1,1),
	   (20,1,2,2,2),
       (18,1,3,2,1),
	    (1,2,3,2,2),
       (2,4,3,1,1),
	   (3,2,1,7,2);

INSERT INTO gender(gender_option) 
VALUES ('mail'),('femail'),('other');

INSERT INTO weight(weight_option)
VALUES ('fat'),('slim'),('middle weight');

INSERT INTO "length"(length_option) 
VALUES ('tall'),('short'),('middle height');

INSERT INTO hair(hair_option)
VALUES ('short hair'),('long hair'),('middle sized'),('without hair');

INSERT INTO beard(beard_option)
VALUES ('coarse beard'),('stubble beard'),('without beard');

INSERT INTO moustache(moustache_option)
VALUES ('long moustache'),('short moustache'),('without moustache');

INSERT INTO "character" (character_name,user_id,gender_id,weight_id,length_id,hair_id,beard_id,moustache_id) 
VALUES ('danger',1,1,2,3,2,1,3),
       ('huge',2,2,1,1,2,3,1),
       ('iron',3,1,3,3,1,3,3);

