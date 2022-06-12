require 'rails_helper'

RSpec.describe SkillRating, type: :model do
  subject {
    skill = Skill.create(name: "Test")
    described_class.new(rating: 3, skill_id: skill.id)
  }

  describe "Validations" do
    it "is valid with valid attributes" do

      expect(subject).to be_valid
    end

    it "is not valid rating greater than 5" do
      subject.rating = 6
      expect(subject).to_not be_valid
    end
  end
end
