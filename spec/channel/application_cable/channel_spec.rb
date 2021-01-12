# NOTE: SEE https://relishapp.com/palkan/action-cable-testing/docs/channel-specs/channel-spec

require "rails_helper"

module ApplicationCable
  RSpec.describe Channel, :type => :channel do

    describe "CLASS" do

      it "inherits from ActionCable::Channel::Base" do
        expect(described_class.superclass).to eq(ActionCable::Channel::Base)
      end

    end # CLASS


    describe "BEHAVIOR" do

      it "can subscribe" do
        subscribe
        expect(subscription).to be_confirmed
      end

    end # BEHAVIOR

  end # describe Channel
end # module ApplicationCable
