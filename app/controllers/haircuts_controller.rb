class HaircutsController < ApplicationController
    before_action :set_lesson, only: [:show]

    def index
        @haircut = Haircut.paginate(:page => params[:page], :per_page => 6).order('sort ASC')
    end

    def show
        @others = Haircut.paginate(:page => params[:page], :per_page => 4).order('sort ASC')
    end 

    def new 
        @haircut = Haircut.new 
    end

    private

    def set_haircut
        @haircut = Haircut.find(params[:id])
    end

    def haircut_params
        params.require(:haircut).permit(:duration)
    end
end
