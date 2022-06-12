require 'rails_helper'

RSpec.describe Job, type: :model do
  subject {
    described_class.new(title: 'name',
                        published_at: Date.today)
  }
  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a title" do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without published_at" do
      subject.published_at = nil
      expect(subject).to_not be_valid
    end
  end
end
