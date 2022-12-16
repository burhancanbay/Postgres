
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


CREATE TABLE IF NOT EXISTS "release"(
  id 				SERIAL NOT NULL UNIQUE PRIMARY KEY,
  release_date      TIMESTAMPTZ NOT NULL,	
  release_qty       INT NOT NULL,
  item_id           INT NOT NULL REFERENCES item(id)	
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
 
