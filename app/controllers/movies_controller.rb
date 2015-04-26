require Rails.root.join('lib/modules/MovieDetail')
class MoviesController < ApplicationController

  def index
    getFiveCastImage("The Lion King")
  end

end
