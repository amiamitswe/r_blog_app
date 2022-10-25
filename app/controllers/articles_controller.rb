class ArticlesController < ApplicationController
  def show
    # @ convert regular variable to instance variable

    @article = Article.find(params[:id])
  end
end
