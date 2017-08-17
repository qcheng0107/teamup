class Skill < ApplicationRecord
  # Direct associations

  has_many   :taggings,
             :dependent => :destroy

  # Indirect associations

  has_many   :users,
             :through => :taggings,
             :source => :user

  # Validations

end
