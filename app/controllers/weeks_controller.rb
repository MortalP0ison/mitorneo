class WeeksController < ApplicationController
    before_action       :authenticate_user!

    def new
        @championship = Championship.find(params[:championship_id])
        @week = Week.new championship_id: params[:championship_id]
        @teams = Team.all()
    end

    def create
        week = Week.create(week_params)
        if week.persisted?
            redirect_to dashbard_path(), notice: 'Fecha exitosamente creada'
        else
            render :new, alert: 'Fecha no fue creada exitosamente. #{week.errors.full_messages}'
        end
    end

    private
    def week_params
        params.require(:week).permit(:name, :date, :championship_id, matches_attributes: [:local_id, :visitor_id, :_destroy])
    end
end