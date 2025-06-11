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

SELECT company_name, AVG(revenue.film_budget) AS avg_movie_budget
FROM distributors
LEFT JOIN specs
ON specs.domestic_distributor_id = distributors.distributor_id
LEFT JOIN revenue
ON specs.movie_id = revenue.movie_id
WHERE revenue.film_budget IS NOT NULL
GROUP BY distributors.company_name
ORDER BY avg_movie_budget DESC
LIMIT 5;

--6.How many movies in the dataset are distributed by a company which is not headquartered in California? Which of these movies has the highest imdb rating?

SELECT company_name, COUNT(film_title) AS movie_count
FROM distributors
LEFT JOIN specs
ON specs.domestic_distributor_id = distributors.distributor_id
LEFT JOIN revenue
ON specs.movie_id = revenue.movie_id
GROUP BY distributors.company_name
ORDER BY  movie_count DESC
LIMIT 5;


