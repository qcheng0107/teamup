class Registration < ApplicationRecord
  # Direct associations

  belongs_to :session

  belongs_to :user

  # Indirect associations

  # Validations
  
  validates :session_id, :presence => true
  validates :user_id, :presence => true

end
