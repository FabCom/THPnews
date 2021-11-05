class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email] )

    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = 'Bonjour ' + current_user.first_name + ' !'
      redirect_to root_path
  
    else
      flash[:danger] = "Échec de l'authentification"
      redirect_to new_session_path
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:success] = 'Au revoir'
    redirect_to new_session_path
  end
end
