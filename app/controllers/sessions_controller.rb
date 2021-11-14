class SessionsController < ApplicationController
  def new
    
  end

  def create
    email = params[:email]
    password = params[:password]
    user = User.find_by(email: email)

    if user and user&.authenticate(password)
      session[:current_user_id] = user.id
      redirect_to users_path notice: 'Connexion Reussie'
    else
      redirect_to login_path, alert: 'Email ou Mot de passe Incorrecte'
  end
end

  def destroy
    session[:current_user_id] = nil 
    redirect_to login_path, notice: 'Deconnexion Reussie'
  end
  
end
