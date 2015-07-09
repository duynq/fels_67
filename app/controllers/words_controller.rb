class WordsController < ApplicationController
  def new
    @word = Word.new
    4.times do
      answer = @word.answers.build
    end
  end

  def create
    @word = Word.new word_params
    if @word.save
      flash[:success] = I18n.t "word_success"
      redirect_to @word
    else
      render "new"
    end
  end

  def edit
    @word = Word.find params[:id]
  end

  def update
    @word = Word.find params[:id]
    if @word.update_attributes word_params
      flash[:success] = I18n.t "word_updated"
      redirect_to @word
    else
      render "edit"
    end
  end

  def show
    @word = Word.find params[:id] 
  end

  private
  def word_params
    params.require(:word).permit :content, :category_id, answers_attributes: [:id, :status, :content]
  end
end