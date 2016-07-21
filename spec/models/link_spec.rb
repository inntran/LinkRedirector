require 'rails_helper'

RSpec.describe Link, type: :model do
  before(:each) do
    @link = FactoryGirl.create(:link)
  end

  context "trigger redirection" do
    it "increase counter by one" do
      expect{@link.click}.to change{@link.click_count}.by(1)
    end

    it "update last click time" do
      last_click = @link.last_click_at
      @link.click
      expect(@link.last_click_at).not_to eq(last_click)
    end
  end
end
