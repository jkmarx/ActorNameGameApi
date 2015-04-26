require Rails.root.join('lib/modules/MovieDetail')
class MoviesController < ApplicationController

  def search
    results = MovieDetail::findTitleMatches(params["movie"]["title"]).to_json
    render json: results, status: 200
  end

  def castImages
    castImages = Movie.getFiveCastImage(params["movie"]["id"]).to_json

    render json: castImages, status: 200
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :id, :castImages)
  end

end
