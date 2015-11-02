class WikiPolicy < ApplicationPolicy
  attr_reader :user, :wiki

  def initialize(user, wiki)
    @user = user
    @wiki = wiki
  end

  def create?
    user.present?
  end

  def update?
    user.present? && (record.user == user || user.admin? || !record.private?)
  end

  def admin_list?
    user.admin?
  end

end
