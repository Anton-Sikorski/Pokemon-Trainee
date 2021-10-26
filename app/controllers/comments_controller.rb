# frozen_string_literal: true

# comments
class CommentsController < ApplicationController
  before_action :set_comment, only: %i[update destroy]

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    @comment.user = current_user
    authorize @comment
    if @comment.save
      redirect_to article_path(@article), notice: "Comment was successfully created."
    else
      redirect_to article_path(@article), alert: "Comment was not created"
    end
  end

  def update; end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end

  private

    def comment_params
      params.require(:comment).permit(:body, :status)
    end

    def set_comment
      @comment = Comment.find(params[:id])
      authorize @comment
    end
end
