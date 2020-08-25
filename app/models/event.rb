class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"

  has_many :attendings, dependent: :destroy
  has_many :attendees, through: :attendings

  has_many :invites, dependent: :destroy

  validates :name, :description, :time, :creator_id, presence: true

  scope :past, -> {where("time <= ?", DateTime.now)}
  scope :upcoming, -> {where("time > ?", DateTime.now)}

  def over?
    time <= DateTime.now
  end
end