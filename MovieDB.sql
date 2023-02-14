								-- MOVIE Data Base--

-- 1.Write a SQL query to find the actors who were cast in the movie 'Annie Hall'.
-- Return actor first name, last name and role.
 select * from actors,movie_cast,movie;

 select a.act_id actor_id,a.act_fname first_name, a.act_lname last_name, mc.role,m.mov_title 
 from actors a 
 join movie_cast mc on a.act_id = mc.act_id
 join movie m on mc.mov_id=m.mov_id
 where mov_title='Annie Hall';

 
 -- 2.From the following tables, write a SQL query to find the director who directed a movie that casted a
 -- role for 'Eyes Wide Shut'.Return director first name, last name and movie title.
 select * from director,movie_direction,movie_cast,movie;
 
 select d.dir_id ,d.dir_fname first_name,d.dir_lname last_name,mc.role,m.mov_title movie_title
 from director d 
 join movie_direction md on d.dir_id=md.dir_id
 join movie_cast mc on md.mov_id=mc.mov_id
 join movie m on mc.mov_id=m.mov_id
 where mov_title='Eyes Wide Shut';
 
 
 -- 3.Write a SQL query to find who directed a movie that casted a role as ‘Sean Maguire’. 
 -- Return director first name, last name and movie title.
 select * from director,movie_direction,movie_cast,movie;
 
 select d.dir_id,dir_fname first_name,d.dir_lname last_name,mc.role,m.mov_title
 from director d 
 join movie_direction md on d.dir_id=md.dir_id
 join movie_cast mc on md.mov_id=mc.mov_id 
 join movie m on mc.mov_id=m.mov_id
 where role ='Sean Maguire';
 
 -- 4.Write a SQL query to find the actors who have not acted in any movie between 1990 and 2000
 -- Begin and end values are included.).Return actor first name, last name,movie title and release year. 
select * from actors,movie_cast,movie;

 select a.act_id,a.act_fname first_name,a.act_lname last_name,m.mov_year release_year
 from actors a 
 join movie_cast mc on a.act_id=mc.act_id
 join movie m on mc.mov_id=m.mov_id
 where m.mov_year not between 1990 and 2000;
 
 -- 5.Write a SQL query to find the directors with the number of genres of movies. 
 -- Group the result set on director first name, last name and generic title. 
 -- Sort the result-set in ascending order by director first name and last name.
 -- Return director first name, last name and number of genres of movies.
 select * from director,movie_direction,movie_genres,genres;
 
 select d.dir_id,dir_fname first_name,dir_lname last_name,g.gen_title,count(*) No_of_genres_movies
 from director d 
 join movie_direction md on d.dir_id=md.dir_id
 join movie_genres mg on md.mov_id=mg.mov_id
 join genres g on mg.gen_id=g.gen_id
 group by dir_fname,dir_lname,gen_title
 order by dir_fname,dir_lname;
  
 