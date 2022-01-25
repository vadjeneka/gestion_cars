class InscriptionsController < ApplicationController
  # before_action :set_inscription , only: [:show, :edit, :update, :destroy]

  def index
    @inscriptions = Inscription.all
  end

  def show
    @inscription = Inscription.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
          render pdf: "Inscritpion no. #{@inscription.id}",
          page_size: 'A4',
          template: "inscriptions/show.html.erb",
          layout: "pdf.html",
          orientation: "Landscape",
          lowquality: true,
          zoom: 1,
          dpi: 75
      end
    end
    @qrcode = Inscription.new.generate_qr_code(@inscription)
  end

  def new
    @inscription = Inscription.new
  end

  def create
    # raise params.inspect
    # @inscription = Inscription.new(inscription_params)
    @inscription = Inscription.create(inscription_params)
    if @inscription.save
      redirect_to inscriptions_path, notice:'Inscription effectuée'
    else
      flash[:error] = 'Inscription echouée'
      render 'new'
    end
  end

  def edit
    @inscription = Inscription.find(params[:id])
  end

  def update
    @inscription = Inscription.find(params[:id])
    if @inscription.update(inscription_params)
      redirect_to inscriptions_path, notice:" Modification réussie "
      
    else
      flash[:error] = " Modification echouée"
      render 'edit'
    end
  end

  def destroy
    @inscription = Inscription.find(params[:id])
    @inscription.destroy
    redirect_to inscriptions_path, notice: "Inscription Supprimée"
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
