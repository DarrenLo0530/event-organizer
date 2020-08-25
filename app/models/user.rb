class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :rememberable, :validatable

  has_many :created_events, foreign_key: "creator_id", class_name: "Event", dependent: :destroy

  has_many :attendings, foreign_key: :attendee_id, dependent: :destroy
  has_many :attended_events, through: :attendings, source: :event

  has_many :sent_invites, foreign_key: :inviter_id, dependent: :destroy
  has_many :received_invites, foreign_key: :invitee_id, dependent: :destroy

  def incoming_invites
    Invite.where(invitee_id: id)
  end

end
