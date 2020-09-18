require 'rails_helper'

RSpec.describe Card, type: :model do
  context "valid Factory" do
    it "has a valid factory" do
      expect(build(:card)).to be_valid
    end
  end

  describe 'Association' do
    context 'belongs_to' do
      it { should belong_to(:backup) }
    end
  end
end
