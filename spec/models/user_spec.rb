require "rails_helper"

RSpec.describe User, :type => :model do

  let(:record) { FactoryBot.build(:user) }

  describe "CLASS" do

    it "inherits from ApplicationRecord" do
      expect(described_class.superclass).to eq(ApplicationRecord)
    end

    it "has a valid factory" do
      expect(record).to be_valid
    end

  end # CLASS


  describe "ATTRIBUTES" do

    describe "email" do
      it "should be present" do
        record.email = nil
        expect(record).to_not be_valid
        expect(record.errors.full_messages).to include("Email can't be blank")
      end

      it "should be unique" do
        target_email = "user@example.com"

        preexisting_record = FactoryBot.create(:user, {
          email: target_email
        })

        record.email = target_email
        expect(record).to_not be_valid
        expect(record.errors.full_messages).to include("Email has already been taken")
      end
    end

    describe "password" do
      it "should be present" do
        record.password = nil
        expect(record).to_not be_valid
        expect(record.errors.full_messages).to include("Password can't be blank")
      end
    end

  end # ATTRIBUTES


  describe "ASSOCIATIONS" do

    describe "belongs_to" do
      [].each do |association|
        it "#{association}" do
          expect(described_class.reflect_on_association(association).macro).to eq(:belongs_to)
        end
      end
    end

    describe "has_many" do
      [:account_users, :accounts].each do |association|
        it "#{association}" do
          expect(described_class.reflect_on_association(association).macro).to eq(:has_many)
        end
      end
    end

    describe "has_one" do
      [].each do |association|
        it "#{association}" do
          expect(described_class.reflect_on_association(association).macro).to eq(:has_one)
        end
      end
    end

    describe "should destroy dependent" do
      it "account_users" do
        record.save

        dependent = FactoryBot.create(:account_user, {
          user: record
        })

        record.reload

        expect{record.destroy}.to change{AccountUser.count}.by(-2)
        expect(AccountUser.find_by(id: dependent.id)).to eq(nil)
      end
    end

  end # ASSOCIATIONS


  describe "CALLBACKS" do

    describe "before_create" do
      context "when accounts are associated" do
        before do
          record.accounts << FactoryBot.create(:account)
        end

        it "does not call #build_new_account" do
          expect(record).to_not receive(:build_new_account)
          record.save
        end
      end

      context "when no accounts are associated" do
        before do
          record.accounts = []
        end

        it "calls #build_new_account" do
          expect(record).to receive(:build_new_account)
          record.save
        end
      end
    end

  end # CALLBACKS


  describe "PRIVATE METHODS" do

    describe "#build_new_account" do
      it "builds an associated new Account" do
        # NOTE: This is checking for a present, but non-persisted AccountUser. Trying to check by count will return 0, whereas any? will return true.
        expect(record.account_users.any?).to eq(false)
        record.send(:build_new_account)
        expect(record.account_users.any?).to eq(true)
      end

      it "gives the user the \"standard\" user_role for the account" do
        record.send(:build_new_account)
        result = record.account_users.last.user_role
        expect(result).to eq("standard")
      end
    end

  end # PRIVATE METHODS

end # describe User
