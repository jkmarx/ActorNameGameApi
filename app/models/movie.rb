class Movie
  include ActiveModel::Model

  def self.getPersonsData(arrId)
    arrId.map{ |personId| JSON.parse(MovieDetail::requestPerson(personId).body)["person_results"][0] }
  end

  def self.parseNameImage(data)
    data.map{ |person| {name: person["name"], image: "https://image.tmdb.org/t/p/w185" + person["profile_path"]} }
  end

  def self.getFiveCastImage(movieId)
    castIds = MovieDetail::getMovieCastIds(movieId)
    personsDetails = getPersonsData(castIds[0..4])
    parseNameImage(personsDetails)
  end
end
