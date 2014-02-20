class CommentsController < ApplicationController

  def create
    @course = Course.find(params[:course_id])
    @comment = @course.comments.build(params[:comment])
    @comment.save
    redirect_to course_path(@course)
  end

  def destroy
    @comment.destroy
    redirect_to course_path(@course)
  end
end