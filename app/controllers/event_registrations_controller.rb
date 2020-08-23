class EventRegistrationsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    event_sign_up = Attending.find_or_initialize_by(attendee_id: current_user.id, event_id: params[:event_id])
    if event_sign_up.new_record?
      event_sign_up.save!
      redirect_to root_path, success: "Succesfully joined event!"
    else
      redirect_to root_path, info: "Already joined event!"
    end
  end 
end