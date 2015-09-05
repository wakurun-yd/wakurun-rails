require 'rails_helper'

RSpec.describe "Stickies", type: :request do
  describe "GET /stickies" do
    it "works! (now write some real specs)" do
      get stickies_path
      expect(response).to have_http_status(200)
    end
  end
end
