class PostsController < ApplicationController
  before_action :authenticate_user, only: [:new, :show, :edit,:update]
  
  def index
    @posts = Post.all.order(created_at: :desc)
  end
  
  def show
    @post = Post.find_by(id: params[:id])
    @favorite = current_user.favorites.find_by(post_id: @post.id)
    @user = User.find_by(id: @post.user_id)
  end
  
  def new
    if params[:back]
      @post = Post.new(post_params)
    else
      @post = Post.new
    end
  end
  
  def create
    @post= Post.new(post_params)
    @post.user_id = current_user.id
    

    if params[:back]
      render :new
      return
    end

    unless @post.valid?
      render :new
      return
    end

    if params[:send]
      @post.save
      PostMailer.post_mail(@post).deliver
      flash[:notice] = "投稿を作成しました"
      redirect_to @post
      return
    end

    render :confirm
  end
  
  def edit
    @post = Post.find_by(id: params[:id])
    @post.image.cache! unless @post.image.blank?
  end
  
  def update
    @post = Post.find_by(id: params[:id])
    
    if @post.update(post_params)
      flash[:notice] = "投稿を編集しました"
      redirect_to post_path
    else
      render :edit
    end
  end

  
  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice] = "投稿を削除しました"
    
    redirect_to posts_path
  end
  
  def confirm
    @post = Post.new(post_params)
    @post.content = params[:content]
    if @post.invalid?
     render :confirm
    else
     render :posts
    end 
  end
  
  def ensure_correct_user
    @post = Post.find_by(id: params[:id])
    if @post.user_id != @current_user.id
      flash[:notice] = "投稿者が削除できます"
      redirect_to posts_path
    end
  end

  private
  
  def post_params
    params.require(:post).permit(:image, :image_cache, :remove_image, :content,)
  end
  
  def set_post
    @post = Post.find(params[:id])
  end
  
end