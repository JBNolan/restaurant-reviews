class Review < ApplicationRecord
  belongs_to :restaurant

  validates :restaurant, presence: true
  validates :rating, :inclusion => { :in => 1..5, :message => "must be between 1 - 5" }
  validates :body, presence: true
end
