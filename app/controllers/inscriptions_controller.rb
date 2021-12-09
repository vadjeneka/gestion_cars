class InscriptionsController < ApplicationController
  before_action :authenticate_user, except: %i[:index, :show]
  before_action :set_inscription , only: [:show, :edit, :update, :destroy]

  def index
    @inscriptions = Inscription.all
  end

  def show
  end

  def new
    @inscription = Inscription.new
    @current_user = User.find(params[:user_id])
  end

  def create
    # raise params.inspect
    # @inscription = Inscription.new(inscription_params)
    @inscription = current_user.inscriptions.build(inscription_params)
    if @inscription.save
      redirect_to user_inscriptions_path(@current_user), notice:'Inscription effectuée'
    else
      flash[:error] = 'Inscription echouée'
      render 'new'
    end
  end

  def edit
    @inscription = Inscription.find(params[:id])
    @current_user = User.find(params[:user_id])
  end

  def update
    @inscription = Inscription.find(params[:id])
    if @inscription.update(inscription_params)
      redirect_to user_inscriptions_path(@current_user), notice:" Modification réussie "
      
    else
      flash[:error] = " Modification echouée"
      render 'edit'
    end
  end

  def destroy
    @inscription = Inscription.find(params[:id])
    @inscription.destroy
    redirect_to user_inscriptions_path(@current_user), notice: "Inscription Supprimée"
  end

  private 

  def set_inscription
    @inscription = Inscription.find(params[:id])
  end

  def inscription_params
    # raise params.inspect
    params.require(:inscription).permit(:nom, :prenom, :classe, :matricule, :num_parent, :montant, :mois, :destination)
  end
end
