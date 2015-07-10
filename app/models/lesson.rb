class Lesson < ActiveRecord::Base
  has_many :results, dependent: :destroy
  belongs_to :user
  belongs_to :category

  default_scope -> {order created_at: :desc}

end
