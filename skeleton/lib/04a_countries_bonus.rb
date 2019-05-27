# == Schema Information
#
# Table name: countries
#
#  name        :string       not null, primary key
#  continent   :string
#  area        :integer
#  population  :integer
#  gdp         :integer

require_relative './sqlzoo.rb'

# BONUS QUESTIONS: These problems require knowledge of aggregate
# functions. Attempt them after completing section 05.

def highest_gdp
  # Which countries have a GDP greater than every country in Europe? (Give the
  # name only. Some countries may have NULL gdp values)
  execute(<<-SQL)
    SELECT
      name
    FROM
      countries
    WHERE GDP > (SELECT MAX(gdp) FROM countries WHERE continent = 'Europe')
  SQL
end

def largest_in_continent
  # Find the largest country (by area) in each continent. Show the continent,
  # name, and area.
  execute(<<-SQL)
    SELECT
      max_by_area.continent, countries.name, max_by_area.max as area
    FROM
      countries
    JOIN 
      ( SELECT continent, MAX(area) as max
      FROM countries
      GROUP BY continent
      ) max_by_area
    ON max_by_area.max = countries.area

  SQL

    # SELECT DISTINCT
    # continent, name, area
    # FROM countries
    # ORDER BY area DESC
    # LIMIT 8
end

def large_neighbors
  # Some countries have populations more than three times that of any of their
  # neighbors (in the same continent). Give the countries and continents.
  execute(<<-SQL)
    SELECT 
      name, continent
    FROM 
      countries
    

    # SELECT name, continent, population from countries
    # ORDER BY population DESC
    # LIMIT 7

  SQL
end
