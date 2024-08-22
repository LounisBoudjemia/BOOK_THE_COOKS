class Service < ApplicationRecord
  belongs_to :user
  has_many :bookings
  # has_one_attached :photo
  has_many_attached :photos

  validates :name, presence: true
  validates :category, presence: true
end
