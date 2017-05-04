class WagonsController < ApplicationController
  before_action :set_wagon, only: [:show, :edit, :update, :destroy]

  def index
    @wagons = Wagon.all
  end

  def show
  end

  def new
    @wagon = Wagon.new
  end

  def edit
  end

  def create
    @wagon = Wagon.new(wagon_params)
    if @wagon.save
      redirect_to @wagon, notice: 'Вагон создан.'
    else
      render :new
    end
  end

  def update
    if @wagon.update(wagon_params)
      redirect_to @wagon, notice: 'Вагон изменен.'
    else
      render :edit
    end
  end

  def destroy
    @wagon.destroy
    redirect_to wagons_url, notice: 'Вагон удален.'
  end

  private
  def set_wagon
    @wagon = Wagon.find(params[:id])
  end

  def wagon_params
    params.require(:wagon).permit(:number,
                                  :wagon_kind,
                                  :upper_places,
                                  :lower_places,
                                  :train_id)
  end
end
