require 'rails_helper'

describe 'Movie Requests' do

  describe '#castImages' do
    it 'gets a movie first five cast and images' do
      post '/movies',
      { movie: {
        name: "The Lion King"
        }
      }.to_json
      expect(response).to be_success
      json = JSON.parse(response.body)
      expect(json.length).to eq 5

      expect(json).to eq [{"name"=>"Jonathan Taylor Thomas","image"=>"https://image.tmdb.org/t/p/w185/nYffgAfxzGaGrjizl8MaZuJojCZ.jpg"},{"name"=>"Matthew Broderick","image"=>"https://image.tmdb.org/t/p/w185/j9ETatVKFxYR5Ijk8l5tzKO4HPn.jpg"},{"name"=>"James Earl Jones","image"=>"https://image.tmdb.org/t/p/w185/pxC7jiRTHArPldgkqSneXRsrRJ9.jpg"},{"name"=>"Jeremy Irons", "image"=>"https://image.tmdb.org/t/p/w185/9AWphjIgGX7JjTrwrx3tsTZlUgv.jpg"},{"name"=>"Moira Kelly", "image"=>"https://image.tmdb.org/t/p/w185/4cDCNxqYgJ0ueUqIpM4lUBnBb5f.jpg"}]
    end
  end
end
