require 'rails_helper'

RSpec.configure {|c| c.before { expect(controller).not_to be_nil }}


RSpec.describe BooksController, :type => :controller do
  describe "GET index" do
    it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end
  end
end