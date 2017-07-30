class Article < ActiveRecord::Base
  belongs_to :user

  validates :title, length: { in: 3..50 }
  validates :description, presence: true, length: { in: 10..500 }
  validates :user_id, presence: true

end