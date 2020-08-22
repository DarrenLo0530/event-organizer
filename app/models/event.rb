class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  validates :name, :description, :time, presence: true
end
