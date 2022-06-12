require 'rails_helper'

RSpec.describe Interview, type: :model do
  subject {
    job = Job.create(title: "Test", published_at: Date.today)
    candidate = Candidate.create(name: 'name', email: 'email@example.com', dob: (Date.today - 10.years).strftime("%Y-%m-%d"), experience: "3.2")
    employee = Employee.create(name: 'emp', email: 'emp_email@example.com', experience: "3.2")
    described_class.new(round: 'Round 1', job_id: job.id, candidate_id: candidate.id, employee_id: employee.id)
  }

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without job_id" do
      subject.job_id = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without employee_id" do
      subject.employee_id = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without candidate_id" do
      subject.candidate_id = nil
      expect(subject).to_not be_valid
    end

    it "is not valid rating greater than 5" do
      subject.round = nil
      expect(subject).to_not be_valid
    end
  end
end
