class Skill < ApplicationRecord

  # --------- Associations -------------------------------------------------
  has_many :skill_mappings, inverse_of: :skill, dependent: :destroy, foreign_key: :skill_id
  has_many :candidates, -> {where(type: User::CANDIDATE)}, through: :skill_mappings, source: :user
  has_many :employees, -> {where(type: User::EMPLOYEE)}, through: :skill_mappings, source: :user

  # --------- Validations --------------------------------------------------
  validates :name, presence: true, uniqueness: {case_sensitive: false}, length: {maximum: 20}
end
