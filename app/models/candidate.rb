class Candidate < User

  # --------- Validations --------------------------------------------------
  validates :name, presence: true, length: {maximum: 16}
end
