json.(skill_rating, :id)
json.skill do
  json.partial! partial: 'skills/skill', locals: {skill: skill_rating.skill}
end
json.(skill_rating, :rating, :created_at, :updated_at)
