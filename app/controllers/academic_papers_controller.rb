class AcademicPapersController < ApplicationController
    def show
        @p = AcademicPaper.find(params[:id])
    end
end
