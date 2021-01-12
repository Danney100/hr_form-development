require "rails_helper"

RSpec.describe ServiceError do

  let(:error_message) { "Something went wrong." }

  let(:instance) { described_class.new([error_message]) }


  describe "PRIMARY METHODS" do

    describe "#initialize" do
      context "@messages" do
        it "calls #convert_to_array with the provided argument" do
          expect_any_instance_of(described_class).to receive(:convert_to_array).with([error_message]).and_call_original
          described_class.new([error_message])
        end

        it "sets @messages using the provided argument" do
          result = instance.messages
          expect(result).to eq([error_message])
        end
      end
    end

  end # PRIMARY METHODS


  describe "PUBLIC METHODS" do

    describe "#messages" do
      it "is an attr_reader" do
        expect(instance).to     respond_to(:messages)
        expect(instance).to_not respond_to(:messages=)
      end
    end

  end # PUBLIC METHODS


  describe "PRIVATE METHODS" do

    describe "#convert_to_array" do
      context "when messages are provided as a String" do
        it "wraps the provided String in an Array" do
          result = instance.send(:convert_to_array, error_message)
          expect(result).to eq([error_message])
        end
      end

      context "when messages are not provided as a String" do
        it "returns messages as provided" do
          result = instance.send(:convert_to_array, [error_message])
          expect(result).to eq([error_message])
        end
      end
    end

  end # PRIVATE METHODS

end # describe ServiceError
