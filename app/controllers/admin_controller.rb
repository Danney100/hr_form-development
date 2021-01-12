# NOTE: This is used to create a new parent controller for RailsAdmin, and expose the "accountable" functionality by override its default of ActionController::Base. SEE: config/initializers/rails_admin.rb
class AdminController < ActionController::Base

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

end # class AdminController
