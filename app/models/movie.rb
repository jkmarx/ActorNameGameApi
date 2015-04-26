class Movie
  include ActiveModel::MovieDetail

  attr_accessor :title, :cast_members, :images

  def self.requestCastIds(title)
    MovieDetail::getMovieCastIds("The Lion King")
  end

  def self.getPersonsData(arrId)
    arrId.map{ |personId| MovieDetail::requestPerson(personId).body.to_json }
  end

  def self.parseNameImage(data)
    data.map{ |person| {name: person.name, image: person.} }
  end

  def self.getFiveCastImage(title)
    castIds = requestCaseIds(title)
    personsDetails = getPersonsData(castIds[0..4])
    byebug;
    parseNameImage(personsDetails)

  end
end
