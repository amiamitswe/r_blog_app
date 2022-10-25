class ArticlesController < ApplicationController

  def index
    @all_articles = Article.all
  end
  def show
    # @ convert regular variable to instance variable

    @article = Article.find(params[:id])
  end
end
