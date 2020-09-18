require 'rails_helper'

RSpec.describe Backup, type: :model do
  context "valid Factory" do
    it "has a valid factory" do
      expect(build(:backup)).to be_valid
    end
  end

  describe 'Association' do
    context 'has_many' do
      it { should have_many(:cards) }
    end
  end

  # describe 'Methods' do
  #   context 'after create populate cards' do
  #     it 'should create cards after backup is done' do
  #       expect{ create(:backup) }.to change{ Card }.by (100)
  #     end
  #   end
  # end
end
