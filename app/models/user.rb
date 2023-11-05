class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  
  PROFILE_TITLE = [
    'senior Ruby on Rails developer',
    'Senior Full stack Ruby on Rails developer',
    'Mid level full stack ruby on rails developer'
  ].freeze


  def address
    "#{city}, #{state}, #{country}, #{pincode}"
  end

  def self.ransackable_attributes(auth_object = nil)
    ['country', 'city', 'profile_title']
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end

end
