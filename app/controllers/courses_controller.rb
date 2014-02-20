class CoursesController < ApplicationController

  def show
    # get the course with id :id
    @course = Course.find(params[:id])
    @comments = @course.comments.paginate(page: params[:page])
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(params[:course])
    if @course.save
      # handle a successful save
      flash[:success] = 'Created!'
      redirect_to @course
    else
      render 'new'
    end
  end

  def edit

  end

  def update
    if @course.update_attributes(params[:course])
      # handle a successful update
      flash[:success] = 'Course updated'
      redirect_to @course
    else
      # handle a failed update
      render 'edit'
    end
  end

  def index
    @courses = Course.paginate(page: params[:page])
  end

  def destroy
    Course.find(params[:id]).destroy
    flash[:success] = 'Course deleted!'
    redirect_to courses_url
  end
end
