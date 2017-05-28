class Admin::WagonsController < Admin::BaseController
  before_action :set_wagon, only: [:show, :edit, :update, :destroy]
  before_action :set_train, only: [:new, :create]

  def index
    @wagons = Wagon.all
  end

  def show
    @wagon = Wagon.find(params[:id])
  end

  def new
    @wagon = Wagon.new
  end

  def edit
  end

  def create
    @wagon = @train.wagons.new(wagon_params)
    if @wagon.save
      redirect_to @train, notice: 'Вагон создан.'
    else
      render :new
    end
  end

  def update
    if @wagon.update(wagon_params)
      redirect_to wagons_path, notice: 'Вагон изменен.'
    else
      render :edit
    end
  end

  def destroy
    @wagon.destroy
    redirect_to wagons_url, notice: 'Вагон удален.'
  end

  protected

  def set_train
    @train = Train.find(params[:train_id])
  end

  def set_wagon
    @wagon = Wagon.find(params[:id])
  end

  def wagon_params
    params.require(:wagon).permit(:number,
                                  :upper_places,
                                  :lower_places,
                                  :side_upper_places,
                                  :side_lower_places,
                                  :seats,
                                  :type,
                                  :train_id)
  end
end
