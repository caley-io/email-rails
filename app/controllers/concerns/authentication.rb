module Authentication
  extend ActiveSupport::Concern

  included do
    helper_method :user_signed_in?, :current_user
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  private

  def authenticate_user!
    # TODO: Fix
    redirect_to new_sessions_url unless user_signed_in?
  end

  def user_signed_in?
    current_user
  end

  def login(user)
    reset_session
    session[:user_id] = user.id
  end

  def logout
    session[:user_id] = nil
    @current_user = nil
    reset_session
  end
end
