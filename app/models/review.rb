class Review < ApplicationRecord
  belongs_to :booking
  belongs_to :listing

  validates :rating, numericality: { greater_than: 0 }, presence: true
end
