class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :destroy]

  def index
    @songs = Song.all
  end

  def show
  end

  def new
    @song = Song.new
  end

  def edit
  end

  def create
    @song = Song.new(song_params)

    if !@song.save
      render :new
    else
      redirect_to song_path(@song)
    end
  end

  def update
    if !@song.update(song_params)
      render :edit
    else
      redirect_to song_path(@song)
    end
  end

  def destroy

  end

  private

  def set_song
    @song = Song.find(params[:id])
  end

  def song_params
    params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
  end
end
