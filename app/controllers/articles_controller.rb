class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def show
    @article = Article.find(params[:id])
  end

  def create
    # render plain: params[:article].inspect
    @article = Article.new article_params
    @article.save
    redirect_to @article
  end

  private
    def article_params
      params.require(:article).permit(:title, :description)
    end
end