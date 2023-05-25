class BookmarksController < ApplicationController

  def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
    @bookmark.list = @list
    @movies = Movie.all
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @list = List.find(params[:list_id])
    @movie = Movie.find(params[:bookmark][:movie])
    @bookmark.movie = @movie
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new,  status: :unprocessable_entity
    end

    def destroy
      raise
      @bookmark = Bookmark.find(params[:id])
      @list = List.find(params[:list_id])
      @bookmark.destroy
      redirect_to list_path(@list), status: :see_other
    end
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment)
  end
end
