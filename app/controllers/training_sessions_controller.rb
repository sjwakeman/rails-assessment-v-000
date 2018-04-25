class TrainingSessionsController < ApplicationController

  def create


  def new
    @training_session = TrainingSession.create(user_id:params[:user_id], trainer_id:params[:trainer_id])
    message = @training_session.book_training_session
        redirect_to user_path(@training_session.user, :message => message )
  end
  #def update
  #this isn't a route, this is just the method that updates
  #Object.update(...)
  #redirect to another route

  def update
    @training_session = TrainingSession.find(params[:id])
      if @training_session.update_attributes(permitted_attributes(@training_session))
        redirect_to @training_session
      else
        render :edit
      end
  end

  def index
    @training_sessions = TrainingSession.all
  end

  private

  def training_session_params
    params.require(:training_session).permit(:date, :start_time, :end_time, :location, :training_session_schedule)
  end

end
