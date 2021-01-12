module Users
  class RegistrationsController < Devise::RegistrationsController

    # TODO: specs
    def create
      super do |user|
        # NOTE: The block is yielded before the parent method checks if the resource is valid. Because of this, if the user did not persist then the method to build a user account would not have run and calling users.accounts.first would return nil, causing an application error when attempting to access the ID
        if user.persisted?
          # NOTE: This currently just sets the account to the User's first account, with the assumption that they only have one. If/when Users are able to belong to multiple accounts, we may want to replace this with an account selection flow.
          session[:current_account_id] = user.accounts.first.id
        end
      end
    end

  end # class RegistrationsController
end # module Users
