class User < ApplicationRecord
  # Direct associations

  has_many   :teams,
             :dependent => :destroy

  has_many   :taggings,
             :dependent => :destroy

  has_many   :registrations,
             :dependent => :destroy

  # Indirect associations

  has_many   :skills,
             :through => :taggings,
             :source => :skill

  has_many   :sessions,
             :through => :registrations,
             :source => :session

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
