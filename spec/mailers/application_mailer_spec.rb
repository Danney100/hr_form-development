require "rails_helper"

RSpec.describe ApplicationMailer, :type => :mailer do

  describe "CLASS" do

    it "inherits from ActionMailer::Base" do
      expect(described_class.superclass).to eq(ActionMailer::Base)
    end

  end # CLASS

end # describe ApplicationMailer
