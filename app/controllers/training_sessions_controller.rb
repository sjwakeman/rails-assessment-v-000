class TrainingSessionsController < ApplicationController

  private

  def training_session_params
    params.require(:training_session).permit(:date, :start_time, :end_time, :location)
  end
  
end
