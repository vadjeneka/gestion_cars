class CarsController < ApplicationController
  before_action :authenticate_user, except: %i[:index, :show]
  before_action :set_car, only: [:show, :edit, :update, :destroy]
  def index
    @cars = Car.all
  end

  def show
    
  end

  def new
    @car = Car.new
    @current_user = User.find(params[:user_id])
  end

  def create
    # raise params.inspect
    # @car = Car.new(car_params)
    @car = current_user.cars.build(car_params)
    if @car.save
      redirect_to user_cars_path(@current_user), notice:'ajout car effectuée'
    else
      flash[:error] = 'car echouée'
      render 'new'
    end
  end

  def edit
    @current_user = User.find(params[:user_id])
  end

  def update
    @car = Car.find(params[:id])
      if @car.update(car_params)
        flash[:success] = "Modification reussie "
        redirect_to user_cars_path
      else
        flash[:error] = "Erreur dans la modification"
        render 'edit'
      end
  end

  def destroy
    @car = Car.find(params[:id])
    @car.destroy
    redirect_to user_cars_path(@current_user)
    flash[:notice]= "Car supprimé avec succès"
  end
  
  private

  def set_car
    @car = Car.find(params[:id])
  end
  
  def car_params
    params.require(:car).permit(:immatriculation, :couleur, :nbre_place, :typ_car)
  end
  
  
end
