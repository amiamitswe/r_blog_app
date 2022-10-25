class ArticlesController < ApplicationController

  def index
    @all_articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create

    @article = Article.new(params.require(:article).permit(:title, :description, :count, :isActive))
    if @article.save
      # redirect_to article_path(@article)
      # or
      redirect_to @article
    else
      render 'new'
    end
  end
  def show
    # @ convert regular variable to instance variable

    @article = Article.find(params[:id])
  end
end
