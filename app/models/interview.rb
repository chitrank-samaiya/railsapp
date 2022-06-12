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

  # --------- Transient attributes -----------------------------------------
  attr_accessor :skill_rating_attributes

  # --------- Callbacks ----------------------------------------------------
  after_create_commit :try_creating_skills_ratings_for_candidate
  after_update_commit :try_updating_skills_ratings

  # --------- Private ------------------------------------------------------

  def try_creating_skills_ratings_for_candidate
    self.candidate.skill_sets.each do |skill|
      self.skill_ratings.where(skill_id: skill.id).first_or_create
    end
  end

  def try_updating_skills_ratings
    return unless self.skill_rating_attributes

    self.skill_rating_attributes.collect do |skill_rating_attributes|
      skill_rating = self.skill_ratings.where(id: skill_rating_attributes[:id]).take
      skill_rating.update(rating: skill_rating_attributes[:rating]) if skill_rating && skill_rating_attributes[:rating]
    end
  end

end
