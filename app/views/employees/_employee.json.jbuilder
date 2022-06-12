json.(employee, :id, :name, :email, :experience)
json.skill_sets do
  json.partial! partial: 'skills/skill', collection: employee.skill_sets, as: :skill
end
json.(employee, :created_at, :updated_at)

