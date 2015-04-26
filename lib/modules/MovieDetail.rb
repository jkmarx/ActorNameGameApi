module MovieDetail
  require 'net/http'


  def self.findTitleMatches(title)
   results = Imdb::Search.new(title).movies
   removeTvSeries(results)
  end

  def self.removeTvSeries(data)
    data.reject { |movie| movie.title.index('TV Series') }
  end

  def self.getMovieCast(title)
    findTitleMatches(title).first.cast_members
  end

  def self.getMovieCastIds(title)
    findTitleMatches(title).first.cast_member_ids
  end

  def self.requestPerson(imdb_id)
    url = URI.parse('http://api.themoviedb.org')
    http = Net::HTTP.new(url.host, 443)
    http.use_ssl = true
    response = http.get('http://api.themoviedb.org/3/find/' + imdb_id + "?external_source=imdb_id&api_key=" + ENV['TMDB_KEY'])
  end

end
