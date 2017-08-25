class User < ApplicationRecord
  # Direct associations

  # has_many   :teams,
  #           :dependent => :destroy

  has_many   :taggings,
             :dependent => :destroy

  has_many   :registrations,
             :dependent => :destroy
             
  has_many   :members,
             :dependent => :destroy

  # Indirect associations

  has_many   :skills,
             :through => :taggings

  has_many   :sessions,
             :through => :registrations
  
  has_many   :teams,
             :through => :members

  # Validations

  validates :email, :presence => true
  validates :password, :presence => true
  validates :first_name, :presence => true, :uniqueness => { :scope => :last_name }

  def dropdown_name
    "#{first_name} #{last_name}"
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
