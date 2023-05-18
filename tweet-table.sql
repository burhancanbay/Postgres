CREATE TABLE IF NOT EXISTS opinion(
  id 				SERIAL NOT NULL UNIQUE,
  matter_id         varchar NOT NULL,
  client_id         varchar NOT NULL,
  user_name         varchar NOT NULL,
  tweet_id          varchar NOT NULL,
  tweet_text        text,
  tweet_opinion     varchar,
  tweet_approval    varchar,
  json_field        JSONB,
  PRIMARY KEY(user_name,tweet_id)	
 );
