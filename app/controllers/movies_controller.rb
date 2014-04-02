class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)

    # @movie = Movie.new(
    #   title: params[:movie][:title],
    #   director: params[:movie][:director],
    #   runtime_in_minutes: params[:movie][:runtime_in_minutes],
    #   description: params[:movie][:description],
    #   poster_image_url: params[:movie][:release_date]
    #   )

    # @movie = Movie.new(
    #   title: params[:title],
    #   director: params[:director],
    #   runtime_in_minutes: params[:runtime_in_minutes],
    #   description: params[:description],
    #   poster_image_url: params[:release_date]
    #   )
    if @movie.save
      redirect_to movies_path
    else
      render :new
    end

  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])

    if @movie.update_attributes(movie_params)
      redirect_to movies_path
    else
      render :edit
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path
  end


  protected

    def movie_params
      params.require(:movie).permit(
        :title, :release_date, :director, :runtime_in_minutes, :poster_image_url, :description
        )
    end


end
