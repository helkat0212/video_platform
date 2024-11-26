class VideosController < ApplicationController
before_action :authenticate_user!

  def index
    @videos = Video.all
  end

  def show
    @video = Video.find(params[:id])
  end

  def new
    @video = Video.new
  end

  def create
    @video = current_user.videos.build(video_params)
    if @video.save
      redirect_to @video, notice: 'Video was successfully created.'
    else
      render :new
    end
  end

  def edit
    @video = Video.find(params[:id])
  end

  def update
    @video = Video.find(params[:id])
    if @video.update(video_params)
      redirect_to @video, notice: 'Video was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @video = Video.find(params[:id])
    @video.destroy
    redirect_to videos_url, notice: 'Video was successfully destroyed.'
  end

  private

  def video_params
    params.require(:video).permit(:title, :description, :url, :uploadDate)
  end
end
