class Tagging < ApplicationRecord
  # Direct associations

  belongs_to :skill

  belongs_to :user

  # Indirect associations

  # Validations

end
