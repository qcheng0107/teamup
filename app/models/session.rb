class Session < ApplicationRecord
  # Direct associations

  has_many   :registrations,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
