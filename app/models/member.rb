class Member < ApplicationRecord

# Direct associations

  belongs_to :team

  belongs_to :user

  # Indirect associations

  # Validations
  validates :team_id, :presence => true
  validates :user_id, :presence => true

end
