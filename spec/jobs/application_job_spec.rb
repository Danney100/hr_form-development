require "rails_helper"

RSpec.describe ApplicationJob, :type => :job do

  describe "CLASS" do

    it "inherits from ActiveJob::Base" do
      expect(described_class.superclass).to eq(ActiveJob::Base)
    end

  end # CLASS

end # describe ApplicationJob
