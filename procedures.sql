CREATE OR REPLACE PROCEDURE insert_transaction(transaction_qty integer,u_name character varying,
					u_name1 character varying,i_name character varying,t_name character varying)			
LANGUAGE plpgsql
AS $$
DECLARE user_from_id integer=(SELECT convert_user_name(u_name));
		user_to_id integer=(SELECT convert_user_name(u_name1));
	    item_id integer=(SELECT convert_item_name(i_name));
        type_id integer=(SELECT convert_transaction_name(t_name));
BEGIN

INSERT INTO "transaction"(transaction_date,transaction_qty,user_from_id,user_to_id,item_id,type_id) 
VALUES (now(),transaction_qty,user_from_id,user_to_id,item_id,type_id);
EXCEPTION
	WHEN sqlstate '23502' THEN
	RAISE EXCEPTION 'please be sure that %, % ,% ,% are registered to their tables',
	u_name, u_name1, i_name, t_name;
END;
$$;

 
CREATE OR REPLACE PROCEDURE insert_item(item_code character varying,game_code character varying,item_name character varying,
			 c_name character varying,c_address character varying,i_name character varying,s_name character varying)			
LANGUAGE plpgsql
AS $$
DECLARE category_id integer=(SELECT convert_category_name(c_name));
		contract_id integer=(SELECT convert_contract_address(c_address));
	    parent_id integer=(SELECT convert_item_name(i_name));
        status_id integer=(SELECT convert_status_name(s_name));
BEGIN

INSERT INTO item(item_code,game_code,item_name,category_id,contract_id,parent_id,status_id) 
VALUES (item_code,game_code,item_name,category_id,contract_id,parent_id,status_id);
EXCEPTION	
    WHEN not_null_violation THEN 
	 RAISE EXCEPTION 'please be sure that %,%,%,% are registered to their tables',
	 c_name, c_address, i_name, s_name;
	WHEN unique_violation THEN
	 RAISE EXCEPTION 'please be sure that %, % and % are unique',
	 item_code, game_code, item_name;
END;
$$;


CREATE OR REPLACE PROCEDURE insert_character(character_name character varying,u_name character varying,
g_option character varying, w_option character varying,l_option character varying,
h_option character varying,b_option character varying,m_option character varying)			
LANGUAGE plpgsql
AS $$
DECLARE user_id integer=(SELECT convert_user_name(u_name));
		gender_id integer=(SELECT convert_gender_option(g_option));
	    weight_id integer=(SELECT convert_weight_option(w_option));
        length_id integer=(SELECT convert_length_option(l_option));
		hair_id integer=(SELECT convert_hair_option(h_option));
	    beard_id integer=(SELECT convert_beard_option(b_option));
        moustache_id integer=(SELECT convert_moustache_option(m_option) );
BEGIN

INSERT INTO "character"(character_name,user_id,gender_id,weight_id,length_id,hair_id,beard_id,moustache_id) 
VALUES (character_name,user_id,gender_id,weight_id,length_id,hair_id,beard_id,moustache_id);
EXCEPTION
	WHEN not_null_violation THEN
	 RAISE EXCEPTION 'please be sure that %, %, %, %, %, % ,% are registered to their tables',
 	 u_name, g_option, w_option, l_option, h_option, b_option, m_option;
	WHEN unique_violation THEN
	 RAISE EXCEPTION '% already exists as a character name',character_name;
END;
$$;

					 
CREATE OR REPLACE PROCEDURE insert_release(release_qty int, i_name character varying)			
LANGUAGE plpgsql
AS $$
DECLARE item_id integer = (SELECT convert_item_name(i_name));
BEGIN
INSERT INTO "release"(release_date, release_qty, item_id) 
VALUES (now(), release_qty, item_id);
EXCEPTION 
	WHEN not_null_violation THEN
	RAISE EXCEPTION 'firstly use insert_item procedure to register the item %',i_name;
END $$;

					 

