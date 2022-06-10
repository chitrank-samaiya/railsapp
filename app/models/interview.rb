class Interview < ApplicationRecord

  # --------- Constants ----------------------------------------------------
  R1 = 'Round 1'
  R2 = 'Round 2'
  R3 = 'Round 3'
  ROUND_SET = [R1, R2, R3].freeze

  # --------- Stored attributes --------------------------------------------
  store :other_attributes, accessors: [:remarks], coder: JSON

  # --------- Associations -------------------------------------------------
  belongs_to :candidate
  belongs_to :employee
  belongs_to :job

  has_many :interview_skill_ratings, inverse_of: :interview, dependent: :destroy
  has_many :skill_ratings, through: :interview_skill_ratings

  # --------- Validations --------------------------------------------------
  validates :round, presence: true, inclusion: {in: ROUND_SET, message: "should be from the set of #{ROUND_SET.to_sentence(last_word_connector: ' or ')}(case sensitive)"}

  # --------- Callbacks ----------------------------------------------------
  after_create_commit :try_populating_skills_ratings_for_candidate

  def try_populating_skills_ratings_for_candidate
    self.candidate.skill_sets.each do |skill|
      self.skill_ratings.where(skill_id: skill.id).first_or_create
    end
  end

end
