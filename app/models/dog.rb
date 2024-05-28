class Dog < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  validates :name, presence: true, length: { maximum: 20 }
  validates :breed, presence: true, length: { maximum: 20 }
  validates :age, presence: true, numericality: { only_integer: true }
  validates :description, length: { maximum: 500 }
  
  has_one_attached :photo
end
