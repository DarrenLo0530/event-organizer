class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"

  has_many :attendings, dependent: :destroy
  has_many :attendees, through: :attendings

  validates :name, :description, :time, :creator_id, presence: true
end
