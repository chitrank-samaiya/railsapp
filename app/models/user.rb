class User < ApplicationRecord

  # --------- Constants ----------------------------------------------------
  EMPLOYEE = 'Employee'
  CANDIDATE = 'Candidate'
  TYPE_SET = [EMPLOYEE, CANDIDATE]

  # --------- Stored attributes --------------------------------------------
  store :other_attributes, accessors: [:experience], coder: JSON

  # --------- Associations -------------------------------------------------
  has_many :skill_mappings, inverse_of: :user, dependent: :destroy, foreign_key: :user_id
  has_many :skill_sets, through: :skill_mappings, source: :skill

  # --------- Validations --------------------------------------------------
  validates :type, presence: true, inclusion: {in: TYPE_SET, message: "should be from the set of #{TYPE_SET.to_sentence(last_word_connector: ' or ')}(case sensitive)"}
  validates :email, presence: true, uniqueness: {case_sensitive: false}
  validates :experience, presence: true

  # --------- Transient attributes -----------------------------------------
  attr_accessor :skill_set_attributes

  # --------- Callbacks ----------------------------------------------------
  before_validation :try_populating_skill_sets

  # --------- Private methods ----------------------------------------------

  private

  def try_populating_skill_sets
    return unless self.skill_set_attributes

    self.skill_sets = self.skill_set_attributes.collect do |skill_set_attributes|
      skill = Skill.where(id: skill_set_attributes[:id]).take
      skill ||= Skill.where(name: skill_set_attributes[:name]).take
      skill ||= Skill.new(name:  skill_set_attributes[:name])
    end
  end

end
