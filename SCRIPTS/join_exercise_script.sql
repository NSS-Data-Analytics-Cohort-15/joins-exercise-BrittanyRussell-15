--1.Give the name, release year, and worldwide gross of the lowest grossing movie.

-- SELECT *
-- FROM specs
-- LEFT JOIN revenue
-- ON specs.movie_id = revenue.movie_id
-- ORDER BY worldwide_gross;

-- ANSWER: SEMI-TOUGH, 1977, 37187139

-- 2. What year has the highest average imdb rating?

-- SELECT release_year, AVG(imdb_rating) AS avg_imdb_rating
-- FROM specs
-- LEFT JOIN rating
-- ON specs.movie_id = rating.movie_id
-- GROUP BY release_year, imdb_rating
-- ORDER BY imdb_rating DESC;
-- ANSWER:2008, 9.0

-- SELECT release_year, film_title, AVG(imdb_rating) AS avg_imdb_rating
-- FROM specs
-- LEFT JOIN rating
-- ON specs.movie_id = rating.movie_id
-- GROUP BY release_year, specs.film_title, imdb_rating
-- ORDER BY imdb_rating DESC;


--3.What is the highest grossing G-rated movie? Which company distributed it?

-- SELECT release_year, film_title, worldwide_gross, mpaa_rating
-- FROM specs
-- LEFT JOIN revenue
-- ON specs.movie_id = revenue.movie_id
-- WHERE mpaa_rating = 'G' 
-- ORDER BY worldwide_gross DESC;

-- SELECT release_year, film_title, worldwide_gross, mpaa_rating, company_name
-- FROM specs
-- LEFT JOIN revenue
-- ON specs.movie_id = revenue.movie_id
-- LEFT JOIN distributors
-- ON specs.domestic_distributor_id = distributors.distributor_id
-- WHERE mpaa_rating = 'G' 
-- ORDER BY worldwide_gross DESC
-- LIMIT 1;

--ANSWER: TOY STORY 2019  --ANSWER: Walt Disney

-- 4.Write a query that returns, for each distributor in the distributors table, the distributor name and the number of movies associated with that distributor in the movies table. Your result set should include all of the distributors, whether or not they have any movies in the movies table.

-- SELECT company_name, COUNT(film_title) AS movie_count
-- FROM distributors
-- LEFT JOIN specs
-- ON specs.domestic_distributor_id = distributors.distributor_id
-- GROUP BY distributors.company_name
-- ORDER BY movie_count DESC;

--5.Write a query that returns the five distributors with the highest average movie budget.

-- SELECT company_name, AVG(revenue.film_budget) AS avg_movie_budget
-- FROM distributors
-- LEFT JOIN specs
-- ON specs.domestic_distributor_id = distributors.distributor_id
-- LEFT JOIN revenue
-- ON specs.movie_id = revenue.movie_id
-- WHERE revenue.film_budget IS NOT NULL
-- GROUP BY distributors.company_name
-- ORDER BY avg_movie_budget DESC
-- LIMIT 5;

--6.How many movies in the dataset are distributed by a company which is not headquartered in California? Which of these movies has the highest imdb rating?

-- SELECT headquarters, imdb_rating, film_title
-- FROM distributors
-- LEFT JOIN specs
-- ON specs.domestic_distributor_id = distributors.distributor_id
-- LEFT JOIN rating
-- ON specs.movie_id = rating.movie_id
-- WHERE headquarters NOT LIKE '%, CA'
-- ORDER BY imdb_rating DESC;

-- SELECT *
-- FROM distributors
-- WHERE headquarters NOT LIKE '%, CA';

-- SELECT *
-- FROM rating;

-- SELECT * 
-- FROM specs;

--7.Which have a higher average rating, movies which are over two hours long or movies which are under two hours?

-- FROM KRITHIKA
-- SELECT 'movies < 2 hours' AS movie_time, AVG(imdb_rating)
-- FROM specs
-- JOIN rating
-- 	USING(movie_id)
-- WHERE  length_in_min <120
-- UNION
-- SELECT 'movies > 2 hours' AS movie_time ,AVG(imdb_rating)
-- FROM specs
-- JOIN rating
-- 	USING(movie_id)
-- WHERE  length_in_min >120
-- GROUP BY film_title;

-- FROM JENNIFER

-- SELECT
--     CASE
--         WHEN specs.length_in_min > 120 THEN 'Over 2 Hours'
--         WHEN specs.length_in_min <= 120 THEN '2 Hours or Less' -- This includes movies exactly 120 mins. 
--     END AS film_length_category, -- This creates a new column called film_length_category that assigns each movie to one of your desired categories based on its length 
--     AVG(rating.imdb_rating) AS average_rating
-- FROM
--     specs
-- JOIN
--     rating ON specs.movie_id = rating.movie_id
-- GROUP BY
--     film_length_category -- Grouping all movies belonging to 'Over 2 Hours' into one group and '2 Hours or Less' into another, allowing AVG() to calculate the average for each category.
-- ORDER BY 1 DESC;

-- FROM specs
-- LEFT JOIN ratings

-- SELECT *
-- FROM ratings

-- SELECT * 
-- FROM specs