class Booking < ApplicationRecord
  # belongs_to :user
  belongs_to :listing

  has_one :review, dependent: :destroy

  validates :num_of_guests, presence: true
  validates :start_date, comparison: { less_than: :end_date }, presence: true
  validates :end_date, comparison: { greater_than: :start_date }, presence: true
end
