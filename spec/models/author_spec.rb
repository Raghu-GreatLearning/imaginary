require 'rails_helper'

RSpec.describe Author, type: :model do
  let(:author) {build(:author)}
  describe 'schema' do
    it { should have_db_column(:first_name).of_type(:string) }
    it { should have_db_column(:last_name).of_type(:string) }
  end

  describe 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_uniqueness_of(:first_name).ignoring_case_sensitivity }
    it { should validate_uniqueness_of(:last_name).ignoring_case_sensitivity }

  end

  describe 'create' do
    it { expect { author.save}.to change(Author, :count).by(1) }

    it "has none to begin with" do
      expect(Author.count).to eq 0
    end

    it "should give error on adding length <3" do
      author.first_name = "a"
      expect(author.save).to eq false
    end

    it "should give error on adding length > 10" do
      author.first_name = "abcdefghijklmno"
      expect(author.save).to eq false
    end

    it "should give error on adding length > 10" do
      author.first_name = "abcd"
      author.last_name = "abcdefghijklmno"
      expect(author.save).to eq false
    end

    it "should give error on adding length <3" do
      author.first_name = "abcd"
      author.last_name = "wo"
      expect(author.save).to eq false
    end


  end
end
