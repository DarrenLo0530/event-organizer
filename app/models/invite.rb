class Invite < ApplicationRecord
  belongs_to :inviter, class_name: "User"
  belongs_to :invitee, class_name: "User"
  belongs_to :event
  validates_uniqueness_of :inviter, scope: [:invitee, :event]
end

