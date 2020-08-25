class Attending < ApplicationRecord
  belongs_to :attendee, class_name: "User"
  belongs_to :event
  validates_uniqueness_of :attendee_id, scope: :event_id
end
