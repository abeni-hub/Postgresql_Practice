
--WHERE Clause:
     --1) AND/OR
     --2) BETWEEN
     --3) IN
     --4) LIKE __ Text Pattern
	 --5) IS NUll/ NOT NULL

--LIKE operator wildcard(JOKER) characters
  -- 1) % = 0 or more any character
  -- 2) _ = any 1 character
select * 
from customer
where first_name LIKE 'A%';


-- Return customers who first name has exactly 6 characters and starts 
-- with A and end with a

select * 
from customer
where first_name LIKE 'A____a';


-- Return Countries whose name start with the letter B or ends with the letter a

select * 
from country
where country like 'B%' or country like '%a';


-- The movies which is not return 
select * 
from rental
where return_date IS NULL;