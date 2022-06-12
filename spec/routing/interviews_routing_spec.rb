require "rails_helper"

RSpec.describe InterviewsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/interviews.json").to route_to(controller: 'interviews', action: 'index', format: "json")
    end

    it "routes to #show" do
      expect(get: "/interviews/1.json").to route_to(controller: 'interviews', action: 'show', id: '1', format: "json")
    end


    it "routes to #create" do
      expect(post: "/interviews.json").to route_to(controller: 'interviews', action: 'create', format: "json")
    end

    it "routes to #update via PUT" do
      expect(put: "/interviews/1.json").to route_to(controller: 'interviews', action: 'update', id: '1', format: "json")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/interviews/1.json").to route_to(controller: 'interviews', action: 'update', id: '1', format: "json")
    end
  end
end
