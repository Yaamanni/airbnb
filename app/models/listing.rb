class Listing < ApplicationRecord
  # belongs_to :user
  # # has_one :address
  has_many :reviews, dependent: :destroy
  has_many :bookings, dependent: :destroy
  # has_many :wishlists

  # has_many_attached :photos

  validates :title, length: { minimum: 6, maximum: 160 }, presence: true, uniqueness: { case_sensitive: false }
  validates :num_of_rooms, :num_of_beds, :num_of_guests, :description, presence: true
  validates :start_date, comparison: { less_than: :end_date }, presence: true
  validates :end_date, comparison: { greater_than: :start_date }, presence: true
  validates :price, numericality: { greater_than: 0 }, presence: true
end
