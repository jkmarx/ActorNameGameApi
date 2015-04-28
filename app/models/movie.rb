class Movie
  include ActiveModel::Model

  def self.getPersonsData(arrId)
    JSON.parse(MovieDetail::requestPerson(arrId).body)["person_results"][0]
  end

  def self.parseNameImage(data)
    data.map{ |person| {name: person["name"], image: "https://image.tmdb.org/t/p/w185" + person["profile_path"]} }
  end

  def self.addValidCast(castIds)
    validCast = []
    ind = 0
    while validCast.length < 5 && ind < castIds.length
      tempActor = getPersonsData(castIds[ind])
      if tempActor && tempActor["name"] && tempActor["profile_path"]
        validCast << tempActor
      end
      ind = ind + 1
    end
    validCast
  end

  def self.getFiveCastImage(movieId)
    castIds = MovieDetail::getMovieCastIds(movieId)
    personsDetails = addValidCast(castIds)
    parseNameImage(personsDetails)
  end

end
