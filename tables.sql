
CREATE SCHEMA public


CREATE TABLE IF NOT EXISTS contract (
  id 				SMALLSERIAL NOT NULL UNIQUE PRIMARY KEY,
  contract_address  CHARACTER VARYING(50) NOT NULL UNIQUE
  );

CREATE TABLE IF NOT EXISTS category (
  id 				SMALLSERIAL NOT NULL UNIQUE PRIMARY KEY,
  category_name     CHARACTER VARYING(50) NOT NULL UNIQUE
  );
  
  CREATE TABLE IF NOT EXISTS status (
  id 				SMALLSERIAL NOT NULL UNIQUE PRIMARY KEY,
  status_name     CHARACTER VARYING(50) NOT NULL UNIQUE
  ); 
  
  CREATE TABLE IF NOT EXISTS item (
  id 				SERIAL NOT NULL UNIQUE PRIMARY KEY,
  item_code         CHARACTER VARYING(100) NOT NULL UNIQUE,
  game_code         CHARACTER VARYING(100) NOT NULL UNIQUE,
  item_name         CHARACTER VARYING(50) NOT NULL UNIQUE,
  category_id       SMALLINT NOT NULL REFERENCES category(id),
  contract_id       SMALLINT NOT NULL REFERENCES contract(id),
  parent_id         INT REFERENCES item(id),
  status_id 		SMALLINT NOT NULL REFERENCES status(id)
  );

CREATE TABLE IF NOT EXISTS "user" (
  id 				SERIAL NOT NULL UNIQUE PRIMARY KEY,
  user_name         CHARACTER VARYING(50) NOT NULL UNIQUE,
  user_address      CHARACTER VARYING(50) NOT NULL UNIQUE
 );

