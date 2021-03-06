# frozen_string_literal: true

class ArticlesController < ApplicationController
  http_basic_authenticate_with(
    name: 'yeqpacha', password: 'secret', except: %i[index show]
  )
  before_action :fetch, only: %i[edit show update destroy]

  def index
    @articles = Article.all
  end

  def edit; end

  def show; end

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

  def fetch
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :text)
  end
end
