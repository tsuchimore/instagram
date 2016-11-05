class BlogsController < ApplicationController
  before_action :set_blog, only: [:edit, :update, :destroy]
  before_action :authenticate_user!
  def index
    @blogs = Blog.all
  end
  
  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blogs_params)
    @blog.user_id = current_user.id
    if @blog.save
      redirect_to blogs_path, notice: "ブログを作成しました！"
    else
      render 'new'
    end
  end

  def edit
    @blog = Blog.find(params[:id])
  end
  
  def update
    @blog = Blog.find(params[:id])
    @blog.update(blogs_params)
    redirect_to root_path
  end
  
  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to root_path
  end
  
  private
    def blogs_params
      params.require(:blog).permit(:content, :image, :image_cache, :remove_image)
    end
    
    def set_blog
      @blog = Blog.find(params[:id])
    end
end
