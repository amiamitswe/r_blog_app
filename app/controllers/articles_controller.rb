class ArticlesController < ApplicationController
  before_action :get_article, only: [:show, :edit, :update, :destroy]

  def index
    @all_articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = User.first
    if @article.valid?
      @article.save
      # redirect_to article_path(@article)
      # or
      flash[:notice] = "Article create done"
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
  end

  def edit
  end

  def update
    if @article.update(article_params)
      flash[:notice] = "Article update successfully"
      redirect_to @article
    else
      render :edit
    end
  end

  def destroy
    if @article
      @article.destroy
      flash[:notice] = "\"#{@article.title}\"" + "Article Deleted successfully"
      redirect_to articles_path, status: :see_other
    end
  end

  private

  def get_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description, :count, :isActive)
  end
end
