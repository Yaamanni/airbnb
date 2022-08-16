class Booking < ApplicationRecord
  has_one :reviews, dependent: :destroy
  belongs_to :user
  belongs_to :listing
end
