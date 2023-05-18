INSERT INTO public.word(
 user_name, tweet_id, tweet_text, tweet_opinion, json_field)
	VALUES ('bcanbay', 'gczjkcgjkz','ali ata bak', 1,array['{"tkid": "R1_0","tk": "ali","aspect": true,"sentiment": "Pos"}',
														   '{"tkid": "R1_1","tk": "ata"}','{"tkid": "R1_2","tk": "bak"}']::json[]);