require "rails_helper"

RSpec.describe ApplicationRecord, :type => :model do

  describe "CLASS" do

    it "inherits from ActiveRecord::Base" do
      expect(described_class.superclass).to eq(ActiveRecord::Base)
    end

    it "is an abstract class" do
      expect(described_class.abstract_class).to eq(true)
    end

  end # CLASS

end # describe ApplicationRecord
