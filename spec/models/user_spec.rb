require 'rails_helper'

RSpec.describe User, type: :model do
  subject {
    described_class.new(name: 'name',
                        type: 'Candidate',
                        email: 'email@example.com',
                        dob: (Date.today - 10.years).strftime("%Y-%m-%d"),
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

    it "is not valid without a name" do
      subject.type = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a email" do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a dob" do
      subject.dob = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a experience" do
      subject.experience = nil
      expect(subject).to_not be_valid
    end
  end
end
