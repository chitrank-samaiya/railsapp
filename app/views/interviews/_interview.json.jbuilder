json.(interview, :id, :round, :remarks)
json.job do
  json.partial! partial: 'jobs/job', locals: {job: interview.job}
end
json.candidate do
  json.partial! partial: 'candidates/candidate', locals: {candidate: interview.candidate}
end
json.employee do
  json.partial! partial: 'employees/employee', locals: {employee: interview.employee}
end
json.skill_ratings do
  json.partial! partial: 'skill_ratings/skill_rating', collection: interview.skill_ratings, as: :skill_rating
end
json.(interview, :created_at, :updated_at)