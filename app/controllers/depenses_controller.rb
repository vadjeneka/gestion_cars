class DepensesController < ApplicationController
  before_action :authenticate_user, except: %i[:index, :show]
  before_action :set_depense, only: [:show, :edit, :update, :destroy]
  def index
    @depenses = Depense.all
  end

  def show
    
  end

  def new
    @depense = Depense.new
    @current_user = User.find(params[:user_id])
  end

  def create
    # raise params.inspect
    # @depense = depense.new(depense_params)
    @depense = current_user.depenses.build(depense_params)
    if @depense.save
      redirect_to user_depenses_path(@current_user), notice:'ajout depense effectuée'
    else
      flash[:error] = ' echouée'
      render 'new'
    end
  end

  def edit
    @current_user = User.find(params[:user_id])
  end

  def update
    @depense = Depense.find(params[:id])
      if @depense.update(depense_params)
        flash[:success] = "Modification reussie "
        redirect_to user_depenses_path
      else
        flash[:error] = "Erreur dans la modification"
        render 'edit'
      end
  end

  def destroy
    @depense = Depense.find(params[:id])
    @depense.destroy
    redirect_to user_depenses_path(@current_user)
    flash[:notice]= "depense supprimé avec succès"
  end
  
  private

  def set_depense
    @car = Depense.find(params[:id])
  end
  
  def depense_params
    params.require(:depense).permit(:nat_depense, :description, :montant, :date_depense, :car_id)
  end
end
