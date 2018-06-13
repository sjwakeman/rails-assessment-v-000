class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update]

  def index
    @clients = Client.all.sorted
  end

  def show
    @client = Client.find(params[:id])
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
      if @client.save
      redirect_to client_path(@client)
        # new server request happens, so the previous controller
        #instance is destroyed and a new controller instance is created.
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
    redirect_to clients_path
  end

  private

  def client_params
    #params.permit(:name, :email, :home_phone, :work_phone, :home_address, :work_address)
    params.require(:client).permit(:name, :email, :home_phone, :work_phone, :home_address, :work_address)

  end

  def set_client
    @client = Client.find(params[:id])
  end

end
