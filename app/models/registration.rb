class Registration < ApplicationRecord
  # Direct associations

  belongs_to :session

  belongs_to :user

  # Indirect associations

  # Validations

end
