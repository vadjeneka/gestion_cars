class ChauffeursController < ApplicationController
  before_action :authenticate_user, except: %i[:index, :show]
  before_action :set_chauffeur, only: [:show, :edit, :update, :destroy]
  def index
    @chauffeurs = Chauffeur.all
  end

  def show
    
  end

  def new
    @chauffeur = Chauffeur.new
    @current_user = User.find(params[:user_id])
  end

  def create
    # raise params.inspect
    # @chauffeur = Chauffeur.new(chauffeur_params)
    @chauffeur = current_user.chauffeurs.build(chauffeur_params)
    if @chauffeur.save
      redirect_to user_chauffeurs_path(@current_user), notice:'ajout chauffeur effectuée'
    else
      flash[:error] = ' echouée'
      render 'new'
    end
  end

  def edit
    @current_user = User.find(params[:user_id])
  end

  def update
    @chauffeur = Chauffeur.find(params[:id])
      if @chauffeur.update(chauffeur_params)
        flash[:success] = "Modification reussie "
        redirect_to user_chauffeurs_path
      else
        flash[:error] = "Erreur dans la modification"
        render 'edit'
      end
  end

  def destroy
    @chauffeur = Chauffeur.find(params[:id])
    @chauffeur.destroy
    redirect_to user_chauffeurs_path(@current_user)
    flash[:notice]= "chauffeur supprimé avec succès"
  end
  
  private

  def set_chauffeur
    @chauffeur = Chauffeur.find(params[:id])
  end
  
  def chauffeur_params
    params.require(:chauffeur).permit(:nom, :prenom, :numero, :car_id)
  end
end
