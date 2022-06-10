class InterviewSkillRating < ApplicationRecord

  # --------- Associations -------------------------------------------------
  belongs_to :interview, inverse_of: :interview_skill_ratings
  belongs_to :skill_rating, inverse_of: :interview_skill_ratings
end