CREATE TABLE transaction_type(
 id 				SMALLSERIAL NOT NULL UNIQUE PRIMARY KEY,
 transaction_name   CHARACTER VARYING(50) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS "transaction" (
  id 				BIGSERIAL NOT NULL UNIQUE PRIMARY KEY,
  transaction_date  DATE NOT NULL,
  transaction_qty   INT NOT NULL,
  user_from_id      INT NOT NULL REFERENCES "user"(id),
  user_to_id        INT NOT NULL REFERENCES "user"(id),
  item_id           INT NOT NULL REFERENCES item(id),
  type_id           SMALLINT NOT NULL REFERENCES transaction_type(id)
 );


CREATE TABLE IF NOT EXISTS asset(
  id 				SERIAL NOT NULL UNIQUE,
  asset_qty         INT NOT NULL,
  user_id           INT NOT NULL REFERENCES "user"(id),
  item_id           INT NOT NULL REFERENCES item(id),
  PRIMARY KEY(user_id,item_id)	
 );


CREATE TABLE IF NOT EXISTS gender(
  id 				SMALLSERIAL NOT NULL UNIQUE PRIMARY KEY,
  gender_option       CHARACTER VARYING(50) NOT NULL UNIQUE
);


CREATE TABLE IF NOT EXISTS weight(
  id 				SMALLSERIAL NOT NULL UNIQUE PRIMARY KEY,
  weight_option       CHARACTER VARYING(50) NOT NULL UNIQUE
);


CREATE TABLE IF NOT EXISTS "length"(
  id 				SMALLSERIAL NOT NULL UNIQUE PRIMARY KEY,
  length_option     CHARACTER VARYING(50) NOT NULL UNIQUE
);


CREATE TABLE IF NOT EXISTS hair(
  id 				SMALLSERIAL NOT NULL UNIQUE PRIMARY KEY,
  hair_option       CHARACTER VARYING(50) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS beard(
  id 				SMALLSERIAL NOT NULL UNIQUE PRIMARY KEY,
  beard_option      CHARACTER VARYING(50) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS moustache(
  id 				SMALLSERIAL NOT NULL UNIQUE PRIMARY KEY,
  moustache_option  CHARACTER VARYING(50) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS "character" (
  id 				SERIAL NOT NULL UNIQUE PRIMARY KEY,
  character_name    CHARACTER VARYING(50) NOT NULL UNIQUE,
  user_id           SMALLINT NOT NULL REFERENCES "user"(id),
  gender_id         SMALLINT NOT NULL REFERENCES gender(id),
  weight_id         SMALLINT NOT NULL REFERENCES weight(id),
  length_id         SMALLINT NOT NULL REFERENCES "length"(id),
  hair_id           SMALLINT NOT NULL REFERENCES hair(id),
  beard_id          SMALLINT NOT NULL REFERENCES beard(id),
  moustache_id      SMALLINT NOT NULL REFERENCES moustache(id)
 );
 

CREATE OR REPLACE FUNCTION transaction_before_insert1()
RETURNS TRIGGER
AS
$$
BEGIN
	IF (SELECT COUNT(*) FROM asset 
       WHERE user_id = NEW.user_from_id AND item_id = NEW.item_id) = 0 THEN
	   INSERT INTO asset (asset_qty, user_id, item_id) VALUES (0, NEW.user_from_id, NEW.item_id);			
    END IF;
RETURN NEW;	
END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION transaction_before_insert2()
RETURNS TRIGGER
AS
$$
BEGIN
    IF (SELECT COUNT(*) FROM asset 
       WHERE user_id = NEW.user_to_id AND item_id = NEW.item_id) = 0 THEN
	   INSERT INTO asset (asset_qty, user_id, item_id) VALUES (0, NEW.user_to_id, NEW.item_id);			
    END IF;
RETURN NEW;	
END;
$$
LANGUAGE plpgsql;


CREATE TRIGGER transaction_before_insert1
BEFORE INSERT
ON "transaction"
FOR EACH ROW
EXECUTE PROCEDURE transaction_before_insert1();

CREATE TRIGGER transaction_before_insert2
BEFORE INSERT
ON "transaction"
FOR EACH ROW
EXECUTE PROCEDURE transaction_before_insert2();



CREATE OR REPLACE FUNCTION transaction_after_insert1() 
RETURNS TRIGGER
AS
$$
BEGIN
	UPDATE asset
    SET asset_qty = asset_qty - NEW.transaction_qty
    WHERE user_id = NEW.user_from_id AND item_id = NEW.item_id;
RETURN NEW;	
END;
$$
LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION transaction_after_insert2() 
RETURNS TRIGGER
AS
$$
BEGIN
	UPDATE asset
    SET asset_qty = asset_qty + NEW.transaction_qty
    WHERE user_id = NEW.user_to_id AND item_id = NEW.item_id;
RETURN NEW;	
END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER transaction_after_insert1
AFTER INSERT
ON "transaction"
FOR EACH ROW
EXECUTE PROCEDURE transaction_after_insert1();

CREATE TRIGGER transaction_after_insert2
AFTER INSERT
ON "transaction"
FOR EACH ROW
EXECUTE PROCEDURE transaction_after_insert2();


CREATE OR REPLACE FUNCTION transaction_before_update1()
RETURNS TRIGGER
AS
$$
BEGIN
	UPDATE asset
    SET asset_qty = asset_qty + OLD.transaction_qty
    WHERE user_id = OLD.user_from_id AND item_id = OLD.item_id;
RETURN NEW;	
END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION transaction_before_update2()
RETURNS TRIGGER
AS
$$
BEGIN
	UPDATE asset
    SET asset_qty = asset_qty - OLD.transaction_qty
    WHERE user_id = OLD.user_to_id AND item_id = OLD.item_id;
RETURN NEW;	
END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER transaction_before_update1
BEFORE UPDATE
ON "transaction"
FOR EACH ROW
EXECUTE PROCEDURE transaction_before_update1();

CREATE TRIGGER transaction_before_update2
BEFORE UPDATE
ON "transaction"
FOR EACH ROW
EXECUTE PROCEDURE transaction_before_update2();



CREATE OR REPLACE FUNCTION transaction_after_update1()
RETURNS TRIGGER
AS
$$
BEGIN
	UPDATE asset
    SET asset_qty = asset_qty - NEW.transaction_qty
    WHERE user_id = NEW.user_from_id AND item_id = NEW.item_id;
RETURN NEW;	
END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION transaction_after_update2()
RETURNS TRIGGER
AS
$$
BEGIN
    UPDATE asset
    SET asset_qty = asset_qty + NEW.transaction_qty
    WHERE user_id = NEW.user_to_id AND item_id = NEW.item_id;
RETURN NEW;	
END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER transaction_after_update1
AFTER UPDATE
ON "transaction"
FOR EACH ROW
EXECUTE PROCEDURE transaction_after_update1();

CREATE TRIGGER transaction_after_update2
AFTER UPDATE
ON "transaction"
FOR EACH ROW
EXECUTE PROCEDURE transaction_after_update2();


CREATE OR REPLACE FUNCTION transaction_after_delete1()
RETURNS TRIGGER
AS
$$
BEGIN
    UPDATE asset
    SET asset_qty = asset_qty + OLD.transaction_qty
    WHERE user_id = OLD.user_from_id AND item_id = OLD.item_id;
RETURN NEW;
END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION transaction_after_delete2()
RETURNS TRIGGER
AS
$$
BEGIN
	UPDATE asset
    SET asset_qty = asset_qty - OLD.transaction_qty
    WHERE user_id = OLD.user_to_id AND item_id = OLD.item_id;
RETURN NEW;
END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER transaction_after_delete1
AFTER DELETE
ON "transaction"
FOR EACH ROW
EXECUTE PROCEDURE transaction_after_delete1();

CREATE TRIGGER transaction_after_delete2
AFTER DELETE
ON "transaction"
FOR EACH ROW
EXECUTE PROCEDURE transaction_after_delete2();


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