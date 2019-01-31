class TrainingSessionsController < ApplicationController
  before_action :set_training_session, only: [:create,:show, :edit, :update] 

  def index
    #Displays training_sessions of current_user
    @training_sessions = current_user.training_sessions.sorted
  end

  def show
    #Duplicates def set_training_session method
    @training_session = TrainingSession.find(params[:id]) #expected: "/training_sessions/2" got: "/training_session"
  end

  def new
      @training_session = TrainingSession.new
  end

  def create
    @training_session = TrainingSession.new(training_session_params)
    @training_session.user = current_user #ties current_user to @training_session.user
    @training_session.client.user_id = current_user.id #ties current_user id to @training_session.client_id
     if @training_session.save
        @training_session.client.save #save client to database
          redirect_to training_session_path(@training_session)
          # new server request happens, so the previous controller
          #instance is destroyed and a new controller instance is created.
      else
        render 'new'
        #When you render, you remain in the same controller instance
      end
  end

  def edit
    #def set_training_session handles this task
    @training_session = TrainingSession.find(params[:id])
  end

  def update
    if @training_session.update(training_session_params)
      redirect_to training_session_path(@training_session)
    else
      render :edit
    end
  end

  def destroy
    @training_session=TrainingSession.find(params[:id])
    @training_session.destroy
    flash[:notice] = "You have successfully cancelled the training session."
    redirect_to training_sessions_path
  end

  private

  def training_session_params
    params.require(:training_session).permit(:date, :client_name, :start_time, :end_time, :location, :user, :client, :booked_status)
  end

  def set_training_session
    @training_session = TrainingSession.find_by(id: params[:id])
  end

end
