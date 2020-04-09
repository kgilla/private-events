class AttendancesController < ApplicationController

  def create
    @att_id = params[:id]
    @attendance = current_user.attendances.build(:attended_event_id => @att_id)
    if !current_user.attended_events.exists?(@att_id)
      @attendance.save
      flash[:success] = "Awesome, cant wait to see you"
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @attendance = current_user.attendances.find_by(attended_event: params[:id])
    @attendance.destroy
    flash[:danger] = "No longer attending event"
    redirect_back(fallback_location: root_path)
  end
end
