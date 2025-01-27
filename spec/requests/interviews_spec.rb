require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/interviews", type: :request do

  # This should return the minimal set of attributes required to create a valid
  # Interview. As you add validations to Interview, be sure to
  # adjust the attributes here as well.
  let(:job) {Job.create(title: "test", published_at: Date.today)}
  let(:candidate) {Candidate.create(name: "name", email: "email@example.com", experience: "8.3", dob: "1988-12-10")}
  let(:employee) {Employee.create(name: "emp", email: "emp@example.com", experience: "10.3")}

  let(:valid_attributes) {
    {round: 'Round 1', job_id: job.id, candidate_id: candidate.id, employee_id: employee.id}
  }

  let(:invalid_attributes) {
    {round: "", job_id: nil, candidate_id: nil, employee_id: nil}
  }

  describe "GET /index" do
    it "renders a successful response" do
      Interview.create! valid_attributes
      get "http://localhost:3000/interviews.json"
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      interview = Interview.create! valid_attributes
      get "http://localhost:3000/interviews/#{interview.id}.json"
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Interview" do
        expect {
          post "http://localhost:3000/interviews.json", params: {interview: valid_attributes}
        }.to change(Interview, :count).by(1)
      end
    end

    context "with invalid parameters" do
      it "does not create a new Interview" do
        expect {
          post "http://localhost:3000/interviews.json", params: {interview: invalid_attributes}
        }.to change(Interview, :count).by(0)
      end

      it "returns a unprocessable entity status" do
        post "http://localhost:3000/interviews.json", params: {interview: invalid_attributes}
        expect(response).to have_http_status(:unprocessable_entity)
      end

    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        {round: 'Round 2'}
      }

      it "updates the requested interview" do
        interview = Interview.create! valid_attributes
        patch "http://localhost:3000/interviews/#{interview.id}.json", params: {interview: new_attributes}
        interview.reload
        expect(response).to be_successful
      end
    end

    context "with invalid parameters" do

      it "returns a unprocessable entity status" do
        interview = Interview.create! valid_attributes
        patch "http://localhost:3000/interviews/#{interview.id}.json", params: {interview: invalid_attributes}
        expect(response).to have_http_status(:unprocessable_entity)
      end

    end
  end
end
