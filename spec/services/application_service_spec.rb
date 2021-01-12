require "rails_helper"

RSpec.describe ApplicationService do

  let(:service_arguments) {{
    # Intentionally left blank.
  }}

  let(:service) { described_class.new(service_arguments) }


  describe "PRIMARY METHODS" do

    describe "#initialize" do
      it "sets errors to an empty array" do
        result = service.errors
        expect(result).to eq([])
      end
    end

    describe "#call" do
      it "returns true" do
        result = service.call
        expect(result).to eq(true)
      end
    end

  end # PRIMARY METHODS


  describe "PUBLIC METHODS" do

    describe "#errors" do
      it "is an attr_accessor" do
        expect(service).to respond_to(:errors)
        expect(service).to respond_to(:errors=)
      end
    end

  end # PUBLIC METHODS


  describe "PRIVATE METHODS" do

    describe "#add_to_errors" do
      it "adds the provided errors array to the existing errors array" do
        service.send(:add_to_errors, ["Something went wrong"])
        result = service.errors
        expect(result).to eq(["Something went wrong"])
      end
    end

    describe "#completed_without_errors?" do
      context "when errors are present" do
        before do
          allow(service).to receive(:errors).and_return(["Something went wrong"])
        end

        it "returns false" do
          result = service.send(:completed_without_errors?)
          expect(result).to eq(false)
        end
      end

      context "when errors are not present" do
        before do
          allow(service).to receive(:errors).and_return([])
        end

        it "returns true" do
          result = service.send(:completed_without_errors?)
          expect(result).to eq(true)
        end
      end
    end

  end # PRIVATE METHODS

end # describe ApplicationService
