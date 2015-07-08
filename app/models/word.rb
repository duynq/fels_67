class Word < ActiveRecord::Base
  has_many :results, dependent: :destroy
  has_many :answers, dependent: :destroy
  belongs_to :category

  validates :content, presence: true
  accepts_nested_attributes_for :answers, allow_destroy: true
end
