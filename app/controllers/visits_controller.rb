class VisitsController < ApplicationController

    def create
        @visit = Visit.new(visit_params)
        @visit.save
    end

    def destroy
        visit = Visit.find(params[:id])
        visit.destroy
    end
    
    private

    def visit_params
        params.require(:visit).permit(:individual_id, :place_id)
    end

end
