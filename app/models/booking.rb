class Booking < ApplicationRecord
  belongs_to :dog
  belongs_to :user

  validates :start_time, presence: true
  # validates :end_time, presence: true
  validates :status, presence: true, inclusion: { in: %w[Pending Approved Declined Completed] }
end
