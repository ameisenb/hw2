# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!
# - Note rubric explanation for appropriate use of external resources.

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)
# - You are welcome to use external resources for help with the assignment (including
#   colleagues, AI, internet search, etc). However, the solution you submit must
#   utilize the skills and strategies covered in class. Alternate solutions which
#   do not demonstrate an understanding of the approaches used in class will receive
#   significant deductions. Any concern should be raised with faculty prior to the due date.

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
Studio.destroy_all
Movie.destroy_all
Actor.destroy_all
Role.destroy_all
# TODO!

# Generate models and tables, according to the domain model.
# TODO!
#DONE IN TERMINAL - APM

# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.
# TODO!

# add studio
new_studio = Studio.new 
new_studio.name = 'Warner Brothers'
new_studio.save

# add movies
Warner_Bros = Studio.find_by({"name" => "Warner Brothers"})

new_movie = Movie.new
new_movie.title = 'Batman Begins'
new_movie.year_released = 2005
new_movie.rated = 'PG-13'
new_movie.studio_id = Warner_Bros.id
new_movie.save

new_movie = Movie.new
new_movie.title = 'The Dark Knight'
new_movie.year_released = 2008
new_movie.rated = 'PG-13'
new_movie.studio_id = Warner_Bros.id
new_movie.save

new_movie = Movie.new
new_movie.title = 'The Dark Knight Rises'
new_movie.year_released = 2012
new_movie.rated = 'PG-13'
new_movie.studio_id = Warner_Bros.id
new_movie.save

movie_ids = {}

for movie in ["Batman Begins", "The Dark Knight", "The Dark Knight Rises"]
    found_movie = Movie.find_by({"title" => movie})
    movie_ids[movie] = found_movie.id
end

# add actors & roles for Batman Begins

actor_ids = {}

for actor in ["Christian Bale", "Michael Caine", "Liam Neeson", "Katie Holmes", "Gary Oldman"]
    new_actor = Actor.new
    new_actor.name = actor
    new_actor.save
    actor_ids[actor] = new_actor.id
end

new_role = Role.new
new_role.character_name = 'Bruce Wayne'
new_role.movie_id = movie_ids['Batman Begins']
new_role.actor_id = actor_ids['Christian Bale']
new_role.save

new_role = Role.new
new_role.character_name = 'Alfred'
new_role.movie_id = movie_ids['Batman Begins']
new_role.actor_id = actor_ids['Michael Caine']
new_role.save


new_role = Role.new
new_role.character_name = "Ra's Al Ghoul"
new_role.movie_id = movie_ids['Batman Begins']
new_role.actor_id = actor_ids['Liam Neeson']
new_role.save

new_role = Role.new
new_role.character_name = "Rachel Dawes"
new_role.movie_id = movie_ids['Batman Begins']
new_role.actor_id = actor_ids['Katie Holmes']
new_role.save

new_role = Role.new
new_role.character_name = "Commissioner Gordon"
new_role.movie_id = movie_ids['Batman Begins']
new_role.actor_id = actor_ids['Gary Oldman']
new_role.save

# add actors and roles for The Dark Knight

for actor in ["Heath Ledger", "Aaron Eckhart", "Maggie Gyllenhaal"]
    new_actor = Actor.new
    new_actor.name = actor
    new_actor.save
    actor_ids[actor] = new_actor.id
end

new_role.character_name = 'Bruce Wayne'
new_role.movie_id = movie_ids['The Dark Knight']
new_role.actor_id = actor_ids['Christian Bale']
new_role.save

new_role = Role.new
new_role.character_name = 'Joker'
new_role.movie_id = movie_ids['The Dark Knight']
new_role.actor_id = actor_ids['Heath Ledger']
new_role.save

new_role = Role.new
new_role.character_name = 'Harvey Dent'
new_role.movie_id = movie_ids['The Dark Knight']
new_role.actor_id = actor_ids['Aaron Eckhart']
new_role.save
new_role = Role.new
new_role.character_name = 'Alfred'
new_role.movie_id = movie_ids['The Dark Knight']
new_role.actor_id = actor_ids['Michael Caine']
new_role.save

new_role = Role.new
new_role.character_name = "Rachel Dawes"
new_role.movie_id = movie_ids['The Dark Knight']
new_role.actor_id = actor_ids['Maggie Gyllenhaal']
new_role.save

# add actors and roles for The Dark Knight Rises

for actor in ["Tom Hardy", "Joseph Gordon-Levitt", "Anne Hathaway"]
    new_actor = Actor.new
    new_actor.name = actor
    new_actor.save
    actor_ids[actor] = new_actor.id
end

new_role.character_name = 'Bruce Wayne'
new_role.movie_id = movie_ids['The Dark Knight Rises']
new_role.actor_id = actor_ids['Christian Bale']
new_role.save

new_role = Role.new
new_role.character_name = 'Commissioner Gordon'
new_role.movie_id = movie_ids['The Dark Knight Rises']
new_role.actor_id = actor_ids['Gary Oldman']
new_role.save

new_role = Role.new
new_role.character_name = 'Bane'
new_role.movie_id = movie_ids['The Dark Knight Rises']
new_role.actor_id = actor_ids['Tom Hardy']
new_role.save
new_role = Role.new
new_role.character_name = 'John Blake'
new_role.movie_id = movie_ids['The Dark Knight Rises']
new_role.actor_id = actor_ids['Joseph Gordon-Levitt']
new_role.save

new_role = Role.new
new_role.character_name = "Selina Kyle"
new_role.movie_id = movie_ids['The Dark Knight Rises']
new_role.actor_id = actor_ids['Anne Hathaway']
new_role.save

# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output.
# TODO!

for movie in Movie.all
    puts "#{movie.title}, #{movie.year_released}, #{movie.rated}, #{movie.studio.name}"
end

# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie.
# TODO!

