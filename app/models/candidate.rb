class Candidate < User

  # --------- Stored attributes --------------------------------------------
  store :other_attributes, accessors: [:dob], coder: JSON

  # --------- Associations -------------------------------------------------
  has_many :interviews, dependent: :destroy

  # --------- Validations --------------------------------------------------
  validates :name, presence: true, length: {maximum: 16}
  validates :dob, date: {before: proc {Date.today}}

  # --------- Callbacks ----------------------------------------------------
  before_validation :try_formatting_dob

  # --------- Scopes -------------------------------------------------------
  scope :avg_skill_ratings_above_3, ->(job_id) {select("users.*").joins(interviews: [:job, :skill_ratings])
                                                                 .where("interviews.job_id =?", job_id).having("avg(skill_ratings.rating) > 3")
                                                                 .group(:id)}
  scope :avg_skill_ratings_above_3_and_no_rating_below_2, ->(job_id) {select("users.*").joins(interviews: [:job, :skill_ratings])
                                                                                       .where("skill_ratings.rating >= 2 and interviews.job_id =?", job_id).having("avg(skill_ratings.rating) > 3")
                                                                                       .group(:id)}

  def try_formatting_dob
    self.dob = Date.parse(self.dob) if self.dob
  end
end
