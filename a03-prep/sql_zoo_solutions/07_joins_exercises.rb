# == Schema Information
#
# Table name: actors
#
#  id          :integer      not null, primary key
#  name        :string
#
# Table name: movies
#
#  id          :integer      not null, primary key
#  title       :string
#  yr          :integer
#  score       :float
#  votes       :integer
#  director_id :integer
#
# Table name: castings
#
#  movie_id    :integer      not null, primary key
#  actor_id    :integer      not null, primary key
#  ord         :integer

require_relative './sqlzoo.rb'

def example_join
  execute(<<-SQL)
    SELECT
      *
    FROM
      movies
    JOIN
      castings ON movies.id = castings.movie_id
    JOIN
      actors ON castings.actor_id = actors.id
    WHERE
      actors.name = 'Sean Connery'
  SQL
end

def ford_films
  # List the films in which 'Harrison Ford' has appeared.
  execute(<<-SQL)
    select m.title
    from actors a
    join castings c on c.actor_id = a.id
    join movies m on c.movie_id = m.id
    where a.name = 'Harrison Ford'
  SQL
end

def ford_supporting_films
  # List the films where 'Harrison Ford' has appeared - but not in the star
  # role. [Note: the ord field of casting gives the position of the actor. If
  # ord=1 then this actor is in the starring role]
  execute(<<-SQL)
    select m.title
    from actors a
    join castings c on c.actor_id = a.id
    join movies m on c.movie_id = m.id
    where a.name = 'Harrison Ford' and c.ord != 1
  SQL
end

def films_and_stars_from_sixty_two
  # List the title and leading star of every 1962 film.
  execute(<<-SQL)
    select m.title, a.name
    from actors a
    join castings c on c.actor_id = a.id
    join movies m on c.movie_id = m.id
    where m.yr = 1962 and c.ord = 1
  SQL
end

def travoltas_busiest_years
  # Which were the busiest years for 'John Travolta'? Show the year and the
  # number of movies he made for any year in which he made at least 2 movies.
  execute(<<-SQL)
    select m.yr, count(*) movies
    from actors a
    join castings c on c.actor_id = a.id
    join movies m on c.movie_id = m.id
    where a.name = 'John Travolta'
    group by m.yr
    having count(*) >= 2
  SQL
end

def andrews_films_and_leads
  # List the film title and the leading actor for all of the films 'Julie
  # Andrews' played in.
  execute(<<-SQL)
    select m.title, a.name
    from actors a
    join castings c on c.actor_id = a.id
    join movies m on c.movie_id = m.id
    where m.title in (
      select m2.title
      from actors a2
      join castings c2 on c2.actor_id = a2.id
      join movies m2 on c2.movie_id = m2.id
      where a2.name = 'Julie Andrews'
    ) and c.ord = 1
  SQL
end

def prolific_actors
  # Obtain a list in alphabetical order of actors who've had at least 15
  # starring roles.
  execute(<<-SQL)
    select a.name
    from actors a
    join castings c on c.actor_id = a.id
    join movies m on c.movie_id = m.id
    where c.ord = 1
    group by a.name
    having count(*) >= 15
    order by a.name
  SQL
end

def films_by_cast_size
  # List the films released in the year 1978 ordered by the number of actors
  # in the cast (descending), then by title (ascending).
  execute(<<-SQL)
    select m.title, count(*) aactors
    from actors a
    join castings c on c.actor_id = a.id
    join movies m on c.movie_id = m.id
    where m.yr = 1978
    group by m.title
    order by aactors desc, m.title
  SQL
end

def colleagues_of_garfunkel
  # List all the people who have played alongside 'Art Garfunkel'.
  execute(<<-SQL)
    select a2.name
    from (
      select c.*
      from actors a
      join castings c on c.actor_id = a.id
      where a.name = 'Art Garfunkel'
      ) as c1
    join castings c2 on c1.movie_id = c2.movie_id
    join actors a2 on c2.actor_id = a2.id
    where a2.name != 'Art Garfunkel'
  SQL
end
