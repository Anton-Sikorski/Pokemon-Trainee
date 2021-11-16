# frozen_string_literal: true

# authorized articles
class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]
  rescue_from ActiveRecord::RecordNotFound do
    render :not_found
  end

  def index
    @search = Article.ransack(params[:q])
    @articles = @search.result
    @best_article = most_viewed
  end

  def show
    @article = Article.find(params[:id])
    increase_views(@article)
    @users = User.all
    @best_article = most_viewed
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

    # finds most viewed article created recently
    def most_viewed
      @best_article = Article.where("created_at >= :week_ago AND views = :max_views",
                                    week_ago: DateTime.now.change(day: 7), max_views: Article.maximum("views")).first
    end

    # increases views on GET#show
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
