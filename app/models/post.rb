class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  validates :name, presence: true, length: { maximum: 30 }
  validates :link, presence: true
end
