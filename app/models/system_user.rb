class SystemUser < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :lockable, :timeoutable, :confirmable and :activatable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :cellphone, :last_name, :name, :phone, :profile_id, :code
  attr_accessor :code

  #VALIDATIONS
  validates_presence_of :name, :last_name


  def self.profile_name(syste_user_profile_id)
    return  Profile.find(syste_user_profile_id).name
  end

  def self.current
    Thread.current[:system_user]
  end

  def self.current=(system_user)
    Thread.current[:system_user] = system_user
  end

end
