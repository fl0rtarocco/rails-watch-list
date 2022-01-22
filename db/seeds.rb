require 'json'
require 'open-uri'

puts 'Cleaning database...'
Movie.destroy_all

url = 'https://api.themoviedb.org/3/movie/top_rated?api_key=fcb92e16769ba67d5a7fed51cdda7e42&language=en-US&page=1'
list_serialized = URI.open(url).read
list = JSON.parse(list_serialized)

movies = list['results']

puts 'creating movies..'
movies.each do |movie|
  movie_details = {
    title: movie['original_title'],
    overview: movie['overview'],
    poster_url: "https://image.tmdb.org/t/p/w500#{movie['poster_path']}",
    rating: movie['vote_average'].to_f
  }
  new_movie = Movie.create!(movie_details)
  puts "created #{new_movie.title}"
end

puts "finished creating #{Movie.count} movies"
