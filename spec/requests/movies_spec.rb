require 'rails_helper'

describe 'Movie Requests' do

  describe '#movie' do
    it 'gets an array of all movie matches' do
      post '/movies',
      { movie: {
        title: "The Lion King"
        }
      }
      expect(response).to be_success
      json = JSON.parse(response.body)
      expect(json.length).to eq 7
      expect(json).to eq [{"id"=>"0110357", "url"=>"http://akas.imdb.com/title/tt0110357/combined", "title"=>"The Lion King (1994)"}, {"id"=>"2102471", "url"=>"http://akas.imdb.com/title/tt2102471/combined", "title"=>"White Lions: King of Kings (2005)"}, {"id"=>"3698172", "url"=>"http://akas.imdb.com/title/tt3698172/combined", "title"=>"The Making of the Lion (2013)"}, {"id"=>"0120733", "url"=>"http://akas.imdb.com/title/tt0120733/combined", "title"=>"Lion of Oz (2000)"}, {"id"=>"0047150", "url"=>"http://akas.imdb.com/title/tt0047150/combined", "title"=>"King Richard and the Crusaders (1954)"}, {"id"=>"0024219", "url"=>"http://akas.imdb.com/title/tt0024219/combined", "title"=>"King of the Jungle (1933)"}, {"id"=>"0187967", "url"=>"http://akas.imdb.com/title/tt0187967/combined", "title"=>"Huang Fei Hong shi wang zheng ba (1957)"}]
    end
  end

  describe '#castImages' do
    it 'gets a movie first five cast and images' do
      post '/movies/cast',
      { movie: {
        id: "0110357"
        }
      }
      expect(response).to be_success
      json = JSON.parse(response.body)
      expect(json.length).to eq 5

      expect(json).to eq [{"name"=>"Jonathan Taylor Thomas","image"=>"https://image.tmdb.org/t/p/w185/nYffgAfxzGaGrjizl8MaZuJojCZ.jpg"},{"name"=>"Matthew Broderick","image"=>"https://image.tmdb.org/t/p/w185/j9ETatVKFxYR5Ijk8l5tzKO4HPn.jpg"},{"name"=>"James Earl Jones","image"=>"https://image.tmdb.org/t/p/w185/pxC7jiRTHArPldgkqSneXRsrRJ9.jpg"},{"name"=>"Jeremy Irons", "image"=>"https://image.tmdb.org/t/p/w185/9AWphjIgGX7JjTrwrx3tsTZlUgv.jpg"},{"name"=>"Moira Kelly", "image"=>"https://image.tmdb.org/t/p/w185/4cDCNxqYgJ0ueUqIpM4lUBnBb5f.jpg"}]
    end
  end
end
