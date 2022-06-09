class SkillMapping < ApplicationRecord

  # --------- Associations -------------------------------------------------
  belongs_to :user, inverse_of: :skill_mappings, optional: true
  belongs_to :skill, inverse_of: :skill_mappings, optional: true
end
