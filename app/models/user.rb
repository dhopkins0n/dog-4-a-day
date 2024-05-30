class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :photo
  has_many :dogs, dependent: :destroy
  has_many :bookings
  has_many :bookings_as_owner, through: :dogs, source: :bookings
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
