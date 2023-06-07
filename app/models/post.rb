class Post < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  has_many :comments

  validates :review, presence: true
end
