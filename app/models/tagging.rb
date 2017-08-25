class Tagging < ApplicationRecord
  # Direct associations

  belongs_to :skill

  belongs_to :user

  # Indirect associations

  # Validations

  validates :skill_id, :presence => true
  validates :user_id, :presence => true

end
