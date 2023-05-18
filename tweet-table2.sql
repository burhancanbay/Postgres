-- Table: public.word

-- DROP TABLE IF EXISTS public.word;

CREATE TABLE IF NOT EXISTS public.word
(
    id BIGSERIAL PRIMARY KEY,
    user_name character varying COLLATE pg_catalog."default" NOT NULL,
    tweet_id character varying COLLATE pg_catalog."default" NOT NULL,
	tweet_text text COLLATE pg_catalog."default" NOT NULL,
    tweet_opinion integer,
    json_field jsonb
);

