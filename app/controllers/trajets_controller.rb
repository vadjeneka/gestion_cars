class TrajetsController < ApplicationController
  before_action :authenticate_user, except: %i[:index, :show]
  before_action :set_trajet, only: [:show, :edit, :update, :destroy]
  def index
    @trajets = Trajet.all
  end

  def show
    
  end

  def new
    @trajet = Trajet.new
    @current_user = User.find(params[:user_id])
  end

  def create
    # raise params.inspect
    # @trajet = Trajet.new(trajet_params)
    @trajet = current_user.trajets.build(trajet_params)
    if @trajet.save
      redirect_to user_trajets_path(@current_user), notice:'ajout trajet effectuée'
    else
      flash[:error] = 'trajet echouée'
      render 'new'
    end
  end

  def edit
    @current_user = User.find(params[:user_id])
  end

  def update
    @trajet = Trajet.find(params[:id])
      if @trajet.update(trajet_params)
        flash[:success] = "Modification reussie "
        redirect_to user_trajets_path
      else
        flash[:error] = "Erreur dans la modification"
        render 'edit'
      end
  end

  def destroy
    @trajet = Trajet.find(params[:id])
    @trajet.destroy
    redirect_to user_trajets_path(@current_user)
    flash[:notice]= "trajet supprimé avec succès"
  end
  
  private

  def set_trajet
    @car = Trajet.find(params[:id])
  end
  
  def trajet_params
    params.require(:trajet).permit(:destination)
  end
end
