class TrainingSessionsController < ApplicationController

  def new
    @training_session = TrainingSession.create(user_id:params[:user_id], trainer_id:params[:trainer_id])
    message = @training_session.book_training_session
        redirect_to user_path(@training_session.user, :message => message )
  end
  #def update
  #this isn't a route, this is just the method that updates
  #Object.update(...)
  #redirect to another route

  def index
    @training_sessions = TrainingSession.all
  end
  
  private

  def training_session_params
    params.require(:training_session).permit(:date, :start_time, :end_time, :location)
  end

end
