class BookmarksController < ApplicationController
  before_action :set_bookmark, only: [:show, :edit, :update, :destroy]

  before_action :authenticate_user!

  # GET /bookmarks
  # GET /bookmarks.json
  def index
    @bookmarks = current_user.bookmarks.order('created_at desc')
  end

  # GET /bookmarks/1
  # GET /bookmarks/1.json
  def show
  end

  # GET /bookmarks/new
  def new
    @bookmark = current_user.bookmarks.new
  end

  # GET /bookmarks/1/edit
  def edit
  end

  # POST /bookmarks
  # POST /bookmarks.json
  def create
    @bookmark = current_user.bookmarks.new(bookmark_params)

    respond_to do |format|
      if @bookmark.save
        flash[:success] = 'Bookmark was successfully created.'
        format.html { redirect_to @bookmark }
        format.json { render :show, status: :created, location: @bookmark }
      else
        flash[:danger] = 'There was a problem creating the Bookmark.'
        format.html { render :new }
        format.json { render json: @bookmark.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bookmarks/1
  # PATCH/PUT /bookmarks/1.json
  def update
    respond_to do |format|
      if @bookmark.update(bookmark_params)
        flash[:success] = 'Bookmark was successfully updated.'
        format.html { redirect_to @bookmark }
        format.json { render :show, status: :ok, location: @bookmark }
      else
        format.html { render :edit }
        format.json { render json: @bookmark.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookmarks/1
  # DELETE /bookmarks/1.json
  def destroy
    @bookmark.destroy
    respond_to do |format|
      flash[:success] = 'Bookmark was successfully destroyed.'
      format.html { redirect_to bookmarks_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bookmark
      unless @bookmark = current_user.bookmarks.where(id: params[:id]).first
        flash[:alert] = 'Bookmark not found.'
        redirect_to root_url
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bookmark_params
      params.require(:bookmark).permit(:title, :url, :user_id)
    end
end
