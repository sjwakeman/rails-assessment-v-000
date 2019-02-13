class ClientsController < ApplicationController
  before_action :set_client, only: [:create, :show, :edit, :update]

  def index
  #Displays clients of current_user
    @clients = current_user.clients.sorted
  #Displays created_clients of current_user
    #@created_clients = current_user.created_clients.sorted
  #Displays created_clients of current_user while reject @clients duplicates.
    @created_clients = current_user.created_clients.reject { |w| @clients.include? w}
  end

  def training_sessions_index
    @client = Cliemt.find(params[:id])
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
  end

  def create 
    @client = Client.new(client_params)
    @client.user = current_user #ties current_user to @client.user
    #@created_client.user = current_user #TIE current_user to @created_client.user?
      if @client.save
      redirect_to client_path(@client)
        # new server request happens, so the previous controller
        #instance is destroyed and a new controller instance is created.
      #elsif @created_client.save
      #redirect to client_path(@created_client)
      else
      render 'new'
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
