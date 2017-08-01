class Category < ActiveRecord::Base
  # has_many :article_categories
  # has_many :articles, through: :article_categories
  has_many :articles

  validates :name,
            presence: true,
            uniqueness: { case_sensitive: false },
            length: { in: 3..25 }
end