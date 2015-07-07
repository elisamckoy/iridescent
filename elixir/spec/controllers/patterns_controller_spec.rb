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
    it "should assign an instance of Pattern to @pattern" do
      expect(assigns(:pattern)).to be_a(Pattern)
    end
  end

  describe "#create" do

    context "if valid params" do

      before do
        @pattern_params = {name: "colors", first: "#457a1d", second: "#8d20af", third: "#f15a00"}
        post :create, { pattern: @pattern_params }
      end

      it { should respond_with(302) }
      it "should redirect to the new patterns page" do
        pattern = Pattern.find_by(@pattern_params)
        expect(response).to redirect_to("/patterns/#{pattern.id}")
      end
      it "creates a new pattern with specified params" do
        expect(Pattern.find_by(@valid_params)).to be_truthy
      end

    end

    context "if invalid params" do

      before do 
        post :create, { pattern: {name: "test"} }
      end

      it { should respond_with(400) }
      it { should render_template(:new) }
      it "should not create a new pattern" do
        expect(Pattern.find_by_name("test")).to be_nil
      end
    end
  end

  describe "#edit" do
    before do
      @pattern = Pattern.create(name: "colors", first: "#457a1d", second: "#8d20af", third: "#f15a00")
      get :edit, id: @pattern.id
    end

    it { should respond_with(200) }
    it { should render_template(:edit) }
    it "should assign pattern with specified id to @pattern" do
      expect(assigns(:pattern)).to eq(@pattern)
    end
  end

  describe "#update" do
    context "with valid params" do
      before do
        @pattern = Pattern.create(name: "colors", first: "#457a1d", second: "#8d20af", third: "#f15a00")
        @pattern_params = {name: "colors", first: "#457a1d", second: "#8d20af", third: "#f15a00"}
        patch :update, { id: @pattern.id, pattern: @pattern_params }
      end

      it { should respond_with(302) }
      it { should redirect_to("/patterns/#{@pattern.id}")}
      it "should update the attributes for pattern" do
        expect(Pattern.find_by(@pattern_params)).to be_truthy
      end
    end

    context "with invalid params" do
      before do
        @pattern = Pattern.create(name: "colors", first: "#457a1d", second: "#8d20af", third: "#f15a00")
        @invalid_pattern_params = { name: "", first: "", second: "", third: ""}
        patch :update, { id: @pattern.id, pattern: @invalid_pattern_params }
      end

      it { should respond_with(400) }
      it { should render_template(:edit) }
      it "should not update the attributes for pattern" do
        expect(Pattern.find_by(@invalid_pattern_params)).to be_nil
      end
    end
  end
end