CREATE OR REPLACE PROCEDURE insert_category(category_name character varying)			
LANGUAGE plpgsql
AS $$

BEGIN
INSERT INTO category(category_name) 
VALUES (category_name);
EXCEPTION
     WHEN unique_violation THEN
	 RAISE EXCEPTION '% already exists as a category name',category_name;
END $$;



CREATE OR REPLACE PROCEDURE insert_contract(contract_address character varying)			
LANGUAGE plpgsql
AS $$

BEGIN
INSERT INTO contract(contract_address) 
VALUES (contract_address);
EXCEPTION
     WHEN unique_violation THEN
	 RAISE EXCEPTION '% already exists as a contract address',contract_address;
END $$;



CREATE OR REPLACE PROCEDURE insert_gender(gender_option character varying)			
LANGUAGE plpgsql
AS $$

BEGIN
INSERT INTO gender(gender_option) 
VALUES (gender_option);
EXCEPTION
     WHEN unique_violation THEN
	 RAISE EXCEPTION '% already exists as a gender option',gender_option;
END $$;



CREATE OR REPLACE PROCEDURE insert_hair(hair_option character varying)			
LANGUAGE plpgsql
AS $$

BEGIN
INSERT INTO hair(hair_option) 
VALUES (hair_option);
EXCEPTION
     WHEN unique_violation THEN
	 RAISE EXCEPTION '% already exists as a hair option',hair_option;
END $$;



CREATE OR REPLACE PROCEDURE insert_length(length_option character varying)			
LANGUAGE plpgsql
AS $$

BEGIN
INSERT INTO "length"(length_option) 
VALUES (length_option);
EXCEPTION
     WHEN unique_violation THEN
	 RAISE EXCEPTION '% already exists as a length option',length_option;
END $$;



CREATE OR REPLACE PROCEDURE insert_beard(beard_option character varying)			
LANGUAGE plpgsql
AS $$

BEGIN
INSERT INTO beard(beard_option) 
VALUES (beard_option);
EXCEPTION
     WHEN unique_violation THEN
	 RAISE EXCEPTION '% already exists as a beard option',beard_option;
END $$;
	


CREATE OR REPLACE PROCEDURE insert_moustache(moustache_option character varying)			
LANGUAGE plpgsql
AS $$

BEGIN
INSERT INTO moustache(moustache_option) 
VALUES (moustache_option);
EXCEPTION
     WHEN unique_violation THEN
	 RAISE EXCEPTION '% already exists as a moustache option',moustache_option;
END $$;
	



CREATE OR REPLACE PROCEDURE insert_status(status_name character varying)			
LANGUAGE plpgsql
AS $$

BEGIN
INSERT INTO status(status_name) 
VALUES (status_name);
EXCEPTION
     WHEN unique_violation THEN
	 RAISE EXCEPTION '% already exists as a status name',status_name;
END $$;
	



CREATE OR REPLACE PROCEDURE insert_transaction_type(transaction_name character varying)			
LANGUAGE plpgsql
AS $$

BEGIN
INSERT INTO transaction_type(transaction_name) 
VALUES (transaction_name);
EXCEPTION
     WHEN unique_violation THEN
	 RAISE EXCEPTION '% already exists as a transaction name',transaction_name;
END $$;



CREATE OR REPLACE PROCEDURE insert_user(user_name character varying, user_address character varying)			
LANGUAGE plpgsql
AS $$

BEGIN
INSERT INTO "user"(user_name,user_address) 
VALUES (user_name,user_address);
EXCEPTION
	WHEN unique_violation THEN
	RAISE EXCEPTION 'please be sure that % and %  are unique',
	user_name, user_address;
END;
$$;




CREATE OR REPLACE PROCEDURE insert_weight(weight_option character varying)			
LANGUAGE plpgsql
AS $$

BEGIN
INSERT INTO weight(weight_option) 
VALUES (weight_option);
EXCEPTION
	WHEN unique_violation THEN
	RAISE EXCEPTION '% already exists as a weight option',weight_option;
END;
$$;
