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

RSpec.describe "/candidates", type: :request do
  
  # This should return the minimal set of attributes required to create a valid
  # Candidate. As you add validations to Candidate, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {name: "name", email: "email@example.com", experience: "8.3", dob: "1988-12-10"}
  }

  let(:invalid_attributes) {
    {name: "", email: "", experience: "", dob: nil}
  }

  describe "GET /index" do
    it "renders a successful response" do
      Candidate.create! valid_attributes
      get "http://localhost:3000/candidates.json"

      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      candidate = Candidate.create! valid_attributes
      get "http://localhost:3000/candidates/#{candidate.id}.json"

      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Candidate" do
        expect {
          post "http://localhost:3000/candidates.json", params: { candidate: valid_attributes }
        }.to change(Candidate, :count).by(1)
      end
    end

    context "with invalid parameters" do
      it "does not create a new Candidate" do
        expect {
          post "http://localhost:3000/candidates.json", params: { candidate: invalid_attributes }
        }.to change(Candidate, :count).by(0)
      end


      it "returns a unprocessable entity status" do
        post "http://localhost:3000/candidates.json", params: { candidate: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        {name: "naam", email: "naam@example.com", experience: "9.3", dob: "1988-12-10"}
      }

      it "updates the requested candidate" do
        candidate = Candidate.create! valid_attributes
        patch "http://localhost:3000/candidates/#{candidate.id}.json", params: { candidate: new_attributes }
        candidate.reload
        expect(response).to be_successful
      end
    end

    context "with invalid parameters" do
    
      it "returns a unprocessable entity status" do
        candidate = Candidate.create! valid_attributes
        patch "http://localhost:3000/candidates/#{candidate.id}.json", params: { candidate: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

end
