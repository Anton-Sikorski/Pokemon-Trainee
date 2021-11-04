# frozen_string_literal: true

# article policy
class ArticlePolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def new?
    create?
  end

  def create?
    user.present?
    true
  end

  def update?
    return true if (user.present? && user == article.user) || user.admin?
  end

  def destroy?
    return true if (user.present? && user == article.user) || user.admin?
  end

  private

    def article
      record
    end
end
