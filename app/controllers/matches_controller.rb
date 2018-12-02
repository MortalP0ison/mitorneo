class MatchesController < ApplicationController
    before_action       :authenticate_user!

    def new
        @week = Week.find(params[:week_id])
        @match = Match.new
        @teams = Team.all()
    end

    def create

        m = Match.create(match_params)

        if m.persisted?
            redirect_to dashboard_path(), notice: 'El partido fue creado exitosamente'
        else
            @week = Week.find(params[:week_id])
            @match = Match.new
            @teams = Team.all()
            render :new, alert: 'El partido no pudo ser creado'
        end
    end

    private
    def match_params
        params.require(:match).permit(:local_id, :visitor_id, :week_id)
    end
end