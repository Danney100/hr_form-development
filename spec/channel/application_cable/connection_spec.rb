require "rails_helper"

module ApplicationCable
  RSpec.describe Connection, :type => :channel do

    describe "CLASS" do

      it "inherits from ActionCable::Connection::Base" do
        expect(described_class.superclass).to eq(ActionCable::Connection::Base)
      end

    end # CLASS

  end # describe Connection
end # module ApplicationCable
