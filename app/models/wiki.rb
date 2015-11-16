class Wiki < ActiveRecord::Base
  belongs_to :user

  has_many :collaborators
  has_many :users, through: :collaborators, dependent: :destroy

  scope :visible_to, -> (user) { user ? all : where(public: true) }

  def collaborator_for(user)
    collaborators.where(user: user).first
  end

end
