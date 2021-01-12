module Users
  class SessionsController < Devise::SessionsController

    # TODO: specs
    # POST /resource/sign_in
    def create
      super do |user|
        # NOTE: This currently just sets the account to the User's first account, with the assumption that they only have one. If/when Users are able to belong to multiple accounts, we may want to replace this with an account selection flow.
        session[:current_account_id] = user.accounts.first.id
      end
    end

    # TODO: specs
    # DELETE /resource/sign_out
    def destroy
      super do |user|
        session.delete(:current_account_id)
      end
    end

  end # class SessionsController
end # module Users
