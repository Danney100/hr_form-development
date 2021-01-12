class ApplicationController < ActionController::Base

  protect_from_forgery

  # Session Authentication (Devise)
  before_action :authenticate_user!

  # Permission Authorization (Pundit)
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def current_account
    if session[:current_account_id].present?
      Account.find(session[:current_account_id])
    end
  end

  def current_role
    if current_account.present?
      current_account.account_users.find_by(user: current_user).user_role
    else
      AccountUsers::DEFAULT_USER_ROLE
    end
  end

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end

end # class ApplicationController
