require 'spec_helper'

RSpec.describe Deal, :type => :model do
  describe 'Associations' do
    it { is_expected.to belong_to(:vendor) }
  end

  describe 'Validations' do

    [:buy_currency, :sell_currency, :vendor_id, :rate].each do |field|
      it { is_expected.to validate_presence_of(field) }
    end
  end
  describe 'factory' do
    it "has a factory that should create successfully" do
      deal = FactoryGirl.create(:deal)
      expect(deal).not_to be_nil
    end
  end

  describe 'instance method' do
    it 'should return the deal name with currency' do
      deal = FactoryGirl.create(:deal)
      expect(deal.name).to eq('USD-INR')
    end
  end
end
