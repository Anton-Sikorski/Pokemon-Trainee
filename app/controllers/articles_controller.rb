# frozen_string_literal: true

# authorized articles
class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]

  def index
    @user = current_user
    @search = Article.ransack(params[:q])
    @articles = @search.result.order("views ASC")
    authorize @articles
  end

  def show
    @article = Article.find(params[:id])
    increase_views(@article)
    @users = User.all
  end

  def new
    @article = Article.new
    authorize @article
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    authorize @article
    if @article.save
      redirect_to @article, notice: "Article was successfully created."
    else
      render :new
    end
  end

  def update
    if @article.update(article_params)
      redirect_to @article, notice: "Article was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path, notice: "Article was successfully destroyed."
  end

  private

    def increase_views(article)
      article.views += 1
      article.save
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
      authorize @article
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :body, :status, :user_id, :views)
    end
end
