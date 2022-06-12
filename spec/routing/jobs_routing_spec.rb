require "rails_helper"

RSpec.describe JobsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/jobs.json").to route_to(controller: 'jobs', action: 'index', format: "json")
    end

    it "routes to #show" do
      expect(get: "/jobs/1.json").to route_to(controller: 'jobs', action: 'show', id: '1', format: "json")
    end

    it "routes to #create" do
      expect(post: "/jobs.json").to route_to(controller: 'jobs', action: 'create', format: "json")
    end

    it "routes to #update via PUT" do
      expect(put: "/jobs/1.json").to route_to(controller: 'jobs', action: 'update', id: '1', format: "json")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/jobs/1.json").to route_to(controller: 'jobs', action: 'update', id: '1', format: "json")
    end
  end
end
