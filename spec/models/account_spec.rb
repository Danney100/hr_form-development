require "rails_helper"

RSpec.describe Account, :type => :model do

  let(:record) { FactoryBot.build(:account) }

  describe "CLASS" do

    it "inherits from ApplicationRecord" do
      expect(described_class.superclass).to eq(ApplicationRecord)
    end

    it "has a valid factory" do
      expect(record).to be_valid
    end

  end # CLASS


  describe "ATTRIBUTES" do

    # NOTE: No attributes at this time.

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
      [:account_users, :users].each do |association|
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
          account: record
        })

        expect{record.destroy}.to change{AccountUser.count}.by(-1)
        expect(AccountUser.find_by(id: dependent.id)).to eq(nil)
      end
    end

  end # ASSOCIATIONS

end # describe Account
