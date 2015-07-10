class LessonsController < ApplicationController
  def create
    @lesson = current_user.lessons.new
    @lesson.category_id = params[:category_id]
    if @lesson.save
      redirect_to @lesson
    else
      redirect_to :back
    end
  end

  def show
    @lesson = Lesson.find params[:id]
  end

  def update
    @lesson = Lesson.find params[:id]
    @lesson.update_attributes lesson_params
  end

  private
  def lesson_params
    params.require(:lesson).permit :id, results_attributes: [:id, :status]
  end
end
