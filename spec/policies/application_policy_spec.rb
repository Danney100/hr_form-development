require "rails_helper"

RSpec.describe ApplicationPolicy do

  let(:user) { Hash.new }

  let(:record) { Hash.new }

  let(:policy) { described_class }


  permissions :index? do
    describe "should not permit" do
      it "all users" do
        expect(policy).to_not permit(user, record)
      end
    end
  end

  permissions :show? do
    describe "should not permit" do
      it "all users" do
        expect(policy).to_not permit(user, record)
      end
    end
  end

  permissions :new? do
    describe "should not permit" do
      it "all users" do
        expect(policy).to_not permit(user, record)
      end
    end
  end

  permissions :create? do
    describe "should not permit" do
      it "all users" do
        expect(policy).to_not permit(user, record)
      end
    end
  end

  permissions :edit? do
    describe "should not permit" do
      it "all users" do
        expect(policy).to_not permit(user, record)
      end
    end
  end

  permissions :update? do
    describe "should not permit" do
      it "all users" do
        expect(policy).to_not permit(user, record)
      end
    end
  end

  permissions :destroy? do
    describe "should not permit" do
      it "all users" do
        expect(policy).to_not permit(user, record)
      end
    end
  end

  describe ApplicationPolicy::Scope do
    describe "#resolve" do
      it "returns no records" do
        policy_scope = described_class.new(user, record)

        result = policy_scope.resolve

        expect(result).to eq([])
      end
    end
  end # describe Scope

end # describe ApplicationPolicy
