class ClientsController < ApplicationController
  before_action :authenticate_client, only: [:show]

  def new
    @client = client.new(client_params)
    if @client.save

  end

  def create
    @client = client.new(client_params)
    if @client.save
      session[:client_id] = @client.id
      # clientsController create logs you in
        redirect_to client_path(@client)
    else
      render 'new'
    end
  end


  private

  def client_params
    params.require(:client).permit(:name, :email, :password, :admin)
  end
end
