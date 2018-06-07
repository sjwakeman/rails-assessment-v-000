class ClientsController < ApplicationController
  before_action :set_client, only: [:show]

  def index
    @clients = Client.all
  end

  def show
    @client = Client.find(params[:id])
  end

  def new
    @client = Client.all 
    #@client = Client.new(client_params)
    #if @client.save
    #end
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      session[:client_id] = @client.id
      # UsersController create logs you in
        redirect_to client_path(@client)
    else
      render 'new'
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



  private

  def client_params
    params.permit(:name, :email, :home_phone, :work_phone, :home_address, :work_address)
  end

  def set_client
    @client = Client.find_by(params[:id])
  end

end
