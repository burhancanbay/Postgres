CREATE OR REPLACE FUNCTION convert_user_name(u_name character varying) 
RETURNS INTEGER
LANGUAGE plpgsql
AS $$
DECLARE 
	user_id INTEGER;
BEGIN
	user_id:=(SELECT id FROM "user" WHERE user_name=u_name);
RETURN user_id;		
END $$;



CREATE OR REPLACE FUNCTION convert_item_name(i_name character varying) 
RETURNS INTEGER
LANGUAGE plpgsql
AS $$
DECLARE 
	item_id INTEGER;
BEGIN
	item_id:=(SELECT id FROM item WHERE item_name=i_name);
RETURN item_id;	
END $$;



CREATE OR REPLACE FUNCTION convert_transaction_name(t_name character varying) 
RETURNS INTEGER
LANGUAGE plpgsql
AS $$
DECLARE 
	type_id INTEGER;
BEGIN
	type_id:=(SELECT id FROM transaction_type WHERE transaction_name=t_name);
RETURN type_id;	
END $$;


CREATE OR REPLACE FUNCTION convert_category_name(c_name character varying) 
RETURNS INTEGER
LANGUAGE plpgsql
AS $$
DECLARE 
	category_id INTEGER;
BEGIN
	category_id:=(SELECT id FROM category WHERE category_name=c_name);
RETURN category_id;	
END $$;


CREATE OR REPLACE FUNCTION convert_contract_address(c_address character varying) 
RETURNS INTEGER
LANGUAGE plpgsql
AS $$
DECLARE 
	contract_id INTEGER;
BEGIN
	contract_id:=(SELECT id FROM contract WHERE contract_address=c_address);
RETURN contract_id;	
END $$;


CREATE OR REPLACE FUNCTION convert_status_name(s_name character varying) 
RETURNS INTEGER
LANGUAGE plpgsql
AS $$
DECLARE 
	status_id INTEGER;
BEGIN
	status_id:=(SELECT id FROM status WHERE status_name=s_name);
RETURN status_id;	
END $$;


CREATE OR REPLACE FUNCTION convert_gender_option(g_option character varying) 
RETURNS INTEGER
LANGUAGE plpgsql
AS $$
DECLARE 
	gender_id INTEGER;
BEGIN
	gender_id:=(SELECT id FROM gender WHERE gender_option=g_option);
RETURN gender_id;	
END $$;

CREATE OR REPLACE FUNCTION convert_weight_option(w_option character varying) 
RETURNS INTEGER
LANGUAGE plpgsql
AS $$
DECLARE 
	weight_id INTEGER;
BEGIN
	weight_id:=(SELECT id FROM weight WHERE weight_option=w_option);
RETURN weight_id;	
END $$;


CREATE OR REPLACE FUNCTION convert_length_option(l_option character varying) 
RETURNS INTEGER
LANGUAGE plpgsql
AS $$
DECLARE 
	length_id INTEGER;
BEGIN
	length_id:=(SELECT id FROM "length" WHERE length_option=l_option);
RETURN length_id;	
END $$;


CREATE OR REPLACE FUNCTION convert_hair_option(h_option character varying) 
RETURNS INTEGER
LANGUAGE plpgsql
AS $$
DECLARE 
	hair_id INTEGER;
BEGIN
	hair_id:=(SELECT id FROM hair WHERE hair_option=h_option);
RETURN hair_id;	
END $$;


CREATE OR REPLACE FUNCTION convert_beard_option(b_option character varying) 
RETURNS INTEGER
LANGUAGE plpgsql
AS $$
DECLARE 
	beard_id INTEGER;
BEGIN
	beard_id:=(SELECT id FROM beard WHERE beard_option=b_option);
RETURN beard_id;	
END $$;


CREATE OR REPLACE FUNCTION convert_moustache_option(m_option character varying) 
RETURNS INTEGER
LANGUAGE plpgsql
AS $$
DECLARE 
	moustache_id INTEGER;
BEGIN
	moustache_id:=(SELECT id FROM moustache WHERE moustache_option=m_option);
RETURN moustache_id;	
END $$;