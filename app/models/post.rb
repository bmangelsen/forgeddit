class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  validates :name, presence: true, length: { maximum: 60 }
  validates :link, presence: true
  validates :link, format: { with: /\A(http|https):\/\//, :message => "must include http:// or https://" }
end
