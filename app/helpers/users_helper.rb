module UsersHelper
  def user_is(id)
    User.find_by(id: id)
  end
  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end
  def authenticate_user_valid_for_users_actions()
    unless current_user == params[:id]
      flash[:danger] = "Action non autorisée"
      redirect_to users_path
    end
  end
  def authenticate_user_valid_for_posts_actions()
    unless current_user == @comment.user
      flash[:danger] = "Action non autorisée"
      redirect_to users_path
    end
  end
end
