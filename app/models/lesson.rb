class Lesson < ActiveRecord::Base
  has_many :results, dependent: :destroy
  belongs_to :user
  belongs_to :category

  default_scope -> {order created_at: :desc}
  accepts_nested_attributes_for :results, allow_destroy: true
  
  before_create :init_lesson
  before_save :update_point
  
  validate :check_number_words, on: :create

  private
  def init_lesson
    list_word = Word.not_learn self.user_id, self.category_id
    Settings.number_result.times do |n|
      self.results.build word_id: list_word[n].id
    end
  end

  def update_point
    self.point = self.results.select{|result| result.status?}.count
  end

  def check_number_words
    list_word = Word.not_learn self.user_id, self.category_id
    if list_word.size < Settings.number_result 
      errors.add :words, I18n.t("not_enough_word")
    end
  end
end
