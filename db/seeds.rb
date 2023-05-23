require 'open-uri'

url = 'https://tmdb.lewagon.com/movie/top_rated'
results_serialized = URI.open(url).read
results = JSON.parse(results_serialized)['results']

results.each do |result|
  Movie.create(
    title: result['title'],
    overview: result['overview'],
    poster_url: "https://image.tmdb.org/t/p/w500/#{result['poster_path']}",
    rating: result['vote_average']
  )
end
