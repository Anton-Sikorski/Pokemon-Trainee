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
    create? if user.present?
  end

  def create?
    user.present?
  end

  def update?
    (user.present? && user == article.user) || user.admin?
  end

  def destroy?
    (user.present? && user == article.user) || user.admin?
  end

  private

    def article
      record
    end
end
