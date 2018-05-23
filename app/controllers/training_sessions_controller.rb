class TrainingSessionsController < ApplicationController
  before_action :set_training_session, only: [:show, :edit, :update]

  def index #performs as new instead of INDEX of Training Sessions?
    @training_sessions = TrainingSession.all
  end

  def new
    #@training_session = TrainingSession.new

    #@training_session = TrainingSession.create(user_id:params[:user_id], training_session_id:params[:training_session_id])
    #message = @training_session.booked_status
      #redirect_to user_path(@training_session.user, :message => message )



    #if params[:user_id]
      #@user = User.find_by(id: params[:user_id])
        #if @user.nil?
          #redirect_to users_path, alert: "User not found"
        #else
          #@training_sessions = @user.training_sessions
        #end
    #else
      @training_session = TrainingSession.all #THIS IS ONLY GETTING HIT!
      #@training_session = TrainingSession.new #undefined method `new' for nil:NilClass
    #end


    #@other_font = OtherFont.new
    #render :"other_fonts/new"
    #@training_session = TrainingSession.new
    #render :"training_sessions/new"
    #@training_session = TrainingSession.find(params[:training_session_id])
  end

  def create
    #Template
    #@attraction = Attraction.new(attraction_params)
    #if @attraction.save
      #redirect_to attraction_path(@attraction)
    #else
      #render 'new'
    #end


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
    #Template
      #if @attraction.update(attraction_params)
        #redirect_to attraction_path(@attraction)
      #else
        #render :edit
      #end

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
    #def set_training_sesison handles this task
    #@training_session = TrainingSession.find(params[:id])
  end

  def destroy
    training_session.destroy
    redirect_to '/'
  end


  private

  def training_session_params
    params.require(:training_session).permit(:date, :start_time, :end_time, :location, :user, :client, :booked_status)
  end

  def set_training_session
    #Template
    #@attraction = Attraction.find(params[:id])
    @training_session = TrainingSession.find_by(params[:id])
  end

end
