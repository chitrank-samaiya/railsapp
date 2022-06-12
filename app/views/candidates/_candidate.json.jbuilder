json.(candidate, :id, :name, :email, :dob, :experience)
json.skill_sets do
  json.partial! partial: 'skills/skill', collection: candidate.skill_sets, as: :skill
end
json.(candidate, :created_at, :updated_at)
