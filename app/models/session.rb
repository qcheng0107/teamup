class Session < ApplicationRecord
  # Direct associations

  has_many   :teams,
             :dependent => :destroy

  has_many   :registrations,
             :dependent => :destroy

  # Indirect associations

  has_many   :users,
             :through => :registrations,
             :source => :user

  # Validations

end
