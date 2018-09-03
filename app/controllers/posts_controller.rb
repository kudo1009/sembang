class PostsController < ApplicationController
  before_action :authenticate_user, only: [:new, :show, :edit]
  
  def index
    @posts = Post.all.order(created_at: :desc)
  end
  
  def show
    @post = Post.find_by(id: params[:id])
    @favorite = current_user.favorites.find_by(post_id: @post.id)
    @user = @post.user
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(content: params[:content],user_id: @current_user.id)
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
      flash[:notice] = "投稿を作成しました"
      redirect_to posts_path
      return
    end

    render :confirm
  end
  
  def edit
    @post = Post.find_by(id: params[:id])
  end
  
  def update
    @post = Post.find_by(id: params[:id])
    @post.content = params[:content]
    if @post.save
      flash[:notice] = "投稿を編集しました"
      redirect_to posts_path
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
    @post = Post.new(params[:post])
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
  
  
end