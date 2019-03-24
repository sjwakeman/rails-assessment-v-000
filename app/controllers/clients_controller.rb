class ClientsController < ApplicationController
  before_action :set_client, only: [:create, :show, :edit, :update]

  def index
  #Display search of client name
    if params[:search]
    #Displays Client Name search with Training Session
    @clients=current_user.clients.search(params[:search])
    #Displays Client Name search without Training Session
    @created_clients = current_user.created_clients.search(params[:search]).reject { |w| current_user.clients.include? w}
    else
      ##Displays all clients of current_user when Client name search not found
      @clients = current_user.clients.sorted
      #Displays all created_clients of current_user while reject @clients duplicates
      #when Client name search not found
      @created_clients = current_user.created_clients.reject { |w| current_user.clients.include? w}
    end
  end

  def training_sessions_index
    @client = Client.find(params[:id])
    @training_sessions = @client.training_sessions
    render template: 'training_sessions/index'
  end

  def training_session
    @client = Client.find(params[:id])
    # Note that because ids are unique by table we can go directly to
    # Training_Session.find — no need for @client.training_sessions.find...
    @training_session = TrainingSession.find(params[:training_session_id])
    render template: 'training_sessions/show'
  end

  def show
    @client = Client.find(params[:id])
  end

  def new
    @client = Client.new
    @user = User.new
  end

  def create 
    @client = Client.new(client_params)
    @client.user = current_user #ties current_user to @client.user
      if @client.save
      redirect_to client_path(@client)
        # new server request happens, so the previous controller
        #instance is destroyed and a new controller instance is created.
        #redirect to client_path(@created_client)
      else
      render :new
        #When you render, you remain in the same controller instance
      end
  end

  def edit
    @client = Client.find(params[:id])
  end

  def update
    if @client.update(client_params)
      redirect_to client_path(@client)
    else
      render :edit
    end
  end

  def destroy
    @client=Client.find(params[:id])
    @client.destroy
    #flash [notice:] = "You have successfully deleted the client."
    redirect_to clients_path
  end

  private

  def client_params
    params.require(:client).permit(:name, :email, :home_phone, :work_phone, :home_address, :work_address, :smart_phone)
  end

  def set_client
    @client = Client.find_by(id: params[:id]) #Did not work @client = Client.find(params[:id])
  end

end
