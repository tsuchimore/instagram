class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  def index
    @blogs = Blog.all
    if params[:back]
      @blog = Blog.new(blogs_params)
    else
      @blog = Blog.new
    end
  end
  def new
    if params[:back]
      @blog = Blog.new(blogs_params)
    else
      @blog = Blog.new
      
    end
  end

 def create
    @blog = Blog.new(blogs_params)
    @blog.user_id = current_user.id
    if @blog.save
      redirect_to blogs_path, notice: "ブログを作成しました！"
    else
      render action: 'new'
    end
  end
  def edit

  end
  def update
    @blog.update(blogs_params)
    redirect_to blogs_path
  end
  def destroy
    @blog.destroy
    redirect_to blogs_path    
  end
  
  def confirm
    @blog = Blog.new(blogs_params)
    render :new if @blog.invalid?
  end
  def show
    @comment = @blog.comments.build
    @comments = @blog.comments
    Notification.find(params[:notification_id]).update(read: true) if params[:notification_id]
  end
  private
  def blogs_params
    params.require(:blog).permit(:content, :image, :image_cache, :remove_image)
  end
  def set_blog
    @blog = Blog.find(params[:id])
  end
end
