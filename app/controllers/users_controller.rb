class UsersController < ApplicationController
  before_action :authenticate_user, only: [:index]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    # raise params.inspect
      if @user.save
        redirect_to login_path, notice: "Utilisateur créer avec succès!" 
      else
        flash[:error] = "erreur de creation"
        render 'new'
      end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to users_path, notice: "Utilisateur modifié avec succès!" 
    else
      render 'edit', alert: "Erreur!" 
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to users_path, notice: "#{user.prenom} supprimé avec succès"
  end

  private

  def user_params
    params.require(:user).permit(:prenom, :nom, :email, :telephone, :password, :password_confirmation)
  end
end
