

SELECT json_field->'4'->1 FROM word WHERE user_name = 'eozer';


SELECT words->'word_opinion'->0 FROM user_tweet WHERE (user_name = 'eozer' and tweet_id ='4');


SELECT words->'start_of'->0 FROM user_tweet WHERE (user_name = 'eozer' and tweet_id ='4');


SELECT words->'end_of'->0 FROM user_tweet WHERE (user_name = 'eozer' and tweet_id ='4');

SELECT * FROM user_tweet WHERE (user_name = 'eozer' and tweet_id ='4');