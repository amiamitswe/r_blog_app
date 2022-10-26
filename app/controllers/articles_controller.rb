class ArticlesController < ApplicationController

  def index
    @all_articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params.require(:article).permit(:title, :description, :count, :isActive))
    if @article.valid?
      @article.save
      # redirect_to article_path(@article)
      # or
      redirect_to @article
    else
      # # if generate flash message then receive by flash[:messages]
      # flash.now[:messages] = @article.errors.full_messages
      # # if noting then can access errors using @article.errors in view .erb file

      # fix to render error message pass status code
      # render :new, status: 201
      # or use "data: { turbo: false }," inside form_with as attribute
      render :new
    end
    # render nothing: true, status: 201
  end
  def show
    # @ convert regular variable to instance variable

    @article = Article.find(params[:id])
  end
end
