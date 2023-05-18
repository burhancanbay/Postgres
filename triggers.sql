

CREATE OR REPLACE FUNCTION release_after_insert()
RETURNS TRIGGER
AS
$$
BEGIN
	UPDATE asset
    SET asset_qty = asset_qty + NEW.release_qty
    WHERE user_id = 1 AND item_id = NEW.item_id;
RETURN NEW;	
END;
$$
LANGUAGE plpgsql;


CREATE TRIGGER release_after_insert
AFTER INSERT
ON "release"
FOR EACH ROW
EXECUTE PROCEDURE release_after_insert();



CREATE OR REPLACE FUNCTION release_before_insert()
RETURNS TRIGGER
AS
$$
BEGIN
    IF (SELECT COUNT(*) FROM asset 
       WHERE user_id = 1 AND item_id = NEW.item_id) = 0 THEN
	   INSERT INTO asset (asset_qty, user_id, item_id) VALUES (0, 1, NEW.item_id);			
    END IF;
RETURN NEW;	
END;
$$
LANGUAGE plpgsql;


CREATE TRIGGER release_before_insert
BEFORE INSERT
ON "release"
FOR EACH ROW
EXECUTE PROCEDURE release_before_insert();



CREATE OR REPLACE FUNCTION release_after_update()
RETURNS TRIGGER
AS
$$
BEGIN
	UPDATE asset
    SET asset_qty = asset_qty + NEW.release_qty
    WHERE user_id = 1 AND item_id = NEW.item_id;
RETURN NEW;	
END;
$$
LANGUAGE plpgsql;


CREATE TRIGGER release_after_update
AFTER UPDATE
ON "release"
FOR EACH ROW
EXECUTE PROCEDURE release_after_update();



CREATE OR REPLACE FUNCTION release_before_update()
RETURNS TRIGGER
AS
$$
BEGIN
	UPDATE asset
    SET asset_qty = asset_qty - OLD.release_qty
    WHERE user_id = 1 AND item_id = OLD.item_id;
RETURN NEW;	
END;
$$
LANGUAGE plpgsql;


CREATE TRIGGER release_before_update
BEFORE UPDATE
ON "release"
FOR EACH ROW
EXECUTE PROCEDURE release_before_update();


CREATE OR REPLACE FUNCTION release_after_delete()
RETURNS TRIGGER
AS
$$
BEGIN
	UPDATE asset
    SET asset_qty = asset_qty - OLD.release_qty
    WHERE user_id = 1 AND item_id = OLD.item_id;
RETURN NEW;	
END;
$$
LANGUAGE plpgsql;


CREATE TRIGGER release_after_delete
AFTER DELETE
ON "release"
FOR EACH ROW
EXECUTE PROCEDURE release_after_delete();


CREATE OR REPLACE FUNCTION transaction_before_insert1()
RETURNS TRIGGER
AS
$$
BEGIN
	IF (SELECT COUNT(*) FROM asset 
       WHERE user_id = NEW.from_user_id AND item_id = NEW.item_id) = 0 THEN
	   INSERT INTO asset (asset_qty, user_id, item_id) VALUES (0, NEW.from_user_id, NEW.item_id);			
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


CREATE OR REPLACE FUNCTION transaction_before_insert2()
RETURNS TRIGGER
AS
$$
BEGIN
    IF (SELECT COUNT(*) FROM asset 
       WHERE user_id = NEW.to_user_id AND item_id = NEW.item_id) = 0 THEN
	   INSERT INTO asset (asset_qty, user_id, item_id) VALUES (0, NEW.to_user_id, NEW.item_id);			
    END IF;
RETURN NEW;	
END;
$$
LANGUAGE plpgsql;




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
    WHERE user_id = NEW.from_user_id AND item_id = NEW.item_id;
RETURN NEW;	
END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER transaction_after_insert1
AFTER INSERT
ON "transaction"
FOR EACH ROW
EXECUTE PROCEDURE transaction_after_insert1();


CREATE OR REPLACE FUNCTION transaction_after_insert2() 
RETURNS TRIGGER
AS
$$
BEGIN
	UPDATE asset
    SET asset_qty = asset_qty + NEW.transaction_qty
    WHERE user_id = NEW.to_user_id AND item_id = NEW.item_id;
RETURN NEW;	
END;
$$
LANGUAGE plpgsql;



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
    WHERE user_id = OLD.from_user_id AND item_id = OLD.item_id;
RETURN NEW;	
END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER transaction_before_update1
BEFORE UPDATE
ON "transaction"
FOR EACH ROW
EXECUTE PROCEDURE transaction_before_update1();


CREATE OR REPLACE FUNCTION transaction_before_update2()
RETURNS TRIGGER
AS
$$
BEGIN
	UPDATE asset
    SET asset_qty = asset_qty - OLD.transaction_qty
    WHERE user_id = OLD.to_user_id AND item_id = OLD.item_id;
RETURN NEW;	
END;
$$
LANGUAGE plpgsql;

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
    WHERE user_id = NEW.from_user_id AND item_id = NEW.item_id;
RETURN NEW;	
END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER transaction_after_update1
AFTER UPDATE
ON "transaction"
FOR EACH ROW
EXECUTE PROCEDURE transaction_after_update1();


CREATE OR REPLACE FUNCTION transaction_after_update2()
RETURNS TRIGGER
AS
$$
BEGIN
    UPDATE asset
    SET asset_qty = asset_qty + NEW.transaction_qty
    WHERE user_id = NEW.to_user_id AND item_id = NEW.item_id;
RETURN NEW;	
END;
$$
LANGUAGE plpgsql;

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
    WHERE user_id = OLD.from_user_id AND item_id = OLD.item_id;
RETURN NEW;
END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER transaction_after_delete1
AFTER DELETE
ON "transaction"
FOR EACH ROW
EXECUTE PROCEDURE transaction_after_delete1();



CREATE OR REPLACE FUNCTION transaction_after_delete2()
RETURNS TRIGGER
AS
$$
BEGIN
	UPDATE asset
    SET asset_qty = asset_qty - OLD.transaction_qty
    WHERE user_id = OLD.to_user_id AND item_id = OLD.item_id;
RETURN NEW;
END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER transaction_after_delete2
AFTER DELETE
ON "transaction"
FOR EACH ROW
EXECUTE PROCEDURE transaction_after_delete2();

