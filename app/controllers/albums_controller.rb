class AlbumsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    
    @albums = current_user.albums.where(published: true)
    @q = @albums.ransack(params[:q])
    @albums = @q.result
  end

  def show
    @album = Album.find(params[:id])
  end

  def new
    @album = Album.new
  end

  def create
    @album = current_user.albums.new(album_params)
    if @album.save
      redirect_to @album
       UserMailer.with(user: current_user).welcome_email.deliver_now
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
      @album = Album.find(params[:id])
  end

  def update 
    @album = Album.find(params[:id])
    if @album.update(album_params)
      redirect_to @album
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy
    if @album.destroy
      UserMailer.with(user: current_user).destroy_mail.deliver_now
    end  
    redirect_to root_path, status: :see_other
  end

  private

  def album_params
    params.require(:album).permit(:title, :description, :cover_image, :published, :tag_list, images: [])
  end
end



