select words->'start_of'->>1 from user_tweet where id=7;

select * from user_tweet where words->'start_of'->>1 = 5;

select * from word where id=7;

select json_field from word where id=8;

select json_field->1->'tk' from word where id=11;

-- select * from word where json_field->1->'tk'->>'ata';

SELECT *
FROM opinion
WHERE json_field -> 0 ->> 'tk' = 'ali' and json_field -> 0 ->> 'sentiment' = 'Pos'  ;

SELECT *
FROM opinion
WHERE json_field ->> 'tk' = 'ali' and json_field -> 0 ->> 'sentiment' = 'Pos'  ;

SELECT *
FROM opinion
WHERE json_field @> '[{"tkid": "R1_0","tk": "ali","aspect": true,"sentiment": "Pos"}]';

SELECT *
FROM opinion
WHERE json_field @> '[{"tk": "ali","sentiment":"Pos"}]';

-- SELECT *
-- FROM my_table
-- WHERE my_array @> '[{"name": "John"}]';