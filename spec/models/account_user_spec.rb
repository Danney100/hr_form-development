require "rails_helper"

RSpec.describe AccountUser, :type => :model do

  let(:record) { FactoryBot.build(:account_user) }

  describe "CLASS" do

    it "inherits from ApplicationRecord" do
      expect(described_class.superclass).to eq(ApplicationRecord)
    end

    it "has a valid factory" do
      expect(record).to be_valid
    end

  end # CLASS


  describe "CONSTANTS" do

    describe "DEFAULT_USER_ROLE" do
      it "returns the expected String" do
        result = described_class::DEFAULT_USER_ROLE
        expected_result = "standard"
        expect(result).to eq(expected_result)
      end
    end

  end # CONSTANTS


  describe "ATTRIBUTES" do

    describe "user_role" do
      # NOTE: before_validation setting prevents this from occurring.
      xit "should be present" do
        record.user_role = nil
        expect(record).to_not be_valid
        expect(record.errors.full_messages).to include("User role can't be blank")
      end

      it "should have a default value of 0 (standard)" do
        record = described_class.new
        expect(record.user_role).to eq("standard")
      end

      it "should map a value of 0 to \"standard\"" do
        record.user_role = 0
        expect(record.user_role).to eq("standard")
      end

      it "should map a value of 1 to \"admin\"" do
        record.user_role = 1
        expect(record.user_role).to eq("admin")
      end
    end

  end # ATTRIBUTES


  describe "ASSOCIATIONS" do

    describe "belongs_to" do
      [:account, :user].each do |association|
        it "#{association}" do
          expect(described_class.reflect_on_association(association).macro).to eq(:belongs_to)
        end
      end
    end

    describe "has_many" do
      [].each do |association|
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

  end # ASSOCIATIONS


  describe "CALLBACKS" do

    describe "before_validation" do
      it "calls #set_user_role_if_missing" do
        expect(record).to receive(:set_user_role_if_missing)
        record.valid?
      end
    end

  end # CALLBACKS


  describe "PRIVATE METHODS" do

    describe "#set_user_role_if_missing" do
      context "when user_role is present" do
        let(:existing_user_role) { "admin" }

        before do
          record.user_role = existing_user_role
        end

        it "does not set a user_role" do
          record.send(:set_user_role_if_missing)
          result = record.user_role
          expect(result).to eq(existing_user_role)
        end
      end

      context "when a user_role is not present" do
        before do
          record.user_role = nil
        end

        it "sets user_role to DEFAULT_USER_ROLE" do
          record.send(:set_user_role_if_missing)
          result = record.user_role
          expect(result).to eq(described_class::DEFAULT_USER_ROLE)
        end
      end
    end

  end # PRIVATE METHODS

end # describe AccountUser
