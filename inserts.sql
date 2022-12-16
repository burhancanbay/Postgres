
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
	   
INSERT INTO "release" (release_date, release_qty, item_id)
VALUES (now(), 100, 6),(now(), 150, 7);

INSERT INTO "transaction" (transaction_date,transaction_qty,user_from_id,user_to_id,item_id,type_id) 
VALUES ('2022-07-31 20:15:57',5,4,3,6,2),
       ('2022-08-01 05:24:45',1,3,4,5,1),
       ('2022-08-02 12:45:23',1,2,1,4,2),
       ('2022-07-26 15:34:42',2,4,3,7,1),
       ('2022-07-28 03:15:36',3,1,3,12,2),
       ('2022-07-27 02:34:12',3,2,1,9,2),
       ('2022-07-25 22:46:25',1,2,4,6,1),
       ('2022-07-26 23:27:43',1,4,1,8,2),
       ('2022-07-29 20:15:57',2,3,2,9,1),
       ('2022-07-30 19:56:21',2,1,3,11,2),
       ('2022-07-31 14:23:41',3,2,1,10,2),
       ('2022-07-24 23:35:57',3,3,1,1,2),
       ('2022-07-26 16:15:36',2,4,1,12,2),
       ('2022-07-23 13:37:32',1,3,2,3,1),
       ('2022-07-24 15:32:39',2,2,1,5,2),
       ('2022-07-26 22:15:22',2,1,4,7,1),
       ('2022-07-27 23:43:57',3,2,3,7,1),
       ('2022-07-21 21:36:12',3,4,2,3,1),
       ('2022-07-22 20:15:57',1,3,1,9,2);

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

