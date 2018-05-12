class TrainingSessionsController < ApplicationController
  before_action :set_training_session, only: [:show, :edit, :update]

  def index
    @training_sessions = TrainingSession.all
  end

  def new
    #@other_font = OtherFont.new
    #render :"other_fonts/new"
    @training_session = TrainingSession.new
    #render :"training_sessions/new"
    #@training_session = TrainingSession.find(params[:training_session_id])
  end

  def create
    @training_session = TrainingSession.new(training_session_params)
    #binding.pry
    if @training_session.save
      redirect_to training_session_path(@training_session)
        # new server request happens, so the previous controller
        #instance is destroyed and a new controller instance is created.
    else
      render 'new'
      #When you render, you remain in the same controller instance
    end
  end

  #def update
  #this isn't a route, this is just the method that updates
  #Object.update(...)
  #redirect to another route

  def update
    if @training_session.update(training_session_params)
      redirect_to training_session_path(@training_session)
    else
      render :edit
    end
  end

  def show
    #Duplicates def set_training_sesison method
    #@training_session = TrainingSession.find_by([:id]) #expected: "/training_sessions/2" got: "/training_session"
    #@training_session = TrainingSession.find(params[:id]) #expected: "/training_sessions/2" got: "/training_session"
  end

  def edit

  end

  private

  def training_session_params
    params.require(:training_session).permit(:date, :start_time, :end_time, :location, :booked_status)
  end

  def set_training_session
  @training_session = TrainingSession.find(params[:id])
 end

end
