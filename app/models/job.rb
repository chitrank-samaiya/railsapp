class Job < ApplicationRecord

  # --------- Validations --------------------------------------------------
  validates :title, presence: true, length: {maximum: 16}
  validates :published_at, presence: true

  # --------- Associations -------------------------------------------------
  has_many :interviews, dependent: :destroy

end
