class Word < ActiveRecord::Base
  has_many :results, dependent: :destroy
  has_many :answers, dependent: :destroy
  belongs_to :category

  validates :content, presence: true
  accepts_nested_attributes_for :answers, allow_destroy: true

  scope :not_learn, -> id_user, id_category{Word.where "category_id = ? AND id NOT IN
    (SELECT word_id FROM results WHERE lesson_id IN 
      (SELECT id FROM lessons WHERE user_id = ?))", id_category, id_user}
end
