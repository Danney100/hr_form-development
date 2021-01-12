require "rails_helper"

RSpec.describe ApplicationController, :type => :request do

  describe "CLASS" do

    it "inherits from ActionController::Base" do
      expect(described_class.superclass).to eq(ActionController::Base)
    end

  end # CLASS


  describe "PUBLIC METHODS" do

    describe "current_account" do
      let(:user) { FactoryBot.create(:user, :with_account) }
      let(:target_account_id) { user.accounts.first.id }

      context "when current_account_id is set in session" do
        before do
          @request.session[:current_account_id] = target_account_id
        end

        xit "returns an Account found by the ID" do
          # TODO
        end
      end

      context "when current_account_id is not set in session" do
        before do
          @request.session[:current_account_id] = nil
        end

        xit "returns nil" do
          # TODO:
        end
      end
    end

    describe "#current_role" do
      context "when a current_account is present" do
        xit "returns the user_role found through the associated AccountUser" do
          # TODO
        end
      end

      context "when a current_account is not present" do
        xit "returns nil" do
          # TODO:
        end
      end
    end

  end # PUBLIC METHODS


  describe "PRIVATE METHODS" do

    describe "#user_not_authorized" do
      # TODO:
    end

  end # PRIVATE METHODS

end # describe ApplicationController
