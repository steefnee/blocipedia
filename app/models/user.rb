class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  attr_accessible :role
  has_many :wikis

  after_initialize :init

  enum role: [:standard, :premium, :admin]

  def init
    role = :standard
  end



end
