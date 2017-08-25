class Team < ApplicationRecord
  # Direct associations

  belongs_to :session

  has_many   :members,
             :dependent => :destroy

  # Indirect associations

  has_many   :users,
             :through => :members

  # Validations

  validates :team_name, :presence => true, :uniqueness => true

end
