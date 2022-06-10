class Candidate < User

  # --------- Associations -------------------------------------------------
  has_many :interviews, dependent: :destroy

  # --------- Validations --------------------------------------------------
  validates :name, presence: true, length: {maximum: 16}

  # --------- Scopes --------------------------------------------------
  scope :avg_skill_ratings_above_3, ->(job_id) {select(:id, :name, :email).joins(interviews: [:job, :skill_ratings])
                                                                   .where("skill_ratings.rating >= 2 and interviews.job_id =?", job_id).having("avg(skill_ratings.rating) > 3")
                                                                   .group(:id)}
  scope :avg_skill_ratings_above_3_and_no_rating_below_2, ->(job_id) {select(:id, :name, :email).joins(interviews: [:job, :skill_ratings])
                                                                   .where("skill_ratings.rating >= 2 and interviews.job_id =?", job_id).having("avg(skill_ratings.rating) > 3")
                                                                   .group(:id)}
end
