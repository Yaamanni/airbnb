class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :wishlist
  has_one :address
  has_many :reviews
  has_many :bookings

  has_many_attached :photos

  before_validation :check_title_uniqueness
  validates :address_id, presence: true,uniqueness: { case_sensitive: false }
  # validates :booking_id
  # validates :review_id
  validates :title, length: { in: 10..160 }, presence: true, uniqueness: { case_sensitive: false }
  validates :num_of_rooms, presence: true
  validates :num_of_beds, presence: true
  validates :num_of_guests, presence: true
  validates :description, presence: true
  validates :start_date, comparison: { greater_than: :end_date }, presence: true
  validates :end_date, comparison: { less_than: :start_date }, presence: true
  validates :price, numericality: { greater_than: 0 }, presence: true

end
