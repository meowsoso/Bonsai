class CommentsController < ApplicationController
  before_action :check_for_login


  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.create comment_params
    @comment.update_attribute(:user_id, @current_user.id)
    redirect_to root_path
  end

  def edit
    @comment = Comment.find params[:id]
    gon.current_user = @current_user
  end

  def update 
    comment = Comment.find params[:id]
    comment.update comment_params
    redirect_to comment
  end

  def index
    id = @current_user.id
    @comments = Comment.where(user_id: id)
  end

  def show
    @comment = Comment.find params[:id]
  end

  def destroy
    comment = Comment.find params[:id]
    comment.destroy
    redirect_to comments_path
  end

  private
  def comment_params
    params.required(:comment).permit(:content, :category, :emotion, :user_id, :score)
  end

end
