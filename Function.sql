-- EXplore data with select state all statement
SELECT *
FROM payment
WHERE customer_id = 341;

-- Stored procedure exmaple
-- simulating late fee charge
CREATE OR REPLACE PROCEDURE latefee(
	customer INTEGER,
	lateFeeAmount DECIMAL
)
LANGUAGE plpgsql
AS $$
BEGIN 
	-- add late fee to customer payment amount
	UPDATE payment
	SET amount = amount + lateFeeAmount
	WHERE customer_id = customer;
	
	-- Commit the above statement inside the transaction
	COMMIT;
END;
$$

-- caling the stored procedur

CALL latefee(341, 0.99);

-- DRop or delete newly create stored procedure
DROP PROCEDURE latefee;

select * from actor DEFAULT ORDER BY actor_id;



-- Stored procedure exmaple
-- simulating late fee charge
CREATE OR REPLACE PROCEDURE addprefix(
	actor_num INTEGER,
	prefix  VARCHAR(5)
)
LANGUAGE plpgsql
AS $$
BEGIN 
	-- add late fee to customer payment amount
	UPDATE actor
	SET first_name = CONCAT (prefix , first_name )
	WHERE actor_id = actor_num;
	
	-- Commit the above statement inside the transaction
	COMMIT;
END;
$$

CALL addprefix (1, 'Mr ');

-- stored functions example
-- stored function to insert data into actor table
CREATE OR REPLACE FUNCTION add_actor(
	_actor_id INTEGER,
	_first_name VARCHAR,
	_last_name VARCHAR,
	_last_update TIMESTAMP WITHOUT TIME ZONE
)
RETURNS void
AS $MAIN$
BEGIN
	INSERT INTO actor(
		actor_id,
		first_name,
		last_name,
		last_update
	)
	VALUES(
		_actor_id,
		_first_name,
		_last_name,
		_last_update
	);
END;
$MAIN$
LANGUAGE plpgsql;

-- BAD call of fuction
-- CALL add_actor(500, 'benji kaay', 'kad', CURRENT_TIMESTAMP)

-- GOOD call of function
SELECT add_actor(500, 'benji kaay', 'kad', NOW()::timestamp);
select * from actor where actor_id = 500;

-- another exmaple
--HEDEAR
CREATE OR REPLACE FUNCTION get_film_count(
	length_from INTEGER,
	length_to INTEGER
)
RETURNS INTEGER
LANGUAGE plpgsql
AS $$
-- DECLARATION section
DECLARE
	film_count INTEGER;
BEGIN
--BODY section
	SELECT COUNT(*)
	INTO film_count
	FROM film
	WHERE length BETWEEN length_from AND length_to;
	
	RETURN film_count;
END;
$$;

DROP FUNCTION get_film_count;
SELECT  get_film_count(50,90);

-- function practice
CREATE OR REPLACE FUNCTION get_cast(
	_film_id INTEGER
	
)
RETURNS TABLE(actor_id INTEGER)
LANGUAGE plpgsql
AS $$
-- DECLARATION section
DECLARE
	actor_count INTEGER;
BEGIN
--BODY section
	SELECT *
	INTO actor_count
	FROM film_actor
	WHERE  film_id = _film_id;
	
	RETURN actor_count;
END;
$$;
select * from film_actor where film_id = 23;
SELECT get_cast(23);