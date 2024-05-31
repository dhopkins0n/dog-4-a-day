class Dog < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  validates :name, presence: true, length: { maximum: 20 }
  validates :breed, presence: true, length: { maximum: 20 }
  validates :age, presence: true, numericality: { only_integer: true }
  validates :description, length: { maximum: 500 }
  validates :summary, length: { maximum: 1500 }, allow_blank: true

  has_one_attached :photo
  has_many_attached :images

  acts_as_taggable_on :tags
end
