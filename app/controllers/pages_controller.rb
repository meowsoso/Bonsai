class PagesController < ApplicationController
  def home
    @score = background
    user = User.find @current_user.id
    @team = user.team
    @comment = user.comments.last.content
    gon.score = @score
  end



  private
  # get average emotion score from the date
  # TODO: change it to only get average of current team
  def background
    emotion_scores = Comment.where('created_at BETWEEN ? AND ?', DateTime.now.beginning_of_day, DateTime.now.end_of_day).average(:score)
    emotion_scores
  end

end
