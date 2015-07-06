require 'rails_helper'

RSpec.describe Pattern, type: :model do

  let(:pattern) { Pattern.create(name: "colors", first: "#457a1d", second: "#8d20af", third: "#f15a00") }

  describe "fields" do
    it { should have_db_column(:name).of_type(:string) }
    it { should have_db_column(:first).of_type(:string) }
    it { should have_db_column(:second).of_type(:string) }
    it { should have_db_column(:third).of_type(:string)}
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:first) }
    it { should validate_presence_of(:second) }
    it { should validate_presence_of(:third) }
  end

  # describe "methods" do
  #   describe "#mixer" do
  #     context "if cat has more than 1 life remaining" do
  #       it "decrements the cat's lives by 1" do
  #         healthy_cat.lose_a_life!
  #         healthy_cat.reload
  #         expect(healthy_cat.lives).to eq(8)
  #       end
  #     end
  #     context "if cat has 1 life remaining" do
  #       it "removes the cat from the database" do
  #         almost_dead_cat.lose_a_life!
  #         expect(Cat.find_by_name(almost_dead_cat.name)).to be_nil
  #       end
  #     end
  #   end
  # end
end
