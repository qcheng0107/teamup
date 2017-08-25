class Skill < ApplicationRecord
  # Direct associations

  has_many   :taggings,
             :dependent => :destroy

  # Indirect associations

  has_many   :users,
             :through => :taggings

  # Validations

  validates :skill, :presence => true

end
