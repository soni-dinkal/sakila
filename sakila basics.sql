# select
# from - eg, sakila.film
# where- conditional extraction : (arthimatic operation <, >, =, != )
# like - escape, %, _
# between or , and
# as, or
# in - not-in 
# is - is-not (null)
# order by 
#insert into
#aggregate - average(_), sum(), min(), max(), count(),  ...
# group by


SELECT * FROM sakila.film_category;

select title, rating 
from film 
where rating = "G";

select title, rating 
from film 
where rating = "G" or  rating = "R";

select title, rating , length
from film 
where rating = "R" and length > 120;

select * 
from film 
where title like "hal%";


select * 
from film 
where title like "w%y";


select * 
from film 
where title like "__L%";


select * 
from film 
where title like "hal%";


select * 
from film 
where title like "c%r";


select * 
from film 
where title like "c%rr_";


select *
from filmactor
where  rating like "_";

insert into actor (first_name, last_name) values ("bhagi_rath", "pan%choli");
insert into actor (first_name, last_name) values ("bhagi_rath_", "pancholi");

select * from actor;

select *
from actor
where last_name like "%o%";

select *
from actor
where last_name like "%oo%";

select *
from actor
where last_name like "%/%%" escape "/";

select *
from actor
where last_name like "%_" escape "/";

select *
from actor
where first_name like "%!_%!_%" escape "!";


select *
from actor
where first_name like "%!_%!_%" escape "!";

select *
from actor 
limit 5;

select *
from city
order by country_id;

select *
from city
order by country_id desc 
limit 10;

select *
from film
where length between 100 and 200;

select *
from film
where rating in("G", "R", "PG-13");

select *
from film
where rating not in("G", "R", "PG-13");

insert into  actor (first_name) values ("tirth");

select * 
from address
where address2 is null;

select *
from film
where rating in("G", "R", "PG-13");

select * 
from address
where address2 is not null;

#aggregte function 
select avg(length) from  film;
select sum(length) from film;
select avg(length) from film;
#non null count of lenth values 
select count(length );

select count (address2)
from address;

select count(*)
from address;

select min(length) from film;

select max(length) from film;

# movies having length >avg length 

select *
from film
where length > (select avg(length)from film);

describe actor;

# group by
# groups uper condition lagavani thy so ani ek speific condition - "having"

# rating wise avg length
select rating, avg(length), count(rating)
from film
group by rating;

select replacement_cost, avg(length), count(replacement_cost)
from film
group by replacement_cost;

select address, count(length)
from film
group by address;

SELECT city, COUNT(DISTINCT location_id) as address_count
FROM locations
GROUP BY city;

select city_id, count(address_id) as cid
from address
group by city_id
having cid > 1;

select country_id, count(city) 
from city
group by country_id
having count(city) > 20;

# category wise movie counts
select category_id, count(film_id) as abc
from film_category
group by category_id
having abc > 50;

select rating, avg(length)
from film
where length > 100
group by rating, avg(length)
having avg(length) > 140 
order by avg(length) desc
limit 2;

select *
from film;

select category.name, count(film_id)
from film_category join category
on film_category.category_id = category.category_id
group by category.name;


select film_category, category_id, category.name
from film_category join category on film_id, film_list avg(length) group by category.name;

#category wise avg length
select category.name, avg(film.length)
from film join film_category
on film.film_id = film_category.film_id
    join category on film_category.category_id = category.category_id 
group by category.name;

# address= contry name
select country_id, address_id
from address
join city
on address.city_id = city.city_id
join country on city.country_id;

# which actor has done, how many movies
select actor.first_name, actor.last_name, count(film_id)
from film_actor
join actor on film_actor.actor_id = actor.actor_id
group by film_actor.actor_id
having count(*) > 20 and actor.first_name like "N%";