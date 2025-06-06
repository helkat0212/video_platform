class CommentsController < ApplicationController
  before_action :set_video, only: [:new, :create]

  def new
    @video = Video.find(params[:video_id])
    @comment = @video.comments.build
  end

  def create
    @video = Video.find(params[:video_id])
    @comment = @video.comments.build(comment_params)
    @comment.user = current_user
    @comment.datePosted = Date.today

    if @comment.save
      redirect_to video_path(@video), notice: 'Comment was successfully created'
    else
      render :new
    end
  end

  private

  def set_video
    @video = Video.find(params[:video_id])
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
