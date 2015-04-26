require Rails.root.join('lib/modules/MovieDetail')
class MoviesController < ApplicationController

  def castImages
    castImages = Movie.getFiveCastImage(params[:title]).to_json

    render json: castImages, status: 200
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :castImages)
  end

end
