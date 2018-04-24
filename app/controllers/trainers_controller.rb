class TrainersController < ApplicationController

  def new
    @trainer = Trainer.new
  end

  def create
    @trainer = Trainer.new(trainer_params)
    if @trainer.save
      redirect_to attraction_path(@attraction)
    else
      render 'new'
    end
  end

  def index
    @trainers = Trainer.all
  end

  def show
    @trainer = Trainer.find_by(id: params[:id])
  end

  def edit
    @trainer = Trainer.find(params[:id])
  end

  def update
    if @trainer.update(trainer_params)
      redirect_to trainer_path(@trainer)
    else
      render :edit
    end
  end

  def set_trainer
    @trainer = Trainer.find(params[:id])
  end

  private

  def trainer_params
    params.require(:user).permit(:name, :email, :specialty, :admin)
  end

end
