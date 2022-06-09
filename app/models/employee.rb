class Employee < User

  # --------- Validations --------------------------------------------------
  validates :name, presence: true, uniqueness: {case_sensitive: false}, length: {maximum: 5}
end