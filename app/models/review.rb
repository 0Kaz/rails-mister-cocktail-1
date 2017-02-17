class Review < ApplicationRecord
  belongs_to :cocktail

  validates :rating, :content, presence: true
  validates :rating, numericality: { only_integer: true }, inclusion: { in: (0..5), allow_nil: false }
end
