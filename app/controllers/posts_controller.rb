class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)
  end
  
  def show
    @post = Post.find_by(id: params[:id])
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(content: params[:content])

    if params[:back]
      render new_post_path
      return
    end

    unless @post.valid?
      render new_post_path
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
      render edit_post
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
     render :action => "posts/confirm"
    else
     render :action => posts_path
    end 
  end
  
  
end