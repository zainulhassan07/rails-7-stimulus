class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  
  has_many :work_experiences, dependent: :destroy       
  has_many :connections, dependent: :destroy
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

  def check_if_already_connected?(current_user, user)
    current_user !=user && !current_user.connections.pluck(:connected_user_id).include?(user.id)
  end
end
