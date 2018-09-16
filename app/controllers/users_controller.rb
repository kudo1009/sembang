class UsersController < ApplicationController
    
    def index
        @users = User.all
    end
    
    def new
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user.id)
        else
            render :new
        end
    end
    
    def edit
        @user = User.find_by(id: params[:id])
        @user.image.cache! unless @user.image.blank?
    end
    
    def update
        @user = User.find_by(id: params[:id])
        @user.name = params[:name]
        @user.email = params[:email]
        @user.password = params[:password]
        if @user.update(user_params)
            flash[:notice] = "ユーザー情報を編集しました"
            redirect_to user_path
        else
            render :edit
        end
    end
    
    def destroy
        @user = User.find_by(id: params[:id])
        @user.destroy
        flash[:notice] = "プロフィールを削除しました"
        redirect_to root_path
    end
    
    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation, :image)
    end
    
    def show
        @user = User.find_by(id: params[:id])
        @favorite_posts = @user.favorite_posts
        @favorite = current_user.favorite_posts
    end
    
    
    
end
