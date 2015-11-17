class Wiki < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  def should_generate_new_friendly_id?
    new_record?
  end

  belongs_to :user

  has_many :collaborators
  has_many :users, through: :collaborators, dependent: :destroy

  scope :visible_to, -> (user) { user ? all : where(public: true) }

  def collaborator_for(user)
    collaborators.where(user: user).first
  end

end
