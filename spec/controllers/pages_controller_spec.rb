require "rails_helper"

RSpec.describe PagesController, :type => :controller do

  describe "ACTIONS" do

    describe "GET welcome" do
      let(:params) {{
        # NOTE: Accepts no params.
      }}

      it "responds with a status of 200 (OK)" do
        get :welcome, params: params
        expect(response.status).to eq(200)
      end

      it "renders the \"welcome\" template" do
        get :welcome, params: params
        expect(response).to render_template("pages/welcome")
      end
    end

  end # ACTIONS

end # describe PagesController
