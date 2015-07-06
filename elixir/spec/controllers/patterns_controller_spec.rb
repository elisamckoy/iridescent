require 'rails_helper'

RSpec.describe PatternsController, type: :controller do
	describe "#index" do
    before do 
      5.times { Pattern.create(name: "colors", first: "#457a1d", second: "#8d20af", third: "#f15a00") }
      get :index
    end

    it { should respond_with(200) }
    it { should render_template(:index) }
    it "should assign @patterns to all Patterns in DB" do
      expect(assigns(:patterns)).to eq(Pattern.all)
    end
  end
end
