class InvitesController < ApplicationController
  before_action :authenticate_user!
  before_action :validate_invite_permission, only: :create

  def index
    @invites = current_user.incoming_invites
  end


  def create
    invitee = User.find_by(username: params[:invitee_username])
    if invitee
      invite = Invite.create(inviter_id: current_user.id, invitee_id: invitee.id, event_id: params[:event_id])
      if invite.save
        redirect_back fallback_location: root_path, success: "Succesfully invited #{invitee.name} - @#{invitee.username}"
      else
        redirect_back fallback_location: root_path, danger: "There is already a pending invite to #{invitee.name} - @#{invitee.username}"
      end
    else
      redirect_back fallback_location: root_path, danger: "That user does not exist!"
    end
  end

  def destroy
    #Accepted the invitation
    invite = Invite.find(params[:id])
    if params[:accept] == "1"
      current_user.attended_events << Event.find(invite.event.id)
      flash[:success] = "Succesfully accepted invitation!"
    else
      flash[:success] = "Succesfully declined invitation!"
    end
    invite.destroy
    redirect_to invites_path
  end

  private
  def validate_invite_permission
    redirect_to root_path, info: "You can only invite users to your own events!" unless Event.find(params[:event_id]).creator == current_user
  end
end
