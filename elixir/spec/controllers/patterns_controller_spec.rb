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

  describe "#show" do
    before do
      @pattern = Pattern.create(name: "colors", first: "#457a1d", second: "#8d20af", third: "#f15a00")
      get :show, id: @pattern.id
    end

    it { should respond_with(200) }
    it { should render_template(:show) }
    it "should assign pattern with specified id to @pattern" do
      expect(assigns(:pattern)).to eq(@pattern)
    end
  end

  describe "#new" do
    before do
      get :new
    end
    it { should respond_with(200) }
    it { should render_template(:new) }
  end
end
