# frozen_string_literal: true

# comment policy
class CommentPolicy < ApplicationPolicy
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
  end

  def update?
    user.present? && (user == comment.user || user.admin?)
  end

  def destroy?
    user.present? && (user == comment.user || user.admin?)
  end

  private

    def comment
      record
    end
end
