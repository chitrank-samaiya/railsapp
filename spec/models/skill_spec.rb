require 'rails_helper'

RSpec.describe Skill, type: :model do
  subject {
    described_class.new(name: 'name')
  }
  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a name" do
      subject.name = nil
      expect(subject).to_not be_valid
    end
  end
end
