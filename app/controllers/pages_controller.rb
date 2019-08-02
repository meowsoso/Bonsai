class PagesController < ApplicationController
  before_action :check_for_login, :except => :new
  before_action :check_for_daily_comment, :only => [:garden, :team]

  def new
  end

  def garden

    @user = User.find @current_user.id
    @score = @user.comments.last.score
    gon.score = @score
  end
  
  def team
    @score = team_score
    gon.score = @score
    @user = User.find @current_user.id
    @team = @user.team
  end



  private
  # get average emotion score from the date
  # TODO: change it to only get average of current team
  def team_score
    team_member = @current_user.team.users
    team_comment = Comment.where(user_id: team_member.pluck('id'))
    emotion_scores = team_comment.where('created_at BETWEEN ? AND ?', DateTime.now.beginning_of_day, DateTime.now.end_of_day).average(:score)
    emotion_scores
  end

end
