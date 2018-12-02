class DashboardController < ApplicationController
    before_action :authenticate_user!

    def index
        @championships = Championship.all
        @current_championship = Championship.first
        @current_week = @current_championship.weeks.order(:date).first
        @current_match = @current_week.matches.order(:date).first
    end

    def search
        @championships = Championship.all
        if params[:championship_id].present?
            @current_championship = Championship.find(params[:championship_id])
            @current_week = @current_championship.weeks.order(:date).first
            @current_match = @current_week.matches.order(:date).first
        elsif params[:week_id].present?
            @current_week = Week.find(params[:week_id])
            @current_championship = @current_week.championship
            @current_match = @current_week.matches.order(:date).first
        else
            @current_match = Match.find(params[:match_id])
            @current_week = @current_match.week
            @current_championship = @current_match.championship
        end
        respond_to do |format|
            format.js
        end
    end
end