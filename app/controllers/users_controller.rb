class UsersController < ApplicationController
  before_action :check_for_login, :only => [:edit, :update]
  before_action :check_for_admin, :only => [:index]
  
  def new
    @user = User.new
  end
  
    def index
      @users = User.all 
    end

  def create
    @user = User.new user_params
    if @user.save
      redirect_to new_comment_path
      session[:user_id] = @user.id 
    else 
      render :new
    end
  end

  def edit
    @user = @current_user
  end

  def update
    @current_user.update user_params
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :team_id)
  end
end
