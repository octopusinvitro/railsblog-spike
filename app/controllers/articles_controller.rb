class ArticlesController < ApplicationController
  before_action :fetch, only: [:edit, :show, :update, :destroy]

  def fetch
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

  def edit
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :text)
  end
end
