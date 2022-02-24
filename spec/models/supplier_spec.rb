require 'rails_helper'

RSpec.describe Supplier, type: :model do
  let(:supplier) {build(:supplier)}
  describe 'schema' do
    it { should have_db_column(:name).of_type(:string) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name).ignoring_case_sensitivity }

  end

  describe 'create' do
    it { expect { supplier.save}.to change(Supplier, :count).by(1) }
    
    it "has none to begin with" do
      expect(Supplier.count).to eq 0
    end
  end
end
