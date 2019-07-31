class ApplicationController < ActionController::Base
    before_action :fetch_user

    private
    def fetch_user
        @current_user = User.find_by :id =>session[:user_id] if session[:user_id].present?
        session[:user_id] = nil unless @current_user.present?
    end

    def check_for_login
        redirect_to login_path unless @current_user.present?
    end

    def check_for_admin
        redirect_to root_path unless @current_user.present? && @current_user.admin?
    end

    def check_for_daily_comment
        redirect_to new_comment_path unless @current_user.comments.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day).present?
    end
end
