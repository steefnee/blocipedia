class WikiPolicy < ApplicationPolicy
  def create
    user.present?
  end

  def update
    user.present? && (record.user == user || user.admin? || !record.private?)
  end
end
