class PagesController < ApplicationController
  def home
    @score = background
    gon.score = @score
  end



  private
  # get average emotion score from the date
  def background
    emotion_scores = Comment.where('created_at BETWEEN ? AND ?', DateTime.now.beginning_of_day, DateTime.now.end_of_day).average(:score)
    emotion_scores
  end

end
