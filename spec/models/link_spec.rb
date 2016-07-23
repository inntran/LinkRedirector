require 'rails_helper'

RSpec.describe Link, type: :model do
  before(:each) do
    @link = FactoryGirl.build(:link)
  end

  context 'validations' do
    it 'has a valid factory' do
      expect(@link).to be_valid
    end

    it 'is not valid if URL scheme is not http or https' do
      link = FactoryGirl.build(:invalid_scheme_link)
      expect(link).not_to be_valid
    end
  end

  context 'click counter' do
    it 'increase counter by one' do
      expect{@link.click}.to change{@link.click_count}.by(1)
    end

    it 'update last click time' do
      last_click = @link.last_click_at
      @link.click
      expect(@link.last_click_at).not_to eq(last_click)
    end
  end

  context 'computed attributes' do
    it 'is an external resource if hostname does not match internal DNS name' do
      link = FactoryGirl.build(:facebook_link)
      expect(link.external?).to equal(true)
    end

    it 'is a fresh link if click_count less than 1000' do
      link = FactoryGirl.build(:link, click_count: 999)
      expect(link.maturity).to eq("fresh")
    end

    it 'is a popular link if click_count more than 1000' do
      link = FactoryGirl.build(:link, click_count:1001)
      expect(link.maturity).to eq("mature")
    end
  end
end
