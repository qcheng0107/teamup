class Session < ApplicationRecord
  # Direct associations

  has_many   :teams,
             :dependent => :destroy

  has_many   :registrations,
             :dependent => :destroy

  # Indirect associations

  has_many   :users,
             :through => :registrations

  # Validations

  validates :quarter, :presence => true
  validates :course_name, :presence => true

  def dropdown_text
    "#{quarter}: #{course_name}"
  end

end
