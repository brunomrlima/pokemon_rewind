require 'rails_helper'

RSpec.describe Rarity, type: :model do
  context "valid Factory" do
    it "has a valid factory" do
      expect(build(:rarity)).to be_valid
    end
  end

  describe 'Association' do
    context 'has_many' do
      it { should have_many(:cards) }
    end
  end
end
