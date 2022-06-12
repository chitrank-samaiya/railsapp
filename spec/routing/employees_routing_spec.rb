require "rails_helper"

RSpec.describe EmployeesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/employees.json").to route_to(controller: 'employees', action: 'index', format: "json")
    end

    it "routes to #show" do
      expect(get: "/employees/1.json").to route_to("employees#show", id: "1", format: "json")
    end

    it "routes to #create" do
      expect(post: "/employees.json").to route_to(controller: 'employees', action: 'create', format: "json")
    end

    it "routes to #update via PUT" do
      expect(put: "/employees/1.json").to route_to("employees#update", id: "1", format: "json")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/employees/1.json").to route_to("employees#update", id: "1", format: "json")
    end
  end
end
