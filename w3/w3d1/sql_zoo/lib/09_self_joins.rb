# == Schema Information
#
# Table name: stops
#
#  id          :integer      not null, primary key
#  name        :string
#
# Table name: routes
#
#  num         :string       not null, primary key
#  company     :string       not null, primary key
#  pos         :integer      not null, primary key
#  stop_id     :integer

require_relative './sqlzoo.rb'

def num_stops
  # How many stops are in the database?
  execute(<<-SQL)
    select count(*)
    from stops
  SQL
end

def craiglockhart_id
  # Find the id value for the stop 'Craiglockhart'.
  execute(<<-SQL)
    select id from stops where name = 'Craiglockhart'
  SQL
end

def lrt_stops
  # Give the id and the name for the stops on the '4' 'LRT' service.
  execute(<<-SQL)
    select s.id, s.name
    from routes r
    join stops s on r.stop_id = s.id
    where r.num = '4' and r.company = 'LRT'
  SQL
end

def connecting_routes
  # Consider the following query:
  #
  # SELECT
  #   company,
  #   num,
  #   COUNT(*)
  # FROM
  #   routes
  # WHERE
  #   stop_id = 149 OR stop_id = 53
  # GROUP BY
  #   company, num
  #
  # The query gives the number of routes that visit either London Road
  # (149) or Craiglockhart (53). Run the query and notice the two services
  # that link these stops have a count of 2. Add a HAVING clause to restrict
  # the output to these two routes.
  execute(<<-SQL)
    SELECT
      company,
      num,
      COUNT(*)
    FROM
      routes
    WHERE
      stop_id = 149 OR stop_id = 53
    GROUP BY
      company, num
    HAVING count(*) > 1
  SQL
end

def cl_to_lr
  # Consider the query:
  #
  # SELECT
  #   a.company,
  #   a.num,
  #   a.stop_id,
  #   b.stop_id
  # FROM
  #   routes a
  # JOIN
  #   routes b ON (a.company = b.company AND a.num = b.num)
  # WHERE
  #   a.stop_id = 53
  #
  # Observe that b.stop_id gives all the places you can get to from
  # Craiglockhart, without changing routes. Change the query so that it
  # shows the services from Craiglockhart to London Road.
  execute(<<-SQL)
    SELECT
      a.company,
      a.num,
      a.stop_id,
      b.stop_id
    FROM
      routes a
    JOIN
      routes b ON (a.company = b.company AND a.num = b.num)
    WHERE
      a.stop_id = 53 and b.stop_id = 149
  SQL
end

def cl_to_lr_by_name
  # Consider the query:
  #
  # SELECT
  #   a.company,
  #   a.num,
  #   stopa.name,
  #   stopb.name
  # FROM
  #   routes a
  # JOIN
  #   routes b ON (a.company = b.company AND a.num = b.num)
  # JOIN
  #   stops stopa ON (a.stop_id = stopa.id)
  # JOIN
  #   stops stopb ON (b.stop_id = stopb.id)
  # WHERE
  #   stopa.name = 'Craiglockhart'
  #
  # The query shown is similar to the previous one, however by joining two
  # copies of the stops table we can refer to stops by name rather than by
  # number. Change the query so that the services between 'Craiglockhart' and
  # 'London Road' are shown.
  execute(<<-SQL)
    SELECT
      ra.company,
      ra.num,
      sa.name,
      sb.name
    FROM
      routes ra
    JOIN
      routes rb ON (ra.company = rb.company AND ra.num = rb.num)
    JOIN
      stops sa ON (ra.stop_id = sa.id)
    JOIN
      stops sb ON (rb.stop_id = sb.id)
    WHERE
      sa.name = 'Craiglockhart' and sb.name = 'London Road'
  SQL
end

def haymarket_and_leith
  # Give the company and num of the services that connect stops
  # 115 and 137 ('Haymarket' and 'Leith')
  execute(<<-SQL)
    SELECT
      distinct ra.company,
      ra.num
    FROM
      routes ra
    JOIN
      routes rb ON (ra.company = rb.company AND ra.num = rb.num)
    JOIN
      stops sa ON (ra.stop_id = sa.id)
    JOIN
      stops sb ON (rb.stop_id = sb.id)
    WHERE
      sa.name = 'Haymarket' and sb.name = 'Leith'
  SQL
end

def craiglockhart_and_tollcross
  # Give the company and num of the services that connect stops
  # 'Craiglockhart' and 'Tollcross'
  execute(<<-SQL)
    SELECT
      distinct ra.company,
      ra.num
    FROM
      routes ra
    JOIN
      routes rb ON (ra.company = rb.company AND ra.num = rb.num)
    JOIN
      stops sa ON (ra.stop_id = sa.id)
    JOIN
      stops sb ON (rb.stop_id = sb.id)
    WHERE
      sa.name = 'Craiglockhart' and sb.name = 'Tollcross'
  SQL
end

def start_at_craiglockhart
  # Give a distinct list of the stops that can be reached from 'Craiglockhart'
  # by taking one bus, including 'Craiglockhart' itself. Include the stop name,
  # as well as the company and bus no. of the relevant service.
  execute(<<-SQL)
    SELECT
      sb.name sbname,
      ra.company rac,
      ra.num ran
    FROM
      routes ra
    JOIN
      routes rb ON (ra.company = rb.company AND ra.num = rb.num)
    JOIN
      stops sa ON (ra.stop_id = sa.id)
    JOIN
      stops sb ON (rb.stop_id = sb.id)
    WHERE
      sa.name = 'Craiglockhart'
  SQL
end

def craiglockhart_to_sighthill
  # Find the routes involving two buses that can go from Craiglockhart to
  # Sighthill. Show the bus no. and company for the first bus, the name of the
  # stop for the transfer, and the bus no. and company for the second bus.
  execute(<<-SQL)
    SELECT distinct
    left_midpoints.first_num fnum,
    left_midpoints.first_comp fcompany,
    stops.name transfer,
    right_midpoints.last_num  lnum,
    right_midpoints.last_comp lcompany
    FROM (
      SELECT
      first_comp,
      first_num,
      stop_id midpoint
      FROM (
        SELECT
          first_route.company first_comp,
          first_route.num first_num
        FROM
          stops first_stop
        JOIN
          routes first_route on first_stop.id = first_route.stop_id
        WHERE first_stop.name = 'Craiglockhart'
          ) AS first_lines
      JOIN routes middle_route
        ON first_lines.first_comp = middle_route.company
        AND first_lines.first_num = middle_route.num
      ORDER BY first_num
    ) AS left_midpoints
    JOIN (
      SELECT
      last_comp,
      last_num,
      stop_id midpoint
      FROM (
        SELECT
          last_route.company last_comp,
          last_route.num last_num
        FROM
          stops last_stop
        JOIN
          routes last_route on last_stop.id = last_route.stop_id
        WHERE last_stop.name = 'Sighthill'
      ) AS last_lines
      JOIN routes middle_route
        ON last_lines.last_comp = middle_route.company
        AND last_lines.last_num = middle_route.num
      ORDER BY last_num
    ) AS right_midpoints
      ON left_midpoints.midpoint = right_midpoints.midpoint
      JOIN stops ON left_midpoints.midpoint = stops.id
  SQL
end
