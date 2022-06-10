class SkillRating < ApplicationRecord

  # --------- Stored attributes --------------------------------------------
  store :other_attributes, accessors: [:remarks], coder: JSON

  # --------- Associations -------------------------------------------------
  belongs_to :skill

  has_many :interview_skill_ratings, inverse_of: :skill_rating, dependent: :destroy
  has_many :interviews, through: :interview_skill_ratings

  # --------- Validations --------------------------------------------------
  validates :rating, numericality: { in: 0..5 }, allow_nil: true
end
