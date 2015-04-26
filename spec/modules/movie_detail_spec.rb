require 'rails_helper'
require 'spec_helper'
require 'net/http'
require 'uri'
require File.join(Rails.root, "lib/modules/MovieDetail.rb")

describe MovieDetail do
  let(:title) {'Eternal Sunshine of the Spotless Mind'}

  describe 'MovieDetail::findTitleMatches' do
    it 'returns an array of movie object' do
      expect(MovieDetail::findTitleMatches(title).size).to eq 1
    end
  end

  describe 'MovieDetail::getMovieCastIds' do
    it 'returns first movie object in search array' do
      expect(MovieDetail::getMovieCastIds("0338013")).to include "nm0000120"
    end
  end

  describe 'MovieDetail::requestPerson' do
    it 'returns a persons details' do
      expect(MovieDetail::requestPerson("nm0000120").body).to include "Eternal Sunshine of the Spotless Mind"
    end
  end

end
