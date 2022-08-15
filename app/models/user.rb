class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
<<<<<<< HEAD
  has_many :bookings, dependent: :destroy
  has_many :listings, dependent: :destroy
  # has_many :wishlists
=======
  has_one :wishlist
>>>>>>> updated wishlist controller and models
end
