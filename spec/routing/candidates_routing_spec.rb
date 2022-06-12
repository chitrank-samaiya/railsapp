require "rails_helper"

RSpec.describe CandidatesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/candidates.json").to route_to(controller: 'candidates', action: 'index', format: "json")
    end

    it "routes to #show" do
      expect(get: "/candidates/1.json").to route_to("candidates#show", id: "1", format: "json")
    end

    it "routes to #create" do
      expect(post: "/candidates.json").to route_to(controller: 'candidates', action: 'create', format: "json")
    end

    it "routes to #update via PUT" do
      expect(put: "/candidates/1.json").to route_to("candidates#update", id: "1", format: "json")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/candidates/1.json").to route_to("candidates#update", id: "1", format: "json")
    end
  end
end
