class ChampionshipsController < ApplicationController
    before_action       :authenticate_user!
    def new
        @championship = Championship.new
    end

    def create
        c = Championship.create(championship_params)
        if c.persisted?
            redirect_to dashboard_path(), notice: 'El campeonato fue creado exitosamente'
        else
            render :new, alert: 'El campeonato no pudo ser creado'
        end
    end

    def show
        @championship = Championship.find(params[:id])
    end

    def edit
        @championship = Championship.find(params[:id])
    end

    def update
        @championship = Championship.find(params[:id])
        if @championship.update(championship_params)
            redirect_to dashboard_path(), notice: 'El campeonato fue actualizado exitosamente'
        else
            render :edit, alert: 'El campeonato no pudo ser actualizado'
        end
    end

    def destroy
        championship = Championship.find(params[:id])
        if championship.destroy
            redirect_to dashboard_path(), notice: 'El campeonato fue eliminado exitosamente'
        else
            redirect_to dashboard_path(), notice: 'El campeonato no pudo ser eliminado'
        end
    end

    private
    def championship_params
        params.require(:championship).permit(:city, :name, :start_date, :end_date, weeks_attributes: [:name, :date, :_destroy])
    end
end