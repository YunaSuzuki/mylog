class ArticlesController < ApplicationController
    
  def index
    @articles = Article.page(params[:page]).per(6).order("created_at DESC")
  end
  
  def new
    @article = Article.new
  end
  
  def create
    Article.create(title: article_params[:title], content: article_params[:content])
    redirect_to :root
  end
  
  def show
    @article = Article.find(params[:id])
  end
  
  private
  def article_params
    params.permit(:title, :content)
  end
end
