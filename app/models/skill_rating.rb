class SkillRating < ApplicationRecord

  # --------- Associations -------------------------------------------------
  belongs_to :skill

  has_many :interview_skill_ratings, inverse_of: :skill_rating, dependent: :destroy
  has_many :interviews, through: :interview_skill_ratings

  # --------- Validations --------------------------------------------------
  validates :rating, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }, allow_nil: true
end
