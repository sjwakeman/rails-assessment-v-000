class ClientsController < ApplicationController
  before_action :set_client, only: [:show]

  def index
    @clients = Client.all
  end

  def show
    @client = Client.find(params[:id])
  end

  def new
    @client = Client.new(client_params)
    if @client.save
    end
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
    @client = Client.find(params[:id])
    @client.update(params.require(:client).permit(:name))
      redirect_to client_path(@client)
  end

  private

  def client_params
    params.require(:client).permit(:name, :email, :home_phone, :work_phone, :home_address, :work_address)
  end

  def set_client
    @client = Client.find_by(params[:id])
  end

end
