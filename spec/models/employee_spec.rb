require 'rails_helper'

RSpec.describe Employee, type: :model do
  subject {
    described_class.new(name: 'name',
                        email: 'email@example.com',
                        experience: "3.2")
  }
  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a name" do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a email" do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a experience" do
      subject.experience = nil
      expect(subject).to_not be_valid
    end
  end
end
